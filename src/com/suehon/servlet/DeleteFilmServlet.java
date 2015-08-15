package com.suehon.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.suehon.service.DeleteFilmService;

@SuppressWarnings("serial")
public class DeleteFilmServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		doPost(req, resp);

	}

	public void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		String filmId = req.getParameter("filmId");
		DeleteFilmService dfs = new DeleteFilmService();
		int result = dfs.deleteFilm(filmId);
		PrintWriter out = resp.getWriter();
		out.print(result);
	}

}
