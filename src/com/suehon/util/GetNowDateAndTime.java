package com.suehon.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class GetNowDateAndTime {

	//private Calendar c = Calendar.getInstance();
	
	/**
	 * 获取当前的年月日，时分秒，
	 * @return 格式为: XXXX-XX-XX XX:XX:XX
	 */
	public String getNowDateAndTime() {
		
		/*
		int y = c.get(Calendar.YEAR);
		int m = c.get(Calendar.MONTH) + 1;
		int day = c.get(Calendar.DAY_OF_MONTH);
		
		int h = c.get(Calendar.HOUR);
		int mins = c.get(Calendar.MINUTE);
		int secs = c.get(Calendar.SECOND);
		
		 String M = ( (m > 9) ? "" + m : ("0" + m));
		 String Day = ( (day > 9) ? ("" + day) : ("0" + day));
		 String H = ( (h > 9) ? "" + h : ("0" + h));
		 String MINS = ( (mins > 9) ? "" + mins : ("0" + mins));
		 String SECS = ( (secs > 9) ? ("" + secs) : ("0" + secs));
		 
		 return y + "-" + M + "-" + Day + " " + H + ":" + MINS + ":" + SECS; 
		 */
		Date today=new Date();
		SimpleDateFormat f=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return f.format(today);
	}
	
	
	public static void main(String[] args) {
		GetNowDateAndTime g = new GetNowDateAndTime();
		System.out.println(g.getNowDateAndTime());
		
		
	}
	
	
}
