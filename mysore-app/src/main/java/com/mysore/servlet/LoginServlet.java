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


@WebServlet("/login")
public class LoginServlet extends HttpServlet{
@Override
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	User u=null;
	userDAO udao=new userDAOImpl();
	u=udao.getuser(req.getParameter("mail"),req.getParameter("password")); {
		if(u!=null) {
			HttpSession session=req.getSession(true);
			session.setAttribute("loginsuccess", u);
			RequestDispatcher rd=req.getRequestDispatcher("Home.jsp");
			rd.forward(req,resp);
		}
		else {
			req.setAttribute("loginfailed", "Failed to login..!");
			RequestDispatcher rd=req.getRequestDispatcher("login.jsp");
			rd.forward(req,resp);
		}
	}
	
}
}
