<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import = "com.suehon.model.EmployeeBean" %>

<%

	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	
	EmployeeBean eb = (EmployeeBean)request.getAttribute("eb");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'user_info.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<!-- 外部引入文件开始 -->
	
	<link rel="stylesheet" type="text/css" href="css/add_film.css">
	<script type = "text/javascript" src = "js/validate.js"></script>
	<script type = "text/javascript" src = "js/jquery-2.0.3.js"></script>
	<script type = "text/javascript" src="js/jquery.1.4.2-min.js"></script>
	<script type="text/javascript" src="artDialog4.1.6/artDialog.js"></script>
	 <!-- 对iframe新增的工具-->
	<script type="text/javascript" src="artDialog4.1.6/plugins/iframeTools.js"></script>
	<script type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>
	<link href="artDialog4.1.6/skins/default.css" rel="stylesheet" type="text/css" />
	<link href="css/add_employee.css" rel="stylesheet" type="text/css" />
	<!-- 外部引入文件结束 -->

  </head>
  
  <body>
    <br />
    <br />
    <p align = "center"><font face = "黑体" size = "5" color = "black">个人信息</font></p>
	
	<center>
		<form action = "AddEmployeeServlet" method="post" enctype="multipart/form-data">
			<table id = "info">
			<tr>
					<th>用户名:</th>
					<td>
						<input disabled="disabled" type = "text" id = "loginName" name = "loginName" value = "<%= eb.getId()%>"/>
					</td>
					<td id = "td_0"></td>
				</tr>
				<tr>
					<th>姓名:</th>
					<td>
						<input disabled="disabled" type = "text" id = "name" name = "name"  value = "<%= eb.getName()%>"/>
					</td>
					<td id = "td_1"></td>
				</tr>
				<tr>
					<th>照片:</th>
					<td>
						<img src = "posts/<%= eb.getPhoto()%>"  width = "154px" height = "175px" alt = "照片">
					</td>
					<td id = "td_2"></td>
				</tr>
				<tr>
					<th>性别:</th>
					<td>
						<input disabled="disabled" type = "text" id = "name" name = "name"  value = "<%= eb.getGender() %>"/>		
					</td>
					<td id = "td_3"></td>
				</tr>	
				<tr>
					<th>年龄:</th>
					<td>
						<input type = "text"  disabled="disabled" id = "age" name = "age" value = "<%= eb.getAge() %>"  onkeyup="javascript:this.value = this.value.replace(/[^\d]/g,'');"/>
					</td>
					<td id = "td_4"></td>
				</tr>
				<tr>
					<th>出生时间:</th>
					<td>
						<input type = "text" id = "birthDate" value = "<%= eb.getBirthDate() %>" name = "birthDate"  disabled="disabled" />
					</td>
					<td id = "td_5"></td>
				</tr>
				<tr>
					<th>身份证号码:</th>
					<td>
						<input type = "text"  disabled="disabled"  id = "idCode" name = "idCode" onkeyup="javascript:this.value = this.value.replace(/[^\d]/g,'');" value = "<%= eb.getIdCode()%>"/>
					</td>
					<td id = "td_6"></td>
				</tr>
				<tr>
					<th>手机号码:</th>
					<td>
						<input type = "text" id = "phoneNo"  disabled="disabled" name = "phoneNo" onkeyup="javascript:this.value = this.value.replace(/[^\d]/g,'');" value = "<%= eb.getPhoneNo()%>"/>
					</td>
					<td id = "td_7"></td>
				</tr>
				<tr>
					<th>上岗时间:</th>
					<td>
						<input type = "text" id = "entryTime" name = "entryTime" value = "<%= eb.getEntryTime()%>"  disabled="disabled" />
					</td>
					<td id = "td_8"></td>
				</tr>
				<tr>
					<th>岗位:</th>
					<td>
						<input type = "text" id = "entryTime" name = "entryTime" value = "<%= eb.getPosition()%>"  disabled="disabled" />
					</td>
					<td id = "td_9"></td>
				</tr>
			</table>
		</form>    
    </center>
    <input type = "hidden" value = "<%= eb.getPassword() %>">
  </body>
  </body>
</html>
