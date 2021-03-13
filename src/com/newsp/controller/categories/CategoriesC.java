package com.newsp.controller.categories;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.newsp.beans.categories.CategoriesBean;
import com.newsp.dao.categories.CategoriesDAO;

@WebServlet(urlPatterns = "/categories/*")
public class CategoriesC extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Logger log = LoggerFactory.getLogger(this.getClass());

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		log.info("categories get method methods");
		String pathInfo = req.getRequestURI();

		log.info("Path info::" + pathInfo);
		log.info("choosing view info");
		RequestDispatcher rd;
		if (pathInfo.equals("/NewsP/categories/add")) {
			log.info("inside add method");
			rd = req.getRequestDispatcher("/Categories/createCategories.jsp");
			rd.forward(req, resp);
		} else if (pathInfo.equals("/NewsP/categories/")) {
			log.info("inside add method");
			rd = req.getRequestDispatcher("/Categories/showCategories.jsp");
			rd.forward(req, resp);
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("categories Post method invoked");
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

}
