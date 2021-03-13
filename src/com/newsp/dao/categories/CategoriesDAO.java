package com.newsp.dao.categories;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.newsp.beans.categories.CategoriesBean;
import com.newsp.config.ConnectionCreator;

public class CategoriesDAO {
	static final String DB_NAME = "practice";

	public static void deleteC(String id) {
		try {
			Connection con = ConnectionCreator.doConnection(DB_NAME);
			String sql = "delete from categories where cid = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, id);
			ps.executeUpdate();
			con.close();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}

	public static int insert(CategoriesBean cb) {

		String sql = "insert into categories values(cid,?)";
		String categories = cb.getcName();
		int result = 0;
		try {
			Connection con = ConnectionCreator.doConnection(DB_NAME);
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, categories);
			result = ps.executeUpdate();
			con.close();
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		return result;
	}

	public static void updateC(CategoriesBean cb, String id) {
		try {
			String sql = "update categories set cname = ? where cid = ?";

			String categories = cb.getcName();

			Connection con = ConnectionCreator.doConnection(DB_NAME);

			PreparedStatement ps = con.prepareStatement(sql);

			ps.setString(1, categories);
			ps.setString(2, id);

			ps.executeUpdate();
			con.close();

		} catch (ClassNotFoundException | SQLException e) {

			e.printStackTrace();
		}

	}
}
