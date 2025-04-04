package com.mysore.servlet;

import java.io.IOException;
import java.util.ArrayList;

import com.mysore.dao.userDAO;
import com.mysore.dao.userDAOImpl;
import com.mysore.dto.User;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet("/searchuser")
public class SearchUserServlet extends HttpServlet {
@Override
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	 String searchValue = req.getParameter("search"); // Get search input
     String sortBy = req.getParameter("sortBy"); // Get sorting option

     // If no search term is entered, fetch all customers
     if (searchValue == null) {
         searchValue = ""; // Treat it as fetching all customers
     }

     userDAO cdao = new userDAOImpl();
     ArrayList<User> list = cdao.searchUser(searchValue, sortBy); // Fetch sorted & filtered data

     req.setAttribute("search", list);
     req.setAttribute("searchValue", searchValue); // Keep search text in JSP
     req.setAttribute("sortBy", sortBy); // Keep selected sorting in JSP

     RequestDispatcher rd = req.getRequestDispatcher("userdetails.jsp");
     rd.forward(req, resp);
 }
}

