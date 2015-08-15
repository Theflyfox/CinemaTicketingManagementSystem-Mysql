package com.suehon.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.suehon.service.AddShowroomPageService;

@SuppressWarnings("serial")
public class IsShowroomExistsServlet extends HttpServlet {



	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String showroomName = request.getParameter("addShowroomName");
		AddShowroomPageService asps = new AddShowroomPageService();
		boolean isExist = asps.isShowroomNameExists(showroomName);
		PrintWriter out = response.getWriter();
		if(isExist) {//存在，返回-2，标志
			
			out.print(-2);
		}else {
			out.print(2);
		}
		
	}


}
