package com.flick.payment;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.flick.dao.PaymentDAO;
import com.flick.model.Payment;

@WebServlet(name = "CancelPayment", urlPatterns = {"/CancelPayment"})
public class CancelPayment extends HttpServlet {
    private static final Logger LOGGER = Logger.getLogger(CancelPayment.class.getName());
    private PaymentDAO paymentDAO;

    @Override
    public void init() throws ServletException {
        super.init();
        paymentDAO = new PaymentDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String paymentIdParam = request.getParameter("paymentId");
        if (paymentIdParam == null || paymentIdParam.isEmpty()) {
            sendJsonResponse(response, "{\"error\": \"Payment ID is required\"}", HttpServletResponse.SC_BAD_REQUEST);
            return;
        }

        int paymentId;
        try {
            paymentId = Integer.parseInt(paymentIdParam);
        } catch (NumberFormatException e) {
            LOGGER.log(Level.SEVERE, "Invalid payment ID format: " + paymentIdParam, e);
            sendJsonResponse(response, "{\"error\": \"Invalid payment ID\"}", HttpServletResponse.SC_BAD_REQUEST);
            return;
        }

        LOGGER.log(Level.INFO, "Cancellation request received for payment ID: " + paymentId);

        Payment payment = paymentDAO.getPaymentById(paymentId);
        if (payment == null) {
            sendJsonResponse(response, "{\"error\": \"Payment not found\"}", HttpServletResponse.SC_NOT_FOUND);
            return;
        }

        String customerEmail = payment.getEmail();
        boolean paymentDeleted = paymentDAO.deletePaymentById(paymentId);

        if (paymentDeleted) {
            LOGGER.log(Level.INFO, "Payment deleted successfully for ID: " + paymentId);
            boolean customerDeleted = false;

            if (customerEmail != null && !customerEmail.isEmpty()) {
                customerDeleted = paymentDAO.deleteCustomerByEmail(customerEmail);
                if (customerDeleted) {
                    LOGGER.log(Level.INFO, "Customer deleted successfully for email: " + customerEmail);
                } else {
                    LOGGER.log(Level.WARNING, "Failed to delete customer for email: " + customerEmail);
                }
            }

            sendJsonResponse(response, "{\"message\": \"Payment cancelled successfully\"}", HttpServletResponse.SC_OK);
        } else {
            LOGGER.log(Level.SEVERE, "Failed to delete payment for ID: " + paymentId);
            sendJsonResponse(response, "{\"error\": \"Failed to cancel payment\"}", HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }

    private void sendJsonResponse(HttpServletResponse response, String message, int statusCode) throws IOException {
        response.setContentType("application/json");
        response.setStatus(statusCode);
        response.getWriter().write(message);
    }
}