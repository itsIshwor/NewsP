package com.newsp.controller.categories;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.newsp.beans.categories.CategoriesBean;
import com.newsp.dao.categories.CategoriesDAO;

public class CategoriesC extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String categories = request.getParameter("cat");
		if (categories == "") {
			response.sendRedirect("Categories/createCategories.jsp");
		} else {
			CategoriesBean cb = new CategoriesBean();
			cb.setcName(categories);
			int result = CategoriesDAO.insert(cb);
			if (result == 1) {
				response.sendRedirect("Categories/showCategories.jsp");
			}
		}

	}
	// HttpSession session = request.getSession();
	// session.setAttribute("categories", categories);

	// getServletContext().getRequestDispatcher("/Categories/showCategories.jsp").forward(request,
	// response);
	// response.sendRedirect("Categories/showCategories.jsp");

}
