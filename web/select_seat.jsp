
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.*" %>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Select Seat</title>
<style>
        .seat { cursor: pointer; padding: 10px; margin: 5px; background-color: #007BFF; color: white; }
        .seat.booked { background-color: #ccc; pointer-events: none; }
    </style>
</head>
<body>
    <h1>Select Your Seat</h1>
    <form action="book" method="post">
        <input type="hidden" name="movieId" value="<%= request.getAttribute("movieId") %>">
        <input type="hidden" name="showTime" value="<%= request.getAttribute("showTime") %>">
        <div class="seats">
            <% 
                List<String[]> seats = (List<String[]>) request.getAttribute("seats");
                if (seats != null && !seats.isEmpty()) {
                    for (String[] seat : seats) {
                        String seatNumber = seat[0];
                        String status = seat[1];
            %>
                <label>
                    <input type="radio" name="seatNumber" value="<%= seatNumber %>" <%= "booked".equals(status) ? "disabled" : "" %> />
                    <div class="seat <%= "booked".equals(status) ? "booked" : "" %>">
                        <%= seatNumber %>
                    </div>
                </label>
            <% 
                    }
                } else { 
            %>
                <p>No available seats for this movie and showtime.</p>
            <% } %>
        </div>
        <button type="submit">Book Selected Seat</button>
    </form>
</body>
</html>