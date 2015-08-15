package com.suehon.service;

import java.util.List;
import java.util.Map;

import com.google.gson.Gson;
import com.suehon.util.DbHelper;

public class GetShowroomNameAndTypeService {
	
	private DbHelper dbHelper;
	
	/**
	 * 获取所有放映厅名和类型
	 * @return gson形式的字符串数组
	 */
	public String getShowroomNameAndType() {
		
		dbHelper = new DbHelper();
		String sql = "select s.showroomname, s.showroomid, d.ddcontent from showroom s, datadictionary d where s.showroomtype = d.ddid order by s.showroomid";
		List<Map<String, Object>> list = dbHelper.query(sql);
		Gson gson = new Gson();
		return gson.toJson(list);
	}
}
