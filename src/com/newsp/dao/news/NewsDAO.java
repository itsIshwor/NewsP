package com.newsp.dao.news;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.newsp.beans.news.NewsBean;
import com.newsp.config.ConnectionCreator;

public class NewsDAO {
	static final String DB_NAME = "practice";

	public static int insertNews(NewsBean b) {
		int result = 0;
		try {
			Connection con = ConnectionCreator.doConnection(DB_NAME);
			String sql = "insert into news values(nid,?,?,?)";

			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, b.getNewsTitle());
			ps.setString(2, b.getNewsContent());
			ps.setString(3, b.getNewsCategory());

			result = ps.executeUpdate();
			con.close();
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}

		return result;
	}

	public static int updateNews(NewsBean b, int id) throws SQLException, ClassNotFoundException {
		Connection con = ConnectionCreator.doConnection(DB_NAME);
		int result = 0;
		String sql = "update news set newstitle = ?, news=?, category = ? where nid = ?";

		PreparedStatement ps = con.prepareStatement(sql);

		ps.setString(1, b.getNewsTitle());
		ps.setString(2, b.getNewsContent());
		ps.setString(3, b.getNewsCategory());
		ps.setInt(4, id);

		result = ps.executeUpdate();
		con.close();
		return result;
	}

	public static int deleteNews(int id) throws SQLException, ClassNotFoundException {
		Connection con = ConnectionCreator.doConnection(DB_NAME);
		int result = 0;
		String sql = "delete from news where nid=?";

		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, id);

		result = ps.executeUpdate();
		con.close();
		return result;
	}

}
