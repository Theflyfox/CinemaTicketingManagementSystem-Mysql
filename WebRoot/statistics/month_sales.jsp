<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'month_sales.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!-- 外部引入文件开始 -->
	
	<script type = "text/javascript" src = "js/jquery-2.0.3.js"></script>
	<script type = "text/javascript" src="js/jquery.1.4.2-min.js"></script>
	<script type="text/javascript" src="artDialog4.1.6/artDialog.js"></script>
	 <!-- 对iframe新增的工具-->
	<script type="text/javascript" src="artDialog4.1.6/plugins/iframeTools.js"></script>
	<script charset="utf-8" src="js/month_sales.js"></script>
	
	<link href="artDialog4.1.6/skins/default.css" rel="stylesheet" type="text/css" />
	<link href="css/month_sales.css" rel="stylesheet" type="text/css" />
	
	
	<!-- 外部引入文件结束 -->

  </head>
  
  <body>
    <br />
    <br />
    <p align = "center"><font face = "黑体" size = "5" color = "black">销售额查询</font></p>
    <div id = "chooseYearBox">
    	年份选择: <select id = "year">  
			          <%  
			                 StringBuffer bufYear = new StringBuffer();  
			                 //下拉列表的年数  
			                 for(int i=0;i<11;i++){  
			                 //最小年  
			                 int iYear = 2005+i;  
			                 bufYear.append("<option value = '"+iYear+"'");  
			                 Date date = new Date();  
			                 int sYear = date.getYear();  
			                 //系统时间从1900年开始  
			                 int sYearc = sYear+1900;  
			                 if(iYear == sYearc){  
			                     bufYear.append(" selected");  
			                 }  
			                 bufYear.append(" >"+iYear+"</option>\n");  
			                 }  
			                 out.println(bufYear.toString());  
			           %>  
  			</select>
  			<input type = "button" value = "查询" onclick = "loadChartBySelectType()" />
    </div>
    
    <!-- 装图片 -->
    <div id="displayChart" >
    </div>
    
  </body>
</html>
