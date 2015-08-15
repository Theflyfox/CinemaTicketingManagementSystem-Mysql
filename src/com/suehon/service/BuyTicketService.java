package com.suehon.service;

import java.util.List;
import java.util.Map;

import com.suehon.util.DbHelper;
import com.suehon.util.GetNowDateAndTime;

public class BuyTicketService {
	private DbHelper dbHelper = new DbHelper();
	
	/**
	 * 获取近三天上映的影片信息
	 * @return	影片信息
	 */
	public List<Map<String, Object>> getOnscreenInfo() {
		
		//当前系统的年月日时分秒 格式XXXX-XX-XX XX:XX:XX
		String nowDateAndTime = new GetNowDateAndTime().getNowDateAndTime();
		String nowDate = nowDateAndTime.split(" ")[0];
		int nowDay = Integer.parseInt(nowDate.split("-")[2]);
		String maxDate = nowDate.split("-")[0] + "-" + nowDate.split("-")[1] + "-" + (nowDay + 2);
		String sql = "select  f.filmname, f.filmpost, f.filmid, o.onscreendate, o.onscreenstarttime, o.onscreenendtime, o.onscreenprice, s.showroomid, s.showroomname,o.onscreenid from onscreen o, film f, showroom s where o.filmid = f.filmid and o.showroomid = s.showroomid and ( o.onscreendate >= '" + nowDate + "' and  o.onscreendate <=  '" + maxDate + "') order by o.onscreendate, o.onscreenstarttime asc";
		
		return dbHelper.query(sql);
		
	}
	
	
	
	
}
