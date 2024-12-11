package com.moviebooking.servlets;

import java.io.IOException;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import com.flick.dao.PaymentDAO;
import com.flick.model.Payment;
import com.flick.model.Useradd;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "submitPayment", urlPatterns = {"/submitPayment"})
public class submitPayment extends HttpServlet {

    private static final Logger LOGGER = Logger.getLogger(submitPayment.class.getName());
    private PaymentDAO paymentDAO;

    @Override
    public void init() throws ServletException {
        paymentDAO = new PaymentDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        try {
            // Read parameters
            String username = request.getParameter("username");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String amountStr = request.getParameter("amount");

            // Validate input
            if (username == null || email == null || phone == null || amountStr == null ||
                username.isEmpty() || email.isEmpty() || phone.isEmpty() || amountStr.isEmpty()) {
                response.getWriter().write("{\"success\":false, \"error\":\"All fields are required\"}");
                return;
            }

            if (!email.matches("^[\\w-.]+@[\\w-]+\\.[a-z]{2,}$")) {
                response.getWriter().write("{\"success\":false, \"error\":\"Invalid email format\"}");
                return;
            }

            if (!phone.matches("^\\d{10}$")) {
                response.getWriter().write("{\"success\":false, \"error\":\"Invalid phone number format\"}");
                return;
            }

            BigDecimal amount;
            try {
                amount = new BigDecimal(amountStr);
            } catch (NumberFormatException e) {
                LOGGER.log(Level.SEVERE, "Invalid amount format", e);
                response.getWriter().write("{\"success\":false, \"error\":\"Invalid amount format\"}");
                return;
            }

            // Prepare objects
            Payment payment = new Payment();
            payment.setUsername(username);
            payment.setEmail(email);
            payment.setPhoneNumber(phone);
            payment.setAmount(amount);
            payment.setStatus("PENDING"); 
            payment.setPaymentDate(LocalDateTime.now());

            Useradd useradd = new Useradd();
            useradd.setUsername(username);
            useradd.setEmail(email);
            useradd.setPhoneNumber(phone);

            // Insert into database
            boolean successUser = paymentDAO.InsertUser(useradd);

            if (successUser) {
                // Create a session and store the customer's email
                HttpSession session = request.getSession();
                session.setAttribute("customerEmail", email);

                payment.generateUniqueBookingId();
                boolean paymentSuccess = paymentDAO.insertPayment(payment);

                if (paymentSuccess) {
                    int paymentId = paymentDAO.getLatestPaymentId();
                    // Store payment ID in session as well
                    session.setAttribute("paymentId", paymentId);
                    response.getWriter().write("{\"success\":true, \"bookingId\":\"" + paymentId + "\"}");
                } else {
                    response.getWriter().write("{\"success\":false, \"error\":\"Failed to create payment\"}");
                }
            } else {
                response.getWriter().write("{\"success\":false, \"error\":\"Failed to create user\"}");
            }
        } catch (IOException e) {
            LOGGER.log(Level.SEVERE, "Error processing payment", e);
            response.getWriter().write("{\"success\":false, \"error\":\"An internal server error occurred\"}");
        }
    }
}