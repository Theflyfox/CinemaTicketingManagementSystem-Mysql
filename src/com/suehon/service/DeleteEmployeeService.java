package com.suehon.service;

import com.suehon.util.DbHelper;

public class DeleteEmployeeService {


	private DbHelper dbHelper = new DbHelper();
	
	/**
	 * 删除员工
	 * @param employeeId 员工id
	 * @return 成功返回 1， 失败返回-1
	 */
	public int deleteEmployee(String employeeId) {
		

		String[] deleteItems = employeeId.split("-");
		StringBuffer sb	= new StringBuffer();
		for(int i = 0; i < deleteItems.length; i++) {
			
			sb.append( "delete from employee where employeeid = " + deleteItems[i]  + "/");
		}
		
		String temp = sb.toString().substring(0, sb.toString().length() - 1);
		
		int [] result = dbHelper.executeBatch(temp.split("/")); 
		return result[0];
		
		
	}
	
	

}
