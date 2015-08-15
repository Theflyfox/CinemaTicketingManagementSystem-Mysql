package com.suehon.service;

import java.util.List;
import java.util.Map;

import com.suehon.util.DbHelper;
import com.suehon.util.GetNowDateAndTime;

public class PreParTicketSaleInfoService {

	
	private DbHelper dbHelper = new DbHelper();
	
	public List<Map<String, Object>> getTicketSaleInfo() {
		
		//当前系统的年月日时分秒 格式XXXX-XX-XX XX:XX:XX
		String nowDateAndTime = new GetNowDateAndTime().getNowDateAndTime();
		String nowDate = nowDateAndTime.split(" ")[0];
		String nowTime = nowDateAndTime.split(" ")[1];
		String sql = "select distinct( f.filmname), f.filmdirector, f.filmpost,f.filmcontent, f.filmlasttime, f.filmid from film f, onscreen o where o.filmid = f.filmid and  (o.onscreendate > '" + nowDate + "' or  o.onscreendate =  '" + nowDate + "' and o.onscreenstarttime > '" + nowTime + "')";
System.out.println(sql);
		return dbHelper.query(sql);
		
		
	}
}
