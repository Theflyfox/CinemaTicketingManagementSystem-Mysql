package com.suehon.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.suehon.model.PageBean;
import com.suehon.service.MangeEmployeeService;
import com.suehon.util.SwitchChnieseQueryKeyToEnglishQueryKey3;

@SuppressWarnings("serial")
public class MangeEmployeeServlet extends HttpServlet {

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
		String tableName = "employee";
		
		
		if(null != req.getParameter("queryKey")) {
			
			queryKey = SwitchChnieseQueryKeyToEnglishQueryKey3.switchQueryKey(new String(req.getParameter("queryKey").getBytes("iso-8859-1"), "utf-8"));// 查询的键
			req.setAttribute("queryKey", new String(req.getParameter("queryKey").getBytes("iso-8859-1"), "utf-8"));
		}
		
		
		if ("" != req.getParameter("queryValue") && null != req.getParameter("queryValue")) {// 有条件查询
			
			queryValue = new String(req.getParameter("queryValue").getBytes("iso-8859-1"), "utf-8");
			req.setAttribute("queryValue", queryValue);
		}

		if (null != req.getParameter("currentPage")) {// 设置当前页
			
			currentPage = Integer.parseInt(req.getParameter("currentPage"));
		}
		
		if (null != req.getParameter("pageSize")) {// 设置每页显示条数
			
			pageSize = Integer.parseInt(req.getParameter("pageSize"));
		}

		
System.out.println("Servlet queryKey:----->" + queryKey);
System.out.println("Servlet queryValue :----->" + queryValue);

		
		MangeEmployeeService mes = new MangeEmployeeService();
		PageBean pb = mes.getResult(tableName, queryKey, queryValue, currentPage, pageSize);

		req.setAttribute("pageSize", pageSize);
		req.setAttribute("pb", pb);
		req.getRequestDispatcher("/employee/manage_employee.jsp").forward(req, resp);
	

	
		
		
		
	}

}
