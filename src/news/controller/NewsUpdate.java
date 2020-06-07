package news.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import news.DAO.NewsBean;
import news.DAO.NewsDAO;

@WebServlet("/NewsUpdate")
public class NewsUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		NewsBean b1 = new NewsBean();
		String newsTitle = request.getParameter("newst");
		String news = request.getParameter("news");
		String newsc = request.getParameter("newsc");
		int nid = Integer.parseInt(request.getParameter("nid"));

		b1.setNewsContent(news);
		b1.setNewsCategory(newsc);
		b1.setNewsTitle(newsTitle);

		try {
			int result = NewsDAO.updateNews(b1, nid);
			if (result > 0) {
				response.sendRedirect(request.getContextPath() + "/news/index.jsp");
			}
		} catch (SQLException e) {

			e.printStackTrace();
		}

	}

}
