package com.pack;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class CustomerLoginDAO {
	public CustomerBean checkLogin(String C_username, String C_password) {
		CustomerBean bean = null;
		try {
			Connection con = DBconnect.getCon();
			PreparedStatement pstm = con.prepareStatement("select * from CUSTOMER where UNAME = ? and PWORD = ?");
			pstm.setString(1, C_username);
			pstm.setString(2, C_password);

			ResultSet rs = pstm.executeQuery();
			if (rs.next()) {
				bean = new CustomerBean();
				bean.setUsername(rs.getString(1));
				bean.setPassword(rs.getString(2));
				bean.setFirstname(rs.getString(3));
				bean.setLastname(rs.getString(4));
				bean.setAddress(rs.getString(5));
				bean.setMailid(rs.getString(6));
				bean.setMobile(rs.getString(7));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bean;

	}

}
