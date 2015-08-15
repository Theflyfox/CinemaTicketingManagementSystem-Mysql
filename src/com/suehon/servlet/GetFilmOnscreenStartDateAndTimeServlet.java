package com.suehon.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.suehon.service.GetFilmOnscreenStartDateAndTimeService;

@SuppressWarnings("serial")
public class GetFilmOnscreenStartDateAndTimeServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		doPost(req, resp);

	}

	public void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

			int filmId = Integer.parseInt(req.getParameter("filmId"));
			GetFilmOnscreenStartDateAndTimeService gfosdat = new GetFilmOnscreenStartDateAndTimeService();
			PrintWriter out = resp.getWriter();
			String result = gfosdat.getFilmOnscreenStartDateAndTime(filmId);
System.out.println(result);
			out.print(result);
			
	}

}
