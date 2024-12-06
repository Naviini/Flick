/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.moviebooking;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.*;
import jakarta.servlet.http.*;

import java.util.ArrayList;
import java.util.List;


@WebServlet(name = "BookingServlet", urlPatterns = {"/book"})
public class BookingServlet extends HttpServlet {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/movie_booking";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "Nan#3rdSqlWish.";

    // Fetch available seats for a movie and showtime
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    int movieId = Integer.parseInt(request.getParameter("movieId"));
    String showTime = request.getParameter("showTime");

    try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
        String sql = "SELECT seat_number, status FROM seats WHERE movie_id = ? AND status = 'available'";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, movieId);
        ResultSet rs = ps.executeQuery();

        // Store seat information in a list to pass to JSP
        List<String[]> seatList = new ArrayList<>();
        while (rs.next()) {
            String seatNumber = rs.getString("seat_number");
            String status = rs.getString("status");
            seatList.add(new String[]{seatNumber, status});
        }

        request.setAttribute("seats", seatList); // Use List<String[]> instead of ResultSet
        request.setAttribute("movieId", movieId);
        request.setAttribute("showTime", showTime);
        request.getRequestDispatcher("select_seat.jsp").forward(request, response);

    } catch (SQLException e) {
        e.printStackTrace();
        response.getWriter().println("Error fetching seat data: " + e.getMessage());
    }
}
    // Handle seat booking
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            response.getWriter().println("Error: You must be logged in to book a seat.");
            return;
        }

        int userId = (int) session.getAttribute("userId");
        int movieId = Integer.parseInt(request.getParameter("movieId"));
        String seatNumber = request.getParameter("seatNumber");
        String showTime = request.getParameter("showTime");

        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
            conn.setAutoCommit(false);

            // Validate if the seat is still available
            String validateSeatSql = "SELECT status FROM seats WHERE movie_id = ? AND seat_number = ?";
            PreparedStatement psValidate = conn.prepareStatement(validateSeatSql);
            psValidate.setInt(1, movieId);
            psValidate.setString(2, seatNumber);
            ResultSet rs = psValidate.executeQuery();

            if (rs.next() && rs.getString("status").equals("available")) {
                // Update seat status to 'booked'
                String updateSeatSql = "UPDATE seats SET status = 'booked' WHERE movie_id = ? AND seat_number = ?";
                PreparedStatement psUpdate = conn.prepareStatement(updateSeatSql);
                psUpdate.setInt(1, movieId);
                psUpdate.setString(2, seatNumber);
                psUpdate.executeUpdate();

                // Insert booking record
                String insertBookingSql = "INSERT INTO bookings (user_id, movie_id, seat_number, booking_time) VALUES (?, ?, ?, NOW())";
                PreparedStatement psInsert = conn.prepareStatement(insertBookingSql);
                psInsert.setInt(1, userId);
                psInsert.setInt(2, movieId);
                psInsert.setString(3, seatNumber);
                psInsert.executeUpdate();

                conn.commit();
                response.sendRedirect("confirmation.jsp");
            } else {
                conn.rollback();
                response.getWriter().println("Error: Seat is no longer available.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}

//if (seatList.isEmpty()) {
//    request.setAttribute("message", "No seats available for the selected movie and showtime.");
//}

//@WebServlet("/book")
//public class BookingServlet extends HttpServlet {
   
//    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        response.setContentType("text/html;charset=UTF-8");
//        try (PrintWriter out = response.getWriter()) {
//            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet BookingServlet</title>");
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet BookingServlet at " + request.getContextPath() + "</h1>");
//            out.println("</body>");
//            out.println("</html>");
//        }
//    }
//
//    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
//    /**
//     * Handles the HTTP <code>GET</code> method.
//     *
//     * @param request servlet request
//     * @param response servlet response
//     * @throws ServletException if a servlet-specific error occurs
//     * @throws IOException if an I/O error occurs
//     */
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        processRequest(request, response);
//    }
//
//    /**
//     * Handles the HTTP <code>POST</code> method.
//     *
//     * @param request servlet request
//     * @param response servlet response
//     * @throws ServletException if a servlet-specific error occurs
//     * @throws IOException if an I/O error occurs
//     */
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        processRequest(request, response);
//    }
//
//    /**
//     * Returns a short description of the servlet.
//     *
//     * @return a String containing servlet description
//     */
//    @Override
//    public String getServletInfo() {
//        return "Short description";
//    }// </editor-fold>
//
//}
