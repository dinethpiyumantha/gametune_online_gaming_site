package com.bid.pack;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


// Database Connection Implementations
public class DBConnection {
	
	private static String url = "jdbc:mysql://localhost:3306/gametune_db";
	private static String username = "root";
	private static String password = "DPE@1997dpe";
	private static Connection con;

	public static Connection getConnection() {
		
		try {
			
			Class.forName("com.mysql.jdbc.Driver");
			
			con = DriverManager.getConnection(url, username, password);
			
		} catch (Exception e) {
			System.out.println("Database Connection is Failed !");
		}
		
		return con;
	}
}
