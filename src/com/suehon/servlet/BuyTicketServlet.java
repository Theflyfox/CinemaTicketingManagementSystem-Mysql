package com.suehon.servlet;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.suehon.service.BuyTicketService;

@SuppressWarnings("serial")
public class BuyTicketServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		doPost(req, resp);

	}

	public void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		
		BuyTicketService bts = new BuyTicketService();
		
		List<Map<String, Object>> list = bts.getOnscreenInfo();
		
		req.setAttribute("list", list);
		
		req.getRequestDispatcher("/ticketSale/index.jsp").forward(req, resp);
		
		
		
		
	}

}
