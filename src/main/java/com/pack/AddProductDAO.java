package com.pack;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class AddProductDAO {
	public int insertproduct(AddProductBean bean) {
		int rowCount = 0;
		try {
			Connection con = DBconnect.getCon();
			PreparedStatement pstm = con.prepareStatement("insert into PRODUCT values(?,?,?,?,?)");
			pstm.setString(1, bean.getP_code());
			pstm.setString(2, bean.getP_name());
			pstm.setString(3, bean.getP_company());
			pstm.setString(4, bean.getP_price());
			pstm.setString(5, bean.getP_qty());

			rowCount = pstm.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return rowCount;
	}
}
