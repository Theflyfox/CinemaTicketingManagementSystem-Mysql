<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <TITLE>影院管理中心 V1.0</TITLE>
	<META http-equiv=Content-Type content="text/html; charset=utf-8">
	<META http-equiv=Pragma content=no-cache>
	<META http-equiv=Cache-Control content=no-cache>
	<META http-equiv=Expires content=-1000>
	<LINK href="/ctms/css/admin.css" type="text/css" rel="stylesheet">

  </head>
  
  <FRAMESET border=0 frameSpacing=0 rows="60, *" border=0>
		<FRAME name="header" src="/ctms/frame/header.jsp" frameborder=0 noresize = "noresize" scrolling=no>
		<FRAMESET cols="170, *">
			<FRAME name="menu" src="/ctms/frame/menu.jsp" frameborder=0 noresize = "noresize">
			<FRAME name="main" src="/ctms/frame/main.jsp" frameborder=0 noresize= "noresize" scrolling="auto">
		</FRAMESET>
	</FRAMESET>
	<noframes></noframes>
</html>
