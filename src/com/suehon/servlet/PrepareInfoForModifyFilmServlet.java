package com.suehon.servlet;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.suehon.service.ShowFilmDetailInfoService;

@SuppressWarnings("serial")
public class PrepareInfoForModifyFilmServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		doPost(req, resp);

	}

	public void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		int filmId = Integer.parseInt(req.getParameter("filmId"));
		ShowFilmDetailInfoService sfdi = new ShowFilmDetailInfoService();
		List<Map<String, Object>> list = sfdi.getFilmInfo(filmId);//调用服务
System.out.println(list.get(0).get("filmalais"));
		req.setAttribute("list", list);
		req.setAttribute("filmId", filmId);
System.out.println(filmId);
		req.getRequestDispatcher("/film/modify_film.jsp").forward(req, resp);
		
	}

}
