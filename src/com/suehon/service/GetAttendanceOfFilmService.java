package com.suehon.service;

import java.util.List;
import java.util.Map;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.JFreeChart;
import org.jfree.data.general.DefaultPieDataset;

import com.suehon.model.PageBean;
import com.suehon.util.DbHelper;
import com.suehon.util.GetNowDateAndTime;

public class GetAttendanceOfFilmService {

	public JFreeChart getAttendanceOfFilm(String startTime, String endTime,
			int pageSize) {

		JFreeChart chart = null;

		// 创建pie图的数据集方法
		DefaultPieDataset data = getPieDataSet(startTime, endTime, pageSize);
		chart = ChartFactory.createRingChart("上座率前五位影片", data, true, false,
				false);
		return chart;
	}

	/**
	 * 创建用于填充pie图的数据集
	 * 
	 * @return DefaultPieDataset对象
	 */
	private DefaultPieDataset getPieDataSet(String startTime, String endTime,
			int pageSize) {

		PageBean pb = getResult(startTime, endTime, pageSize);

		List<Map<String, Object>> list = pb.getList();
		DefaultPieDataset dataset = new DefaultPieDataset();

		if (list.size() == 0 || list == null) {// 返回空数据集
			return dataset;

		} else {

			// 用来填充pie图的数据集
			for (Map<String, Object> map : list) {

				// 饼图分块名字 设置pie数据集中的数据对
				dataset.setValue(map.get("filmname").toString(),
						Integer.parseInt(map.get("fm").toString()));

			}

			return dataset;

		}

	}

	/**
	 * 有条件获取结果集
	 * 
	 * @param startTime
	 *            开始时间
	 * @param endTime
	 *            结束时间
	 * @param pageSize
	 *            显示条数
	 * @return PageBean
	 */
	private PageBean getResult(String startTime, String endTime, int pageSize) {

		DbHelper dbHelper = new DbHelper();
		PageBean pageBean = new PageBean();

		GetNowDateAndTime now = new GetNowDateAndTime();

		String nowDateAndTime = now.getNowDateAndTime();

		String nowDate = nowDateAndTime.split(" ")[0];

		String finalEndTime = nowDate + " " + endTime;

		String sql;
		String sql2;

		// sql =
		// "select f.filmname,count(f.filmname) as fm from showroom s ,tickettrade t, film f, onscreen o where s.showroomid = t.showroomid and f.filmid = o.filmid and t.onscreenid = o.onscreenid and o.onscreenstarttime >= '"
		// + startTime + "' and o.onscreenendtime <= '" + finalEndTime +
		// "' group by f.filmname order by count(f.filmname) desc";
		sql = "select f.filmname,count(f.filmname) as fm from showroom s ,tickettrade t, film f, onscreen o where s.showroomid = t.showroomid and f.filmid = o.filmid and t.onscreenid = o.onscreenid and o.onscreenstarttime >= '"
				+ startTime
				+ "' group by f.filmname order by count(f.filmname) desc";
		sql2 = "select count(*) count from showroom s ,tickettrade t, film f, onscreen o where s.showroomid = t.showroomid and f.filmid = o.filmid and t.onscreenid = o.onscreenid and o.onscreenstarttime >= '"
				+ startTime
				+ "' and o.onscreenendtime <= '"
				+ finalEndTime
				+ "'";

		System.out.println(sql);
		System.out.println(sql2);
		pageBean.setCurrentPage(1);
		pageBean.setPageSize(5);
		pageBean.setSql(sql);
		pageBean.setTotalPage(sql2);

		pageBean.setTotalPage(sql2);
		pageBean.setList(dbHelper.query(pageBean.getSql()));
		return pageBean;
	}
}
