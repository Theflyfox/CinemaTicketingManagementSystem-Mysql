package com.suehon.util;
/**
 * 获取单个文件的扩展名
 * @author John
 *
 */
public class GetFileExtension {

	/**
	 * 获取文件扩展名
	 * @param fileName	文件名
	 * @return	成功返回扩展名，失败返回字符串常量"ERROR"
	 */
	public static String getFileExtension(String fileName) {
		
		int postion = fileName.lastIndexOf(".");
		if(postion < 0) {
			
			return "ERROR";
		}else {
			
			return fileName.substring(postion, fileName.length());
		}
	}
	/*
	public static void main(String[] args) {
		
		String fileName = "hello..txt";
		System.out.println(GetFileExtension.getFileExtension(fileName));
		
		
		
	}*/
}
