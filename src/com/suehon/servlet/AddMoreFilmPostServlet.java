package com.suehon.servlet;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.suehon.service.AddMoreFilmPostService;


@SuppressWarnings("serial")
public class AddMoreFilmPostServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		doPost(req, resp);

	}

	public void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		
		StringBuffer postStringBuffer = new StringBuffer();
		DiskFileItemFactory factory = new DiskFileItemFactory();
		// 获取WebRoot下upload文件夹在磁盘上的绝对路径
		// String path = req.getRealPath("/upload");
		String path = req.getSession().getServletContext()
				.getRealPath("/posts");

System.out.println("上传路径是 :" + path);
		// 设置当上传文件大小超过默认直接写到硬盘大小(该大小由DiskFileItemFactory对象的setSizeThrehold()指定大小)时的缓存的路径
		factory.setRepository(new File(path));
		factory.setSizeThreshold(1024 * 1024);

		ServletFileUpload upload = new ServletFileUpload(factory);
		upload.setHeaderEncoding("utf-8");
		
		try {

			List<FileItem> list = upload.parseRequest(req);

			for (FileItem fileItem : list) {
				// 获取表单域的名字<input type = "XXX" name = "XXX">中的第二个XXX值
				String name = fileItem.getFieldName();
				
				if (fileItem.isFormField()) {// 是一个表单文本域，不是上传的文件

					String value = fileItem.getString("utf-8");
System.out.println(name + "---->" + value);
					req.setAttribute(name, value);
				} else {// 上传的文件
					//获取上传文件的名字，不包括路径;只是文件名
					String value = fileItem.getName();
					int start = value.lastIndexOf("\\");
					String fileName = System.currentTimeMillis() + value.substring(start + 1);//在用户上传的实际文件名前加上当前系统时间毫秒数
					//将用户上传的文件名完全废弃掉，按照当前时间建立新的文件名，否则当用户上传的文件名中包含汉字时，在"影片详情"页面将找不到图片
					//String finalFileName = System.currentTimeMillis() + GetFileExtension.getFileExtension(fileName);
					
					// 将文件写入磁盘
					fileItem.write(new File(path, fileName));
System.out.println(fileName + "文件上传成功");
					postStringBuffer.append(fileName + "/");
					req.setAttribute(name, fileName);
					//long size = fileItem.getSize();//上传文件大小
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String  newPostFileNameStr = "";
		newPostFileNameStr = postStringBuffer.toString().substring(0, postStringBuffer.length() - 1);//以"/"连接的所有海报文件名,去掉最右面的"/"
		
System.out.println("海报字符串---->" + newPostFileNameStr);
		

		AddMoreFilmPostService amfps = new AddMoreFilmPostService();
		
		int filmId = Integer.parseInt(req.getAttribute("filmId").toString());
		//调用服务
		amfps.addMoreFilmPost(filmId, newPostFileNameStr);
		
System.out.println("--------success---------");
		req.getRequestDispatcher("DeleteFilmPicServlet?filmId=" + filmId + "&picNo="  + (-1)).forward(req, resp);
	
		
		
	}

}
