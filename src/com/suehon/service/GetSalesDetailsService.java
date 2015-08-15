package com.suehon.service;

import com.suehon.model.PageBean;
import com.suehon.util.DbHelper;


public class GetSalesDetailsService {

	
	
	/**
	 * 有条件获取结果集
	 * @param startTime 开始时间
	 * @param endTime 结束时间
	 * @param currentPage 当前页
	 * @param pageSize 每页显示条数
	 * @return	PageBean
	 */
	public PageBean getResult(String startTime, String endTime, int currentPage, int pageSize) {

		DbHelper dbHelper = new DbHelper();
		PageBean pageBean = new PageBean();
		/*
		GetNowDateAndTime gndt = new GetNowDateAndTime();
		//当前系统时间
		String nowDateAndTime = gndt.getNowDateAndTime();
		
		String nowDate = nowDateAndTime.split(" ")[0];
		
		String finishTime = nowDate + " "  + endTime;
		*/
		String sql;
		String sql2;

			sql = "select s.showroomname, f.filmname, o.onscreendate, o.onscreenstarttime, t.siterow, t.sitecol, t.shouldpay, t.realpay, t.vipno from showroom s ,tickettrade t, film f, onscreen o where s.showroomid = t.showroomid and f.filmid = o.filmid and t.onscreenid = o.onscreenid and o.onscreenstarttime > '" + startTime + "' and o.onscreenendtime < '" + endTime + "'";
			sql2 = "SELECT count(*) count FROM showroom s ,tickettrade t, film f, onscreen o where s.showroomid = t.showroomid and f.filmid = o.filmid and o.onscreenstarttime > '" + startTime + "' and t.onscreenid = o.onscreenid and o.onscreenendtime < '" + endTime + "'";
			

System.out.println(sql);
		pageBean.setCurrentPage(currentPage);
		pageBean.setPageSize(pageSize);
		pageBean.setSql(sql);
		pageBean.setTotalPage(sql2);
System.out.println(sql2);
		pageBean.setTotalPage(sql2);
		pageBean.setList(dbHelper.query(pageBean.getSql()));
		return pageBean;
	}
	
}
