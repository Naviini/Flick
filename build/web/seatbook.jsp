
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Seat Booking</title>
        <style>
            .seat-container {
                display: grid;
                grid-template-columns: repeat(10, 1fr);
                gap: 10px;
                max-width: 800px;
                margin: 20px auto;
            }
            .seat {
                padding: 10px;
                text-align: center;
                background-color: #4CAF50;
                color: white;
                cursor: pointer;
                border: none;
                border-radius: 5px;
            }
            .seat.booked {
                background-color: #f44336;
                cursor: not-allowed;
            }
            .screen {
                width: 100%;
                height: 50px;
                background-color: #ddd;
                margin: 20px 0;
                text-align: center;
                line-height: 50px;
            }
            .booking-form {
                max-width: 400px;
                margin: 20px auto;
                padding: 20px;
                background-color: #f5f5f5;
                border-radius: 5px;
            }
        </style>
    </head>
    <body>
        <div class="header">
            <h1>Seat Booking</h1>
        </div>

        <div class="screen">SCREEN</div>

        <div class="seat-container">
            <%
                Connection conn = null;
                PreparedStatement pstmt = null;
                ResultSet rs = null;
                
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/movie_booking", "root", "Nan#3rdSqlWish.");
                    
                    // Get booked seats
                    String sql = "SELECT seat_number FROM seats WHERE show_time_id = ?";
                    pstmt = conn.prepareStatement(sql);
                    pstmt.setInt(1, 1); // Assuming show_id = 1
                    rs = pstmt.executeQuery();
                    
                    java.util.Set<Integer> bookedSeats = new java.util.HashSet<>();
                    while(rs.next()) {
                        bookedSeats.add(rs.getInt("seat_number"));
                    }
                    
                    // Display seats
                    for(int i = 1; i <= 50; i++) {
                        String seatClass = bookedSeats.contains(i) ? "seat booked" : "seat";
                        %>
                        <button class="<%=seatClass%>" 
                                onclick="selectSeat(<%=i%>)" 
                                id="seat<%=i%>" 
                                <%=bookedSeats.contains(i) ? "disabled" : ""%>>
                            Seat <%=i%>
                        </button>
                        <%
                    }
                } catch(Exception e) {
                    out.println("Error: " + e.getMessage());
                } finally {
                    try { rs.close(); } catch(Exception e) { }
                    try { pstmt.close(); } catch(Exception e) { }
                    try { conn.close(); } catch(Exception e) { }
                }
            %>
        </div>

        <form class="booking-form" action="SeatBooking" method="POST">
            <input type="hidden" name="selectedSeat" id="selectedSeatInput">
            <div>
                <label for="name">Name:</label>
                <input type="text" name="name" required>
            </div>
            <div>
                <label for="email">Email:</label>
                <input type="email" name="email" required>
            </div>
            <div>
                <label for="phone">Phone:</label>
                <input type="tel" name="phone" required>
            </div>
            <button type="submit"><a href="confirmation.jsp"B>Book Seat</a></button>
        </form>

        <script>
            function selectSeat(seatNumber) {
                // Remove previous selection
                document.querySelectorAll('.seat:not(.booked)').forEach(seat => {
                    seat.style.backgroundColor = '#4CAF50';
                });
                
                // Highlight selected seat
                document.getElementById('seat' + seatNumber).style.backgroundColor = '#2196F3';
                
                // Update hidden input
                document.getElementById('selectedSeatInput').value = seatNumber;
            }
        </script>
    </body>
</html>
