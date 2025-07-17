package com.pack;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ProductDAO {

	public AddProductBean getProductByCode(String pcode) {
		AddProductBean bean = null;
		String query = "SELECT * FROM PRODUCT WHERE PCODE = ?";

		try {

			Connection con = DBconnect.getCon();
			PreparedStatement ps = con.prepareStatement(query);

			ps.setString(1, pcode);
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				bean = new AddProductBean();
				bean.setP_code(rs.getString(1));
				bean.setP_name(rs.getString(2));
				bean.setP_company(rs.getString(3));

				float price = rs.getFloat(4);
				bean.setP_price(String.valueOf(price));

				int qty = Integer.parseInt(rs.getString(5));
				bean.setP_qty(String.valueOf(qty));

				System.out.println("✅ Product Found: " + bean.getP_name());
			} else {
				System.out.println("⚠️ No product found with PCODE: " + pcode);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return bean;
	}

	public void updateQuantity(String pcode, int newQty) {
		String query = "UPDATE PRODUCT SET PQTY = ? WHERE PCODE = ?";

		try (Connection con = DBconnect.getCon(); PreparedStatement ps = con.prepareStatement(query)) {

			ps.setString(1, String.valueOf(newQty)); // PQTY is VARCHAR2
			ps.setString(2, pcode);

			int rows = ps.executeUpdate();

			if (rows > 0) {
				System.out.println("✅ Quantity updated for PCODE: " + pcode + ", New Quantity: " + newQty);
			} else {
				System.out.println("⚠️ Quantity update failed. No product found with PCODE: " + pcode);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public boolean updateQuantityAfterPurchase(String pcode, int newQty) {
		String query = "UPDATE PRODUCT SET PQTY = ? WHERE PCODE = ?";
		boolean status = false;

		try (Connection con = DBconnect.getCon(); PreparedStatement ps = con.prepareStatement(query)) {

			ps.setInt(1, newQty);
			ps.setString(2, pcode);

			int i = ps.executeUpdate();
			status = (i > 0);

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return status;
	}
}
