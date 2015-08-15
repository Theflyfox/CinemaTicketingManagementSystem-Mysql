package com.suehon.service;

import com.suehon.util.DbHelper;

public class ModifyShowroomInfoService {

	/**
	 * 更新单个影厅信息
	 * @param showroomId 影厅id
	 * @param showroomType 影厅类型
	 * @param showroomSiteAmount 影厅座位数量
	 * @return 成功返回true， 失败返回false
	 */
	public int modifyShowroomInfo(int showroomId, int showroomType) {
		
		String sql = "update showroom set SHOWROOMTYPE = " + showroomType + " where SHOWROOMID = " + showroomId;
		System.out.println(sql);
		DbHelper dbHelper = new DbHelper();
		int result = dbHelper.update(sql);
		return result; 
	}
}
