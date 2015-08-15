package com.suehon.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.suehon.service.DeleteFilmPicService;

@SuppressWarnings("serial")
public class DeleteFilmPicServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		doPost(req, resp);

	}

	public void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

			int filmId = Integer.parseInt(req.getParameter("filmId"));
			int picNo = Integer.parseInt(req.getParameter("picNo"));
			
System.out.println("删除的影片id ：" + filmId + "----\n图片序号:" + picNo);
			DeleteFilmPicService dfps = new DeleteFilmPicService();
			String  postStr = dfps.deletePic(filmId, picNo);
			
			req.getSession().setAttribute("postStr", postStr);
				
			
			
			req.getRequestDispatcher("/film/modify_film_pic.jsp").forward(req, resp);
			
	}

}
