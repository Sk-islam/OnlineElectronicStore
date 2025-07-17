package com.pack;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/clogin")
public class CustomerLoginServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		CustomerLoginDAO cldao = new CustomerLoginDAO();
		CustomerBean bean = cldao.checkLogin(req.getParameter("username"), req.getParameter("password"));
		System.out.println("Username: " + req.getParameter("username"));
		System.out.println("Password: " + req.getParameter("password"));

		if (bean == null) {
			req.setAttribute("msg", "Invalid Credential");
			req.getRequestDispatcher("CustomerLoginFaild.jsp").forward(req, res);
		} else {
			HttpSession session = req.getSession();
			session.setAttribute("cbean", bean);
			System.out.println("Session set with bean: " + bean.getUsername());
			req.getRequestDispatcher("CustomerHome.jsp").forward(req, res);

		}
	}

}
