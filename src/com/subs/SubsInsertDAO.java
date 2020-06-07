package com.subs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class SubsInsertDAO {
	public int insertEmail(String email) {
		int result = 0;
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {

			e.printStackTrace();
		}
		String user = "root";
		String pass = "password";
		String url = "jdbc:mysql://localhost:3306/practice";

		try {
			Connection con = DriverManager.getConnection(url, user, pass);

			PreparedStatement ps = con
					.prepareStatement("insert into semailList values(sid,?)");

			ps.setString(1, email);

			result = ps.executeUpdate();
		} catch (SQLException e) {

			e.printStackTrace();
		}
		return result;
	}
}
