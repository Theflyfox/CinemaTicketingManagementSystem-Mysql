package com.suehon.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.suehon.service.DeleteFilmOnscreenPlanService;

@SuppressWarnings("serial")
public class DeleteFilmOnscreenPlanServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		doPost(req, resp);

	}

	public void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		String onscreenId = req.getParameter("onscreenId");
		DeleteFilmOnscreenPlanService dfops = new DeleteFilmOnscreenPlanService();
		int result = dfops.deleteFilmOnscreenPlan(onscreenId);
		PrintWriter out = resp.getWriter();
		out.print(result);
	

	}

}
