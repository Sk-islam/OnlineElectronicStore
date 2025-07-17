package com.pack;

import java.sql.*;
import java.util.ArrayList;

public class OrderHistoryDAO {

	public ArrayList<OrderBean> getOrdersByUser(String username) {
		ArrayList<OrderBean> list = new ArrayList<>();
		try {
			Connection con = DBconnect.getCon();
			PreparedStatement ps = con
					.prepareStatement("SELECT * FROM ORDERS WHERE USERNAME = ? ORDER BY ORDER_DATE DESC");
			ps.setString(1, username);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				OrderBean ob = new OrderBean();
				ob.setOrderId(rs.getInt("ORDER_ID"));
				ob.setUsername(rs.getString("USERNAME"));
				ob.setProductName(rs.getString("PRODUCT_NAME"));
				ob.setProductPrice(rs.getDouble("PRODUCT_PRICE"));
				ob.setQuantity(rs.getInt("QUANTITY"));
				ob.setOrderDate(rs.getString("ORDER_DATE"));
				list.add(ob);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
