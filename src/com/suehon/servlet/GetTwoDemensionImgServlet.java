package com.suehon.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.suehon.service.GetTwoDemensionImgService;

@SuppressWarnings("serial")
public class GetTwoDemensionImgServlet extends HttpServlet {
	
	
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		doPost(req, resp);

	}

	public void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		String showroomName = req.getParameter("showroomName");
		String sitePosition = req.getParameter("sitePosition");
		String filmType = req.getParameter("filmType");
		
		String filmName = req.getParameter("filmName");
		String ChangCi = req.getParameter("ChangCi");
		String singalTicketPrice = req.getParameter("singalTicketPrice");
		String postSrc = req.getParameter("postSrc");
		String fromPath = req.getServletContext().getRealPath("posts");
		
		
		String tempPath = req.getServletContext().getRealPath("ctms");
		String toPath = tempPath.substring(0, tempPath.lastIndexOf("ctms") - 1);
		
//System.out.println("start" + start);
System.out.println("postSrc :" + postSrc);
System.out.println("sitePosition:" + sitePosition);
System.out.println("fromPath :" + fromPath);
System.out.println("toPath:" + toPath);
		
		
		GetTwoDemensionImgService gtds = new GetTwoDemensionImgService();
		String result = gtds.createTwoDemension(showroomName, sitePosition, filmType, filmName, ChangCi, singalTicketPrice, fromPath  + postSrc, toPath);
		PrintWriter out = resp.getWriter();
		
System.out.println(result);
		out.print(result);
		
	}

}
