package com.suehon.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.suehon.service.PreParTicketSaleInfoService;

@SuppressWarnings("serial")
public class PreParTicketSaleInfoServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		doPost(req, resp);

	}

	public void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		PreParTicketSaleInfoService ptsis = new PreParTicketSaleInfoService();
		req.setAttribute("list", ptsis.getTicketSaleInfo());
		req.getRequestDispatcher("/ticketSale/buy_ticket_step.jsp").forward(req, resp);
		
	}

}
