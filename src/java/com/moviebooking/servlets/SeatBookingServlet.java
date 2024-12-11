/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.moviebooking.servlets;

import DBconn.DatabaseConnection;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;

//import jakarta.servlet.http.*;

//import java.io.IOException;
//import java.io.PrintWriter;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet(name = "SeatBookingServlet", urlPatterns = {"/book"})
public class SeatBookingServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String seatIds = request.getParameter("seats"); // Expecting a JSON array of seat IDs
        try (Connection conn = DatabaseConnection.getConn()) {
            String sql = "UPDATE seats SET status = 'booked' WHERE seat_id IN (?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, seatIds); // Assuming seatIds is a comma-separated string
            int updated = ps.executeUpdate();

            response.setContentType("application/json");
            PrintWriter out = response.getWriter();
            if (updated > 0) {
                out.write("{\"success\": true, \"message\": \"Seats booked successfully.\"}");
            } else {
                out.write("{\"success\": false, \"message\": \"Error booking seats.\"}");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error.");
        }
    }
}


//package com.moviebooking;
//
//import DBconn.DatabaseConnection;
//import com.google.gson.Gson;
//import com.google.gson.reflect.TypeToken;
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.*;
//import java.io.IOException;
//import java.io.PrintWriter;
//import java.sql.Connection;
//import java.sql.PreparedStatement;
//import java.sql.SQLException;
//import java.util.Collections;
//import java.util.List;
//
//@WebServlet(name = "BookSeatsServlet", urlPatterns = {"/bookSeats"})
//public class SeatBooking extends HttpServlet {
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        response.setContentType("application/json");
//        String seatIdsJson = request.getParameter("seats");
//
//        if (seatIdsJson == null || seatIdsJson.isEmpty()) {
//            response.getWriter().write("{\"success\": false, \"message\": \"No seats provided.\"}");
//            return;
//        }
//
//        try {
//            List<String> seatIds = new Gson().fromJson(seatIdsJson, new TypeToken<List<String>>() {}.getType());
//            if (seatIds.isEmpty()) {
//                response.getWriter().write("{\"success\": false, \"message\": \"Invalid seat IDs.\"}");
//                return;
//            }
//
//            try (Connection conn = DatabaseConnection.getConn()) {
//                String placeholders = String.join(",", Collections.nCopies(seatIds.size(), "?"));
//                String sql = "UPDATE seats SET status = 'booked' WHERE seat_id IN (" + placeholders + ")";
//                PreparedStatement ps = conn.prepareStatement(sql);
//
//                for (int i = 0; i < seatIds.size(); i++) {
//                    ps.setString(i + 1, seatIds.get(i));
//                }
//
//                int updated = ps.executeUpdate();
//                PrintWriter out = response.getWriter();
//                if (updated > 0) {
//                    out.write("{\"success\": true, \"message\": \"Seats booked successfully.\"}");
//                } else {
//                    out.write("{\"success\": false, \"message\": \"No seats were updated.\"}");
//                }
//            }
//        } catch (SQLException e) {
//            e.printStackTrace(); // Replace with logging
//            response.getWriter().write("{\"success\": false, \"message\": \"Database error.\"}");
//        }
//    }
//}
