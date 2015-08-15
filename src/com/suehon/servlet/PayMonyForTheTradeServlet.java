package com.suehon.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.suehon.service.PayMonyForTheTradeService;

@SuppressWarnings("serial")
public class PayMonyForTheTradeServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		doPost(req, resp);

	}

	public void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
			
		//格式 :5,9-6,4-4,3
		String choosenSitePositionStr = req.getParameter("choosenSitePositionStr");
		String onscreenId = req.getParameter("onscreenId");
		String showroomId = req.getParameter("showroomId");
		String shouldPay = req.getParameter("shouldPay");
		String realPay = req.getParameter("realPay");
		String vipNo = req.getParameter("vipNo");
		System.out.println(choosenSitePositionStr);
		PayMonyForTheTradeService pmftt = new PayMonyForTheTradeService();
		pmftt.payMonyForTheTrade(choosenSitePositionStr, onscreenId, showroomId,shouldPay, realPay, vipNo);
		
	}

}
