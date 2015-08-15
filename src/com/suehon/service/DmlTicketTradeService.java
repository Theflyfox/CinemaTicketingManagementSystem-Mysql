package com.suehon.service;

import com.suehon.util.DbHelper;

public class DmlTicketTradeService {

	
	/**
	 * 预订座位
	 * @param flag 标志， 1为预订该座位，2为取消该座位
	 * @param sitePosition	位置 格式为(XX,XX)
	 * @param onscreenId	上映计划id
	 * @param shouldPay	
	 * @return
	 */
	public int DmlTicketTrade(int flag, String sitePosition, int onscreenId) {
		
		
		String siteRow = sitePosition.substring(0, sitePosition.indexOf(","));
		String siteCol = sitePosition.substring(sitePosition.indexOf(",") + 1, sitePosition.length());
		if(flag == 1) {//预订
				
			
			return addTicketTrade( siteRow, siteCol, onscreenId);
			
		}else{//取消
			
			return cancleTickeTrade(siteRow, siteCol, onscreenId);
			
		}
		
	}
	
	
	private int addTicketTrade(String siteRow, String siteCol, int onscreenId) {
		
		String sql = "insert into tickettrade (onscreenid, siterow, sitecol) values(?,?, ?)";
System.out.println(sql);
		
		return new DbHelper().update(sql, new Object [] {onscreenId, siteRow, siteCol});
		
	}
	
	private int cancleTickeTrade(String siteRow, String siteCol, int onscreenId) {
		
		String sql = "delete from tickettrade where siterow = ? and sitecol = ? and onscreenid = ?";
System.out.println(sql);
		return new DbHelper().update(sql, new Object[] {siteRow, siteCol, onscreenId});
	}
	
	
	
	
}
