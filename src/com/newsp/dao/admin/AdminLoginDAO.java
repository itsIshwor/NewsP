package com.newsp.dao.admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.newsp.config.ConnectionCreator;

public class AdminLoginDAO {

	Logger log = LoggerFactory.getLogger(getClass());

	public boolean login(String username, String userpass) throws ClassNotFoundException {
		log.info("inside login method");
		String sql = "select * from admin where email=? and passwordn=? ";
		String dbName = "practice";

		try {
			System.out.println("Trying creating connection");
			Connection conn = ConnectionCreator.doConnection(dbName);
			log.info("Connection Creation successfull");
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
