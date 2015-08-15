package com.suehon.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.suehon.model.PageBean;
import com.suehon.service.GetSalesDetailsService;

@SuppressWarnings("serial")
public class GetSalesDetailsServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		doPost(req, resp);

	}

	public void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		String startTime = req.getParameter("startTime");
		String endTime = req.getParameter("endTime");
		
		req.setAttribute("startTime", startTime);
		req.setAttribute("endTime", endTime);
		
		int currentPage = 1;//默认当前页
		int pageSize = 5;//默认每页显示条数
		

		if (null != req.getParameter("currentPage")) {// 设置当前页
			
			currentPage = Integer.parseInt(req.getParameter("currentPage"));
		}
		
		if (null != req.getParameter("pageSize")) {// 设置每页显示条数
			
			pageSize = Integer.parseInt(req.getParameter("pageSize"));
		}

		
		
		GetSalesDetailsService gsds = new GetSalesDetailsService();
		PageBean pb = gsds.getResult( startTime, endTime, currentPage, pageSize);
		
		req.setAttribute("pageSize", pageSize);
		req.setAttribute("pb", pb);
		req.getRequestDispatcher("/statistics/sales_detail.jsp").forward(req, resp);
		
	}

}
