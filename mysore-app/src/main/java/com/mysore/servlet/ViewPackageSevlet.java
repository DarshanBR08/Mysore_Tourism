 package com.mysore.servlet;

import java.io.IOException;

import com.mysore.dao.PackageDAO;
import com.mysore.dao.PackageDAOImpl;
import com.mysore.dto.Packages;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet("/viewpackage")
public class ViewPackageSevlet extends HttpServlet{
@Override
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	Packages p=null;
	PackageDAO pdao=new PackageDAOImpl();
	p=pdao.getPackages(req.getParameter("packageid"));
	if(p!=null) {
	req.setAttribute("package", p);
	RequestDispatcher rd=req.getRequestDispatcher("viewpackage.jsp");
	rd.forward(req, resp);
	}
	else {
		req.setAttribute("package", "Package Doesnot Exist");
		RequestDispatcher rd=req.getRequestDispatcher("packagedetails.jsp");
		rd.forward(req, resp);
	}
	
}
}
