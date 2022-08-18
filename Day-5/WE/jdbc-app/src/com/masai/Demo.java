package com.masai;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Demo {
	
	public static void main(String[] args) {
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		
		String url= "jdbc:mysql://localhost:3306/testdb";
		
		try {
			Connection conn= DriverManager.getConnection(url, "root", "root");
			
			if(conn  != null)
				System.out.println("connected...");
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}				
		
	}

}

