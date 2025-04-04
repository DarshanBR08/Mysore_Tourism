package com.mysore.servlet;

import java.io.IOException;
import java.time.LocalDate;

import com.mysore.dao.PackageDAO;
import com.mysore.dao.PackageDAOImpl;
import com.mysore.dto.Package;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet("/createpackage")
public class CreatePackageServlet extends HttpServlet{
@Override
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	PackageDAO pdao=new PackageDAOImpl();
	Package p=new Package();
	p.setPackagename(req.getParameter("name"));
	p.setDescription(req.getParameter("description"));
	p.setCategory(req.getParameter("category"));
	p.setAmount(Double.parseDouble(req.getParameter("amount")));
	p.setNo_of_days(Integer.parseInt(req.getParameter("days")));
	p.setNo_of_nights(Integer.parseInt(req.getParameter("nights")));
	p.setStartdate(LocalDate.parse(req.getParameter("start_date")));
	p.setEnddate(LocalDate.parse(req.getParameter("end_date")));
	p.setLastdate(LocalDate.parse(req.getParameter("last_date")));
	p.setPackageimage(req.getParameter("image"));
	if(pdao.insertpackage(p)) {
	   req.setAttribute("Package_created", "Package Created");
	   RequestDispatcher rd=req.getRequestDispatcher("createpackage.jsp");
	   rd.forward(req, resp);
	  
	}else {
		 req.setAttribute("Package_not_created", "Package not Created");
		   RequestDispatcher rd=req.getRequestDispatcher("createpackage.jsp");
		   rd.forward(req, resp);
	}
}
}
