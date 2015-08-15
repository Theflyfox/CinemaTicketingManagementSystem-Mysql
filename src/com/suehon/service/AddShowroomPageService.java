package com.suehon.service;

import java.util.List;
import java.util.Map;

import com.google.gson.Gson;
import com.suehon.util.DbHelper;

public class AddShowroomPageService {

	private DbHelper dbHelper;

	/**
	 * 获取表中所有影厅类型，以json格式返回
	 * 
	 * @return
	 */
	public String getShowroomType() {

		dbHelper = new DbHelper();
		String sql = "select ddid, ddcontent from datadictionary where ddtype = 'showroomtype'";
		List<Map<String, Object>> list = dbHelper.query(sql);
		Gson gson = new Gson();
		return gson.toJson(list);

	}

	/**
	 * 添加影厅
	 * 
	 * @param showroomName
	 *            影厅名
	 * @param showroomType
	 *            影厅类型
	 * @param showroomsiteamount
	 *            影厅座位数
	 * @return 添加失败返回-1，成功返回受影响行数
	 */
	public int AddShowroom(String showroomName, String showroomType ,String showroomsiteamount) {

		int affectedRows = 0;
		dbHelper = new DbHelper();

		String sql = "insert into showroom (showroomname, showroomtype, showroomsiteamount) values (?, ?,?)";
		affectedRows = dbHelper.update(sql, new Object[] { showroomName,
				showroomType, showroomsiteamount });

		return affectedRows;

	}
	
	/**
	 * 添加影厅
	 * 
	 * @param showroomName
	 *            影厅名
	 * @param showroomType
	 *            影厅类型
	 * @return 添加失败返回-1，成功返回受影响行数
	 */
	public int AddShowroom(String showroomName, String showroomType) {

		int affectedRows = 0;
		dbHelper = new DbHelper();

		String sql = "insert into showroom (showroomname, showroomtype) values (?, ?)";
		affectedRows = dbHelper.update(sql, new Object[] { showroomName, showroomType });

		return affectedRows;

	}

	/**
	 * 验证影厅是否存在
	 * @param showroomName 待验证的影厅名
	 * @return  影厅已存在返回 true，不存在返回false
	 */
	
	public boolean isShowroomNameExists(String showroomName) {

		String sql = "select showroomname from showroom where showroomname = '"
				+ showroomName + "'";
		dbHelper = new DbHelper();
		List<Map<String, Object>> list = dbHelper.query(sql);
		if (list.size() > 0) {// 要添加的影厅已存在
			return true;
		}
		return false;

	}
	
	/**
	 * 获取影厅id
	 * @param showroomName 影厅名
	 * @return	id
	 */
	public int getShowroomId(String showroomName) {
		
		String sql = "select showroomid from showroom where showroomname = '"
				+ showroomName + "'";
		dbHelper = new DbHelper();
		List<Map<String, Object>> list = dbHelper.query(sql);
		return Integer.parseInt(list.get(0).get("showroomid").toString());
	}
	
	public String getShowroomType(String showroomType) {
		
		
		String sql = "select ddcontent from datadictionary where ddid = " + showroomType + "";
		dbHelper = new DbHelper();
		List<Map<String, Object>> list = dbHelper.query(sql);
		return list.get(0).get("ddcontent").toString();
		
	}
	
	
	
	
	
	
	
	
	
	
	

}
