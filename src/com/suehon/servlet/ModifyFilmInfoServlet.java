package com.suehon.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.suehon.model.FilmBean;
import com.suehon.service.ModifyFilmInfoService;

@SuppressWarnings("serial")
public class ModifyFilmInfoServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		doPost(req, resp);

	}

	public void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		int filmId = Integer.parseInt(req.getParameter("filmId").toString());
		String filmName = req.getParameter("filmName").trim();
		String filmAlias = req.getParameter("filmAlias").trim();
		String filmCountry = req.getParameter("filmCountry").trim();
		String filmDirector = req.getParameter("filmDirector").trim();
		String filmLeadingRole = req.getParameter("filmLeadingRole").trim();
		String filmLanguage = req.getParameter("filmLanguage").trim();
		String filmLastTime = req.getParameter("filmLastTime").trim();
		String filmType = req.getParameter("filmType").trim();
		String filmOnline = req.getParameter("filmOnline").trim();
		String filmContent = req.getParameter("filmContent").trim();
		String filmBackStory = req.getParameter("filmBackStory").trim();
		String filmAward = req.getParameter("filmAward").trim();
		
		FilmBean fb = new FilmBean();//声明javaBean
		
		
		/*******调用set方法*********/
		fb.setFilmId(filmId);
		fb.setFilmName(filmName);
		fb.setFilmAlias(filmAlias);
		fb.setFilmCountry(filmCountry);
		fb.setFilmDirector(filmDirector);
		fb.setFilmLeadingRole(filmLeadingRole);
		fb.setFilmLanguage(filmLanguage);
		fb.setFilmLastTime(filmLastTime);
		fb.setFilmType(filmType);
		fb.setFilmOnline(filmOnline);
		fb.setFilmContent(filmContent);
		fb.setFilmBackStory(filmBackStory);
		fb.setFilmAward(filmAward);
		
		
		/*********调用服务*******/
		ModifyFilmInfoService mfis = new ModifyFilmInfoService();
		int result = mfis.modifyFilmInfo(fb);
		req.setAttribute("result", result);
		
		/**********转向结果页面**********/
		req.getRequestDispatcher("/film/modify_film_info_result.jsp").forward(req, resp);
		
	}

}
