@WebServlet("/SeatBooking")
public class SeatBooking extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        
        try {
            // Read JSON data from request
            BufferedReader reader = request.getReader();
            StringBuilder sb = new StringBuilder();
            String line;
            while ((line = reader.readLine()) != null) {
                sb.append(line);
            }
            
            // Parse JSON
            JsonObject jsonObject = new Gson().fromJson(sb.toString(), JsonObject.class);
            JsonArray seatsArray = jsonObject.getAsJsonArray("seats");
            
            // Process seat booking
            // Your seat booking logic here
            
            // Send response
            JsonObject jsonResponse = new JsonObject();
            jsonResponse.addProperty("success", true);
            jsonResponse.addProperty("message", "Seats booked successfully");
            out.println(jsonResponse.toString());
            
        } catch (Exception e) {
            JsonObject jsonResponse = new JsonObject();
            jsonResponse.addProperty("success", false);
            jsonResponse.addProperty("message", e.getMessage());
            out.println(jsonResponse.toString());
        }
    }
} 