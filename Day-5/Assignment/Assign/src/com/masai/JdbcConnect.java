package com.masai;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class JdbcConnect {
	public static void main(String args[]) {
		try {
			// Class class | forName-> static method of Class
			// ClassNotFoundException thrown (Checked Exception)
			// location of Driver Class (JDBC JAR)
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		String url = "jdbc:mysql://localhost:3306/db1";
		// Connection -> Interface in java.sql Package
		Connection con = null;
		try {
			con = DriverManager.getConnection(url, "root", "root");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(con != null) {
			System.out.println("Connected to db ....");
		}
	}
}
