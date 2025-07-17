package com.pack;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/BuyProduct")
public class BuyProductServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		HttpSession session = req.getSession(false);

		if (session == null || session.getAttribute("cbean") == null) {
			req.setAttribute("msg", "Session Expired or Unauthorized Access!");
			req.getRequestDispatcher("CustomerLogin.html").forward(req, res);
			return;
		}

		String pcode = req.getParameter("pcode");

		if (pcode != null && !pcode.isEmpty()) {
			ArrayList<AddProductBean> productList = (ArrayList<AddProductBean>) session.getAttribute("Productlist");

			if (productList != null && !productList.isEmpty()) {
				AddProductBean selectedProduct = null;
				for (AddProductBean product : productList) {
					if (product.getP_code().equals(pcode)) {
						selectedProduct = product;
						break;
					}
				}

				if (selectedProduct != null) {
					// yaha sirf selected product bhejna hai page pe
					req.setAttribute("selectedProduct", selectedProduct);
					req.getRequestDispatcher("BuyProduct.jsp").forward(req, res);
				} else {
					req.setAttribute("msg", "Product not found.");
					req.getRequestDispatcher("ProductNotFound.jsp").forward(req, res);
				}
			} else {
				req.setAttribute("msg", "No products available.");
				req.getRequestDispatcher("ProductNotFound.jsp").forward(req, res);
			}
		} else {
			req.setAttribute("msg", "Invalid Product Code.");
			req.getRequestDispatcher("BuyProduct.jsp").forward(req, res);
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		HttpSession session = req.getSession(false);

		if (session == null || session.getAttribute("cbean") == null) {
			req.setAttribute("msg", "Session Expired or Unauthorized Access!");
			req.getRequestDispatcher("CustomerLogin.html").forward(req, res);
			return;
		}

		try {
			// user ne jo form bhara usse data uthao
			String pcode = req.getParameter("pcode");
			int buyqty = Integer.parseInt(req.getParameter("buyqty"));

			// product list session se uthao
			ArrayList<AddProductBean> productList = (ArrayList<AddProductBean>) session.getAttribute("Productlist");

			if (productList != null) {
				for (AddProductBean product : productList) {
					if (product.getP_code().equals(pcode)) {
						int currentQty = Integer.parseInt(product.getP_qty()); // int hai
						if (buyqty <= currentQty) {
							int newQty = currentQty - buyqty;
							// Update karo database me

						} else {
							res.setContentType("text/html");
							res.getWriter().println(
									"<script>alert('Not enough quantity available!'); window.location='CustomerDashboard.jsp';</script>");
						}
						return;
					}
				}
			}

			// agar yaha aya to kuch garbar
			res.setContentType("text/html");
			res.getWriter()
					.println("<script>alert('Product not found.'); window.location='CustomerDashboard.jsp';</script>");

		} catch (Exception e) {
			e.printStackTrace();
			res.setContentType("text/html");
			res.getWriter().println(
					"<script>alert('Error occurred. Try Again.'); window.location='CustomerDashboard.jsp';</script>");
		}
	}
}