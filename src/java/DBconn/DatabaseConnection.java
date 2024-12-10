/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DBconn;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
     // Database URL, Username, and Password
    private static final String URL = "jdbc:mysql://localhost:3306/movie_booking";
    private static final String USER = "root"; // Replace with your MySQL username
    private static final String PASSWORD = "Nan#3rdSqlWish."; // Replace with your MySQL password

    // Method to establish and return a database connection
    public static Connection getConn() {
        Connection connection = null;
        try {
            // Load MySQL JDBC Driver (optional for some setups)
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish connection
            connection = DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (ClassNotFoundException e) {
            System.out.println("MySQL Driver not found. Please add the JDBC library to the project.");
        } catch (SQLException e) {
            System.out.println("Connection failed! Check output console.");
        }
        return connection;
    }

    // Method to close the connection (optional, good practice)
    public static void closeConnection(Connection connection) {
        try {
            if (connection != null && !connection.isClosed()) {
                connection.close();
            }
        } catch (SQLException e) {
        }
    }

    public static Connection getConnection() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}


