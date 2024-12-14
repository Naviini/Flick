
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%--<%@ page import="java.io.*" %>--%>
<%--<%@ page import="java.util.*" %>--%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Movies|Cinex</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <script src="js/navbar.js" defer></script>
    <style>
/*        .movie-container {
            width: 80%;
            margin: auto;
            padding: 50px;
        }*/
        .movie {
            background: #1f2937;
            width: 80%;
            height: 250px;
            margin: 20px 0;
            margin-left: 140px;
            margin-right: 140px;
            margin-bottom: 35px;
            /*padding: 30px;*/
            border-radius: 20px;
            box-shadow: 5px 5px 20px rgba(204, 251, 241, 0.263);
            /*box-shadow: 2px 2px 10px rgba(204, 251, 241, 0.849);*/
            /*box-shadow: 10px 10px 30px rgb(204 251 241);*/
            /*box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);*/
        }
        .movie_description{
            /*background: red;*/
            /*display: flex;*/
            width: 500px;
            margin-left: 375px;
            padding-top: 15px;
            /*margin-top: 50px;*/
        }
        .movie_cover1{
            /*display: flex;*/
            background: gray;
            width: 350px;
            height: 250px;
            border-radius: 20px;
            margin-bottom: 30px;
            /*height: 300px;*/
            /*margin-left: 10px;*/
            /*margin-top: -190px;*/
            /*padding-bottom: 100px;*/
            /*height: 400px;*/
            /*margin: 0;*/
        }
        .movie h2 {
            font-size: 30px;
            font-weight: 500;
            /*margin-top: 40px;*/
            /*margin: 0;*/
            /*padding-left: 20px;*/
            /*color: #333;*/
        }
        .movie p {
            color: #D1D5DB;
/*            margin: 5px 0;
            font-size: 18px;
            margin-left: 250px;*/
            /*font-weight: 400;*/
            /*color: #666;*/
        }
        .show-times {
            margin-top: 10px;
        }
        .show-time {
            display: inline-block;
            margin-right: 10px;
            padding: 5px 10px;
            background: #007BFF;
            color: white;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
        }
        .show-time:hover {
            background: #0056b3;
        }
        #logo{
            height: 45px;
            margin-top: 3px;
            /*margin-left: -0px;*/
            margin-left: 13px;
        }
        #head{
            height: 75px;
        }
        #navigation{
            font-size:20px;
        }
        #Book_btn{
            /*display: flex;*/
            margin-left: 980px;
            margin-top: -95px;
            /*margin-bottom: -50px;*/
        }
        #cover1{
            /*display: flex;*/
            /*margin-top: -188px;*/
            margin-top: -204px;
            border-radius: 20px;
/*            margin-bottom: 25px;
            margin-left: 20px;
            width: 210px;*/
            height: 250px;
            /*padding-left: 20px;*/
        }
/*        .book_btn{
            display: flex;
            background: red;
            width: 200px;
            margin-left: 1000px;
            margin-top: -10px;
        }*/
    </style>
</head>
<body class="bg-gray-900 text-gray-100 min-h-screen flex flex-col" style = "overflow-x: hidden;">

    <!-- Navigation Bar -->
    <header class="fixed top-0 left-0 w-full z-50 bg-gray-900 bg-opacity-90 backdrop-blur-sm shadow-lg">
      <div class="container mx-auto flex justify-between items-center px-6 py-3">
        <!-- Logo -->
        <h1 class="text-3xl font-extrabold text-teal-300 tracking-wide"> 
            <!--i changed it-->
          <a href="home.jsp"><img src="images/logo.png" id="logo"></a>
        </h1>

        <!-- Navigation Menu (Desktop) -->
        <nav class="hidden md:flex space-x-8 text-lg font-medium text-gray-300">
          <a href="home.jsp" class="hover:text-teal-300  transition duration-300">Home</a>
          <a href="home.jsp#about-us" class="hover:text-teal-300  transition duration-300">About Us</a>
          <!--<a href="#upcoming-movies"" class="hover:text-teal-300  transition duration-300">Movies</a>-->
          <a href="movies.jsp" class="hover:text-teal-300  transition duration-300">Movies</a>
          <a href="home.jsp#faq" class="hover:text-teal-300  transition duration-300">FAQ</a>
        </nav>

        <!-- Profile Section -->
        <div class="hidden md:flex items-center space-x-4">
          <img src="resources/dashboard/home/profile.svg" alt="User Logo" class="w-10 h-10 rounded-full border-2 border-teal-300 ">
          
              
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

