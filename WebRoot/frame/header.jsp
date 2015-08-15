<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'header.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<LINK type="text/css" rel="stylesheet" href="/ctms/css/admin.css" >

  </head>
  
  <body>
    <TABLE cellSpacing=0 cellPadding=0 width="100%"
		background="/ctms/images/header_bg.jpg" border=0>
		<TR height=56>
			<TD width=260>
			<a href = "main.html" target="main"><IMG height=56 src="/ctms/images/header_left.jpg" width="260"></a>
			</TD >
			<TD style="FONT-WEIGHT: bold; COLOR: #fff; PADDING-TOP: 20px" align="center">
					当前用户：<%= session.getAttribute("name") %> &nbsp;&nbsp; 
				<!-- <A style="COLOR: #fff" href="" target="main">修改口令</A> &nbsp;&nbsp;  -->
				<A style="COLOR: #fff" onclick="if (confirm('确定要退出吗？')) return true; else return false;" href="/ctms/loginout/login_out.jsp" target="_top">退出系统</A>
			</TD>
			<TD align="right" width=268>
				<IMG height=56 src="/ctms/images/header_right.jpg" width=268>
			</TD>
		</TR>
	</TABLE>
	<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
		<TR bgColor=#1c5db6 height=4>
			<TD></TD>
		</TR>
	</TABLE>
</BODY>
  </body>
</html>
