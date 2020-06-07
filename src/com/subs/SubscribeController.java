package com.subs;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/subscribe")
public class SubscribeController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request,
			HttpServletResponse response) {
		String str = request.getParameter("subscriberemail");

		SubsInsertDAO sId = new SubsInsertDAO();

		if (sId.insertEmail(str) == 1) {
			try {
				response.sendRedirect("thanks.jsp");
			} catch (IOException e) {

				e.printStackTrace();
			}
		} else {
			try {
				response.sendRedirect("index.jsp");
			} catch (IOException e) {

				e.printStackTrace();
			}
		}

	}

}
