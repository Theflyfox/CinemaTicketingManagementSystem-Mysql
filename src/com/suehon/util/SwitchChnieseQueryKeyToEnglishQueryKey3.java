package com.suehon.util;

public class SwitchChnieseQueryKeyToEnglishQueryKey3 {

	/**
	 * 将查询的汉字条件转换为对应的英文条件 eg: switch "国家" to "FILMCOUNTRY"
	 * 
	 * @param orignalQuerkey
	 *            汉字的查询条件
	 * @return 对应的英文条件
	 */
	public static String switchQueryKey(String orignalQuerkey) {

		if ("姓名".equals(orignalQuerkey)) {
			return "name";
		}

		else if ("用户名".equals(orignalQuerkey)) {
			return "employeeid";
		} else if ("性别".equals(orignalQuerkey)) {
			return "gender";
		} else if ("手机号".equals(orignalQuerkey)) {

			return "phoneno";
		} else {
			return "position";
		}
	}

}
