package com.suehon.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.suehon.model.FilmOnscreenBean;
import com.suehon.service.AddFilmOnscreenService;

@SuppressWarnings("serial")
public class AddFilmOnscreenServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		doPost(req, resp);

	}

	public void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
			
		int showroomId = Integer.parseInt(req.getParameter("showroomId"));
		String filmOnscreenDate = req.getParameter("filmOnscreenDate");
		int chooseFilmId = Integer.parseInt(req.getParameter("chooseFilmId"));
		String startTime = req.getParameter("startTime");
		String endTime = req.getParameter("endTime");
		int filmPrice = Integer.parseInt(req.getParameter("filmPrice"));
		
		//生成javaBean
		FilmOnscreenBean fob = new FilmOnscreenBean();
		fob.setShowroomId(showroomId);
		fob.setFilmOnscreenDate(filmOnscreenDate);
		fob.setChooseFilmId(chooseFilmId);
		fob.setStartTime(startTime);
		fob.setEndTime(endTime);
		fob.setFilmPrice(filmPrice);
		
		//调用服务
		AddFilmOnscreenService afos = new AddFilmOnscreenService();
		int result = afos.addFilmOnscreen(fob);
		
		PrintWriter out = resp.getWriter();
		out.print(result);
		
	}

}
