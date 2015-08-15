package com.suehon.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.suehon.service.DmlTicketTradeService;

@SuppressWarnings("serial")
public class DmlTicketTradeServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		doPost(req, resp);

	}

	public void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		int flag = Integer.parseInt(req.getParameter("flag"));
		String sitePosition = req.getParameter("sitePosition");
		int onscreenId = Integer.parseInt(req.getParameter("onscreenId"));
		
		DmlTicketTradeService dtts = new DmlTicketTradeService();
		dtts.DmlTicketTrade(flag, sitePosition, onscreenId);
		
	}

}
