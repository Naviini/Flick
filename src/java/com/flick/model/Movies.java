/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.flick.model;

/**
 *
 * @author ravindupriyankara
 */
public class Movies {
    
    /**
     * 
     * id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    rating DECIMAL(3, 1) NOT NULL,
    image_url VARCHAR(255) NOT NULL
     */
    
    private int id;
    private String title;
    private int rating;
    private String image_url;
    
    //getters
    public int getId(){
        return id;
    }
    
    public String getTitle(){
        return title;
    }
    
    public int getRating(){
        return rating;
    }
    
    public String getImageUrl(){
        return image_url;
    }
    
    //setters
    
    public void setId(int id){
        this.id = id;
    }
    
    public void setTitle(String title){
        this.title = title;
    }
    
    public void setRating(int rating){
        this.rating = rating;
    }
    
    public void setImageUrl(String image_url){
        this.image_url = image_url;
    }
}
