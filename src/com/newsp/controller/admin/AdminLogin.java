package com.newsp.controller.admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.newsp.dao.admin.AdminLoginDAO;

public class AdminLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	Logger log = LoggerFactory.getLogger(this.getClass());

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		log.info("Login method invoked");
		RequestDispatcher rd = req.getRequestDispatcher("/admin/login.jsp");
		rd.forward(req, resp);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		log.info("Loging method invoked");
		AdminLoginDAO ald = new AdminLoginDAO();

		String username = request.getParameter("email");
		String userpass = request.getParameter("pass");

		try {
			log.info("Inside try....");
			boolean login = ald.login(username, userpass);

			log.info("Is Login successful??::" + login);

			if (login) {

				HttpSession session = request.getSession();
				session.setAttribute("admin", username);
				response.sendRedirect("admin/adminhome.jsp");
			} else {
				response.sendRedirect("index.jsp");
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

	}

}
