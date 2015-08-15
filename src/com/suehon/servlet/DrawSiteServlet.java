package com.suehon.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.suehon.service.DrawSiteService;

@SuppressWarnings("serial")
public class DrawSiteServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		doPost(req, resp);

	}

	public void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		String filmId = req.getParameter("filmId");
		String startDateAndTime = req.getParameter("startDateAndTime");
		
		String startDate = startDateAndTime.split(" ")[0];
		String startTime = startDateAndTime.split(" ")[1];
		
		DrawSiteService dss = new DrawSiteService();
		
		String result = dss.getSite(filmId, startDate, startTime);
		
System.out.println(result);
		
		PrintWriter out = resp.getWriter();
		
		out.print(result);
		
		
		
		
		
		
		
		
		
		
		
		
	}

}
