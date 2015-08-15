package com.suehon.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.suehon.service.GetShowroomInfoService;

public class GetShowroomInfoServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	
		
	
	
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		doPost(req, resp);
	}

	
	public void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		//System.out.println("test");
		String checkedItemId = req.getParameter("checkedItemId");
		String result = new GetShowroomInfoService().getInfo(checkedItemId);
		PrintWriter out = resp.getWriter();
		out.print(result);
		
	}

	
}
