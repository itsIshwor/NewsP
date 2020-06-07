package news.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class NewsDAO {
	public static Connection getCon() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e1) {
			e1.printStackTrace();
		}

		String user = "root";
		String password = "password";
		String url = "jdbc:mysql://localhost:3306/practice";

		Connection con = null;
		try {
			con = DriverManager.getConnection(url, user, password);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return con;
	}

	public static int insertNews(NewsBean b) {
		int result = 0;
		try {
			Connection con = getCon();
			String sql = "insert into news values(nid,?,?,?)";

			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, b.getNewsTitle());
			ps.setString(2, b.getNewsContent());
			ps.setString(3, b.getNewsCategory());

			result = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return result;
	}

	public static int updateNews(NewsBean b, int id) throws SQLException {
		Connection con = getCon();
		int result = 0;
		String sql = "update news set newstitle = ?, news=?, category = ? where nid = ?";

		PreparedStatement ps = con.prepareStatement(sql);

		ps.setString(1, b.getNewsTitle());
		ps.setString(2, b.getNewsContent());
		ps.setString(3, b.getNewsCategory());
		ps.setInt(4, id);
		result = ps.executeUpdate();

		return result;
	}

	public static int deleteNews(int id) throws SQLException {
		Connection con = getCon();
		int result = 0;
		String sql = "delete from news where nid=?";

		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, id);

		result = ps.executeUpdate();

		return result;
	}

}
