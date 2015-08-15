package com.suehon.service;

import java.util.List;
import java.util.Map;

import com.suehon.model.PageBean;
import com.suehon.util.DbHelper;

public class MangeFilmOnscreenInfoService {

	private DbHelper dbHelper = new DbHelper();
	private PageBean pageBean = new PageBean();

	/**
	 * 获取结果集，无查询条件
	 * @param tableName
	 * @param currentPage
	 * @param pageSize
	 * @return
	 */
	public PageBean getResult(String tableName, int currentPage, int pageSize) {

		String sql = "select o.onscreenid, o.onscreendate, f.filmname, s.showroomname, o.onscreenstarttime, o.onscreenendtime, o.onscreenprice from onscreen o, film f, showroom s where o.showroomid = s.showroomid and o.filmid = f.filmid  order by onscreendate";
		String sql2 = "select count(*) count from " + tableName + " order by onscreendate";
		pageBean.setCurrentPage(currentPage);
		pageBean.setPageSize(pageSize);
		pageBean.setSql(sql);
		pageBean.setTotalPage(sql2);

		pageBean.setList(dbHelper.query(pageBean.getSql()));
		return pageBean;
	}

	/**
	 * 有条件获取结果集
	 * @param tableName
	 * @param queryKey
	 * @param queryValue
	 * @param currentPage
	 * @param pageSize
	 * @return
	 */
	public PageBean getResult(String tableName, String queryKey, String queryValue, int currentPage, int pageSize) {

		DbHelper dbHelper = new DbHelper();
		PageBean pageBean = new PageBean();
		String sql;
		String sql2;
		
		if ((null != queryKey && "" != queryKey && !"null".equals(queryKey)) && (null != queryValue && "" != queryValue) && !"null".equals(queryValue)) {// 有条件查询
			
			//String tempQueryKey = queryKey;
			
			String queryStr = throughtBriage(queryKey, queryValue);
			String [] queryArr = queryStr.split("-");
			System.out.println("============" + queryArr[0]);
			String [] specialQueryKey = queryArr[0].split("\\.");
			System.out.println("++++++++++" + specialQueryKey[1]);
			
			sql = "select onscreen.onscreenid, onscreen.onscreendate, film.filmname, showroom.showroomname, onscreen.onscreenstarttime, onscreen.onscreenendtime, onscreen.onscreenprice from onscreen, film, showroom where onscreen.showroomid = showroom.showroomid and onscreen.filmid = film.filmid and " + queryArr[0] + " LIKE " + queryArr[1] +" order by onscreen.onscreendate desc";
			sql2 = "SELECT count(*) count FROM " + tableName + " o WHERE o."
					+ specialQueryKey[1] + " LIKE " + queryArr[1];
System.out.println("有条件查询");
		} else {//无条件查询
			sql = "select o.onscreenid, o.onscreendate, f.filmname, s.showroomname, o.onscreenstarttime, o.onscreenendtime, o.onscreenprice from onscreen o, film f, showroom s where o.showroomid = s.showroomid and o.filmid = f.filmid order by o.onscreendate desc";
			sql2 = "select count(*) count from " + tableName ;
			System.out.println("无条件查询");
		}

System.out.println(sql);
System.out.println(sql2);
		pageBean.setCurrentPage(currentPage);
		pageBean.setPageSize(pageSize);
		pageBean.setSql(sql);
		pageBean.setTotalPage(sql2);
		pageBean.setList(dbHelper.query(pageBean.getSql()));
		return pageBean;
	}
	
	
	private String throughtBriage(String queryKey, String queryValue) {
		
		
		if("filmname".equalsIgnoreCase(queryKey)) {
			
			String sql = "select filmid from film where filmname = '" + queryValue + "'";
			List<Map<String, Object>> list = dbHelper.query(sql);
			
			if(list.size() > 0) {
				return "film.filmid-" + list.get(0).get("filmid");
			}else {
				return "film.filmid-0";
			}
			
			
			
		}else if("showroomname".equalsIgnoreCase(queryKey)){
			
			String sql = "select showroomid from showroom where showroomname = '" + queryValue + "'";
			List<Map<String, Object>> list = dbHelper.query(sql);
			
			if(list.size() > 0) {
				return "showroom.showroomid-" + list.get(0).get("showroomid");
			}else {
				return "showroom.showroomid-0";
			}
		}else {
			return queryKey = "onscreen.onscreendate-'%" + queryValue + "%'";
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
