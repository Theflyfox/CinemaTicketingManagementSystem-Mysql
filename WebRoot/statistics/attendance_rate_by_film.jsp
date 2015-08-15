<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'attendance_rate_by_film.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<!-- 外部引入文件开始 -->
	
	<script type = "text/javascript" src = "js/validate.js"></script>
	<script type = "text/javascript" src = "js/jquery-2.0.3.js"></script>
	<script type = "text/javascript" src="js/jquery.1.4.2-min.js"></script>
	<script type="text/javascript" src="artDialog4.1.6/artDialog.js"></script>
	 <!-- 对iframe新增的工具-->
	<script type="text/javascript" src="artDialog4.1.6/plugins/iframeTools.js"></script>
	<script type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>
	<script charset="utf-8" src="js/jquery.settime.js"></script>
	<script charset="utf-8" src="js/attendance_rate_by_film.js"></script>
	
	<link href="artDialog4.1.6/skins/default.css" rel="stylesheet" type="text/css" />
	<link href="css/attendance_rate_by_film.css" rel="stylesheet" type="text/css" />
	
	
	<!-- 外部引入文件结束 -->

  </head>
  
  <body>
    <br />
    <br />
    <p align = "center"><font face = "黑体" size = "5" color = "black">影片上座率</font></p>
     <div id = "setTimeBox">
    	开始时间:<input class="pwdTrigger" type="text"  id = "startTime" name = "startTime" value = "<% if(request.getAttribute("startTime") != null) out.print(request.getAttribute("startTime")); %>" onclick="pickStartTime();" onblur="" onfocus=""/>
    	&nbsp;
    	结束时间:<input class="pwdTrigger" type="text"  id = "endTime" name = "endTime" value = "<% if(request.getAttribute("endTime") != null) out.print(request.getAttribute("endTime")); %>" onclick="pickEndTime();" onblur="" onfocus=""/>
    	&nbsp;
    	<input type = "button" value = "确定" onclick="loadChartBySelectType()"/>
    </div>
    
    
    <!-- 装图片 -->
    <div id="displayChart" >
    </div>
  </body>
</html>
