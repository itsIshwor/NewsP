package news.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import news.DAO.NewsDAO;

@WebServlet("/NewsDelete")
public class NewsDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("nid"));

		try {
			int result = NewsDAO.deleteNews(id);

			if (result > 0) {
				response.sendRedirect(request.getContextPath() + "/news/index.jsp");
			} else {
				response.sendRedirect(request.getContextPath() + "/error.jsp");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
