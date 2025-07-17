package com.pack;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class AdminLoginDAO {
	public AdminBean checkAdminLogin(String admin_username, String admin_password) {
		AdminBean bean = null;
		try {
			Connection con = DBconnect.getCon();

			System.out.println("Checking in DB for: " + admin_username + " / " + admin_password);

			PreparedStatement pstm = con
					.prepareStatement("select * from ADMIN where TRIM(UNAME) = ? and TRIM(PWORD) = ?");

			pstm.setString(1, admin_username.trim());
			pstm.setString(2, admin_password.trim());
			ResultSet rs = pstm.executeQuery();

			if (rs.next()) {
				System.out.println("Login successful in DAO.");
				bean = new AdminBean();
				bean.setUname(rs.getString(1));
				bean.setPwd(rs.getString(2));
				bean.setFname(rs.getString(3));
				bean.setLname(rs.getString(4));
				bean.setAddr(rs.getString(5));
				bean.setMail_id(rs.getString(6));
				bean.setMobileNo(rs.getString(7));
			} else {
				System.out.println("No match found in DAO.");

			}
		} catch (Exception e) {
			e.printStackTrace();
			;
		}
		return bean;
	}
}
