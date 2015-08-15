package com.suehon.service;

import com.suehon.model.PageBean;
import com.suehon.util.DbHelper;

public class ManageFilmInfoService {

	private DbHelper dbHelper = new DbHelper();
	private PageBean pageBean = new PageBean();

	/**
	 * 获取结果集，无查询条件
	 * @param tableName
	 * @param currentPage
	 * @param pageSize
	 * @return
	 */
	public PageBean getResult(String tableName, int currentPage, int pageSize) {

		String sql = "select * from " + tableName;
		String sql2 = "select count(*) count from " + tableName;
		pageBean.setCurrentPage(currentPage);
		pageBean.setPageSize(pageSize);
		pageBean.setSql(sql);
		pageBean.setTotalPage(sql2);

		pageBean.setList(dbHelper.query(pageBean.getSql()));
		return pageBean;
	}

	/**
	 * 有条件获取结果集
	 * @param tableName
	 * @param queryKey
	 * @param queryValue
	 * @param currentPage
	 * @param pageSize
	 * @return
	 */
	public PageBean getResult(String tableName, String queryKey,
			String queryValue, int currentPage, int pageSize) {

		DbHelper dbHelper = new DbHelper();
		PageBean pageBean = new PageBean();
		String sql;
		String sql2;
		if (( "" != queryKey) && ( "" != queryValue)) {// 有条件查询

			sql = "SELECT * FROM " + tableName + " WHERE " + queryKey
					+ " LIKE " + "'%" + queryValue + "%' order by FILMONLINE ASC";
			sql2 = "SELECT count(*) count FROM " + tableName + " WHERE "
					+ queryKey + " LIKE " + "'%" + queryValue + "%'";
		} else {
			
			sql = "select * from " + tableName + " order by FILMONLINE ASC";
			sql2 = "select count(*) count from " + tableName;
		}

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
