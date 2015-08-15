package com.suehon.service;

import java.util.List;
import java.util.Map;

import com.suehon.util.DbHelper;

public class ShowFilmDetailInfoService {

	private DbHelper dbHelper = new DbHelper();

	public List<Map<String, Object>> getFilmInfo(int filmId) {

		String sql1 = "select * from film where FILMID = " + filmId;
		String sql2 = "select DDCONTENT from DATADICTIONARY where DDTYPE = '"
				+ filmId + "'";

		List<Map<String, Object>> list1 = dbHelper.query(sql1);// 获取该影片信息
		List<Map<String, Object>> list2 = dbHelper.query(sql2);// 获取影片别名信息
		StringBuffer sb = new StringBuffer();
		for (Map<String, Object> item : list2) {// 将每个别名取出进行组合，以"/"分割

			sb.append(item.get("ddcontent") + "/");
			
		}
		String tempString = sb.toString();
		String filmAlais = tempString.substring(0, sb.toString().length() - 1);
		list1.get(0).put("filmalais", filmAlais);
		return list1;
	}
	
	
}
