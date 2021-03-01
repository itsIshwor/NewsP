package com.newsp.dao.admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.newsp.config.ConnectionCreator;

public class AdminLoginDAO {

	public boolean login(String username, String userpass) throws ClassNotFoundException {
		String sql = "select * from admin where email=? and passwordn=? ";
		String dbName = "practice";

		try {
			Connection conn = ConnectionCreator.doConnection(dbName);

			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setString(1, username);
			ps.setString(2, userpass);

			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				return true;
			}
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return false;
	}
}
