package com.pack;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/aps")
public class AddProductServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		HttpSession session = req.getSession(false);
		if (session == null) {
			session.setAttribute("msg", "Admin Session Expired!!");
			req.getRequestDispatcher("AdminLogin.html").forward(req, res);
		} else {
			AddProductBean pbean = new AddProductBean();
			pbean.setP_code(req.getParameter("pcode"));
			pbean.setP_name(req.getParameter("pname"));
			pbean.setP_company(req.getParameter("pcompany"));
			pbean.setP_price(req.getParameter("pprice"));
			pbean.setP_qty(req.getParameter("pqty"));

			int rowCount = new AddProductDAO().insertproduct(pbean);
			if (rowCount == 0) {
				throw new ServletException(" DATA NOT INSERTED !!");

			} else {
				req.setAttribute("msg", "DATA INSERTED SUCCESSFULLY !!");
				req.getRequestDispatcher("AddProduct.jsp").forward(req, res);
			}
		}

	}
}
