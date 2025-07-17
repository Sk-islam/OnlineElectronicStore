package com.pack;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/OrderHistory")
public class OrderHistoryServlet extends HttpServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		HttpSession session = req.getSession(false);
		CustomerBean cbean = (CustomerBean) session.getAttribute("cbean");

		if (session == null || cbean == null) {
			req.setAttribute("msg", "Session expired. Please login again.");
			req.getRequestDispatcher("CustomerLogin.html").forward(req, res);
			return;
		}

		String username = cbean.getUsername();
		ArrayList<OrderBean> orders = new OrderHistoryDAO().getOrdersByUser(username);

		req.setAttribute("orderList", orders);
		req.getRequestDispatcher("OrderHistory.jsp").forward(req, res);
	}
}
