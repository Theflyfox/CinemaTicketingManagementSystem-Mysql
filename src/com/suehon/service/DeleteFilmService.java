package com.suehon.service;


import com.suehon.util.DbHelper;

public class DeleteFilmService {

	private DbHelper dbHelper = new DbHelper();
	
	/**
	 * 删除影片
	 * @param filmId 影片id
	 * @return 成功返回 1， 失败返回-1
	 */
	public int deleteFilm(String filmId) {
		

		String[] deleteItems = filmId.split("-");
		StringBuffer sb	= new StringBuffer();
		for(int i = 0; i < deleteItems.length; i++) {
			
			sb.append( "DELETE FROM film WHERE filmid = " + deleteItems[i]  + "/");
			sb.append( "DELETE FROM datadictionary WHERE ddtype = '" + deleteItems[i] + "'" + "/");
		}
		
		String temp = sb.toString().substring(0, sb.toString().length() - 1);
		
		int [] result = dbHelper.executeBatch(temp.split("/")); 
		return result[0];
		
		
	}
	
	
}
