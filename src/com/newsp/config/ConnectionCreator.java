package com.newsp.config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionCreator {
	final static String DRIVER_CLASS = "com.mysql.cj.jdbc.Driver";
	final static String USER = "root";
	final static String PASSWORD = "root";

	public static Connection doConnection(String dbName) throws ClassNotFoundException, SQLException {
		final String URL = "jdbc:mysql://localhost:3306/" + dbName + "?useSSL=false";
		Class.forName(DRIVER_CLASS);
		Connection con = DriverManager.getConnection(URL, USER, PASSWORD);
		return con;
	}
}
