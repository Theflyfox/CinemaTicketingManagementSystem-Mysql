package com.suehon.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.suehon.service.DeleteShowroomService;

public class DeleteShowroomServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		doPost(request, response);
	}


	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		
		
		String deleteItemsStr = request.getParameter("deleteItems");
		int result = new DeleteShowroomService().deleteShowroom(deleteItemsStr);
		if(result > 0) {//删除成功返回 1
			out.print(1);
		}else { //删除失败，返回  -1
			
			out.print(-1);
		}
		
		
		
		
	}

}
