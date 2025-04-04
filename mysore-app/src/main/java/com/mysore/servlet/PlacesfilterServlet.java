package com.mysore.servlet;

import java.io.IOException;
import java.util.ArrayList;


import com.mysore.dao.PlacesDAO;
import com.mysore.dao.PlacesDAOImpl;
import com.mysore.dto.Places;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet("/place_filter")
public class PlacesfilterServlet extends HttpServlet{ 
@Override
protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	 String month = req.getParameter("month");
     String category = req.getParameter("category");
    
     
     PlacesDAO pdao = new PlacesDAOImpl();

    ArrayList<Places> filteredPlaces = pdao.getFilteredPlacesList(month, category);
     req.setAttribute("filteredPlaces", filteredPlaces);
     RequestDispatcher dispatcher = req.getRequestDispatcher("placedetails.jsp");
     dispatcher.forward(req, resp);
}
}

