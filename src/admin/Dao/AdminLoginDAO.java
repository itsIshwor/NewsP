package admin.Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AdminLoginDAO {
	public  boolean login(String username, String userpass) {
		String user = "root";
		String password = "password";
		String sql = "select * from admin where email=? and passwordn=? ";
		String url = "jdbc:mysql://localhost:3306/practice";

		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		try {
			Connection con = DriverManager.getConnection(url, user, password);

			PreparedStatement ps = con.prepareStatement(sql);

			ps.setString(1, username);
			ps.setString(2, userpass);

			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return false;
	}
}
