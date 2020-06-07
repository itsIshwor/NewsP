package categories.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import categories.DAO.CategoriesBean;
import categories.DAO.InsertCategories;

public class CategoriesC extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String categories = request.getParameter("cat");
		if (categories == "") {
			response.sendRedirect("Categories/createCategories.jsp");
		} else {

			CategoriesBean cb = new CategoriesBean();
			cb.setcName(categories);
			int result = InsertCategories.insert(cb);

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
