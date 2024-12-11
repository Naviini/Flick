package com.flick.model;

import java.math.BigDecimal;
import java.time.LocalDateTime;

public class Payment {
    private int paymentId;
    private Integer bookingId; // Change to Integer to allow null
    private BigDecimal amount;
    private String status;
    private LocalDateTime paymentDate;
    private String email;
    private String username;
    private String phoneNumber;

    // Constructor
    public Payment() {
        this.paymentDate = LocalDateTime.now();
    }

    // Utility method to generate unique booking ID
    public void generateUniqueBookingId() {
        this.bookingId = (int) (Math.random() * 1000000);
    }

    // Getters and Setters
    public int getPaymentId() {
        return paymentId;
    }

    public void setPaymentId(int paymentId) {
        this.paymentId = paymentId;
    }

    public Integer getBookingId() {
        return bookingId;
    }

    public void setBookingId(Integer bookingId) {
        this.bookingId = bookingId;
    }

    public BigDecimal getAmount() {
        return amount;
    }

    public void setAmount(BigDecimal amount) {
        this.amount = amount;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public LocalDateTime getPaymentDate() {
        return paymentDate;
    }

    public void setPaymentDate(LocalDateTime paymentDate) {
        this.paymentDate = paymentDate;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    // Validation method
    public boolean isValidPayment() {
        return amount != null && amount.compareTo(BigDecimal.ZERO) > 0 
               && email != null && !email.isEmpty()
               && username != null && !username.isEmpty()
               && phoneNumber != null && !phoneNumber.isEmpty();
    }
}
