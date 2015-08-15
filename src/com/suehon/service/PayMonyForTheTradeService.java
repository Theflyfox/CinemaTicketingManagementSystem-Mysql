package com.suehon.service;

import com.suehon.util.DbHelper;

public class PayMonyForTheTradeService {

	public int payMonyForTheTrade(String choosenSitePositionStr, String onscreenId, String showroomid, String shouldPay, String realPay, String vipNo) {
		
		StringBuffer sb = new StringBuffer();
		
		//每一个座位的位置 格式 4,5
		String[] choosenSitePositionArr = choosenSitePositionStr.split("-");
		int siteCount = choosenSitePositionArr.length;
		float should = Float.parseFloat(shouldPay) / siteCount;
		float real = Float.parseFloat(realPay) / siteCount;
		String row = "";
		String col = "";
		String sql = "";
		for(String item : choosenSitePositionArr) {
			
			 row = item.substring(0, item.indexOf(","));
			 col = item.substring(item.indexOf(",") + 1, item.length());
			 sql = "update tickettrade set showroomid = " + showroomid + ", realpay = " + real + ", shouldpay = " + should + ", vipno = '" + vipNo + "' where onscreenid = " + onscreenId + " and siterow = " + row + " and sitecol = " + col;
			 System.out.println(sql);
			sb.append(sql + "/");
		}
		
		String []sqls = sb.toString().substring(0, sb.toString().length() - 1).split("/");
		return new DbHelper().executeBatch(sqls)[0];
		
	}
}
