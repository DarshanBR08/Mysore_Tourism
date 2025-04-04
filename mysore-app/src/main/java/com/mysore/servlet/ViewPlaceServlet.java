package com.mysore.servlet;

import java.io.IOException;

import com.mysore.dao.PlacesDAO;
import com.mysore.dao.PlacesDAOImpl;
import com.mysore.dto.Places;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet("/viewplace")
public class ViewPlaceServlet extends HttpServlet{
@Override
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	Places p=null;
	PlacesDAO pdao=new PlacesDAOImpl();
	p=pdao.getPlaces(Integer.parseInt(req.getParameter("placeid")));
	if(p!=null) {
		req.setAttribute("placedetails", p);
		RequestDispatcher rd=req.getRequestDispatcher("viewplaces.jsp");
		rd.forward(req, resp);
	}
	
}
}
