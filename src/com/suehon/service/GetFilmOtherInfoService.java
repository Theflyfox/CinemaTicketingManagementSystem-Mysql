package com.suehon.service;

import java.util.List;
import java.util.Map;

import com.google.gson.Gson;
import com.suehon.util.DbHelper;

public class GetFilmOtherInfoService {

	private DbHelper dbHelper;
	
	/**
	 * 根据影片id获取影片类型， 时长，语言
	 * @param filmid 影片id
	 * @return 
	 */
	public String getFilmOtherInfo(int filmid) {
		
		dbHelper = new DbHelper();
		String sql = "select f.filmname, f.filetype, f.filmlasttime, f.filmpost, f.filmlanguage from film f where f.filmid = " + filmid;
		List<Map<String, Object>> list = dbHelper.query(sql);
		Gson gson = new Gson();
		return gson.toJson(list);
	}
	
	
}
