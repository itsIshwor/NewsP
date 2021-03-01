package com.newsp.controller.categories;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.newsp.beans.categories.CategoriesBean;
import com.newsp.dao.categories.CategoriesDAO;

@WebServlet("/CategoriesUpdate")
public class CategoriesUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = (request.getParameter("id"));
		String categories = request.getParameter("cat");

		CategoriesBean cb = new CategoriesBean();
		cb.setcName(categories);

		CategoriesDAO.updateC(cb, id);
		response.sendRedirect("Categories/showCategories.jsp");
	}

}
