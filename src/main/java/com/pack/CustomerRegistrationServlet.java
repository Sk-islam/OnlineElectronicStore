package com.pack;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/crs")
public class CustomerRegistrationServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		CustomerBean bean = new CustomerBean();
		bean.setUsername(req.getParameter("username"));
		bean.setPassword(req.getParameter("password"));
		bean.setFirstname(req.getParameter("firstname"));
		bean.setLastname(req.getParameter("lastname"));
		bean.setAddress(req.getParameter("address"));
		bean.setMailid(req.getParameter("mailid"));
		bean.setMobile(req.getParameter("mobile"));

		int rowCount = new CustomerRegisterDAO().insertData(bean);
		if (rowCount > 0) {
			req.setAttribute("msg", "User Registered SussecFully");
			req.getRequestDispatcher("Register.jsp").forward(req, res);
		} else {
			req.setAttribute("msg", "User Registerd FAILED!!");
			req.getRequestDispatcher("Register.jsp").forward(req, res);
		}
	}

}
