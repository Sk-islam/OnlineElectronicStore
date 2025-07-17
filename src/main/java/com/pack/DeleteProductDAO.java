package com.pack;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class DeleteProductDAO {
	public int deleteProduct(String pcode) {
		int rowCount = 0;
		try {
			Connection con = DBconnect.getCon();
			PreparedStatement pstm = con.prepareStatement("delete from PRODUCT where PCODE = ?");
			pstm.setString(1, pcode);
			rowCount = pstm.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return rowCount;
	}

}
