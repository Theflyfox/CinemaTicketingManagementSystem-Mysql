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

import com.suehon.model.FilmBean;
import com.suehon.service.AddFilmService;

@SuppressWarnings("serial")
public class AddFilmServlet extends HttpServlet {

	
	
	public void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		
		
		StringBuffer postStringBuffer = new StringBuffer();
		req.setCharacterEncoding("utf-8");
		DiskFileItemFactory factory = new DiskFileItemFactory();
		// 获取WebRoot下upload文件夹在磁盘上的绝对路径
		// String path = req.getRealPath("/upload");
		String path = req.getSession().getServletContext()
				.getRealPath("/posts");
		File file = new File(path);
		if(!file.exists()) {
			file.mkdirs();
		}
		
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
		
		/*
		int postCount = Integer.parseInt(req.getAttribute("postCount").toString());
		
		for(int i = 1; i <= postCount; i++) {
			
			postStr = req.getAttribute("filmPost" + i).toString() + "/";
		}*/
		
		String  postStr = "";
		postStr = postStringBuffer.toString().substring(0, postStringBuffer.length() - 1);//以"/"连接的所有海报文件名
		
		System.out.println("海报字符串---->" + postStr);
		
		FilmBean fb = new FilmBean();
		fb.setFilmName(req.getAttribute("filmName").toString().trim());
		fb.setFilmAlias(req.getAttribute("filmAlias").toString().trim());
		fb.setFilmCountry(req.getAttribute("filmCountry").toString().trim());
		fb.setFilmDirector(req.getAttribute("filmDirector").toString().trim());
		fb.setFilmLeadingRole(req.getAttribute("filmLeadingRole").toString().trim());
		fb.setFilmLanguage(req.getAttribute("filmLanguage").toString().trim());
		fb.setFilmLastTime(req.getAttribute("filmLastTime").toString().trim());
		fb.setFilmType(req.getAttribute("filmType").toString().trim());
		fb.setFilmOnline(req.getAttribute("filmOnline").toString().trim());
		fb.setFilmPost(postStr);
		fb.setFilmContent(req.getAttribute("filmContent").toString().trim());
		fb.setFilmBackStory(req.getAttribute("filmBackStory").toString().trim());
		fb.setFilmAward(req.getAttribute("filmAward").toString().trim());
		AddFilmService afs = new AddFilmService();
		afs.addFilm(fb);
		System.out.println("--------success---------");
		req.setAttribute("flag", "success");
		req.getRequestDispatcher("/film/add_film_result.jsp").forward(req, resp);
	}

}
