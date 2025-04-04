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
@WebServlet("/addplace")
public class AddPlaceServlet extends HttpServlet{
@Override
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	Places p=new Places();
	PlacesDAO pdao=new PlacesDAOImpl();
	p.setPlacename(req.getParameter("name"));
	p.setPlacecategory(req.getParameter("category"));
	p.setPlacemonth(req.getParameter("month"));
	p.setPlacehistory(req.getParameter("history"));
	p.setPlacedescription(req.getParameter("description"));
	p.setPlaceimage(req.getParameter("image"));
	if(pdao.insertplaces(p)) {
		req.setAttribute("added"," "+p.getPlacename()+" added Sucessfully");
		RequestDispatcher rd=req.getRequestDispatcher("addplaces.jsp");
		rd.forward(req, resp);
	}
	else{
		req.setAttribute("failed","Failed to add");
		RequestDispatcher rd=req.getRequestDispatcher("addplaces.jsp");
		rd.forward(req, resp);
	}
}
}
