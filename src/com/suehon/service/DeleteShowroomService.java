package com.suehon.service;

import com.suehon.util.DbHelper;

public class DeleteShowroomService {

	/**
	 * 删除影厅
	 * @param deleteItemsStr 将要删除的影厅的id字符串，以"-"拼接
	 * @return
	 */
	public int deleteShowroom(String deleteItemsStr) {

		String[] deleteItems = deleteItemsStr.split("-");
		String [] sqls = new String[deleteItems.length];
		String [] sql0 = new String[deleteItems.length];
		for(int i = 0; i < deleteItems.length; i++) {
			
			sqls[i] = "DELETE FROM showroom WHERE showroomid = " + deleteItems[i];
			sql0[i] = "DELETE FROM showroomsite WHERE showroomid = " + deleteItems[i];
		}
		
		new DbHelper().executeBatch(sql0);
		
		int [] result = new DbHelper().executeBatch(sqls); 
		return result[0];
	}
}
