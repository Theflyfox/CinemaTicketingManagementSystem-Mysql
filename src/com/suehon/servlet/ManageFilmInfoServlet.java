package com.suehon.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.suehon.model.PageBean;
import com.suehon.service.ManageFilmInfoService;
import com.suehon.util.SwitchChnieseQueryKeyToEnglishQueryKey;

@SuppressWarnings("serial")
public class ManageFilmInfoServlet extends HttpServlet {


	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		doPost(req, resp);

	}

	
	public void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {


		int currentPage = 1;//默认当前页
		int pageSize = 5;//默认每页显示条数
		String queryKey = "";//查询的条件
		String queryValue = "";// 查询的值
		String tableName = "film";
		
		
		if(null != req.getParameter("queryKey")) {
			queryKey = SwitchChnieseQueryKeyToEnglishQueryKey.switchQueryKey(new String(req.getParameter("queryKey").getBytes("iso-8859-1"), "utf-8"));// 查询的键
			
			req.setAttribute("queryKey",  new String(req.getParameter("queryKey").getBytes("iso-8859-1"), "utf-8"));
			
			
			
		}
		
		
		if ("" != req.getParameter("queryValue") && null != req.getParameter("queryValue")) {// 有条件查询
			
			queryValue = new String(req.getParameter("queryValue").getBytes("iso-8859-1"), "utf-8");
			//req.setAttribute("queryKey", queryKey);
			req.setAttribute("queryValue", queryValue);
		}

		if (null != req.getParameter("currentPage")) {// 设置当前页
			
			currentPage = Integer.parseInt(req.getParameter("currentPage"));
		}
		
		if (null != req.getParameter("pageSize")) {// 设置每页显示条数
			
			pageSize = Integer.parseInt(req.getParameter("pageSize"));
		}


		ManageFilmInfoService mfis = new ManageFilmInfoService();
		PageBean pb = mfis.getResult(tableName, queryKey, queryValue, currentPage, pageSize);
		
		req.setAttribute("pageSize", pageSize);
		req.setAttribute("pb", pb);
		req.getRequestDispatcher("/film/manage_film.jsp").forward(req, resp);
	}

}
