package com.flick.model;

public class Useradd {
    private String email;
    private String username;
    private String phoneNumber;

    // Default constructor
    public Useradd() {}

    // Constructor for easier initialization
    public Useradd(String email, String username, String phoneNumber) {
        this.email = email;
        this.username = username;
        this.phoneNumber = phoneNumber;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    // Validation method
    public boolean isValidUser() {
        return email != null && !email.trim().isEmpty()
                && username != null && !username.trim().isEmpty()
                && phoneNumber != null && !phoneNumber.trim().isEmpty();
    }

    // Override toString for better debugging
    @Override
    public String toString() {
        return "Useradd{" +
                "email='" + email + '\'' +
                ", username='" + username + '\'' +
                ", phoneNumber='" + phoneNumber + '\'' +
                '}';
    }
}
