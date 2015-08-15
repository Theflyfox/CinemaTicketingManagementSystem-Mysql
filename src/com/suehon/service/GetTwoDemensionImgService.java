package com.suehon.service;

import java.awt.Color;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.google.gson.Gson;
import com.google.zxing.common.BitMatrix;
import com.suehon.util.MatrixToImageWriterEx;
import com.suehon.util.MatrixToLogoImageConfig;

public class GetTwoDemensionImgService {

	/**
	 * 生成二维码
	 * @param showroomName 影厅名
	 * @param sitePosition	座位位置
	 * @param filmType	影片类型
	 * @param filmName	影片名
	 * @param ChangCi	场次(开场日期 + 开场时间)
	 * @param singalTicketPrice	单张票价
	 * @param fromPath	海报
	 * @param toPath 生成二维码的存放路径
	 * @return 生成二维码的保存路径
	 */
	public String createTwoDemension(String showroomName, String sitePosition, String filmType, String filmName, String ChangCi, String singalTicketPrice, String fromPath, String toPath) {
		
		String imgName = "tdimage.jpg";

		try {
			int width = 100;
			int height = 100;
			String cinemaName = "开心影院";
			String content = cinemaName + "\n" + "影厅:" + showroomName + ", " + "座位 :" + sitePosition + "\n" + "类别:" + filmType
					+ "\n" + "片名:" + filmName + "\n" + "日期:" + ChangCi + ", 票价:" + singalTicketPrice;
			
			
			BitMatrix matrix = MatrixToImageWriterEx.createQRCode(content, width, height);
			
			MatrixToLogoImageConfig logoConfig = new MatrixToLogoImageConfig(Color.BLUE, 4);
			
			MatrixToImageWriterEx.writeToFile(matrix, "jpg", toPath + "/" + imgName, fromPath, logoConfig);
			
			Thread.sleep(100);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("SITE", sitePosition);
		map.put("URL", imgName);
		
		list.add(map);
		Gson gson = new Gson();
		
		return gson.toJson(list);
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
