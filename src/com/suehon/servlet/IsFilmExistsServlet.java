package com.suehon.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.suehon.service.IsFilmExistsService;

/**
 * 根据电影名验证此电影是否存在
 * 
 * @author John
 * 
 */
public class IsFilmExistsServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		doPost(req, resp);

	}

	public void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		String filmName = req.getParameter("filmName");
		IsFilmExistsService ifes = new IsFilmExistsService();
		PrintWriter out = resp.getWriter();
		out.print(ifes.isFilmExists(filmName));

	}

}
