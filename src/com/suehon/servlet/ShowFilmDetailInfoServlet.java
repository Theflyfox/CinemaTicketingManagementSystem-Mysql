package com.suehon.servlet;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.suehon.service.ShowFilmDetailInfoService;

public class ShowFilmDetailInfoServlet extends HttpServlet {

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
		
		int filmId = Integer.parseInt(req.getParameter("filmId"));
		ShowFilmDetailInfoService sfdi = new ShowFilmDetailInfoService();
		List<Map<String, Object>> list = sfdi.getFilmInfo(filmId);//调用服务
System.out.println(list.get(0).get("FILMAlAIS"));
		req.setAttribute("list", list);
System.out.println(filmId);
		req.getRequestDispatcher("/film/show_single_film_info.jsp").forward(req, resp);
		
	}

}
