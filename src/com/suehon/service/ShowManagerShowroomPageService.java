package com.suehon.service;

import com.suehon.model.PageBean;
import com.suehon.util.DbHelper;

public class ShowManagerShowroomPageService {

	public PageBean getResult(String tableName, int currentPage, int pageSize) {

		DbHelper dbHelper = new DbHelper();
		PageBean pageBean = new PageBean();
		String sql = "select * from " + tableName;
		pageBean.setCurrentPage(currentPage);
		pageBean.setPageSize(pageSize);
		pageBean.setSql(sql);
		pageBean.setTotalPage(tableName);
		
		pageBean.setList(dbHelper.query(pageBean.getSql()));
		return pageBean;
	}

	public PageBean getResult(String tableName, String queryKey,
			String queryValue, int currentPage, int pageSize) {

		DbHelper dbHelper = new DbHelper();
		PageBean pageBean = new PageBean();
		String sql;
		String sql2;
		if ( (null != queryKey && "" != queryKey) && (null != queryValue && "" != queryValue)) {// 有条件查询
			
			sql = "SELECT * FROM " + tableName + " WHERE "  +  queryKey + " LIKE " + "'%"
					+ queryValue + "%' order by showroomname";
			sql2 = "SELECT count(*) count FROM " + tableName + " WHERE "  +  queryKey + " LIKE " + "'%"
					+ queryValue + "%'";
		} else {//无条件查询
			sql = "select t.showroomid, t.showroomname, d.ddcontent, t.showroomsiteamount from SHOWROOM t, DATADICTIONARY d where t.showroomtype = d.ddid order by t.showroomid";//获取记录
			sql2 = "select count(*) count from " + tableName;//获取纪录行数
		}
		
//System.out.println(sql);
		pageBean.setCurrentPage(currentPage);
		pageBean.setPageSize(pageSize);
		pageBean.setSql(sql);
//System.out.println(sql2);
		pageBean.setTotalPage(sql2);
		pageBean.setList(dbHelper.query(pageBean.getSql()));
		System.out.println("ShowManagerShowroomPageService-->" + pageBean.getList().size());
		return pageBean;
	}

}
