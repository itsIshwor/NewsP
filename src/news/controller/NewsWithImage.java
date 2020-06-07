package news.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

public class NewsWithImage extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse respnose) {
		// get the form data
		String newsTitle = request.getParameter("newst");
		String newsCategory = request.getParameter("newsc");
		try {
			Part part = request.getPart("newsi");
			String fileName = part.getSubmittedFileName();
			System.out.println(fileName);

		} catch (IOException | ServletException e) {

			e.printStackTrace();
		}
		String news = request.getParameter("news");
		System.out.println(newsTitle + " " + newsCategory + " " + news);
	}
}