<body>
<!--     Right Content 
        <div class="lg:w-1/2 flex justify-center lg:justify-end">
          <img src="resources/dashboard/home/3.svg" alt="Cinema Experience" 
               class=" transform hover:scale-105 transition duration-500 ">
        </div>
      </div>

       Decorative Element 
      <div class="absolute top-0 left-0 w-48 h-48 bg-teal-300 opacity-20 rounded-full blur-xl"></div>
      <div class="absolute bottom-0 right-0 w-64 h-64 bg-yellow-400 opacity-10 rounded-full blur-2xl"></div>
    
       Decorative Background Elements 
      <div class="absolute top-0 left-0 w-64 h-64 bg-teal-300 opacity-10 rounded-full blur-3xl transform -translate-y-16 -translate-x-16"></div>
      <div class="absolute bottom-0 right-0 w-96 h-96 bg-teal-300 opacity-20 rounded-full blur-3xl transform translate-y-16 translate-x-16"></div>

      <div class="relative container mx-auto px-6 lg:px-12">
          
      <section id="testimonials" class="py-20 bg-gray-900 text-white">
         Decorative Elements 
        <div class="absolute top-0 left-0 w-64 h-64 bg-teal-300 opacity-10 rounded-full blur-3xl transform -translate-y-16"></div>

        <div class="container mx-auto px-6 lg:px-12 relative"></div>
          
          -->
    <!--<h1>Available Movies</h1>-->
        <section id="upcoming-movies" class="py-20">
        <div class="container mx-auto px-6 lg:px-12 text-left">
            <h2 class="text-4xl lg:text-5xl font-extrabold text-teal-300 tracking-wide">Available Movies</h2>
            <p class="mt-4 text-lg lg:text-xl text-gray-300 leading-relaxed max-w-2xl">
                Get ready for the most anticipated blockbusters and cinematic experiences!
            </p>
        </div>
            
<!--        <div class="container mx-auto px-6 lg:px-12 mt-12 grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-8">
            <c:forEach var="movie" items="${upcomingMovies}">
                <div class="bg-gray-800 rounded-lg overflow-hidden shadow-lg hover:shadow-2xl transform hover:scale-105 transition duration-300">
                    <img src="${movie.imageUrl}" alt="${movie.title}" class="w-full h-64 object-cover">
                    <div class="p-6">
                        <h3 class="text-2xl font-bold text-teal-300">${movie.title}</h3>
                        <p class="mt-2 text-gray-300">Release Date: ${movie.releaseDate}</p>
                        <p class="mt-4 text-gray-400 text-sm">${movie.description}</p>
                        <div class="mt-6 text-center">
                            <a href="MoviesServlet" class="bg-teal-300 hover:bg-teal-300 text-gray-900 py-2 px-6 rounded-lg font-bold shadow-lg transition">
                                Learn More
                            </a>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </section>-->

        <%
            Connection conn = null;
            Statement stmt = null;
            ResultSet movies = null;

            try {
                // Database connection
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/movie_booking", "root", "Nan#3rdSqlWish.");
                stmt = conn.createStatement();

                // Execute query
                String sql = "SELECT * FROM movies";
                movies = stmt.executeQuery(sql);

                // Display movies
                while (movies.next()) {
        %>
                    <div class="movie">
                        <div class="movie_description">
                            <h2><%= movies.getString("title") %></h2>
                            <p>Genre: <%= movies.getString("genre") %></p>
                            <p>Description: <%= movies.getString("description") %></p>
                            <p>Show Times: <%= movies.getString("show_times") %></p>
                            <p>Director: <%= movies.getString("director") %></p>
                            <p>Cast: <%= movies.getString("cast") %></p>
                            <p>Duration: <%= movies.getInt("duration") %> minutes</p>
                        </div>
                        <div class="movie_cover1">
                            <img src="<%= movies.getString("cover1") %> " alt="Movie Poster" class="w-55 h-60 object-cover rounded-lg" id="cover1">
                        <!--<img src="<%= movies.getString("cover1") %> " alt="Movie Poster" class="w-55 h-60 object-cover rounded-lg">-->
                        <!--<img src="https://i.imghippo.com/files/cM5761ibo.jpg" alt="Movie Poster" class="w-40 h-60 object-cover rounded-lg" id="cover1">-->
                        </div>
                        
                        <!-- Book Now Button -->
                            <div class="mt-0.2 text-center" id="Book_btn">
                            <a href="seatbook.jsp" class="bg-teal-300 hover:bg-teal-300 text-gray-900 py-2 px-6 rounded-lg font-bold shadow-lg transition" >
                                Book Now
                            </a>
                        </div>
<!--                        <div class="book_btn">
                            <a href="MoviesServlet" class="bg-teal-300 hover:bg-teal-300 text-gray-900 py-2 px-6 rounded-lg font-bold shadow-lg transition">
                                Book Now
                            </a>
                        </div>-->
<!--                        <button type="submit" id="Book_btn"
                                class=" bg-teal-300 hover:bg-teal-300 text-gray-900 py-2 px-6 rounded-lg font-bold shadow-lg transition">
                          Book Now
                        </button>-->
                            
                    </div>
                    
        <%
                }
            } catch (Exception e) {
                out.println("<p>Error fetching movies: " + e.getMessage() + "</p>");
            } finally {
                // Close resources
                if (movies != null) try { movies.close(); } catch (SQLException e) {}
                if (stmt != null) try { stmt.close(); } catch (SQLException e) {}
                if (conn != null) try { conn.close(); } catch (SQLException e) {}
            }
        %>
    </div>
</body>
</html>
