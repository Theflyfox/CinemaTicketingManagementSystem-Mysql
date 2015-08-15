package com.suehon.service;

import java.util.List;
import java.util.Map;

import com.suehon.model.FilmOnscreenBean;
import com.suehon.util.DbHelper;

public class AddFilmOnscreenService {

	private DbHelper dbHelper = new DbHelper();
	
	/**
	 * 添加一个上映计划
	 * @param fob 封装添加上映计划所需要的所有信息的 FilmOnscreenBean 对象
	 * @return 状态码 : -1表示将要添加的计划已存在; -2表示添加的上映计划不存在但是添加失败; -3 表示将要添加计划的影厅在此时间段内正在上映影片;  1 表示添加上映计划成功
	 */
	public int addFilmOnscreen(FilmOnscreenBean fob) {
		
		String sql1 = "select onscreenid from onscreen where showroomid = " + fob.getShowroomId() + " and " +
						"onscreendate = '" + fob.getFilmOnscreenDate() + "' and " +
						"filmid = " + fob.getChooseFilmId() + " and onscreenstarttime = '" + fob.getStartTime() + "' and onscreenendtime = '" + 
							fob.getEndTime() + "'";
		
		List<Map<String, Object>> list = dbHelper.query(sql1);
		if(list.size() > 0) {//所添加的计划已存在
			
			return -1;
		}else {//不存在
			
			
			String sql0 = "select o.onscreendate, o.onscreenstarttime, o.onscreenendtime from onscreen o where o.showroomid = " + fob.getShowroomId();
			List<Map<String, Object>> list0 = dbHelper.query(sql0);
			String nStartDate = fob.getFilmOnscreenDate() + " " + fob.getStartTime();//待添加的上映计划的日期 eg:2013-12-12 13:13:13
			String nEndDate = fob.getEndTime();//待添加的上映计划的结束时间(24小时制) eg: 2013-12-12 14:13:13
			String aStartDate;//已存在的开始日期
			String aEndDate;//已存在的结束日期
			
			
			for(Map<String, Object> item : list0) {//检测在此时间段内影厅是否正在上映影片
				
				aStartDate = item.get("onscreendate").toString() + " " + item.get("onscreenstarttime").toString();
				aEndDate = item.get("onscreenendtime").toString();
				
//System.out.println("aStartDate---->" + aStartDate);
//System.out.println("aEndDate---->" + aEndDate);
//System.out.println("nStartDate====" + nStartDate);
//System.out.println("nEndDate====" + nEndDate);
				
				if( !(nEndDate.compareTo(aStartDate) < 0 || nStartDate.compareTo(aEndDate) > 0) )  {
					
					return -3;
				}
			}
			
			String sql = "insert into onscreen (showroomid, onscreendate, filmid, onscreenstarttime, onscreenendtime, onscreenprice) values (?, ?, ?, ?, ?, ?)";
			int result = dbHelper.update(sql, new Object [] {fob.getShowroomId(), fob.getFilmOnscreenDate(), fob.getChooseFilmId(), fob.getStartTime(), fob.getEndTime(), fob.getFilmPrice()});
			if(result > 0) {//添加成功
				return 1;
			}else {//添加失败
				return -2;
			}
	
		}
	}
	
}
