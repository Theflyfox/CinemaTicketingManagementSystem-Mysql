<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'attendance_rate_by_showroom.jsp' starting page</title>
    
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
	<script charset="utf-8" src="js/attendance_rate_by_showroom.js"></script>
	
	<link href="artDialog4.1.6/skins/default.css" rel="stylesheet" type="text/css" />
	<link href="css/attendance_rate_by_showroom.css" rel="stylesheet" type="text/css" />
	
	
	<!-- 外部引入文件结束 -->
	

  </head>
  
  <body>
    <br />
    <br />
    <p align = "center"><font face = "黑体" size = "5" color = "black">影厅上座率统计</font></p>
    
    <div id = "chooseMonthBox">
    		请点击选择查询月份 :
    		<select onchange="loadChartBySelectType(this)">
    			<option value = "-1">==请选则==</option>
    			<option value = "01">01月</option>
    			<option value = "02">02月</option>
    			<option value = "03">03月</option>
    			<option value = "04">04月</option>
    			<option value = "05">05月</option>
    			<option value = "06">06月</option>
    			<option value = "07">07月</option>
    			<option value = "08">08月</option>
    			<option value = "09">09月</option>
    			<option value = "10">10月</option>
    			<option value = "11">11月</option>
    			<option value = "12">12月</option>
    		</select>
    </div>
    
    <div id="displayChart" >
    
    
    
    
    </div>
    
  </body>
</html>
