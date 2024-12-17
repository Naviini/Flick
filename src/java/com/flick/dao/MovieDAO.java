/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.flick.dao;

import com.flick.model.Movie;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ravindupriyankara
 */

public class MovieDAO {
    private Connection conn;

    public MovieDAO(Connection conn) {
        this.conn = conn;
    }

    public List<Movie> getUpcomingMovies() throws SQLException {
        List<Movie> movies = new ArrayList<>();
        String query = "SELECT * FROM UpcomingMovies ORDER BY release_date ASC";

        try (PreparedStatement stmt = conn.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                Movie movie = new Movie();
                movie.setId(rs.getInt("id"));
                movie.setTitle(rs.getString("title"));
                movie.setReleaseDate(rs.getDate("release_date").toString());
                movie.setDescription(rs.getString("description"));
                movie.setImageUrl(rs.getString("image_url"));
                movies.add(movie);
            }
        }

        return movies;
    }
}