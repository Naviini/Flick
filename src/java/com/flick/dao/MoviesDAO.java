/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.flick.dao;

import com.flick.model.Movies;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
/**
 *
 * @author ravindupriyankara
 */
public class MoviesDAO {
    private Connection conn;
    
    public MoviesDAO(Connection conn){
        this.conn = conn;
    }

// Fetch movies with pagination
    public List<Movies> getMovies(String searchQuery, int page, int pageSize) throws SQLException {
        List<Movies> movies = new ArrayList<>();
        String query = "SELECT * FROM movies WHERE title LIKE ? LIMIT ?, ?";

        try (PreparedStatement stmt = conn.prepareStatement(query)) {
            int offset = (page - 1) * pageSize;

            stmt.setString(1, "%" + (searchQuery != null ? searchQuery : "") + "%");
            stmt.setInt(2, offset);
            stmt.setInt(3, pageSize);

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Movies movie = new Movies();
                    movie.setId(rs.getInt("id"));
                    movie.setTitle(rs.getString("title"));
                    movie.setRating(rs.getInt("rating"));
                    movie.setImageUrl(rs.getString("image_url"));
                    movies.add(movie);
                }
            }
        }

        return movies;
    }

    // Get the total count of movies matching the search query
    public int getTotalMoviesCount(String searchQuery) throws SQLException {
        String query = "SELECT COUNT(*) FROM movies WHERE title LIKE ?";
        try (PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, "%" + (searchQuery != null ? searchQuery : "") + "%");

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1);
                }
            }
        }
        return 0;
    }
}
