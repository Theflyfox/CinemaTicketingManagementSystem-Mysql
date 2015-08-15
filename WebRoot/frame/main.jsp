<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'main.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="/ctms/css/admin.css" type="text/css" rel="stylesheet">
		<script type="text/javascript">
		 	
		 	
		 	//实时获取并显示系统时间 
			function realSysTime(){ 
				var td = document.getElementById("showSystemTime");
				var now=new Date(); //创建Date对象 
				var year=now.getFullYear(); //获取年份 
				var month=now.getMonth(); //获取月份 
				var date=now.getDate(); //获取日期 
				var day=now.getDay(); //获取星期 
				var hour=now.getHours(); //获取小时 
				var minu=now.getMinutes(); //获取分钟 
				var sec=now.getSeconds(); //获取秒钟 
				month=month+1; 
				var arr_week=new Array("星期日","星期一","星期二","星期三","星期四","星期五","星期六"); 
				var week=arr_week[day]; //获取中文的星期 
				var time= "<font size = '5'>当前时间：" + year+"年"+month+"月"+date+"日 "+week+" "+hour+":"+minu+":"+sec + "</font>"; //组合系统时间 
				td.innerHTML=time; //显示系统时间
				setTimeout("realSysTime()", 1000);
			}
 
		</script>

  </head>
  
  <body onload = "realSysTime()">
		<table cellSpacing=0 cellPadding=0 width="100%" align=center border=0>
			<tr height=28>
				<td background=/ctms/images/title_bg1.jpg></td>
			</tr>
			<tr>
				<td bgColor=#b1ceef height=1></td>
			</tr>
			<tr height=20>
				<td background=/ctms/images/shadow_bg.jpg></td>
			</tr>
		</table>
		<table cellSpacing=0 cellPadding=0 width="90%" align=center border=0>
			<tr height=100>
				<td align="center" width=100><img height=100
					src="/ctms/images/admin_p.gif" width=90>
				</td>
				<td width=60>&nbsp;</td>
				<td>
					<table height=100 cellSpacing=0 cellPadding=0 width="100%" border=0>
	
						<tr>
							<td id="showSystemTime"></td>
						</tr>
						<tr>
							<td style="FONT-WEIGHT: bold; FONT-SIZE: 16px"><%=session.getAttribute("name") %></td>
						</tr>
						<tr>
							<td><font size = "4">欢迎进入开心影院管理中心！</font></td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td colSpan=3 height=10></td>
			</tr>
		</table>
		<table cellSpacing=0 cellPadding=0 width="95%" align=center border=0>
			<tr height=20>
				<td></td>
			</tr>
			<tr height=22>
				<td style="PADDING-LEFT: 20px; FONT-WEIGHT: bold; COLOR: #ffffff"
					align="center" background="/ctms/images/title_bg2.jpg">您的相关信息
				</td>
					
			</tr>
			<tr bgColor="#ecf4fc" height=12>
				<td></td>
			</tr>
			<tr height=20>
				<td></td>
			</tr>
		</table>
		<table cellSpacing=0 cellPadding=2 width="95%" align="center" border=0>
			<tr>
				<td align="right" width=100>登陆帐号：</td>
				<td style="COLOR: #880000"><%=session.getAttribute("loginName") %></td>
			</tr>
			<tr>
				<td align="right">真实姓名：</td>
				<td style="COLOR: #880000"><%=session.getAttribute("name") %></td>
			</tr>
			<!-- 
			<tr>
				<td align="right">注册时间：</td>
				<td style="COLOR: #880000">2007-7-25 15:02:04</td>
			</tr>
			<tr>
				<td align="right">登陆次数：</td>
				<td style="COLOR: #880000">58</td>
			</tr>
			<tr>
				<td align="right">上线时间：</td>
				<td style="COLOR: #880000">2008-12-27 17:02:54</td>
			</tr>
			 -->
			<tr>
				<td align="right">IP地址：</td>
				<td style="COLOR: #880000"><%=request.getRemoteAddr() %></td>
			</tr>
			<!-- 
			<tr>
				<td align="right">身份过期：</td>
				<td style="COLOR: #880000">30 分钟</td>
			</tr>
			 -->
		</table>
	</body>
</html>
