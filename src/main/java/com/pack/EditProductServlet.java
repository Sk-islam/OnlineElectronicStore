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

@WebServlet("/edit")
public class EditProductServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		HttpSession session = req.getSession(false);
		if (session == null) {
			req.setAttribute("msg", "Session Expired !!");
			req.getRequestDispatcher("AdminLogin.html").forward(req, res);
		} else {
			String pcode = req.getParameter("pcode");
			ArrayList<AddProductBean> al = (ArrayList<AddProductBean>) session.getAttribute("Productlist");
			AddProductBean pb = null;
			Iterator<AddProductBean> i = al.iterator();
			while (i.hasNext()) {
				pb = i.next();
				if (pcode.equals(pb.getP_code()))
					break;
			}
			req.setAttribute("pbean", pb);
			req.getRequestDispatcher("EditProduct.jsp").forward(req, res);
		}
	}

}
