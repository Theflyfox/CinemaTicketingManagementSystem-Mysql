package com.suehon.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.suehon.service.ModifyShowroomInfoService;

public class ModifyShowroomInfoServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		doPost(req, resp);

	}

	public void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		int showroomId = Integer.parseInt(req.getParameter("checkedItemId"));
		int showroomType = Integer.parseInt(req.getParameter("showroomtype"));
		//int  showroomSiteAmount = Integer.parseInt(req.getParameter("showroomsiteamount"));
		ModifyShowroomInfoService msis = new ModifyShowroomInfoService();
//System.out.println("修改的id为" + showroomId + ", 类型为 " + showroomType + ", 数量 :" + showroomSiteAmount);
		int result = msis.modifyShowroomInfo(showroomId, showroomType);
//System.out.println("是否成功" + result);
		PrintWriter out = resp.getWriter();
		out.print(result);
	}

}
