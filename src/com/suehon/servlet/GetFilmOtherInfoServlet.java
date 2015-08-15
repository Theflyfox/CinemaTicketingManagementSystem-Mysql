package com.suehon.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.suehon.service.GetFilmOtherInfoService;

@SuppressWarnings("serial")
public class GetFilmOtherInfoServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		doPost(req, resp);

	}

	public void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		int filmid = Integer.parseInt(req.getParameter("filmId"));
		GetFilmOtherInfoService gfois = new GetFilmOtherInfoService();
		PrintWriter out = resp.getWriter();
		out.print(gfois.getFilmOtherInfo(filmid));
		
	}

}
