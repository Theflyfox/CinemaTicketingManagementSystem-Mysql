package com.suehon.service;

import com.suehon.util.DbHelper;

public class DeleteFilmOnscreenPlanService {

	private DbHelper dbHelper = new DbHelper();
	
	/**
	 * 删除上映计划
	 * @param filmId 上映计划id
	 * @return 成功返回 1， 失败返回-1
	 */
	public int deleteFilmOnscreenPlan(String onscreenId) {
		

		String[] deleteItems = onscreenId.split("-");
		StringBuffer sb	= new StringBuffer();
		for(int i = 0; i < deleteItems.length; i++) {
			
			sb.append( "delete from onscreen where onscreenid = " + deleteItems[i]  + "/");
			//sb.append( "DELETE FROM datadictionary WHERE ddtype = '" + deleteItems[i] + "'" + "/");
		}
		
		String temp = sb.toString().substring(0, sb.toString().length() - 1);
		
		int [] result = dbHelper.executeBatch(temp.split("/")); 
		return result[0];
		
	}
	
	


}
