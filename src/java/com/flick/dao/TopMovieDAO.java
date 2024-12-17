/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.flick.dao;

import com.flick.model.TopMovie;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
/**
 *
 * @author ravindupriyankara
 */
public class TopMovieDAO {
    private Connection conn;
    
    public TopMovieDAO(Connection conn){
        this.conn = conn;
    }
    
    public List<TopMovie> getTopMovies() throws SQLException {
        List<TopMovie> movies = new ArrayList<>();
        String query = "SELECT * FROM TopRatedMovies ORDER BY rating DESC LIMIT 8";

        try (PreparedStatement stmt = conn.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                TopMovie movie = new TopMovie();
                movie.setId(rs.getInt("id"));
                movie.setTitle(rs.getString("title"));
                movie.setImageUrl(rs.getString("image_url"));
                movie.setRating(rs.getInt("rating"));
                movies.add(movie);
            }
        }

        return movies;
    }
}
