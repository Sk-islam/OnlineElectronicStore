package com.pack;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class UpdateProductDAO {
	public int UpdateProduct(AddProductBean bean) {
		int rowCount = 0;
		try {
			Connection con = DBconnect.getCon();
			PreparedStatement pstm = con.prepareStatement("update PRODUCT set PPRICE = ?, PQTY = ? where PCODE = ?");
			pstm.setString(1, bean.getP_price());
			pstm.setString(2, bean.getP_qty());
			pstm.setString(3, bean.getP_code());

			rowCount = pstm.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return rowCount;
	}

}
