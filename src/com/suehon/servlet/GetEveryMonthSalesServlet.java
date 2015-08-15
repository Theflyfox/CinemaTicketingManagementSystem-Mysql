package com.suehon.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jfree.chart.ChartUtilities;
import org.jfree.chart.JFreeChart;

import com.suehon.service.GetEveryMonthSalesService;

@SuppressWarnings("serial")
public class GetEveryMonthSalesServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		doPost(req, resp);

	}

	public void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		String year = req.getParameter("year");
		
		GetEveryMonthSalesService gemss = new GetEveryMonthSalesService();
		
		JFreeChart chart = gemss.getEveryMonthSales(year);
		// 将图片对象输出到客户端  
        java.io.OutputStream ous = resp.getOutputStream();
        
        ChartUtilities.writeChartAsPNG(ous, chart, 800, 400);
        
        ous.flush();  
        ous.close();  
        System.out.println("******ho ho..*****图片输出完毕....... ");  
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	}

}
