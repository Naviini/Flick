
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
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }
        .movie-container {
            width: 80%;
            margin: auto;
            padding: 20px;
        }
        .movie {
            background: white;
            margin: 20px 0;
            padding: 15px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .movie h2 {
            margin: 0;
            color: #333;
        }
        .movie p {
            margin: 5px 0;
            color: #666;
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
    </style>
</head>
<body>
    <h1>Available Movies</h1>
    <div class="movie-list">
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
                        <h2><%= movies.getString("title") %></h2>
                        <p>Genre: <%= movies.getString("genre") %></p>
                        <p>Description: <%= movies.getString("description") %></p>
                        <p>Show Times: <%= movies.getString("show_times") %></p>
                        <p>Director: <%= movies.getString("director") %></p>
                        <p>Duration: <%= movies.getInt("duration") %> minutes</p>
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
