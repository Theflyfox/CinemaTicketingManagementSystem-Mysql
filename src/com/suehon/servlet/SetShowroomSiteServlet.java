package com.suehon.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.suehon.service.SetShowroomSiteService;

@SuppressWarnings("serial")
public class SetShowroomSiteServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		doPost(req, resp);

	}

	public void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
			
		String totalSiteStr = req.getParameter("totalSiteStr");
		int totalSiteAmount = Integer.parseInt(req.getParameter("totalSiteAmount"));
		int showroomId = Integer.parseInt(req.getParameter("showroomId"));
		
System.out.println("座位分布 :" + totalSiteStr);
System.out.println("总座位数 :" + totalSiteAmount);
System.out.println("影厅id :" + showroomId);
		SetShowroomSiteService ssss = new SetShowroomSiteService();
		int flag = ssss.setShowroomSite(totalSiteStr, totalSiteAmount, showroomId);
		PrintWriter out = resp.getWriter();
		out.print(flag);
		
		
	}

}
