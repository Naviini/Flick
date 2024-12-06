

<%--<%@page contentType="text/html" pageEncoding="UTF-8"%>--%>
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

<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Book Your Seats</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div class="container">
        <h1>Select Your Seats</h1>
        <form action="book" method="post">
            <input type="hidden" name="movieId" value="<%= request.getAttribute("movieId") %>">
            <input type="hidden" name="showTime" value="<%= request.getAttribute("showTime") %>">
            <div class="seat-grid">
                <div class="seat-grid">
    <% 
        List<String[]> seats = (List<String[]>) request.getAttribute("seats");
        if (seats != null) {
            for (String[] seat : seats) {
                String seatNumber = seat[0];
                String status = seat[1];
    %>
    <label>
        <input type="checkbox" name="seatNumbers" value="<%= seatNumber %>"
            <%= "booked".equals(status) ? "disabled" : "" %>>
        <div class="seat <%= "booked".equals(status) ? "booked" : "" %>">
            <%= seatNumber %>
        </div>
    </label>
    <% 
            }
        } else {
    %>
    <p>No seats available.</p>
    <% } %>
</div>

            </div>
            <button type="submit" class="book-btn">Confirm Booking</button>
        </form>
    </div>
</body>
</html>
