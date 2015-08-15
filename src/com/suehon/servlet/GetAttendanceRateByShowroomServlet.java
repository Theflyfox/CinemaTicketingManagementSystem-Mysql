package com.suehon.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jfree.chart.ChartUtilities;
import org.jfree.chart.JFreeChart;

import com.suehon.service.GetAttendanceRateByShowroomService;

@SuppressWarnings("serial")
public class GetAttendanceRateByShowroomServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		doPost(req, resp);

	}

	public void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		String month = req.getParameter("month");
		
		GetAttendanceRateByShowroomService garbss = new GetAttendanceRateByShowroomService();
		JFreeChart chart = garbss.getAttendanceRateByShowroom(month);
		// 将图片对象输出到客户端  
        java.io.OutputStream ous = resp.getOutputStream();  
        ChartUtilities.writeChartAsPNG(ous, chart, 500, 300);
        
        ous.flush();  
        ous.close();  
        System.out.println("******ho ho..*****图片输出完毕....... ");  
		
		
	}

}
