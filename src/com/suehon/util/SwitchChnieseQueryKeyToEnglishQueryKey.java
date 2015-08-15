package com.suehon.util;

public class SwitchChnieseQueryKeyToEnglishQueryKey {
	
	/**
	 * 将查询的汉字条件转换为对应的英文条件 eg: switch "国家" to "FILMCOUNTRY"
	 * @param orignalQuerkey 汉字的查询条件
	 * @return 对应的英文条件
	 */
	public static String switchQueryKey(String orignalQuerkey) {

		if ("片名".equals(orignalQuerkey)) {
			return "fILMNAME";
		}

		else if ("主演".equals(orignalQuerkey)) {
			return "FILMLEADINGROLE";	
		}else if("导演".equals(orignalQuerkey)) {
			return "FILMDIRECTOR";
		}else if("类型".equals(orignalQuerkey)) {
			
			return "FILETYPE";
		}else{
			return "FILMCOUNTRY";
		}
	}

}
