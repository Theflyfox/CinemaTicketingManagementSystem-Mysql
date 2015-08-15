package com.suehon.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.google.gson.Gson;
import com.suehon.util.DbHelper;


public class DrawSiteService {

	private DbHelper dbHelper = new DbHelper();
	
	/**
	 * 获取影厅id	
	 * @param filmId 影片id
	 * @param startDate 上映日期
	 * @param startTime 开始时间
	 * @return	影厅id
	 */
	private int getShowroomId(String filmId, String startDate, String startTime) {
		
		String sql = "select showroomid from onscreen o where filmid = " + filmId + " and o.onscreendate = '" + startDate + "' and o.onscreenstarttime = '" + startTime + "'";
System.out.println(sql);
		return Integer.parseInt(dbHelper.query(sql).get(0).get("showroomid").toString());
	}
	
	
	public String getSite(String filmId, String startDate, String startTime) {
		
		int showroomId = getShowroomId(filmId, startDate, startTime);
		String sql = "select st.siterow, st.sitecol, s.showroomname from showroomsite st, showroom s where st.showroomid = " + showroomId + " and st.showroomid = s.showroomid order by st.siterow asc";
		
System.out.println(sql);
		Gson g = new Gson();
		List<Map<String, Object>> list = dbHelper.query(sql);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("showromid", showroomId);
		list.add(map);
		return g.toJson(list);
		
	}
	
	
}
