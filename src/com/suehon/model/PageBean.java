package com.suehon.model;

import java.util.List;
import java.util.Map;

import com.suehon.util.DbHelper;

public class PageBean {

	private int currentPage;// 当前页数，起始从1开始
	private int totalPage;// 查询总页数
	private int pageSize;// 每页显示的页数
	private String sql;// 要查询的sql语句；如:select * from user_infor
	private List<Map<String, Object>> rslist;

	public List<Map<String, Object>> getList() {
		return rslist;
	}

	public void setList(List<Map<String, Object>> rslist) {
		this.rslist = rslist;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getTotalPage() {
		return totalPage;
	}

	/**
	 * 获取分页的总页数
	 * 
	 * @param sql
	 */
	public void setTotalPage(String sql) {

		DbHelper dbHelper = new DbHelper();
		int totalRow = dbHelper.getTotalRow(sql);// 查询结果总行数
		this.totalPage = (totalRow % pageSize == 0) ? totalRow / pageSize
				: totalRow / pageSize + 1;

	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public String getSql() {
		return sql;
	}

	public void setSql(String sql) {
		this.sql = sql + " limit " + (currentPage - 1) * pageSize + ", "
				+ pageSize;
		System.out.println("PageBean-->" + this.sql);
	}

}
