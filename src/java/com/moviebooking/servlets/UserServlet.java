///*
// * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
// * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
// */
//package com.moviebooking.servlets;
//
//import java.io.IOException;
//import java.io.PrintWriter;
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import java.sql.*;
//import jakarta.servlet.http.*;
////import org.mindrot.jbcrypt.BCrypt;
//
//@WebServlet(name = "UserServlet", urlPatterns = {"/user"})
//public class UserServlet extends HttpServlet {
//
//    private static final String DB_URL = "jdbc:mysql://localhost:3306/movie_booking";
//    private static final String DB_USER = "root";
//    private static final String DB_PASSWORD = "Nan#3rdSqlWish.";
//
//    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
//            throws ServletException, IOException {
//        String action = request.getParameter("action");
//        if ("register".equals(action)) {
//            registerUser(request, response);
//        } else if ("login".equals(action)) {
//            loginUser(request, response);
//        }
//    }
//
//    private void registerUser(HttpServletRequest request, HttpServletResponse response) 
//            throws IOException {
//        String name = request.getParameter("name");
//        String email = request.getParameter("email");
//        String password = request.getParameter("password");
//        String userType = request.getParameter("userType");
//        
//        try {
//            Class.forName("com.mysql.cj.jdbc.Driver");
//            Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
////            String sql = "INSERT INTO users (name, email, password) VALUES (?, ?, ?)";
//            String sql = "INSERT INTO users (name, email, password, user_type) VALUES (?, ?, ?, ?)";
//            
//            PreparedStatement ps = conn.prepareStatement(sql);
//            ps.setString(1, name);
//            ps.setString(2, email);
//            ps.setString(3, password);
//             ps.setString(4, userType);
//            ps.executeUpdate();
//            conn.close();
//            response.sendRedirect("login.html");
//        } catch (Exception e) {
//            e.printStackTrace();
//            response.getWriter().println("Error: " + e.getMessage());
//        }
//    }
//
//    private void loginUser(HttpServletRequest request, HttpServletResponse response) 
//            throws IOException {
//        String email = request.getParameter("email");
//        String password = request.getParameter("password");
//
//        try {
//            Class.forName("com.mysql.cj.jdbc.Driver");
//            Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
//            String sql = "SELECT * FROM users WHERE email = ? AND password = ?";
//            PreparedStatement ps = conn.prepareStatement(sql);
//            ps.setString(1, email);
//            ps.setString(2, password);
//            ResultSet rs = ps.executeQuery();
//            
//            
//            if (rs.next()) {
//                HttpSession session = request.getSession();
//                session.setAttribute("userId", rs.getInt("id"));
////                response.sendRedirect("home.jsp");
////            } else {
////                response.getWriter().println("Invalid cr0edentials.Try again!");
////                response.sendRedirect("login.html");
//             session.setAttribute("userType", rs.getString("user_type"));
//                session.setAttribute("userName", rs.getString("name"));
//                
//                // Redirect based on user type
//                String userType = rs.getString("user_type");
//                if ("admin".equals(userType)) {
//                    response.sendRedirect("admin/index.html");
//                } else {
//                    response.sendRedirect("home.jsp");
//                }
//            } else {
//                response.sendRedirect("login.html?error=invalid");
//            }
//            conn.close();
//        } catch (Exception e) {
//            e.printStackTrace();
//            response.getWriter().println("Error: " + e.getMessage());
//        }
//    
//    
//    //login
////    httpSession.setAttribute("current-user,user", user);
////    
////    if(user.getUserType)
//    //admin.jsp
//    //user.jsp
//    
//    
//    
//    }
//}
//    

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
//package com.moviebooking.servlets;
//
//import java.io.IOException;
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import java.sql.*;
//import jakarta.servlet.http.*;
//import org.mindrot.jbcrypt.BCrypt;
//
//@WebServlet(name = "UserServlet", urlPatterns = {"/user"})
//public class UserServlet extends HttpServlet {
//
//    private static final String DB_URL = "jdbc:mysql://localhost:3306/movie_booking";
//    private static final String DB_USER = "root";
//    private static final String DB_PASSWORD = "Nan#3rdSqlWish.";
//
//    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
//            throws ServletException, IOException {
//        String action = request.getParameter("action");
//        if ("register".equals(action)) {
//            registerUser(request, response);
//        } else if ("login".equals(action)) {
//            loginUser(request, response);
//        }
//    }
//
//    // Helper method to hash passwords
//    private String hashPassword(String plainTextPassword) {
//        return BCrypt.hashpw(plainTextPassword, BCrypt.gensalt(12));
//    }
//
//    // Helper method to verify passwords
//    private boolean checkPassword(String plainTextPassword, String hashedPassword) {
//        return BCrypt.checkpw(plainTextPassword, hashedPassword);
//    }
//
//    private void registerUser(HttpServletRequest request, HttpServletResponse response) 
//            throws IOException {
//        String name = request.getParameter("fullName");
//        String email = request.getParameter("email");
//        String password = request.getParameter("password");
//        String userType = request.getParameter("userType");
//
//        // Hash the password
//        String hashedPassword = hashPassword(password);
//
//        try {
//            // Check if email already exists
//            if (emailExists(email)) {
//                response.sendRedirect("register.html?error=email_exists");
////                response.sendRedirect("register.html");
//                return;
//            }
//
//            Class.forName("com.mysql.cj.jdbc.Driver");
//            Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
//            String sql = "INSERT INTO users (name, email, password, user_type) VALUES (?, ?, ?, ?)";
//            
//            PreparedStatement ps = conn.prepareStatement(sql);
//            ps.setString(1, name);
//            ps.setString(2, email);
//            ps.setString(3, hashedPassword);
//            ps.setString(4, userType);
//            
//            ps.executeUpdate();
//            conn.close();
//            
//            response.sendRedirect("login.html?registration=success");
////            response.sendRedirect("login.html");
//        } catch (Exception e) {
//            e.printStackTrace();
//            response.sendRedirect("register.html?error=registration_failed");
////            response.sendRedirect("register.html");
//        }
//    }
//
//    private boolean emailExists(String email) throws SQLException, ClassNotFoundException {
//        Class.forName("com.mysql.cj.jdbc.Driver");
//        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
//            String sql = "SELECT COUNT(*) FROM users WHERE email = ?";
//            PreparedStatement ps = conn.prepareStatement(sql);
//            ps.setString(1, email);
//            ResultSet rs = ps.executeQuery();
//            rs.next();
//            return rs.getInt(1) > 0;
//        }
//    }
//
//    private void loginUser(HttpServletRequest request, HttpServletResponse response) 
//            throws IOException {
//        String email = request.getParameter("email");
//        String password = request.getParameter("password");
//
//        try {
//            Class.forName("com.mysql.cj.jdbc.Driver");
//            Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
//            String sql = "SELECT * FROM users WHERE email = ?";
//            PreparedStatement ps = conn.prepareStatement(sql);
//            ps.setString(1, email);
//            ResultSet rs = ps.executeQuery();
//
//            if (rs.next()) {
//                String storedHash = rs.getString("password");
//                
//                // Verify password
//                if (checkPassword(password, storedHash)) {
//                    HttpSession session = request.getSession();
//                    session.setAttribute("userId", rs.getInt("id"));
//                    session.setAttribute("userType", rs.getString("user_type"));
//                    session.setAttribute("userName", rs.getString("name"));
//                    
//                    // Redirect based on user type
//                    String userType = rs.getString("user_type");
//                    if ("admin".equals(userType)) {
//                        response.sendRedirect("admin/index.html");
//                    } else {
//                        response.sendRedirect("home.jsp");
//                    }
//                } else {
//                    response.sendRedirect("login.html?error=invalid_password");
////                    response.sendRedirect("login.html");
//                }
//            } else {
//                response.sendRedirect("login.html?error=user_not_found");
////                response.sendRedirect("login.html");
//            }
//            conn.close();
//        } catch (Exception e) {
//            e.printStackTrace();
//            response.sendRedirect("login.html?error=system_error");
////            response.sendRedirect("login.html");
//        }
//    }
//}
    

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.moviebooking.servlets;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.*;
import jakarta.servlet.http.*;
import org.mindrot.jbcrypt.BCrypt;
import java.util.UUID;
import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;

