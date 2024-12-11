<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>-->

<%--<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>--%>
<%@ page import="java.sql.*, java.util.*" %>
<%
    // Fetch seat data from the database
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;
    List<Integer> bookedSeats = new ArrayList<>();
    try {
        conn = DBconn.DatabaseConnection.getConn();
        stmt = conn.createStatement();
        rs = stmt.executeQuery("SELECT seat_id FROM seats WHERE status = 'booked'");

        while (rs.next()) {
            bookedSeats.add(rs.getInt("seat_id"));
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (rs != null) rs.close();
        if (stmt != null) stmt.close();
        if (conn != null) conn.close();
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Seat Selection</title>
    <link rel="stylesheet" href="styles.css"> <!-- Optional CSS file -->
</head>
<body>
    <h1>Select Your Seats</h1>
    <div class="seat-grid">
        <%
            // Generate seat grid
            for (int i = 1; i <= 100; i++) {
                String className = bookedSeats.contains(i) ? "seat booked" : "seat";
        %>
            <div class="<%= className %>" data-seat-id="<%= i %>"><%= i %></div>
        <%
            }
        %>
    </div>
    <button id="confirmBooking">Confirm Booking</button>

    <script src="seatSelection.js"></script> <!-- JS for interactive seat selection -->
</body>
</html>
