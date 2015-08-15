package com.suehon.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.suehon.service.AddShowroomPageService;

@SuppressWarnings("serial")
public class AddShowroomServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

			String showroomName = request.getParameter("SHOWROOMNAME");
			String showroomType = request.getParameter("SHOWROOMTYPE");
//			String showroomsiteamount = request.getParameter("SHOWROOMSITEAMOUNT");
			
			
			AddShowroomPageService asps = new AddShowroomPageService();
			int affectedRows = asps.AddShowroom(showroomName, showroomType);
			int showroomId = asps.getShowroomId(showroomName);
			
			HttpSession session = request.getSession();
			
			session.setAttribute("showroomName", showroomName);
			session.setAttribute("showroomType", asps.getShowroomType(showroomType));
			session.setAttribute("showroomId", showroomId);
			
			PrintWriter out = response.getWriter();
			out.print(affectedRows);
System.out.println(affectedRows);
	}
}
