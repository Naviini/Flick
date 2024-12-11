package com.flick.payment;

import com.flick.dao.PaymentDAO;
import com.flick.model.Payment;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.math.BigDecimal;

@WebServlet("/ProcessPayment")
public class ProcessPayment extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get payment details from the form
        int bookingId = Integer.parseInt(request.getParameter("booking_id"));
        BigDecimal amount = new BigDecimal(request.getParameter("amount"));
        String email = request.getParameter("email");
        String username = request.getParameter("username");
        String phoneNumber = request.getParameter("phone_number");
        String status = "Success"; // Set default status

        // Create a Payment object
        Payment payment = new Payment();
        payment.setBookingId(bookingId);
        payment.setAmount(amount);
        payment.setEmail(email);
        payment.setUsername(username);
        payment.setPhoneNumber(phoneNumber);
        payment.setStatus(status);

        // Save payment using DAO
        PaymentDAO paymentDAO = new PaymentDAO();
        boolean isInserted = paymentDAO.insertPayment(payment);

        if (isInserted) {
            response.getWriter().println("Payment successful!");
        } else {
      
            paymentDAO.deletePaymentById(bookingId);
       
            response.getWriter().println("Failed to process payment!");
        }
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        response.getWriter().write("<h1>ProcessPayment is working!</h1>");
    }
}
