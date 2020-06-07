package news.controller;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/CreateNewsI")
@MultipartConfig
public class imageProcessor extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse respnose) throws IOException {
		@SuppressWarnings("unused")
		String fileName = "";
		Part part = null;
		// get the form data
		String newsTitle = request.getParameter("newst");
		String newsCategory = request.getParameter("newsc");
		try {
			part = request.getPart("newsi");
			fileName = part.getSubmittedFileName();
		} catch (IOException | ServletException e) {

			e.printStackTrace();
		}
		String news = request.getParameter("news");

//		String path = getServletContext().getRealPath("/" + "images" + File.separator + fileName);
		InputStream fis = part.getInputStream();

		try {
			Class.forName("com.mysql.jdbc.Driver");
			String user = "root";
			String password = "password";
			String url = "jdbc:mysql://localhost:3306/practice";
			String sql = "insert into newsi values(nid,?,?,?,?)";

			Connection con = DriverManager.getConnection(url, user, password);
			PreparedStatement ps = con.prepareStatement(sql);

			ps.setString(1, newsTitle);
			ps.setBinaryStream(2, fis);
			ps.setString(3, news);
			ps.setString(4, newsCategory);
			ps.executeUpdate();
		} catch (ClassNotFoundException | SQLException e) {

			e.printStackTrace();
		}

	}

}
