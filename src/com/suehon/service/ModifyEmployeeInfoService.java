package com.suehon.service;

import com.suehon.model.EmployeeBean;
import com.suehon.util.DbHelper;

public class ModifyEmployeeInfoService {

	public int updateEmployeeInfo(String employeeId, EmployeeBean eb) {
		
		String sql = "update employee set name = ?, gender = ?, age = ?, birthdate = ?, idcode = ?, phoneno = ?, entrytime = ?, position = ?, password = ? where employeeid = ?";
		return new DbHelper().update(sql, new Object[] {eb.getName(), eb.getGender(), eb.getAge(), eb.getBirthDate(), eb.getIdCode(), eb.getPhoneNo(), eb.getEntryTime(), eb.getPosition(), eb.getPassword(), employeeId});
		
	}
}
