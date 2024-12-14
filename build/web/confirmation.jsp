<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Booking Confirmation</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <script src="js/navbar.js" defer></script>
    <style>
        #logo{
            height: 45px;
            margin-top: 3px;
            /*margin-left: 13px;*/
        }
        #head{
            height: 75px;
        }
        #navigation{
            font-size:20px;
        }
        #Book_btn2{
            margin-top: 30px;
        }
        .booking_container{
            margin-left: 40px;
            margin-top: 150px;
        }
        body {
            /*font-family: Arial, sans-serif;*/
            text-align: center;
            /*margin-top: 100px;*/
        }  
        .btn_container{
             margin-top:200px;
        }

    </style>
<!--    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            margin-top: 50px;
        }  
    </style>-->
</head>

<body class="bg-gray-900 text-gray-100 min-h-screen flex flex-col" style = "overflow-x: hidden;">
    
     <!-- Decorative Element -->
      <div class="absolute top-0 left-0 w-48 h-48 bg-teal-300 opacity-20 rounded-full blur-xl"></div>
      <div class="absolute bottom-0 right-0 w-64 h-64 bg-teal-300 opacity-10 rounded-full blur-2xl"></div>
    </section>
    
    <section id="about-us" class="relative bg-gray-900 text-white py-20">
      <!-- Decorative Background Elements -->
      <div class="absolute top-0 left-0 w-64 h-64 bg-teal-300 opacity-10 rounded-full blur-3xl transform -translate-y-16 -translate-x-16"></div>
      <div class="absolute bottom-0 right-0 w-96 h-96 bg-teal-300 opacity-20 rounded-full blur-3xl transform translate-y-16 translate-x-16"></div>
    </section>

    <!-- Navigation Bar -->
    <header id="head" class="fixed top-0 left-0 w-full z-50 bg-gray-900 bg-opacity-90 backdrop-blur-sm shadow-lg">
      <div class="container mx-auto flex justify-between items-center px-6 py-3">
        <!-- Logo -->
        <h1 class="text-3xl font-extrabold text-teal-300 tracking-wide"> 
            <!--i changed it-->
            <!--<a href="Dashboard/home.jsp"><img src="flick 2.png"/></a>-->
            <a href="home.jsp"><img src="images/logo.png" id="logo"></a>
             <!--<a href="https://www.tesla.com/"><img src="logo.svg" class="i1"/></a>-->
        </h1>

        <!-- Navigation Menu (Desktop) -->
        <nav id="navigation" class="hidden md:flex space-x-8 text-lg font-medium text-gray-300">
          <a href="#home" class="hover:text-teal-300 transition duration-300">Home</a>
          <a href="#about-us" class="hover:text-teal-300 transition duration-300">About Us</a>
          <!--<a href="#upcoming-movies"" class="hover:text-teal-300 transition duration-300">Movies</a>-->
          <a href="movies.jsp"" class="hover:text-teal-300 transition duration-300">Movies</a>
          <!--<a href="movies.jsp" class="hover:text-teal-300 transition duration-300">Movies</a>-->
          <a href="#faq" class="hover:text-teal-300 transition duration-300">FAQ</a>
        </nav>

        <!-- Profile Section -->
        <div class="hidden md:flex items-center space-x-4">
          <img src="Dashboard/home/profile.svg" alt="User Logo" class="w-10 h-10 rounded-full border-2 border-teal-300">
          
              
          <span class="text-gray-300 font-medium">user@gmail.com</span>
          
          
        </div>

        <!-- Mobile Menu Button -->
        <button id="menu-toggle" class="block md:hidden text-teal-300 focus:outline-none">
          <svg class="w-8 h-8" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16m-7 6h7" />
          </svg>
        </button>
      </div>

      <!-- Mobile Navigation Menu -->
      <nav id="mobile-menu" class="hidden bg-gray-800 bg-opacity-90 md:hidden">
        <ul class="flex flex-col space-y-4 text-lg font-medium text-gray-300 py-4 px-6">
          <li><a href="#features" class="block hover:text-teal-300 transition duration-300">Features</a></li>
          <li><a href="#movies" class="block hover:text-teal-300 transition duration-300">Movies</a></li>
          <li><a href="#contact" class="block hover:text-teal-300 transition duration-300">Contact</a></li>
          <li>
            <div class="flex items-center space-x-4">
              <img src="https://via.placeholder.com/40" alt="User Logo" class="w-10 h-10 rounded-full border-2 border-teal-300">
              <span class="text-gray-300 font-medium">...</span>
            </div>
          </li>
        </ul>
      </nav>
    </header>
    

    
    <div class="booking_container">  
        <h1>Booking Confirmed!</h1>
        <p>Thank you for booking. Enjoy your movie!</p>
    
    <%
            Connection conn = null;
            Statement stmt = null;
            ResultSet bookings = null;

            try {
                // Database connection
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/movie_booking", "root", "Nan#3rdSqlWish.");
                stmt = conn.createStatement();

                // Execute query
                String sql = "SELECT * FROM bookings";
                bookings = stmt.executeQuery(sql);

                // Display movies
                while (bookings.next()) {
        %>
    
    <div class="movie">
                        <div class="movie_description">
                            <h2><%= bookings.getInt("id") %></h2>
                            <p>Booking Id: <%= bookings.getInt("user_id") %></p>
                            <p>movie Id: <%= bookings.getInt("movie_id") %></p>
                            <p>Booking Time: <%= bookings.getString("booking_time") %></p>
                            <p>Seat Numbers: <%= bookings.getInt("seat_number") %></p>
                   
                        </div>
                            
<!--                        <div class="movie_cover1">
                            <img src="<%= bookings.getString("cover1") %> " alt="Movie Poster" class="w-55 h-60 object-cover rounded-lg" id="cover1">                     
                       </div>-->
                      
    
        <%
                }
            } catch (Exception e) {
                out.println("<p>Error fetching movies: " + e.getMessage() + "</p>");
            } finally {
                // Close resources
                if (bookings != null) try { bookings.close(); } catch (SQLException e) {}
                if (stmt != null) try { stmt.close(); } catch (SQLException e) {}
                if (conn != null) try { conn.close(); } catch (SQLException e) {}
            }
        %>
   
        <!-- Book Now Button -->
        <div class="btn_container" >
            <div class="mt-0.2 text-center" id="Book_btn">
                <a href="seatbook.jsp" class="bg-teal-300 hover:bg-teal-300 text-gray-900 py-2 px-6 rounded-lg font-bold shadow-lg transition" >
                        Pay Now
                </a>
            </div>
        
            <div class="mt-0.2 text-center" id="Book_btn2">
                <a href="movies.jsp" class="bg-teal-300 hover:bg-teal-300 text-gray-900 py-2 px-6 rounded-lg font-bold shadow-lg transition" >
                        Back to Movies
                </a>
            </div>
        
            </div>
   </div>

</body>
</html>
