package com.pack;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class ViewCustomerProductDAO {
	public ArrayList<AddProductBean> retriveData2() {
		ArrayList<AddProductBean> al = new ArrayList<>();
		try {
			Connection con = DBconnect.getCon();
			PreparedStatement pstm = con.prepareStatement("SELECT * FROM PRODUCT");
			ResultSet rs = pstm.executeQuery();
			while (rs.next()) {
				AddProductBean pbean = new AddProductBean();
				pbean.setP_code(rs.getString(1));
				pbean.setP_name(rs.getString(2));
				pbean.setP_company(rs.getString(3));
				pbean.setP_price(rs.getString(4));
				pbean.setP_qty(rs.getString(5));
				al.add(pbean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return al;
	}
}