package com.suehon.service;

import com.suehon.util.DbHelper;

/**
 * 设置放映厅座位排布服务
 * 座位排布协议为:
 * 
 * 1:12;0(1)-12(2)-30(1)/2:12;0(1)-12(2)-30(1)/3:12;0(1)-12(2)-30(1)/
 *
 *	(0) 表示空格
 *	(1) 表示座位
 *
 *	解释：单行 1:12;0(0)-12(1)-30(0) 
 * 	第一行共有十二个座位，左边0个空格，中间12个座位，右边30个空格,多行之间用/分割
 * 
 * @author John
 *
 */
public class SetShowroomSiteService {

	private DbHelper dbHelper = new DbHelper();
	
	public int setShowroomSite(String totalSiteStr, int totalSiteAmount, int showroomId) {
		
		//存放sql语句
		StringBuffer sqlBuffer = new StringBuffer();
		//每一行座位排布 ，每一行座位排布格式为 :1:12;0(1)-12(2)-30(1)
		String []siteArr = totalSiteStr.split("/");
		
		String rowNo;
		String sql;
		
		for(String item : siteArr) {
			
			rowNo = item.split(":")[0];
			//获取";"之后的字符串 结果格式为 "0(0)-12(1)-30(0)"
			String subStr = item.split(";")[1];
			
			//获取每一个座位个数和属性
			sql = "insert into showroomsite (siterow, sitecol, showroomId) values('"+ rowNo + "', '" + subStr + "', " + showroomId + " )";
			
			sqlBuffer.append(sql + "/");
			
		}
		
		String sql0 = "update showroom set  showroomsiteamount = " + totalSiteAmount + " where showroomid = " + showroomId;
		sqlBuffer.append(sql0 + "/");
		
		int []result = dbHelper.executeBatch(sqlBuffer.toString().split("/"));
		
		return result[0];
	}
	
	
	
}
