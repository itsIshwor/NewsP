package com.newsp.controller.news;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/news-delete")
public class NewsDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//int id = Integer.parseInt(request.getParameter("nid"));

		int result = 0;

		if (result > 0) {
			response.sendRedirect(request.getContextPath() + "/news/index.jsp");
		} else {
			response.sendRedirect(request.getContextPath() + "/error.jsp");
		}
	}

}
