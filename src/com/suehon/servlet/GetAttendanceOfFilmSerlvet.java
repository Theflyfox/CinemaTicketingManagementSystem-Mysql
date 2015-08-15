package com.suehon.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jfree.chart.ChartUtilities;
import org.jfree.chart.JFreeChart;

import com.suehon.service.GetAttendanceOfFilmService;

@SuppressWarnings("serial")
public class GetAttendanceOfFilmSerlvet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		doPost(req, resp);

	}

	public void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		String startTime = req.getParameter("startTime");
		String endTime = req.getParameter("endTime");
		int pageSize = 5;//显示个数
		
		
		GetAttendanceOfFilmService gaofs = new GetAttendanceOfFilmService();
		JFreeChart chart = gaofs.getAttendanceOfFilm(startTime, endTime, pageSize);
		// 将图片对象输出到客户端  
        java.io.OutputStream ous = resp.getOutputStream();  
        ChartUtilities.writeChartAsPNG(ous, chart, 500, 300);
        
        ous.flush();  
        ous.close();  
        System.out.println("******ho ho..*****图片输出完毕....... ");  
		
	}
}
