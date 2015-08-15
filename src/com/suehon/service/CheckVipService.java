package com.suehon.service;

import java.util.List;
import java.util.Map;

import com.suehon.util.DbHelper;

public class CheckVipService {

	/**
	 * 验证是否是会员
	 * @param vipNo 会员id
	 * @return	存在返回true， 不存在返回false
	 */
	private boolean isVip(String vipNo) {
		
		String sql = "select vipid from vip where vipno = '" + vipNo +"'";
		
		List<Map<String, Object>> list = new DbHelper().query(sql);
		if(list.size() > 0) {
			return true;
		}
		
		return false;
	}
	
	
	/**
	 * 获取vip等级
	 * @param vipNo vip号
	 * @return 会员存在返回相应打折力度标识(在显示层将该标识除以100之后为打折力度)；会员不存在，返回-1
	 */
	public int getvipLevel(String vipNo) {
		
		if(isVip(vipNo)) {//是会员
			String sql = "select viplevel from vip where vipno = '" + vipNo + "'";
			int vipLevel = Integer.parseInt(new DbHelper().query(sql).get(0).get("viplevel").toString()); 
			String sql2 = "select ddcontent from datadictionary where ddid = " + vipLevel;
			return Integer.parseInt(new DbHelper().query(sql2).get(0).get("ddcontent").toString());
		}
		//非会员返回-1
		return -1;
	}
	
	
	
	
	
	
	
}
