package com.suehon.service;


import com.suehon.util.DbHelper;

public class DeleteFilmPicService {

	
	/**
	 * 删除图片
	 * @param filmId 影片id
	 * @param picNo 将要删除的图片的位置, 当位置小于 0 时，将不删除任何图片
	 * @return	picNo大于  0 时 ，返回删除之后的图片名字符串， 小于 0返回原字符串
	 */
	public String deletePic(int filmId, int picNo) {
		
		if(picNo >= 0) {
			
			String sql = "select filmpost from film where filmid = " + filmId;
			
			String postStr = new DbHelper().query(sql).get(0).get("filmpost").toString();
			String []postArr = postStr.split("/");
			
			String [] afterDeleteArr = deletespecifyPositionElem(postArr, picNo);
			
			StringBuffer sb = new StringBuffer();
			
			for(String item : afterDeleteArr) {
				
				sb.append(item + "/");
			}
			
			String tempStr = sb.toString();
			String finalPostStr = tempStr.substring(0, tempStr.length() - 1);
			String sql2 = "update film set filmpost = ? where filmid = " + filmId;
			
			new DbHelper().update(sql2, new Object[] {finalPostStr});
			
			return finalPostStr;
		}else {
			String sql = "select filmpost from film where filmid = " + filmId;
			
			return  new DbHelper().query(sql).get(0).get("filmpost").toString();
			
		}
		
		
	}
	
	/**
	 * 删除数组中指定位置的元素
	 * @param a 原数组
	 * @param position	要删除的位置
	 * @return 删除指定元素之后的数组
	 */
	private String[] deletespecifyPositionElem(String [] a, int position) {
		
		String [] b = new String[a.length - 1];
		for(int i = 0; i < position; i++) {
			b[i] = a[i];
		}
		
		for(int j = position + 1; j < a.length; j++) {
			b[j - 1] = a[j];
		}
		return b;
	}
	
	
		
}
