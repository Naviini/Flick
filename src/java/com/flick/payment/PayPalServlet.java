package com.flick.payment;

import java.io.IOException;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Base64;
import java.util.logging.Level;
import java.util.logging.Logger;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import com.flick.dao.PaymentDAO;
import com.flick.model.Payment;
import org.json.JSONObject;
import org.json.JSONArray;
@WebServlet(name = "PayPalServlet", urlPatterns = {"/PayPalServlet"})
public class PayPalServlet extends HttpServlet {
    private static final Logger LOGGER = Logger.getLogger(PayPalServlet.class.getName());

    // Consider using environment variables or a secure configuration management system
    private static final String CLIENT_ID = "AU0KzHjZUKAGwbZ5o4dnvey3ZtmG3oDmKlP3O4GEf2wlT3zT6EVpEqr1Bu78VOpO-1z03LGaF4-RLngG";
    private static final String CLIENT_SECRET = "EG-cyF5EK8eWuB-b_mrBOTpT_MOO9TOgFRqawCgiLldkwsorLubPV7jCnno5YMPC8tBvymvEUnxOgGb-";

    private static final String PAYPAL_SANDBOX_TOKEN_URL = "https://api-m.sandbox.paypal.com/v1/oauth2/token";
    private static final String PAYPAL_SANDBOX_PAYMENT_URL = "https://api-m.sandbox.paypal.com/v1/payments/payment";
    private static final String RETURN_URL = "http://localhost:8080/cinema/success.jsp";
    private static final String CANCEL_URL = "http://localhost:8080/cinema/cancel.jsp";

    private PaymentDAO paymentDAO;

    @Override
    public void init() throws ServletException {
        paymentDAO = new PaymentDAO();
    }

    /**
     * Retrieve an access token from PayPal
     * @return PayPal access token
     * @throws IOException if there's an error connecting to PayPal
     */
    private String getAccessToken() throws IOException {
        try {
            String auth = Base64.getEncoder().encodeToString((CLIENT_ID + ":" + CLIENT_SECRET).getBytes());
            URL url = new URL(PAYPAL_SANDBOX_TOKEN_URL);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            
            conn.setRequestMethod("POST");
            conn.setRequestProperty("Authorization", "Basic " + auth);
            conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
            conn.setDoOutput(true);

            try (OutputStream os = conn.getOutputStream()) {
                os.write("grant_type=client_credentials".getBytes());
            }

            if (conn.getResponseCode() != HttpURLConnection.HTTP_OK) {
                LOGGER.log(Level.SEVERE, "Failed to get access token. Response Code: " + conn.getResponseCode());
                throw new IOException("Failed to get access token");
            }

            StringBuilder response = new StringBuilder();
            try (var reader = new java.io.BufferedReader(new java.io.InputStreamReader(conn.getInputStream()))) {
                String line;
                while ((line = reader.readLine()) != null) {
                    response.append(line);
                }
            }

            JSONObject jsonResponse = new JSONObject(response.toString());
            return jsonResponse.getString("access_token");
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error obtaining PayPal access token", e);
            throw new IOException("Could not obtain PayPal access token", e);
        }
    }

