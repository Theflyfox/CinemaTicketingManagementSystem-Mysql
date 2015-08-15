package com.suehon.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.suehon.service.AddShowroomPageService;

@SuppressWarnings("serial")
public class ShowAddShowroomPageServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		AddShowroomPageService sasps = new AddShowroomPageService();
		String result = sasps.getShowroomType();
		PrintWriter out = response.getWriter();
		out.print(result);

	}

}
