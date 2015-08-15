package com.suehon.service;

import java.util.List;
import java.util.Map;

import com.google.gson.Gson;
import com.suehon.util.DbHelper;
import com.suehon.util.GetNowDateAndTime;

public class GetFilmOnscreenStartDateAndTimeService {

	private DbHelper dbHelper;
	
	/**
	 * 获取影片开场日期和时间
	 * @param filmId
	 * @return
	 */
	public String getFilmOnscreenStartDateAndTime(int filmId) {
		
		GetNowDateAndTime g = new GetNowDateAndTime();
		String now = g.getNowDateAndTime();
		String nowDate = now.split(" ")[0];
		String nowTime = now.split(" ")[1];
		
		dbHelper = new DbHelper();
		String sql = "select o.onscreenid, o.onscreendate, o.onscreenprice, o.onscreenstarttime from onscreen o where o.filmid = " + filmId + " and ( o.onscreendate > '" + nowDate + "' or (o.onscreendate = '" + nowDate+ "' and o.onscreenstarttime > '" +nowTime + "'))";
System.out.println(sql);
		List<Map<String, Object>> list = dbHelper.query(sql);
		Gson gson = new Gson();
		return gson.toJson(list);
		
	}
}
