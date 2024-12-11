package com.flick.dao;

import com.flick.payment.Databaseconnection;
import com.flick.model.Payment;
import com.flick.model.Useradd;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class PaymentDAO {
    private static final Logger LOGGER = Logger.getLogger(PaymentDAO.class.getName());

    // Insert customer
    public boolean InsertUser(Useradd useradd) {
        String sql = "INSERT INTO customer " +
                     "(username, email, phone_number) " +
                     "VALUES (?, ?, ?)";
        try (Connection conn = Databaseconnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
             
            stmt.setString(1, useradd.getUsername());
            stmt.setString(2, useradd.getEmail());
            stmt.setString(3, useradd.getPhoneNumber());

            int affectedRows = stmt.executeUpdate();
            if (affectedRows > 0) {
                LOGGER.log(Level.INFO, "User inserted successfully for username: {0}", useradd.getUsername());
                return true;
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error inserting user", e);
        }
        return false;
    }

    // Insert Payment
    public boolean insertPayment(Payment payment) {
        String sql = "INSERT INTO payment " +
                     "(booking_id, amount, status, payment_date, email, username, phone_number ) " +
                     "VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = Databaseconnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
             if (payment.getBookingId() != null) {
            stmt.setInt(1, payment.getBookingId());
        } else {
            stmt.setNull(1, java.sql.Types.INTEGER);
        }
            stmt.setInt(1, payment.getBookingId());
            stmt.setBigDecimal(2, payment.getAmount());
            stmt.setString(3, payment.getStatus());
            stmt.setTimestamp(4, Timestamp.valueOf(payment.getPaymentDate()));
            stmt.setString(5, payment.getEmail());
            stmt.setString(6, payment.getUsername());
            stmt.setString(7, payment.getPhoneNumber());
            

            int affectedRows = stmt.executeUpdate();
            if (affectedRows > 0) {
                LOGGER.log(Level.INFO, "Payment inserted successfully for booking ID: {0}", payment.getBookingId());
                return true;
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error inserting payment", e);
        }
        return false;
    }
public int getLatestPaymentId() {
    String sql = "SELECT payment_id FROM payment ORDER BY payment_id DESC LIMIT 1";
    try (Connection conn = Databaseconnection.getConnection();
         PreparedStatement stmt = conn.prepareStatement(sql);
         ResultSet rs = stmt.executeQuery()) {

        if (rs.next()) {
            return rs.getInt("payment_id");
        } else {
            LOGGER.log(Level.INFO, "No payments found in the database.");
            return -1; // No records
        }
    } catch (SQLException e) {
        LOGGER.log(Level.SEVERE, "Error fetching the latest payment ID", e);
        return -1; // SQL error
    }
}


    // Get Payment by ID
    public Payment getPaymentById(int paymentId) {
        String sql = "SELECT * FROM payment WHERE payment_id = ?";
        try (Connection conn = Databaseconnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
             
            stmt.setInt(1, paymentId);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                return mapResultSetToPayment(rs);
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error fetching payment by ID", e);
        }
        return null;
    }
public int getPaymentIdByEmail(String email) {
        String sql = "SELECT payment_id FROM payment WHERE email = ? ORDER BY payment_date DESC LIMIT 1";
        try (Connection conn = Databaseconnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
             
            stmt.setString(1, email);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                return rs.getInt("payment_id");
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error fetching payment ID by email", e);
        }
        return -1;
    }
    // Get All Payments
    public List<Payment> getAllPayments() {
        List<Payment> payments = new ArrayList<>();
        String sql = "SELECT * FROM payment";

        try (Connection conn = Databaseconnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
             
            while (rs.next()) {
                payments.add(mapResultSetToPayment(rs));
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error fetching all payments", e);
        }
        return payments;
    }

    // Update Payment Status
    public boolean updatePaymentStatus(int paymentId, String status) {
        String sql = "UPDATE payment SET status = ? WHERE payment_id = ?";
        try (Connection conn = Databaseconnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
             
            stmt.setString(1, status);
            stmt.setInt(2, paymentId);

            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error updating payment status", e);
            return false;
        }
    }

    public boolean deletePaymentById(int paymentId) {
    String sql = "DELETE FROM payment WHERE payment_id = ?";
    try (Connection conn = Databaseconnection.getConnection();
         PreparedStatement stmt = conn.prepareStatement(sql)) {
         
        stmt.setInt(1, paymentId);
        int rowsAffected = stmt.executeUpdate();
        LOGGER.log(Level.INFO, "Rows affected when deleting payment: " + rowsAffected);
        
        // If no rows affected, try setting foreign key references to NULL
        if (rowsAffected == 0) {
            String updateSql = "UPDATE payment SET email = NULL, username = NULL, phone_number = NULL WHERE payment_id = ?";
            try (PreparedStatement updateStmt = conn.prepareStatement(updateSql)) {
                updateStmt.setInt(1, paymentId);
                rowsAffected = updateStmt.executeUpdate();
                LOGGER.log(Level.INFO, "Rows updated when nullifying payment references: " + rowsAffected);
            }
        }
        
        return rowsAffected > 0;
    } catch (SQLException e) {
        LOGGER.log(Level.SEVERE, "Error deleting payment", e);
        return false;
    }
}

public boolean deleteCustomerByEmail(String email) {
    String sql = "DELETE FROM customer WHERE email = ?";
    try (Connection conn = Databaseconnection.getConnection();
         PreparedStatement stmt = conn.prepareStatement(sql)) {
        stmt.setString(1, email);
        int rowsAffected = stmt.executeUpdate();
        
        // If deletion fails, log details
        if (rowsAffected == 0) {
            // Check if customer exists and has related records
            if (checkCustomerExists(conn, email)) {
                LOGGER.log(Level.WARNING, "Customer exists but could not be deleted. Possible related records exist.");
            }
        }
        
        LOGGER.log(Level.INFO, "Rows affected when deleting customer: " + rowsAffected);
        return rowsAffected > 0;
    } catch (SQLException e) {
        LOGGER.log(Level.SEVERE, "Error deleting customer by email", e);
        return false;
    }
}

// Helper method to check if customer exists and has related records
private boolean checkCustomerExists(Connection conn, String email) throws SQLException {
    String checkSql = "SELECT COUNT(*) FROM customer c " +
                      "LEFT JOIN payment p ON c.email = p.email OR c.phone_number = p.phone_number OR c.username = p.username " +
                      "WHERE c.email = ? AND p.payment_id IS NOT NULL";
    
    try (PreparedStatement stmt = conn.prepareStatement(checkSql)) {
        stmt.setString(1, email);
        try (ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                int relatedRecords = rs.getInt(1);
                if (relatedRecords > 0) {
                    LOGGER.log(Level.WARNING, "Customer has " + relatedRecords + " related payment records preventing deletion");
                    return true;
                }
            }
        }
    }
    return false;
}

    // Helper: Map ResultSet to Payment Object
    private Payment mapResultSetToPayment(ResultSet rs) throws SQLException {
        Payment payment = new Payment();
        payment.setPaymentId(rs.getInt("payment_id"));
        payment.setBookingId(rs.getInt("booking_id"));
        payment.setAmount(rs.getBigDecimal("amount"));
        payment.setStatus(rs.getString("status"));
        payment.setPaymentDate(rs.getTimestamp("payment_date").toLocalDateTime());
        payment.setEmail(rs.getString("email"));
        payment.setUsername(rs.getString("username"));
        payment.setPhoneNumber(rs.getString("phone_number"));
        return payment;
    }
     // Helper: Map ResultSet to Payment Object
    private Useradd mapResultSetToUseradd(ResultSet rs) throws SQLException {
        Useradd useradd = new Useradd();
        useradd.setEmail(rs.getString("email"));
        useradd.setUsername(rs.getString("username"));
        useradd.setPhoneNumber(rs.getString("phone_number"));
        return useradd;
    }
}
