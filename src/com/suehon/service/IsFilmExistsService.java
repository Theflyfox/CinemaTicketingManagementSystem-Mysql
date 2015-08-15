package com.suehon.service;

import java.util.List;
import java.util.Map;

import com.suehon.util.DbHelper;

public class IsFilmExistsService {

	private final int UNEXIST = -1;
	private DbHelper dbHelper = new DbHelper();
	
	/**
	 * 检查影片名是否存在
	 * @param filmName 影片名
	 * @return	存在返回 当前影片的id；不存在返回-1。
	 */
	public int isFilmExists(String filmName) {
		
		String sql = "select FILMID from film where FILMNAME = '" + filmName + "'";
		String sql1 = "select DDTYPE from DATADICTIONARY where DDCONTENT = '" + filmName+ "'";
		List<Map<String, Object>> list = dbHelper.query(sql);
		
		
		if(list.size() > 0) {
			return Integer.parseInt(list.get(0).get("FILMID").toString());
		}else {
			List<Map<String, Object>> list1 = dbHelper.query(sql1);
			
			if(list1.size() > 0) {
				return Integer.parseInt(list1.get(0).get("DDTYPE").toString());
			}
		}
		return UNEXIST;
	}
}
