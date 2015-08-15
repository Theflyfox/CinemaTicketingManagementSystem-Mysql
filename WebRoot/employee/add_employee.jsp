<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'add_employee.jsp' starting page</title>
    
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
    <p align = "center"><font face = "黑体" size = "5" color = "black">添加员工</font></p>
	
	<center>
		<form action = "AddEmployeeServlet" method="post" enctype="multipart/form-data">
			<table id = "info">
				<tr>
					<th>姓名:</th>
					<td>
						<input type = "text" id = "name" name = "name" />
					</td>
					<td id = "td_1"></td>
				</tr>
				<tr>
					<th>照片:</th>
					<td>
						<input type = "file" id = "photo"  name = "photo" />
					</td>
					<td id = "td_2"></td>
				</tr>
				<tr>
					<th>性别:</th>
					<td>
						<select id = "gender" name = "gender">
							<option value = "男">男</option>
							<option value = "女">女</option>
						</select>
					</td>
					<td id = "td_3"></td>
				</tr>	
				<tr>
					<th>年龄:</th>
					<td>
						<input type = "text" id = "age" name = "age" onkeyup="javascript:this.value = this.value.replace(/[^\d]/g,'');"/>
					</td>
					<td id = "td_4"></td>
				</tr>
				<tr>
					<th>出生时间:</th>
					<td>
						<input type = "text" id = "birthDate" name = "birthDate" class = "Wdate" onclick="WdatePicker()"/>
					</td>
					<td id = "td_5"></td>
				</tr>
				<tr>
					<th>身份证号码:</th>
					<td>
						<input type = "text" id = "idCode" name = "idCode" onkeyup="javascript:this.value = this.value.replace(/[^\d]/g,'');"/>
					</td>
					<td id = "td_6"></td>
				</tr>
				<tr>
					<th>手机号码:</th>
					<td>
						<input type = "text" id = "phoneNo" name = "phoneNo" onkeyup="javascript:this.value = this.value.replace(/[^\d]/g,'');"/>
					</td>
					<td id = "td_7"></td>
				</tr>
				<tr>
					<th>上岗时间:</th>
					<td>
						<input type = "text" id = "entryTime" name = "entryTime" class = "Wdate" onclick="WdatePicker()"/>
					</td>
					<td id = "td_8"></td>
				</tr>
				<tr>
					<th>岗位:</th>
					<td>
						<select id = "position" name = "position">
							<!-- <option value = "管理员">管理员</option> -->
							<option value = "售票员">售票员</option>
						</select>
					</td>
					<td id = "td_9"></td>
				</tr>
				<tr>
					<th>用户密码:</th>
					<td>
						<input type = "password" id = "password" name = "password" />
					</td>
					<td id = "td_10"></td>
				</tr>
				
				<tr id = "conmit">
					<td>
						<input type = "reset" value = "重置" />
					</td>
					<td>
						<input type = "submit" value = "添加" />
					</td>
					<td></td>
				</tr>
			</table>
		</form>    
    </center>
  </body>
</html>
