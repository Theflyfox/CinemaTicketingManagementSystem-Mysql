package com.suehon.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.suehon.service.LoginService;

@SuppressWarnings("serial")
public class LoginServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		doPost(req, resp);

	}

	public void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		String loginName = req.getParameter("loginName");
		String psw = req.getParameter("psw");
		System.out.println("登录名 :" + loginName);
		System.out.println("密码:" + psw);
		
		LoginService ls = new LoginService();
		int result = ls.checkLoginNameAndPsw(loginName, psw);
		PrintWriter out = resp.getWriter();
		if(result > 0) {
			
			HttpSession session = req.getSession();
			session.setAttribute("name", ls.getUserName());
			session.setAttribute("position", ls.getPosition());
			session.setAttribute("loginName", loginName);
			out.print(1);
			
		}else {
			
			out.print(-1);
			
		}
		
		
		
		
		
		
		
		
		
	}

}
