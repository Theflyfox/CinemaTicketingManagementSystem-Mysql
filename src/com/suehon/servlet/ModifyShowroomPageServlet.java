package com.suehon.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.suehon.model.PageBean;
import com.suehon.service.ShowManagerShowroomPageService;

@SuppressWarnings("serial")
public class ModifyShowroomPageServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int currentPage = 1;
		int pageSize = 30;
//		String tableName = "showroom";
		String queryKey = request.getParameter("queryKey");// 查询的键
		String queryValue = "";// 查询的值
		if ("" != request.getParameter("queryValue")) {// 有条件查询
			queryValue = request.getParameter("queryValue");
			request.setAttribute("queryKey", queryKey);
			request.setAttribute("queryValue", queryValue);
		}

		if (null != request.getParameter("currentPage")) {// 设置当前页
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		if (null != request.getParameter("pageSize")) {// 设置每页显示条数
			pageSize = Integer.parseInt(request.getParameter("pageSize"));
		}

//System.out.println("queryKey:" + queryKey);
//System.out.println("queryValue :" + queryValue);
		ShowManagerShowroomPageService ssps = new ShowManagerShowroomPageService();
		PageBean pb = ssps.getResult("showroom", queryKey, queryValue, currentPage, pageSize);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("pb", pb);
		request.getRequestDispatcher("/showroom/modify_showroominfor.jsp").forward(request, response);

	}

}
