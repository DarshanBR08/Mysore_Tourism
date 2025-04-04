package com.mysore.connector;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class connector {
	public static Connection requestConnection() {
		Connection con=null;
		String user="root";
		String password="tiger";
		String url="jdbc:mysql://localhost:3306/mysore_tourism";
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection(url,user,password);
		} catch (ClassNotFoundException |SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return con;
	}
	}
