package admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import admin.Dao.AdminLoginDAO;

public class AdminLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		AdminLoginDAO ald = new AdminLoginDAO();
		String username = request.getParameter("email");
		String userpass = request.getParameter("pass");
		boolean login = ald.login(username, userpass);
		if (login == true) {
			HttpSession session = request.getSession();
			session.setAttribute("admin", username);
			response.sendRedirect("admin/adminhome.jsp");
		} else {
			response.sendRedirect("index.jsp");
		}
	}

}
