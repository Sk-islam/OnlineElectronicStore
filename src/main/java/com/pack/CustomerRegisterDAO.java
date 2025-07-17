package com.pack;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class CustomerRegisterDAO {
	public int insertData(CustomerBean bean) {
		int rowCount = 0;
		try {
			Connection con = DBconnect.getCon();
			PreparedStatement pstm = con.prepareStatement("insert into CUSTOMER values(?,?,?,?,?,?,?)");
			pstm.setString(1, bean.getUsername());
			pstm.setString(2, bean.getPassword());
			pstm.setString(3, bean.getFirstname());
			pstm.setString(4, bean.getLastname());
			pstm.setString(5, bean.getAddress());
			pstm.setString(6, bean.getMailid());
			pstm.setString(7, bean.getMobile());

			rowCount = pstm.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rowCount;
	}
}
