package com.suehon.service;

import java.util.List;
import java.util.Map;

import com.google.gson.Gson;
import com.suehon.util.DbHelper;

public class GetShowroomInfoService {

	/**
	 * 获取单个影厅的名称，座位数量
	 * @param showroomId	查询影厅的id
	 * @return	gson
	 */
	public String getInfo(String showroomId) {
		
		String sql = "select showroomname, showroomsiteamount from showroom where showroomid = " + showroomId;
		List<Map<String, Object>> list = new DbHelper().query(sql);
		Gson gson = new Gson();
		return gson.toJson(list);
	}
}
