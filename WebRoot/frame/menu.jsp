<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'menu.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!-- 外部引入文件开始 -->
	
		<script type = "text/javascript" src = "/ctms/js/validate.js"></script>
		<script type = "text/javascript" src = "/ctms/js/jquery-2.0.3.js"></script>
		<script type = "text/javascript" src="/ctms/js/jquery.1.4.2-min.js"></script>
		<script type="text/javascript" src="/ctms/artDialog4.1.6/artDialog.js"></script>
		 <!-- 对iframe新增的工具-->
		<script type="text/javascript" src="/ctms/artDialog4.1.6/plugins/iframeTools.js"></script>
		<link href="/ctms/artDialog4.1.6/skins/default.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="/ctms/js/menu.js"></script>
		
		<link href="/ctms/css/admin.css" type="text/css" rel="stylesheet">
		
		<!-- 外部引入文件结束 -->
		

		<script type="text/javascript">
			function expand(el)
			{
				childObj = document.getElementById("child" + el);
		
				if (childObj.style.display == 'none')
				{
					childObj.style.display = 'block';
				}
				else
				{
					childObj.style.display = 'none';
				}
				return;
			}
		</script>
	</head>
<body>

<table height="100%" cellSpacing=0 cellPadding=0 width=170 
	background="/ctms/images/menu_bg.jpg" border=0>
  <tr>
    <td vAlign="top" align="center">

		<table cellSpacing=0 cellPadding=0 width="100%" border=0>
			<tr>
			  <td height=10></td>
			</tr>
		</table>
		<% if( "管理员".equals(session.getAttribute("position").toString() ) ){%>
		
		<table cellSpacing=0 cellPadding=0 width=150 border=0>
			<tr height=22>
				<td style="PADDING-LEFT: 30px" background="/ctms/images/menu_bt.jpg">
					<a class="menuParent" onclick="expand(1)" href="javascript:void(0);">
						影厅管理
					</a>
				</td>
			</tr>
			<tr height=4>
				<td></td>
			</tr>
		</table>
		
		<table id=child1 style="DISPLAY: none" cellSpacing=0 cellPadding=0 
			width=150 border=0>
        <tr height=20>
			<td align="center" width=30>
				<img height=9 src="/ctms/images/menu_icon.gif" width=9 />
			</td>
			<td>
				<a class="menuChild" href="/ctms/showroom/add_showroom.jsp" target="main">新增影厅</a>
		  </td>
		</tr>
        <tr height=20>
          <td align="center" width=30><img height=9 
            src="/ctms/images/menu_icon.gif" width=9></td>
          <td><a class="menuChild" href="/ctms/ModifyShowroomPageServlet" target="main">信息维护</a></td></tr>
      <!--   <tr height=20>
          <td align="center" width=30><img height=9 
            src="/ctms/images/menu_icon.gif" width=9></td>
          <td><a class=menuChild 
            href="#" 
            target=main>信息查询</a></td></tr> -->
        
        <tr height=4>
          <td colSpan=2></td></tr></table>
      <table cellSpacing=0 cellPadding=0 width=150 border=0>
        <tr height=22>
          <td style="PADDING-LEFT: 30px" background=/ctms/images/menu_bt.jpg><a 
            class=menuParent onclick=expand(2) 
            href="javascript:void(0);">影片管理</a></td></tr>
        <tr height=4>
          <td></td></tr></table>
      <table id=child2 style="DISPLAY: none" cellSpacing=0 cellPadding=0 
      width=150 border=0>
        <tr height=20>
          <td align="center" width=30>
          	<img height = "9" src="/ctms/images/menu_icon.gif" width=9></td>
          <td>
          	<a class = "menuChild"  href="/ctms/film/add_film.jsp" target = "main">信息添加</a></td></tr>
        <tr height=20>
          <td align="center" width=30><img height=9 
            src="/ctms/images/menu_icon.gif" width=9></td>
          <td>
          	<a class="menuChild" href="/ctms/ManageFilmInfoServlet" target="main">信息修改</a>
          </td>
        </tr>
       <!--  <tr height=20>
          <td align="center" width=30><img height=9 
            src="/ctms/images/menu_icon.gif" width=9></td>
          <td><a class=menuChild 
            href="#" 
            target=main>影片上映</a></td></tr> -->
        <tr height=4>
          <td colSpan=2></td></tr></table>
          
          
                <table cellSpacing=0 cellPadding=0 width=150 border=0>
        <tr height=22>
          <td style="PADDING-LEFT: 30px" background=/ctms/images/menu_bt.jpg><a 
            class=menuParent onclick=expand(5) 
            href="javascript:void(0);">影片上映</a></td></tr>
        <tr height=4>
          <td></td></tr></table>
      <table id=child5 style="DISPLAY: none" cellSpacing=0 cellPadding=0 
      width=150 border=0>
        
        <tr height=20>
          <td align="center" width=30><img height=9 
            src="/ctms/images/menu_icon.gif" width=9></td>
          <td>
          	<a class = "menuChild" href="/ctms/onscreen/add_film_to_screen.jsp" target=main>添加上映计划</a>
          </td>
        </tr>
        <tr height=20>
          <td align="center" width=30><img height=9 
            src="/ctms/images/menu_icon.gif" width=9></td>
          <td>
          	<a class = "menuChild" href="/ctms/MangeFilmOnscreenInfoServlet" target="main">查询正在上映</a>
          </td>
        </tr>
        <tr height=4>
          <td colSpan=2></td></tr></table>
          
     	<%} %>     
          
          
          
      <table cellSpacing=0 cellPadding=0 width=150 border=0>
        <tr height=22>
          <td style="PADDING-LEFT: 30px" background=/ctms/images/menu_bt.jpg><a 
            class=menuParent onclick=expand(3) 
            href="javascript:void(0);">购票</a></td></tr>
        <tr height=4>
          <td></td></tr></table>
      <table id=child3 style="DISPLAY: none" cellSpacing=0 cellPadding=0 
      width=150 border=0>
      <!-- 
        <tr height=20>
          <td align="center" width=30><img height=9 
            src="/ctms/images/menu_icon.gif" width=9></td>
          <td><a class="menuChild"  href="/ctms/BuyTicketServlet"  target="main">自由购票</a></td></tr>
           -->
        <tr height=20>
          <td align="center" width=30><img height=9 
            src="/ctms/images/menu_icon.gif" width=9></td>
          <td><a class="menuChild" 
            href="/ctms/PreParTicketSaleInfoServlet" 
            target="main">快速购票</a></td></tr>
        <tr height=4>
          <td colSpan=2></td></tr></table>
          
          
          
      <table cellSpacing=0 cellPadding=0 width=150 border=0>
        <tr height=22>
          <td style="PADDING-LEFT: 30px" background=/ctms/images/menu_bt.jpg><a 
            class=menuParent onclick=expand(4) 
            href="javascript:void(0);">会员管理</a></td></tr>
        <tr height=4>
          <td></td></tr></table>
      <table id=child4 style="DISPLAY: none" cellSpacing=0 cellPadding=0 
      width=150 border=0>
        <tr height=20>
          <td align="center" width=30><img height=9 
            src="/ctms/images/menu_icon.gif" width=9></td>
          <td>
          	<a class="menuChild" href="/ctms/vip/add_vip.jsp" target="main">新增会员</a>
          </td>
        </tr>
        <tr height=20>
          <td align="center" width=30><img height=9 
            src="/ctms/images/menu_icon.gif" width=9></td>
          <td><a class=menuChild 
            href="#" 
            target=main>已有会员</a></td></tr>
        <tr height=4>
          <td colSpan=2></td></tr></table>
	
	<% if( "管理员".equals(session.getAttribute("position").toString() ) ){%>
      <table cellSpacing=0 cellPadding=0 width=150 border=0>
        
        <tr height=22>
          <td style="PADDING-LEFT: 30px" background=/ctms/images/menu_bt.jpg><a 
            class=menuParent onclick=expand(6) 
            href="javascript:void(0);">员工管理</a></td></tr>
        <tr height=4>
          <td></td></tr></table>
      <table id=child6 style="DISPLAY: none" cellSpacing=0 cellPadding=0 
      width=150 border=0>
        
        <tr height=20>
          <td align="center" width=30><img height=9 
            src="/ctms/images/menu_icon.gif" width=9></td>
          <td>
          	<a class="menuChild"  href="/ctms/employee/add_employee.jsp" target="main">新增员工</a>
          </td>
        </tr>
        <tr height="20">
          <td align="center" width="30"><img height=9 
            src="/ctms/images/menu_icon.gif" width=9></td>
          <td><a class="menuChild" href="/ctms/MangeEmployeeServlet" target="main">信息维护</a></td></tr>
            
        <tr height=4>
          <td colSpan=2></td></tr></table>
          
          
      <table cellSpacing=0 cellPadding=0 width=150 border=0>
        
        <tr height=22>
          <td style="PADDING-LEFT: 30px" background=/ctms/images/menu_bt.jpg><a 
            class=menuParent onclick=expand(7) 
            href="javascript:void(0);">统计</a></td></tr>
        <tr height=4>
          <td></td></tr></table>
      <table id=child7 style="DISPLAY: none" cellSpacing=0 cellPadding=0 
      width=150 border=0>
        
        <tr height=20>
          <td align="center" width=30><img height=9 
            src="/ctms/images/menu_icon.gif" width=9></td>
          <td>
          	<a class="menuChild" href="/ctms/statistics/sales_detail.jsp" target="main">销售明细</a>
          </td>
        </tr>
        <tr height=20>
          <td align="center" width=30><img height=9 
            src="/ctms/images/menu_icon.gif" width=9></td>
          <td><a class="menuChild" href="/ctms/statistics/attendance_rate_by_showroom.jsp" target="main">影厅上座率</a>
          </td>
        </tr>
        <tr height=20>
          <td align="center" width=30><img height=9 
            src="/ctms/images/menu_icon.gif" width=9></td>
          <td><a class="menuChild" href="/ctms/statistics/attendance_rate_by_film.jsp"   target="main">影片上座率</a></td></tr>
       <!-- <tr height=20>
          <td align="center" width=30><img height=9 
            src="/ctms/images/menu_icon.gif" width=9></td>
          <td><a class="menuChild" href="/ctms/statistics/month_sales.jsp" target="main">销售额</a></td></tr>
           -->
 <!--            
        <tr height=20>
          <td align="center" width=30><img height=9 
            src="/ctms/images/menu_icon.gif" width=9></td>
          <td><a class=menuChild 
            href="#" 
            target=main>菜单管理</a></td></tr>
            
        <tr height=20>
          <td align="center" width=30><img height=9 
            src="/ctms/images/menu_icon.gif" width=9></td>
          <td><a class=menuChild 
            href="#" 
            target=main>首页设置</a></td></tr>
        <tr height=20>
          <td align="center" width=30><img height=9 
            src="/ctms/images/menu_icon.gif" width=9></td>
          <td><a class=menuChild 
            href="#" 
            target=main>管理员列表</a></td></tr>
             -->
        <tr height=4>
          <td colSpan=2></td></tr></table>
          <%} %>
          
      <table cellSpacing=0 cellPadding=0 width=150 border=0>
        
        <tr height=22>
          <td style="PADDING-LEFT: 30px" background=/ctms/images/menu_bt.jpg><a 
            class=menuParent onclick=expand(0) 
            href="javascript:void(0);">个人管理</a></td></tr>
        <tr height=4>
          <td></td></tr></table>
      <table id=child0 style="DISPLAY: none" cellSpacing=0 cellPadding=0 
      width=150 border=0>
        
        <tr height=20>
          <td align="center" width=30><img height=9 
            src="/ctms/images/menu_icon.gif" width=9></td>
          <td>
          	<a class = "menuChild"  href = "/ctms/GetUserInfoServlet" target = "main" onclick="">个人信息</a>
          </td>
        </tr>
        <tr height=20>
          <td align="center" width=30><img height=9 
            src="/ctms/images/menu_icon.gif" width=9></td>
          <td><a class=menuChild 
            onclick="if (confirm('确定要退出吗？')) return true; else return false;" 
            href="/ctms/loginout/login_out.jsp" target="_top">退出系统</a></td></tr></table></td>
    <td width=1 bgColor=#d1e6f7></td></tr></table></body></html>
