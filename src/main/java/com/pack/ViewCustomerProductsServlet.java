package com.pack;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/View2")
public class ViewCustomerProductsServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		HttpSession session = req.getSession(false);

		if (session == null) {
			req.setAttribute("msg", "Session Expired !!");
			req.getRequestDispatcher("CustomerLogin.html").forward(req, res);
		} else {
			// Refetch product list after buy or any other updates
			ArrayList<AddProductBean> al = new ViewCustomerProductDAO().retriveData2();
			session.setAttribute("Productlist", al); // Store updated product list in session
			req.getRequestDispatcher("ViewCustomerProduct.jsp").forward(req, res);
		}
	}
}