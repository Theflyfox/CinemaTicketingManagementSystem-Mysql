package com.suehon.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.suehon.service.AddShowroomTypeService;

@SuppressWarnings("serial")
public class AddShowroomTypeServlet extends HttpServlet {



	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

			String showroomType = request.getParameter("showroomType");
			AddShowroomTypeService ast = new AddShowroomTypeService();
			int result = ast.addShowroomType(showroomType);
			PrintWriter out = response.getWriter();
			out.print(result);
	}


}
