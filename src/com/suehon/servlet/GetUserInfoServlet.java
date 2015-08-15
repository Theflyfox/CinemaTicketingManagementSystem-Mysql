package com.suehon.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.suehon.service.GetUserInfoService;

@SuppressWarnings("serial")
public class GetUserInfoServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		doPost(req, resp);

	}

	public void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		 String loginName = req.getSession().getAttribute("loginName").toString();
		 
		 GetUserInfoService guis = new GetUserInfoService();
		 req.setAttribute("eb", guis.getUserInfo(loginName));
		 
		 req.getRequestDispatcher("/user/user_info.jsp").forward(req, resp);
	}

}
