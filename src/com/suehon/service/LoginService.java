package com.suehon.service;

import java.util.List;
import java.util.Map;

import com.suehon.util.DbHelper;

public class LoginService {

	private DbHelper dbHelper = new DbHelper();
	private String userName;
	private String Position;

	public String getPosition() {
		return Position;
	}

	public void setPosition(String position) {
		Position = position;
	}

	public int checkLoginNameAndPsw(String loginName, String psw) {

		String sql = "select name, position from employee where employeeid = "
				+ loginName + " and password = '" + psw + "'";
		System.out.println(sql);
		List<Map<String, Object>> list = dbHelper.query(sql);

		if (list.size() > 0) {

			setUserName(list.get(0).get("name").toString());
			setPosition(list.get(0).get("position").toString());
			return 1;

		}
		//用户不存在
		return -1;

	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

}
