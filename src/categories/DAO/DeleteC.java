package categories.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class DeleteC {
	public static void deleteC(String id) {

		try {
			Class.forName("com.mysql.jdbc.Driver");

			String user = "root";
			String pass = "root";
			String url = "jdbc:mysql://localhost:3306/practice";
			String sql = "delete from categories where cid = ?";

			Connection con = DriverManager.getConnection(url, user, pass);
			PreparedStatement ps = con.prepareStatement(sql);

			ps.setString(1, id);

			ps.executeUpdate();
		} catch (ClassNotFoundException | SQLException e) {

			e.printStackTrace();
		}

	}
}
