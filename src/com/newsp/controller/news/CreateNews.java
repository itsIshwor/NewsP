package com.newsp.controller.news;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.newsp.beans.news.NewsBean;
import com.newsp.dao.news.NewsDAO;

@WebServlet("/CreateNews")
public class CreateNews extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String title = request.getParameter("newst");
		String category = request.getParameter("newsc");
		String News = request.getParameter("news");

		NewsBean nb = new NewsBean();
		nb.setNewsTitle(title);
		nb.setNewsCategory(category);
		nb.setNewsContent(News);
		
		int result = NewsDAO.insertNews(nb);
		
		if(result == 1) {
			response.sendRedirect("news/index.jsp");
		}

	}

}
