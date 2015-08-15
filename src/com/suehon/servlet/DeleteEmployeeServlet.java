package com.suehon.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.suehon.service.DeleteEmployeeService;

@SuppressWarnings("serial")
public class DeleteEmployeeServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		doPost(req, resp);

	}

	public void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		
		String employeeId = req.getParameter("employeeId");
		DeleteEmployeeService des = new DeleteEmployeeService();
		int result = des.deleteEmployee(employeeId);
		PrintWriter out = resp.getWriter();
		out.print(result);
		
	}

}
