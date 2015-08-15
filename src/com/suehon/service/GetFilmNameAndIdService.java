package com.suehon.service;

import java.util.Calendar;
import java.util.List;
import java.util.Map;

import com.google.gson.Gson;
import com.suehon.util.DbHelper;

public class GetFilmNameAndIdService {

	private DbHelper dbHelper;
	
	/**
	 * 获取当前月份的所有电影的名称、id、海报名称
	 * @return json形式存储的字符串数字
	 */
	public String getFilmNameAndIdServlet() {
		
		
		
		Calendar c = Calendar.getInstance();
		//获取当前月份
		String currentMonth = (c.get(Calendar.MONTH) + 1) > 9 ? ( c.get(Calendar.MONTH) + 1) + "" : "0" + ( c.get(Calendar.MONTH) + 1);
		//当前年
		String currentYear = c.get(Calendar.YEAR) + "";
		
		dbHelper = new DbHelper();
		String sql = "select f.filmid, f.filmname, f.filetype, f.filmlanguage, f.filmlasttime, f.filmpost " +
						"from film f where f.filmonline like '" + currentYear + "-" + currentMonth + "-%'";
		List<Map<String, Object>> list = dbHelper.query(sql);
		Gson gson = new Gson();
		return gson.toJson(list);
		
	}
	
	
}
