package com.suehon.service;

import java.util.Map;

import com.suehon.model.EmployeeBean;
import com.suehon.util.DbHelper;

public class GetUserInfoService {

	private DbHelper dbHelper = new DbHelper();

	public EmployeeBean getUserInfo(String loginName) {

		String sql = "select e.employeeid, e.name, e.photo, e.gender, e.birthdate, e.idcode, e.phoneno, e.entrytime, e.position, e.password, e.age from employee e where e.employeeid = "
				+ loginName;
		Map<String, Object> map = dbHelper.query(sql).get(0);

		EmployeeBean eb = new EmployeeBean();

		eb.setAge(map.get("age").toString());
		eb.setBirthDate(map.get("birthdate").toString());
		eb.setEntryTime(map.get("entrytime").toString());
		eb.setGender(map.get("gender").toString());
		eb.setId(loginName);
		eb.setIdCode(map.get("idcode").toString());
		eb.setName(map.get("name").toString());
		eb.setPassword(map.get("password").toString());
		eb.setPhoneNo(map.get("phoneno").toString());
		eb.setPhoto(map.get("photo").toString());
		eb.setPosition(map.get("position").toString());

		return eb;
	}

}
