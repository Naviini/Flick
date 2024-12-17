///*
// * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
// * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
// */
//package com.moviebooking.servlets;
//
//import com.flick.dao.MovieDAO;
//import com.flick.dao.TopMovieDAO;
////import com.flick.models.Movie;
////import com.flick.models.TopMovie;
////import com.flick.dbconnection.DBConnection;
//import com.flick.model.Movie;
//import com.flick.model.TopMovie;
//
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import jakarta.servlet.http.HttpSession;
//
//import java.io.IOException;
//import java.sql.Connection;
//import java.sql.PreparedStatement;
//import java.sql.SQLException;
//import java.util.List;
//
///**
// *
// * @author ravindupriyankara
// */
//
//@WebServlet("/HomeServlet")
//public class HomeServlet extends HttpServlet {
//
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        try {
//            // Establish database connection
//            Connection connection = DBConnection.getConnection();
//            
//            // Fetch upcoming movies using the MovieDAO
//            MovieDAO movieDAO = new MovieDAO(connection);
//            List<Movie> upcomingMovies = movieDAO.getUpcomingMovies();
//            
//            //fetch top movies using TopMovieDAO
//            TopMovieDAO topMovieDAO = new TopMovieDAO(connection);
//            List<TopMovie> topMovies = topMovieDAO.getTopMovies();
//
//            // Set movies as a request attribute
//            request.setAttribute("upcomingMovies", upcomingMovies);
//            
//            // Set top movies as a request attribute
//            request.setAttribute("topRatedMovies", topMovies);
//
//            // Forward to the home page JSP
//            request.getRequestDispatcher("/Dashboard/home.jsp").forward(request, response);
//
//        } catch (Exception e) {
//            e.printStackTrace();
//            // Handle errors and redirect to an error page or show an error message
//            request.setAttribute("error", "Unable to fetch movies.");
//            request.getRequestDispatcher("index.html").forward(request, response);
//        }
//    }
//}
