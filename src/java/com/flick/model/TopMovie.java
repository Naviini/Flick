/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.flick.model;

/**
 *
 * @author ravindupriyankara
 */
public class TopMovie {
    private int id;
    private String title;
    private int rating;
    private String imageUrl;
    
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
        return imageUrl;
    }
    
    public void setId(int id){
        this.id = id;
    }
    
    public void setTitle(String title){
        this.title = title;
    }
    
    public void setRating(int rating){
        this.rating = rating;
    }
    
    public void setImageUrl(String imageUrl){
        this.imageUrl = imageUrl;
    }
}
