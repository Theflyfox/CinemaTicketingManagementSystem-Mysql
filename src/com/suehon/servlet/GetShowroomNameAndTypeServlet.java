package com.suehon.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.suehon.service.GetShowroomNameAndTypeService;

@SuppressWarnings("serial")
public class GetShowroomNameAndTypeServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		doPost(req, resp);

	}

	public void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		GetShowroomNameAndTypeService gsats = new GetShowroomNameAndTypeService();
		PrintWriter out = resp.getWriter();
		out.print(gsats.getShowroomNameAndType());
	}

}
