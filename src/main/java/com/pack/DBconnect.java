package com.pack;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBconnect {
	private static Connection con = null;

	static {
		try {
			Class.forName(DBinfo.driver);
			con = DriverManager.getConnection(DBinfo.Dburl, DBinfo.Dbuname, DBinfo.Dbpwd);
			System.out.println("Database connected!");

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static Connection getCon() {
		return con;
	}

}
