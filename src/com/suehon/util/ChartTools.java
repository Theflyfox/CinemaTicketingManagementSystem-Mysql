package com.suehon.util;

import org.jfree.data.category.DefaultCategoryDataset;
import org.jfree.data.general.DefaultPieDataset;

/** 
 * 生成图片数据集的工具类: 
 * @author    javaFound 
 */  
public class ChartTools {  
    /** 
     * 生成bar图的数据集: 
     * @return:可用于Bar图的数据集 
     */  
    public static DefaultCategoryDataset getCategoryDataset() {  
        DefaultCategoryDataset dataset = new DefaultCategoryDataset();  
        for (int series = 0; series < seriesTimes.length; series++) {  
            for (int i = 0; i < seriesNames.length; i++) {  
                nameValueOfTime[series][i] = new java.util.Random()  
                        .nextInt(300) + 100;  
                dataset.addValue(nameValueOfTime[series][i], seriesNames[i],  
                        seriesTimes[series]);  
            }  
        }  
        return dataset;  
    }  
  
    /** 
     * 创建用于填充pie图的数据集 
     * @return DefaultPieDataset对象 
     */  
    public static DefaultPieDataset getPieDataSet() {  
        // 用来填充pie图的数据集  
        DefaultPieDataset dataset = new DefaultPieDataset();  
        // 饼图分块名字  
        String[] seriesNames = { "芙蓉路", "八一路", "五一路", "大学路", };  
        for (int i = 0; i < seriesNames.length; i++) {  
            int value = new java.util.Random().nextInt(1000) + 500;  
            // 设置pie数据集中的数据对  
            dataset.setValue(seriesNames[i], value);  
        }  
        return dataset;  
    }  
    
    private ChartTools(){};  
    /** X轴时间维数据序型(当然也可以为标签维度)* */  
    private static String[] seriesTimes = { "一月", "二月", "三月", "四月", "五月", "六月","七月" };  
    /** 柱状标签序列(比如做为地点序列) */  
    private static String[] seriesNames = { "芙蓉路立交桥", "五一立交桥", "长岭路口" };  
    /** 每个时间点上每个地区/类型序列的值 */  
    private static int[][] nameValueOfTime = new int[seriesTimes.length][seriesNames.length];  
}  
