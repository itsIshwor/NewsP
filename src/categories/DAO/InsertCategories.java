package categories.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class InsertCategories {
	public static int insert(CategoriesBean cb) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {

			e.printStackTrace();
		}

		String user = "root";
		String pass = "root";
		String url = "jdbc:mysql://localhost:3306/practice";
		String sql = "insert into categories values(cid,?)";
		String categories = cb.getcName();

		int result = 0;

		Connection con;
		try {
			con = DriverManager.getConnection(url, user, pass);
			PreparedStatement ps = con.prepareStatement(sql);

			ps.setString(1, categories);

			result = ps.executeUpdate();

		} catch (SQLException e) {

			e.printStackTrace();
		}

		return result;
	}

}
