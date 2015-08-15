package com.suehon.service;

import java.util.List;
import java.util.Map;

import com.suehon.util.DbHelper;

public class ShowEmployeeDetailInfoService {


	private DbHelper dbHelper = new DbHelper();

	public List<Map<String, Object>> getFilmInfo(int employeeId) {

		String sql = "select * from employee where employeeid = " + employeeId;
		return dbHelper.query(sql);
	}
	
	

}
