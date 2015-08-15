package com.suehon.service;

import com.suehon.util.DbHelper;

public class AddShowroomTypeService {

	DbHelper dbHelper;
	public int addShowroomType(String showroomType) {
		
		String sql = "insert into datadictionary (ddcontent, ddtype) values(?,?)";
		dbHelper = new DbHelper();
		return dbHelper.update(sql, new Object[] { showroomType, "showroomtype"});
	}
}
