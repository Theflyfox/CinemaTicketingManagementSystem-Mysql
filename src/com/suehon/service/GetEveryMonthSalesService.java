package com.suehon.service;

import java.util.List;
import java.util.Map;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.data.category.DefaultCategoryDataset;

import com.suehon.util.DbHelper;

public class GetEveryMonthSalesService {

	private static DbHelper dbHelper = new DbHelper();

	public JFreeChart getEveryMonthSales(String year) {

		JFreeChart chart = null;

		// 创建bar图的数据集方法
		DefaultCategoryDataset data = getCategoryDataset(year);
		// PlotOrientation.HORIZONTAL这个参数说明是水平还是垂直方向VERTICAL
		chart = ChartFactory.createBarChart3D(year + "年每月销售额及占全年总销售额统计图",
				"月份", "销售额", data, PlotOrientation.VERTICAL, true, true, false);

		return chart;
	}

	/**
	 * 生成bar图的数据集:
	 * 
	 * @return:可用于Bar图的数据集
	 */
	private static DefaultCategoryDataset getCategoryDataset(String year) {

		/** X轴时间维数据序型* */
		String[] months = { "一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月",
				"九月", "十月", "十一月", "十二月" };

		/** 柱状标签序列(Y) */
		String[] title = { "每月销售额", "全年总销售额" };

		/** 每个时间点上每个地区/类型序列的值 */
		int[][] nameValueOfTime = new int[months.length][title.length];

		DefaultCategoryDataset dataset = new DefaultCategoryDataset();

		// 每月销售总额
		List<Map<String, Object>> list = getEveryMonthTotalSale(year);

		String date = "";
		int mon = 0;

		for (Map<String, Object> map : list) {// 填充每一月

			date = map.get("mon").toString();
			mon = Integer.parseInt(date.substring(date.indexOf("-") + 1, date.lastIndexOf("-")));
			nameValueOfTime[mon - 1][0] = Integer.parseInt(map.get("qian").toString());
			System.out.println(date);
//			System.out.println(date.substring(date.indexOf("/") + 1, date.lastIndexOf("/")));
		}
		
		
		int yearTotalSale = Integer.parseInt(getYearTotalSale(year).get(0).get("qian").toString());
		
		for (int m = 0; m < months.length; m++) {//填充年


					nameValueOfTime[m][1] = yearTotalSale;
				//dataset.addValue(nameValueOfTime[m][1], title[t], months[m]);
		}
		
		
		for(int m = 0 ; m < months.length; m++) {
			for(int t = 0; t < title.length; t++) {
				dataset.addValue(nameValueOfTime[m][t], title[t], months[m]);
			}
			
		}
		
		return dataset;
	}

	/**
	 * 获取每月销售额总和
	 * @param year 年份
	 * @return list
	 */
	public static List<Map<String, Object>> getEveryMonthTotalSale(String year) {

		List<Map<String, Object>> list = null;
		/*String sql = "select trunc(to_date(o.onscreendate, 'yyyy-mm-dd'), 'mm') as mon, sum(t.realpay)  as qian "
				+ " from onscreen o ,tickettrade t "
				+ " where t.onscreenid = o.onscreenid and onscreendate >= '"
				+ year
				+ "-01-01' and onscreendate <= '"
				+ year
				+ "-12-31' "
				+ " group by   trunc(to_date(o.onscreendate, 'yyyy-mm-dd'), 'mm') "
				+ " order by trunc(to_date(o.onscreendate, 'yyyy-mm-dd'), 'mm')";
		
		*/
		
		String sql = "select cast(to_date(o.onscreendate, 'yyyy-mm-dd'), 'mm') as mon, sum(t.realpay)  as qian "
				+ " from onscreen o ,tickettrade t "
				+ " where t.onscreenid = o.onscreenid and onscreendate >= '"
				+ year
				+ "-01-01' and onscreendate <= '"
				+ year
				+ "-12-31' "
				+ " group by   trunc(to_date(o.onscreendate, 'yyyy-mm-dd'), 'mm') "
				+ " order by trunc(to_date(o.onscreendate, 'yyyy-mm-dd'), 'mm')";
		
		System.out.println(sql);
		list = dbHelper.query(sql);
		return list;

	}
	
	/**
	 * 获取当年销售总额
	 * @param year
	 * @return
	 */
	public static List<Map<String, Object>> getYearTotalSale(String year) {

		List<Map<String, Object>> list = null;
		String sql = "select trunc(to_date(o.onscreendate, 'yyyy-mm-dd'), 'yyyy') as mon, sum(t.realpay)  as qian "
				+ " from onscreen o ,tickettrade t "
				+ " where t.onscreenid = o.onscreenid and onscreendate >= '"
				+ year
				+ "-01-01' and onscreendate <= '"
				+ year
				+ "-12-31' "
				+ " group by   trunc(to_date(o.onscreendate, 'yyyy-mm-dd'), 'yyyy') "
				+ " order by trunc(to_date(o.onscreendate, 'yyyy-mm-dd'), 'yyyy')";
		System.out.println(sql);
		list = dbHelper.query(sql);
		return list;

	}
}
