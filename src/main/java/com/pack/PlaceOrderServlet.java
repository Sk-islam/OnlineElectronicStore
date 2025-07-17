package com.pack;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/PlaceOrder")
public class PlaceOrderServlet extends HttpServlet {
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String code = req.getParameter("code"); // Product code
		int requestedQty = Integer.parseInt(req.getParameter("quantity")); // Quantity requested by the user

		HttpSession session = req.getSession(false);
		if (session == null || session.getAttribute("cbean") == null) {
			req.setAttribute("msg", "Session expired. Please login again!");
			req.getRequestDispatcher("CustomerLogin.html").forward(req, res);
			return;
		}

		ProductDAO productDAO = new ProductDAO();
		AddProductBean product = productDAO.getProductByCode(code);

		if (product != null) {
			int currentQty = Integer.parseInt(product.getP_qty());
			if (requestedQty <= currentQty) {
				int newQty = currentQty - requestedQty;
				productDAO.updateQuantity(code, newQty);

				ViewCustomerProductDAO productListDAO = new ViewCustomerProductDAO();
				ArrayList<AddProductBean> updatedProductList = productListDAO.retriveData2();
				session.setAttribute("Productlist", updatedProductList);

				// ✅ Pass required details for bill
				req.setAttribute("flashMessage", "Your order has been placed successfully!");
				req.setAttribute("productName", product.getP_name());
				req.setAttribute("pricePerItem", product.getP_price());
				req.setAttribute("quantity", String.valueOf(requestedQty));
				float totalAmount = requestedQty * Float.parseFloat(product.getP_price());
				req.setAttribute("totalAmount", String.valueOf(totalAmount));

				req.getRequestDispatcher("OrderSuccess.jsp").forward(req, res);

			} else {
				req.setAttribute("flashMessage", "Requested quantity not available.");
				req.getRequestDispatcher("BuyProduct.jsp").forward(req, res);
			}
		} else {
			req.setAttribute("flashMessage", "Product not found.");
			req.getRequestDispatcher("ProductNotFound.jsp").forward(req, res);
		}
	}
}
