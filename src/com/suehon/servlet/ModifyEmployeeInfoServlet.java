package com.suehon.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.suehon.model.EmployeeBean;
import com.suehon.service.ModifyEmployeeInfoService;

@SuppressWarnings("serial")
public class ModifyEmployeeInfoServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		doPost(req, resp);

	}

	public void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		String employeeId = req.getParameter("employeeId");
		String name = req.getParameter("name");
		String gender = req.getParameter("gender");
		String age = req.getParameter("age");
		String birthDate = req.getParameter("birthDate");
		String idCode = req.getParameter("idCode");
		String phoneNo = req.getParameter("phoneNo");
		String entryTime = req.getParameter("entryTime");
		String position = req.getParameter("position");
		String password = req.getParameter("password");
		
		EmployeeBean eb = new EmployeeBean();
		
		
		eb.setName(name);
		eb.setGender(gender);
		eb.setAge(age);
		eb.setBirthDate(birthDate);
		eb.setIdCode(idCode);
		eb.setPhoneNo(phoneNo);
		eb.setEntryTime(entryTime);
		eb.setPosition(position);
		eb.setPassword(password);
		
		ModifyEmployeeInfoService meis = new ModifyEmployeeInfoService();
		
		int result = meis.updateEmployeeInfo(employeeId, eb);
		
		PrintWriter out = resp.getWriter();
		out.print(result);
	}

}
