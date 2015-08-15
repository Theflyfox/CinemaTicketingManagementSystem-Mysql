package com.suehon.service;

import com.google.gson.Gson;
import com.suehon.util.DbHelper;

public class GetAlreadySoldoutTicketService {

	
	public String getAlreadySoldoutTicket(String onscreenId) {
		
		String sql = "select siterow, sitecol from tickettrade where onscreenId = " + onscreenId + " and shouldpay is not null and realpay is not null and vipno is not null";
System.out.println(sql);
		Gson gson = new Gson();
		return gson.toJson(new DbHelper().query(sql));
	}
}
