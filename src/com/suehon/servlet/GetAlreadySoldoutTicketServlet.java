package com.suehon.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.suehon.service.GetAlreadySoldoutTicketService;

@SuppressWarnings("serial")
public class GetAlreadySoldoutTicketServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		doPost(req, resp);

	}

	public void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		
		//String showroomId = req.getParameter("showroomId");
		String onscreenId = req.getParameter("onscreenId");
System.out.println("; onscreenId " + onscreenId);
		GetAlreadySoldoutTicketService gasts = new GetAlreadySoldoutTicketService();
		PrintWriter out = resp.getWriter();
		String result = gasts.getAlreadySoldoutTicket(onscreenId);
System.out.println(result);
		out.print(result);
		
		
	}

}
