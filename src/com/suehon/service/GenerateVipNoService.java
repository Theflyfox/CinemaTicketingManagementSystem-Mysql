package com.suehon.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.google.gson.Gson;
import com.suehon.util.DbHelper;

public class GenerateVipNoService {

	private DbHelper dbHelper = new DbHelper();

	public String generate() {

		Date today = new Date();
		SimpleDateFormat f = new SimpleDateFormat("yyyyMMddHHmmss");

		String vipNo = f.format(today) + (int) (Math.random() * 10)
				+ ((int) (Math.random() * 10));
		int addResult = addVipToDbTable(vipNo);
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("vipno", vipNo);
		map.put("addresult", addResult);
		list.add(map);
		Gson gson = new Gson();
		return gson.toJson(list);

	}

	private int addVipToDbTable(String vipNo) {

		String sql = "insert into vip (vipno, viplevel, totalconsume) values(?, ?, ?)";
		return dbHelper.update(sql, new Object[] { vipNo, 223, 0 });
	}

}
