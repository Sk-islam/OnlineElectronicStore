package com.pack;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/View1")
public class ViewProductServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		HttpSession session = req.getSession(false);

		if (session == null || session.getAttribute("abean") == null) {
			req.setAttribute("msg", "Session Expired or Unauthorized Access!");
			req.getRequestDispatcher("AdminLogin.html").forward(req, res);
			System.out.println("Session expired or abean not found.");
		} else {
			ArrayList<AddProductBean> al = new ViewProductDAO().retriveData();
			session.setAttribute("Productlist", al);
			req.getRequestDispatcher("ViewProduct.jsp").forward(req, res);
		}
	}

}
