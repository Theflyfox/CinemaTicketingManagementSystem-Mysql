<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'add_employee_result.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
     <%
  		response.setHeader("refresh","2;URL=employee/add_employee.jsp") ;
  		int result = Integer.parseInt(request.getAttribute("result").toString());
		if(result > 0) {
		  		
  	%>
  	
  	<font color = "blue">添加成功!</font>，3秒后跳转至<a href = "" target = "main">添加页面</a>...
  	<%}else {%>
  		
  		<font color = "red">添加失败,请重试!</font>，3秒后跳转至<a href = "" target = "main">添加页面</a>...
  	
  	<%} %>
  </body>
</html>