@WebServlet(name = "UserServlet", urlPatterns = {"/user"})
public class UserServlet extends HttpServlet {

    private static final String DB_URL = "jdbc:mysql://localhost:3306/movie_booking";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "Nan#3rdSqlWish.";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("register".equals(action)) {
            registerUser(request, response);
        } else if ("login".equals(action)) {
            loginUser(request, response);
        } else if ("forgot_password".equals(action)) {
            handleForgotPassword(request, response);
        } else if ("reset_password".equals(action)) {
            handleResetPassword(request, response);
        }
    }

    // Helper method to hash passwords
    private String hashPassword(String plainTextPassword) {
        return BCrypt.hashpw(plainTextPassword, BCrypt.gensalt(12));
    }

    // Helper method to verify passwords
    private boolean checkPassword(String plainTextPassword, String hashedPassword) {
        return BCrypt.checkpw(plainTextPassword, hashedPassword);
    }

    private void registerUser(HttpServletRequest request, HttpServletResponse response) 
            throws IOException {
        String name = request.getParameter("fullName");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String userType = request.getParameter("userType");

        // Hash the password
        String hashedPassword = hashPassword(password);

        try {
            // Check if email already exists
            if (emailExists(email)) {
                response.sendRedirect("register.html?error=email_exists");
                return;
            }

            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
            String sql = "INSERT INTO users (name, email, password, user_type) VALUES (?, ?, ?, ?)";
            
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, hashedPassword);
            ps.setString(4, userType);
            
            ps.executeUpdate();
            conn.close();
            
            response.sendRedirect("login.html?registration=success");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("register.html?error=registration_failed");
        }
    }

    private boolean emailExists(String email) throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
            String sql = "SELECT COUNT(*) FROM users WHERE email = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            rs.next();
            return rs.getInt(1) > 0;
        }
    }

    private void loginUser(HttpServletRequest request, HttpServletResponse response) 
            throws IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
            String sql = "SELECT * FROM users WHERE email = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                String storedHash = rs.getString("password");
                
                // Verify password
                if (checkPassword(password, storedHash)) {
                    HttpSession session = request.getSession();
                    session.setAttribute("userId", rs.getInt("id"));
                    session.setAttribute("userType", rs.getString("user_type"));
                    session.setAttribute("userName", rs.getString("name"));
                    
                    // Redirect based on user type
                    String userType = rs.getString("user_type");
                    if ("admin".equals(userType)) {
                        response.sendRedirect("admin/index.html");
                    } else {
                        response.sendRedirect("home.jsp");
                    }
                } else {
                    response.sendRedirect("login.html?error=invalid_password");
                }
            } else {
                response.sendRedirect("login.html?error=user_not_found");
            }
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("login.html?error=system_error");
        }
    }

    private void handleForgotPassword(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String email = request.getParameter("email");
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
            
            // Check if email exists
            String checkSql = "SELECT id FROM users WHERE email = ?";
            PreparedStatement checkPs = conn.prepareStatement(checkSql);
            checkPs.setString(1, email);
            ResultSet rs = checkPs.executeQuery();
            
            if (rs.next()) {
                // Generate reset token
                String token = UUID.randomUUID().toString();
                String updateSql = "UPDATE users SET reset_token = ?, reset_token_expiry = ? WHERE email = ?";
                PreparedStatement updatePs = conn.prepareStatement(updateSql);
                updatePs.setString(1, token);
                updatePs.setTimestamp(2, new Timestamp(System.currentTimeMillis() + 3600000)); // 1 hour expiry
                updatePs.setString(3, email);
                updatePs.executeUpdate();

                // Send reset email
                sendResetEmail(email, token);
                
                response.sendRedirect("forgot-password.html?status=email_sent");
            } else {
                response.sendRedirect("forgot-password.html?error=email_not_found");
            }
            
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("forgot-password.html?error=system_error");
        }
    }

    private void sendResetEmail(String email, String token) {
        // Email configuration
//        String from = "your-email@gmail.com"; // Replace with your email
//        String password = "your-app-password"; // Replace with your app password
//        String from = "your-email@gmail.com"; // Replace with your email
//        String password = "your-app-password"; // Replace with your app password
        String from = "your-email@gmail.com"; // Replace with your email
        String password = "your-app-password"; // Replace with your app password
        String host = "smtp.gmail.com";
        String resetLink = "http://localhost:8080/MovieBooking/reset-password.html?token=" + token;

        // Set mail properties
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.port", "587");

        // Authenticate and create session
        Session session = Session.getInstance(props, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(from, password);
            }
        });

        try {
            // Create message
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(from));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
            message.setSubject("Password Reset");
            message.setText("Click the following link to reset your password: " + resetLink);

            // Send message
            Transport.send(message);
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }

    private void handleResetPassword(HttpServletRequest request, HttpServletResponse response) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}
    
