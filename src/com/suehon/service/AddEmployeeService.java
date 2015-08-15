package com.suehon.service;

import com.suehon.model.EmployeeBean;
import com.suehon.util.DbHelper;

public class AddEmployeeService {

	private DbHelper dbHelper = new DbHelper();
	
	/**
	 * 添加员工
	 * @param eb
	 * @return 受影响行数
	 */
	public int add(EmployeeBean eb) {
			
		String sql = "insert into employee (name, photo, gender, birthdate, idcode, phoneno, entrytime, position, password) values (?, ?, ?, ?, ?, ?, ?, ?,?)";
		return dbHelper.update(sql, new Object[] {eb.getName(), eb.getPhoto(), eb.getGender(), eb.getBirthDate(), eb.getIdCode(), eb.getPhoneNo(), eb.getEntryTime(), eb.getPosition(), eb.getPassword()});
		
	}
	
	
}
