package com.pack;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		AdminLoginDAO AlDAO = new AdminLoginDAO();
		AdminBean bean = AlDAO.checkAdminLogin(req.getParameter("a_name"), req.getParameter("a_password"));
		System.out.println("Username: " + req.getParameter("a_name"));
		System.out.println("Password: " + req.getParameter("a_password"));

		if (bean == null) {
			req.setAttribute("msg", "Invalid Admin Credential!!");
			req.getRequestDispatcher("AdminLoginFaild.jsp").forward(req, res);
		} else {
			HttpSession session = req.getSession();
			session.setAttribute("abean", bean);
			System.out.println("Session set with bean: " + bean.getUname());
			req.getRequestDispatcher("AdminHome.jsp").forward(req, res);
		}

	}

}