    /**
     * Create a PayPal payment
     * @param accessToken PayPal access token
     * @param payment Payment details
     * @return Approval URL for the payment
     * @throws IOException if there's an error creating the payment
     */
    private String createPayment(String accessToken, Payment payment) throws IOException {
        try {
            URL url = new URL(PAYPAL_SANDBOX_PAYMENT_URL);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("POST");
            conn.setRequestProperty("Authorization", "Bearer " + accessToken);
            conn.setRequestProperty("Content-Type", "application/json");
            conn.setDoOutput(true);

            JSONObject paymentJson = new JSONObject();
            paymentJson.put("intent", "sale");

            JSONObject payer = new JSONObject();
            payer.put("payment_method", "paypal");
            paymentJson.put("payer", payer);

            JSONObject transaction = new JSONObject();
            transaction.put("amount", new JSONObject()
                .put("total", payment.getAmount().toString())
                .put("currency", "USD"));
            transaction.put("description", "Cinema Ticket Booking");

            JSONArray transactions = new JSONArray();
            transactions.put(transaction);
            paymentJson.put("transactions", transactions);

            JSONObject redirectUrls = new JSONObject();
            redirectUrls.put("return_url", String.format("%s?paymentId=%d&status=success", RETURN_URL, payment.getPaymentId()));
            redirectUrls.put("cancel_url", String.format("%s?paymentId=%d&status=canceled", CANCEL_URL, payment.getPaymentId()));
            paymentJson.put("redirect_urls", redirectUrls);

            try (OutputStream os = conn.getOutputStream()) {
                os.write(paymentJson.toString().getBytes());
            }

            if (conn.getResponseCode() != HttpURLConnection.HTTP_CREATED) {
                LOGGER.log(Level.SEVERE, "Failed to create PayPal payment. Response Code: " + conn.getResponseCode());
                throw new IOException("Failed to create PayPal payment");
            }

            StringBuilder response = new StringBuilder();
            try (var reader = new java.io.BufferedReader(new java.io.InputStreamReader(conn.getInputStream()))) {
                String line;
                while ((line = reader.readLine()) != null) {
                    response.append(line);
                }
            }

            JSONObject jsonResponse = new JSONObject(response.toString());
            JSONArray links = jsonResponse.getJSONArray("links");

            for (int i = 0; i < links.length(); i++) {
                JSONObject link = links.getJSONObject(i);
                if (link.getString("rel").equals("approval_url")) {
                    return link.getString("href");
                }
            }

            return null;
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error creating PayPal payment", e);
            throw new IOException("Could not create PayPal payment", e);
        }
    }

@Override
protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    try {
        HttpSession session = request.getSession(false);
        if (session == null) {
            sendErrorResponse(response, "No active session", HttpServletResponse.SC_UNAUTHORIZED);
            return;
        }

        // Retrieve email from session
        String customerEmail = (String) session.getAttribute("customerEmail");
        if (customerEmail == null) {
            sendErrorResponse(response, "No customer email in session", HttpServletResponse.SC_UNAUTHORIZED);
            return;
        }

        // Get payment ID by email
        int paymentId = paymentDAO.getPaymentIdByEmail(customerEmail);
        if (paymentId == -1) {
            sendErrorResponse(response, "Payment not found for the given email", HttpServletResponse.SC_NOT_FOUND);
            return;
        }

        String status = request.getParameter("status");
        Payment payment = paymentDAO.getPaymentById(paymentId);

        if (payment == null) {
            sendErrorResponse(response, "Payment not found", HttpServletResponse.SC_NOT_FOUND);
            return;
        }

        // Handle cancellation
        if ("canceled".equals(status)) {
            handlePaymentCancellation(payment, customerEmail, response);
        } else if ("success".equals(status)) {
            // Handle successful payment
            handleSuccessfulPayment(payment, response);
        } else {
            // Proceed with payment
            String approvalUrl = createPayment(getAccessToken(), payment);
            
            if (approvalUrl != null) {
                response.sendRedirect(approvalUrl);
            } else {
                sendErrorResponse(response, "Failed to get approval URL", HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            }
        }
    } catch (IOException e) {
        LOGGER.log(Level.SEVERE, "Unexpected error in doGet", e);
        sendErrorResponse(response, "An unexpected error occurred", HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
    }
}
private void handleSuccessfulPayment(Payment payment, HttpServletResponse response) throws IOException {
    // Update payment status to PAID
    boolean updated = paymentDAO.updatePaymentStatus(payment.getPaymentId(), "PAID");
    
    if (updated) {
        sendJsonResponse(response, 
            "{\"message\": \"Payment successfully processed and status updated to PAID.\"}", 
            HttpServletResponse.SC_OK);
    } else {
        sendErrorResponse(response, 
            "Failed to update payment status", 
            HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
    }
}
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            HttpSession session = request.getSession(false);
            if (session == null) {
                sendErrorResponse(response, "No active session", HttpServletResponse.SC_UNAUTHORIZED);
                return;
            }

            // Retrieve email from session
            String customerEmail = (String) session.getAttribute("customerEmail");
            if (customerEmail == null) {
                sendErrorResponse(response, "No customer email in session", HttpServletResponse.SC_UNAUTHORIZED);
                return;
            }

            // Get payment ID by email
            int paymentId = paymentDAO.getPaymentIdByEmail(customerEmail);
            if (paymentId == -1) {
                sendErrorResponse(response, "Payment not found for the given email", HttpServletResponse.SC_NOT_FOUND);
                return;
            }

            Payment payment = paymentDAO.getPaymentById(paymentId);

            if (payment == null) {
                sendErrorResponse(response, "Payment not found", HttpServletResponse.SC_NOT_FOUND);
                return;
            }

            // Get PayPal access token and create payment
            String accessToken = getAccessToken();
            String approvalUrl = createPayment(accessToken, payment);

            if (approvalUrl != null) {
                // Delete payment details and customer details using email from session
                boolean paymentDeleted = paymentDAO.deletePaymentById(paymentId);
                boolean customerDeleted = paymentDAO.deleteCustomerByEmail(customerEmail);
                
                if (paymentDeleted && customerDeleted) {
                    // Clear session attributes
                    session.removeAttribute("customerEmail");
                    session.removeAttribute("paymentId");
                    
                    response.sendRedirect(approvalUrl);
                } else {
                    LOGGER.log(Level.WARNING, "Failed to delete payment or customer for email: " + customerEmail);
                    sendErrorResponse(response, "Failed to process payment", HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                }
            } else {
                // Update payment status to FAILED
                paymentDAO.updatePaymentStatus(paymentId, "FAILED");
                sendErrorResponse(response, "Error creating payment", HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            }
        } catch (IOException e) {
            LOGGER.log(Level.SEVERE, "Error processing payment", e);
            sendErrorResponse(response, "An unexpected error occurred", HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }
    /**
     * Handle payment cancellation
     * @param payment Payment object
     * @param customerEmail Customer's email from session
     * @param response HttpServletResponse
     * @throws IOException if there's an error sending response
     */
    private void handlePaymentCancellation(Payment payment, String customerEmail, HttpServletResponse response) throws IOException {
        boolean paymentDeleted = paymentDAO.deletePaymentById(payment.getPaymentId());
        boolean customerDeleted = paymentDAO.deleteCustomerByEmail(customerEmail);

        if (paymentDeleted && customerDeleted) {
            sendJsonResponse(response, 
                "{\"message\": \"Payment and customer details deleted successfully.\"}", 
                HttpServletResponse.SC_OK);
        } else {
            sendErrorResponse(response, 
                "Failed to delete payment or customer details", 
                HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }

    /**
     * Send a JSON error response
     * @param response HttpServletResponse
     * @param message Error message
     * @param statusCode HTTP status code
     * @throws IOException if there's an error sending response
     */
    private void sendErrorResponse(HttpServletResponse response, String message, int statusCode) throws IOException {
        response.setContentType("application/json");
        response.setStatus(statusCode);
        response.getWriter().write(String.format("{\"error\": \"%s\"}", message));
    }

    /**
     * Send a JSON response
     * @param response HttpServletResponse
     * @param message JSON message
     * @param statusCode HTTP status code
     * @throws IOException if there's an error sending response
     */
    private void sendJsonResponse(HttpServletResponse response, String message, int statusCode) throws IOException {
        response.setContentType("application/json");
        response.setStatus(statusCode);
        response.getWriter().write(message);
    }
}