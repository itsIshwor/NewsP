package categories.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class UpdateCategories {
	public static void updateC(CategoriesBean cb, String id) {
		try {
			Class.forName("com.mysql.jdbc.Driver");

			String user = "root";
			String pass = "password";
			String url = "jdbc:mysql://localhost:3306/practice";
			String sql = "update categories set cname = ? where cid = ?";
			String categories = cb.getcName();
//			int iid = Integer.parseInt(id);
			Connection con = DriverManager.getConnection(url, user, pass);
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, categories);
			ps.setString(2, id);

			ps.executeUpdate();

		} catch (ClassNotFoundException | SQLException e) {

			e.printStackTrace();
		}

	}
}
