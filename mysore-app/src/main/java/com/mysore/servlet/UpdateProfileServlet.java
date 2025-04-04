package com.mysore.servlet;

import java.io.IOException;

import com.mysore.dao.userDAO;
import com.mysore.dao.userDAOImpl;
import com.mysore.dto.User;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/update_profile")
public class UpdateProfileServlet extends HttpServlet{
@Override
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	HttpSession session=req.getSession(false);
	User u=(User)session.getAttribute("loginsuccess");
	userDAO udao=new userDAOImpl();
	u.setUsername(req.getParameter("name"));
	u.setPhone(Long.parseLong(req.getParameter("phone")));
	u.setEmail(req.getParameter("email"));
	u.setAddress(req.getParameter("address"));
	if(udao.updateUser(u)) {
		req.setAttribute("updatesuccess", "Profile Updated");
		RequestDispatcher rd=req.getRequestDispatcher("editprofile.jsp");
		rd.forward(req,resp);
	}
	else {
		req.setAttribute("updatefailed", "Failed to Update");
		RequestDispatcher rd=req.getRequestDispatcher("editprofile.jsp");
		rd.forward(req,resp);
	}
}
}
