package com.suehon.service;

import com.suehon.util.DbHelper;

public class AddMoreFilmPostService {

	private DbHelper dbHelper = new DbHelper();
	
	/**
	 * 将原存储海报的字符串添加新的文件名字符串
	 * @param filmId	电影id
	 * @param newPostFileNameStr 新的文件名字符串
	 * @return	成功返回大于 0 的整数， 失败返回小于0 的整数
	 */
	public int addMoreFilmPost(int filmId, String newPostFileNameStr) {
		
		
		String sql = "select filmpost from film where filmid = " + filmId;
		String orignalPostStr = dbHelper.query(sql).get(0).get("filmpost").toString();
		String sql2 = "update film set filmpost = ? where filmid = ?";
		
		return dbHelper.update(sql2, new Object[] {orignalPostStr + "/"  +newPostFileNameStr, filmId});
	}
	
}
