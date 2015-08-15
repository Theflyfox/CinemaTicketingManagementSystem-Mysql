package com.suehon.service;

import java.util.Calendar;
import java.util.List;
import java.util.Map;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.JFreeChart;
import org.jfree.data.general.DefaultPieDataset;

import com.suehon.util.DbHelper;


public class GetAttendanceRateByShowroomService {

	public JFreeChart getAttendanceRateByShowroom(String month) {
		
		JFreeChart chart = null;
		
		// 创建pie图的数据集方法  
        DefaultPieDataset data = getPieDataSet(month);  
        chart = ChartFactory.createPieChart3D(month  + " 月各影厅上座率", data, true,  
                false, false);  
		
		return chart;
	}
	
	
	
	/** 
     * 创建用于填充pie图的数据集 
     * @return DefaultPieDataset对象 
     */  
    private DefaultPieDataset getPieDataSet(String month) {
    	
    	Calendar c = Calendar.getInstance();
    	int year = c.get(Calendar.YEAR);
    	
    	String datePeriod = year + "-" +month;
    	
    	String sql = "select s.showroomname, count(s.showroomname) as amount from showroom s ,tickettrade t, onscreen o where s.showroomid = t.showroomid and t.onscreenid = o.onscreenid and o.onscreendate like '" + datePeriod + "%'group by s.showroomname";
    	
    	List<Map<String, Object>> list = new DbHelper().query(sql);
    	
    	// 用来填充pie图的数据集  
        DefaultPieDataset dataset = new DefaultPieDataset();
        
    	for(Map<String, Object> map : list )  {
    		
    		// 饼图分块名字   设置pie数据集中的数据对 
    		dataset.setValue(map.get("showroomname").toString(), Integer.parseInt(map.get("amount").toString()));  
    		
    	}
        
        return dataset;  
    }
}
