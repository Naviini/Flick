/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.moviebooking.servlets;
// Path: src/java/com/moviebooking/servlets/AdminAuthenticationFilter.java

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.*;
import java.io.IOException;

//public class AdminAuthenticationFilter {
public class AdminAuthenticationFilter implements Filter {
    
//@WebFilter("/admin/*")

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // Initialization code if needed
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        HttpSession session = httpRequest.getSession(false);

        boolean isLoggedIn = (session != null && session.getAttribute("userId") != null);
        boolean isAdmin = isLoggedIn && "admin".equals(session.getAttribute("userType"));

        if (isAdmin) {
            chain.doFilter(request, response);
        } else {
            httpResponse.sendRedirect(httpRequest.getContextPath() + "/login.html");
        }
    }

    @Override
    public void destroy() {
        // Cleanup code if needed
    }
}