package com.pack;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/update")
public class UpdateProductServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		HttpSession session = req.getSession(false);
		if (session == null) {
			session.setAttribute("msg", "Session Expired");
			req.getRequestDispatcher("AdminLogin.html").forward(req, res);
		} else {
			String p_code = req.getParameter("p_code");
			ArrayList<AddProductBean> al = (ArrayList<AddProductBean>) session.getAttribute("Productlist");
			AddProductBean pbean = null;
			Iterator<AddProductBean> i = al.iterator();
			while (i.hasNext()) {
				pbean = i.next();
				if (p_code.equals(pbean.getP_code())) {
					break;
				}
			}
			pbean.setP_price(req.getParameter("P_code"));
			pbean.setP_qty(req.getParameter("P_qty"));
			int rowCount = new UpdateProductDAO().UpdateProduct(pbean);
			if (rowCount > 0) {
				req.setAttribute("msg", "Data Updated Successfully !!");
				req.getRequestDispatcher("UpdateProduct.jsp").forward(req, res);
			}
		}
	}

}
