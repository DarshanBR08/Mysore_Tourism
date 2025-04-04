package com.mysore.servlet;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.mysore.dao.userDAO;
import com.mysore.dao.userDAOImpl;
import com.mysore.dto.User;

@WebServlet("/signup")
public class SignupServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User u = new User();
        userDAO udao = new userDAOImpl();

        u.setUsername(req.getParameter("name"));
        u.setEmail(req.getParameter("email"));  // Fixed parameter name
        u.setPhone(Long.parseLong(req.getParameter("phone")));

        if (req.getParameter("password").equals(req.getParameter("conpassword"))) {
            u.setPassword(req.getParameter("conpassword"));

            if (udao.insertuser(u)) {
                req.setAttribute("Signupsuccess", "SignUp successful");
                RequestDispatcher rd = req.getRequestDispatcher("login.jsp"); // Redirect to login
                rd.forward(req, resp);
            } else {
                req.setAttribute("signupfailed", "Failed to signup");
                RequestDispatcher rd = req.getRequestDispatcher("signup.jsp");
                rd.forward(req, resp);
            }
        } else {
            req.setAttribute("passwordfailed", "Password Mismatch"); // Fixed typo
            RequestDispatcher rd = req.getRequestDispatcher("signup.jsp");
            rd.forward(req, resp);
        }
    }
}
