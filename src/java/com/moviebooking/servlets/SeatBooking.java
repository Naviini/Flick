/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.moviebooking.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.*;
import java.net.URLEncoder;
import java.util.logging.Logger;

@WebServlet(name = "SeatBooking", urlPatterns = {"/SeatBooking"})
public class SeatBooking extends HttpServlet {


//
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        processRequest(request, response);
//    }
    private static final Logger logger = Logger.getLogger(SeatBooking.class.getName());
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        processRequest(request, response);
    
        String selectedSeat = request.getParameter("selectedSeat");
        String name = request.getParameter("name"); 
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        
        Connection conn = null;
        PreparedStatement pstmt = null;
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/movie_booking", "root", "Nan#3rdSqlWish.");

            // Check if seat is already booked
            String checkSql = "SELECT seat_number FROM seats WHERE show_time_id = ? AND seat_number = ?";
            pstmt = conn.prepareStatement(checkSql);
            pstmt.setInt(1, 1); // Assuming show_id = 1
            pstmt.setInt(2, Integer.parseInt(selectedSeat));
            ResultSet rs = pstmt.executeQuery();

//            if (rs.next()) {
//                // Seat already booked
//                response.sendRedirect("seatbook.jsp?error=seatTaken");
//                return;
//            }
              if (rs.next()) {
                // Log the error
                logger.warning("Attempt to book an already booked seat: " + selectedSeat);
                response.sendRedirect("seatbook.jsp?error=seatTaken");
                return;
              }

            // Insert booking
//            String sql = "INSERT INTO bookings (show_id, seat_number, customer_name, email, phone) VALUES (?, ?, ?, ?, ?)";
            String sql = "INSERT INTO bookings (show_time_id, seat_number, name, phone_number) VALUES (?, ?, ?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, 1); // Assuming show_id = 1
            pstmt.setInt(2, Integer.parseInt(selectedSeat));
            pstmt.setString(3, name);
            pstmt.setString(4, email);
            pstmt.setString(5, phone);
            
            int result = pstmt.executeUpdate();
            
//            if(result > 0) {
//                // Booking successful
//                response.sendRedirect("seatbook.jsp?status=success");
//            } else {
//                // Booking failed
//                response.sendRedirect("seatbook.jsp?error=failed");
//            }
                      if (result > 0) {
                // Booking successful
                logger.info("Booking successful for seat: " + selectedSeat + ", by: " + name);
                response.sendRedirect("seatbook.jsp?status=success");
            } else {
                // Booking failed
                logger.warning("Booking failed for seat: " + selectedSeat);
                response.sendRedirect("seatbook.jsp?error=failed");
            }

        } catch (SQLIntegrityConstraintViolationException e) {
            // Log specific SQL constraint violations
            logger.severe("SQL Constraint Violation: " + e.getMessage());
            response.sendRedirect("seatbook.jsp?error=constraintViolation");
        } catch (Exception e) {
            // Log general exceptions
            logger.severe("Error during booking: " + e.getMessage());
            response.sendRedirect("seatbook.jsp?error=serverError");
        } finally {
            // Close resources
            try { if (pstmt != null) pstmt.close(); } catch (Exception e) { logger.warning("Failed to close statement: " + e.getMessage()); }
            try { if (conn != null) conn.close(); } catch (Exception e) { logger.warning("Failed to close connection: " + e.getMessage()); }
        }
    }
}

//        } catch(Exception e) {
//            response.sendRedirect("seatbook.jsp?error=" + e.getMessage());
// nv,this will Avoid Sending Detailed Error Messages in the URL
//      2nd attemt
//        }   catch (Exception e) {
//                String encodedError = URLEncoder.encode(e.getMessage(), "UTF-8");
//                response.sendRedirect("seatbook.jsp?error=" + encodedError);
//           
//        } finally {
//            try { pstmt.close(); } catch(Exception e) { }
//            try { conn.close(); } catch(Exception e) { }
//        }
//    }
//}

//    @Override
//    public String getServletInfo() {
//        return "Short description";
//    }// </editor-fold>
//
//}
