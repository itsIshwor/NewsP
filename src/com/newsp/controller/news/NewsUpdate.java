package com.newsp.controller.news;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.newsp.beans.news.NewsBean;
import com.newsp.dao.news.NewsDAO;

@WebServlet("/news-update")
public class NewsUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		NewsBean news = new NewsBean();
		String newsTitle = request.getParameter("newst");
		String newsContent = request.getParameter("news");
		String newsc = request.getParameter("newsc");
		int nid = Integer.parseInt(request.getParameter("nid"));

		news.setNewsContent(newsContent);
		news.setNewsCategory(newsc);
		news.setNewsTitle(newsTitle);

		try {
			int result = NewsDAO.updateNews(news, nid);
			if (result > 0) {
				response.sendRedirect(request.getContextPath() + "/news/index.jsp");
			}
		} catch (SQLException | ClassNotFoundException e) {

			e.printStackTrace();
		}

	}

}
