package com.suehon.servlet;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.suehon.service.ShowEmployeeDetailInfoService;

@SuppressWarnings("serial")
public class PrepareInfoForModifyEmployeeServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		doPost(req, resp);

	}

	public void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		
		int employeeId = Integer.parseInt(req.getParameter("employeeId"));
		
		ShowEmployeeDetailInfoService sedis = new ShowEmployeeDetailInfoService();
		List<Map<String, Object>> list = sedis.getFilmInfo(employeeId);//调用服务

		req.setAttribute("list", list);
		req.setAttribute("employeeId", employeeId);
System.out.println(employeeId);
		req.getRequestDispatcher("/employee/modify_employee.jsp").forward(req, resp);
		
	
		
		
		
	}

}
