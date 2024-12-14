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

@WebServlet(name = "confirmationServlet", urlPatterns = {"/confirm"})
public class confirmationServlet extends HttpServlet {

    private static final String DB_URL = "jdbc:mysql://localhost:3306/movie_booking";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "Nan#3rdSqlWish.";

    
@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        try {
            // Load MySQL driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish connection to the database
            Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
            
            // Example code in your servlet
//            ResultSet movies = statement.executeQuery("SELECT * FROM movies");
//            request.setAttribute("movies", movies);


            // Fetch all movies
            String sql = "SELECT * FROM bookings";
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);

            // Pass movie data to the JSP page
            request.setAttribute("bookings", rs);
            request.getRequestDispatcher("confirmation.jsp").forward(request, response);

//            // Pass movie data to the booking JSP page
//            request.setAttribute("movies", rs);
//            request.getRequestDispatcher("booking.jsp").forward(request, response);
//            
            // Close connection
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}
