<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>新增影片</title>
    
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
	
	<!-- 外部引入文件结束 -->
	
	<script type = "text/javascript">
	
			//验证影厅名称
			function validateFileName() {
			
				var obj = document.getElementById("fileName");
				var text = document.getElementById("td_1");
				if(obj.value.trim() == "" || obj.value == null) {
					//alert("用户名 不能为空！");
					text.innerHTML = "<font color = 'red' size = '2'>请填写电影名称！</font>";
					return false;
				}else if(isShowroomNameExists()){
					return false;
				}
				
				text.innerHTML = "<img src = './images/succeed.png' width = '20' height = '20'> ";
				return true;
			}
			
			//异步验证电影名是否存在,存在返回影片id，不存在返回false
			function isShowroomNameExists() {
				var text = document.getElementById("td_1");
				var flag = false;
				$.post("IsFilmExistsServlet",
						{filmName: $("#fileName").val()},
							function(returnedDate, status) {
							if(returnedDate > 0) {//存在
								text.innerHTML = "<font color = 'red' size = '2'>已存在，<a href = 'javascript:void(0)' target = 'main' id = '" +returnedDate + "' onclick = 'goToDetailPage(this)'>点击查看详情！</a></font>";
								flag = true;
							}
						});
				return flag;
			}
			
			//转向单个影片详情页面
			function goToDetailPage(obj) {
				art.dialog({
								title: '信息提示',
								content: "点击'确认'后,当前页面编辑内容将丢失",
								icon: 'warning',
								//lock: true,
								ok: function(){
									window.location.assign("../ShowFilmDetailInfoServlet?filmId=" + obj.id);
	    							return true;
								},
								cancel:true,
								okVal:'确认',
								cancleVal:'取消'
							});
			}
			
			//清空提示信息
			function onfocusText(id) {
				document.getElementById(id).innerHTML = "";
			}
			
			//动态创建上传文件
			var count = 1;
			function moreFileUpload() {
			
				//创建三个元素
				var button = $("<input type  = 'button' value = '删除'>");
				var input = $("<input type  = 'file' name = 'filmPost"+ (++count) + "' value = '浏览...'>");
				var br = $("<br />");
				$("#postContainer").append(input);
				$("#postContainer").append(button);
				$("#postContainer").append(br);
				button.click( function () {
					count--;
					input.remove();
					button.remove();
					br.remove();
				});
				document.getElementById("postCount").value = count;
				//alert("值 :" + document.getElementById("postCount").value);
			}
			
			//验证影片别名输入框
			function validateFilmAlias() {
			
				var obj = document.getElementById("filmAlias");
				var text = document.getElementById("td_2");
				if(obj.value.trim() == "" || obj.value == null) {
					//alert("用户名 不能为空！");
					text.innerHTML = "<font color = 'red' size = '2'>请输入,没有请输入'无'！</font>";
					return false;
				}
				text.innerHTML = "<img src = './images/succeed.png' width = '20' height = '20'> ";
				return true;
			}
			
			//验证国家输入框
			function validateFilmCountry() {
			
				var obj = document.getElementById("filmCountry");
				var text = document.getElementById("td_3");
				if(obj.value.trim() == "" || obj.value == null) {
					//alert("用户名 不能为空！");
					text.innerHTML = "<font color = 'red' size = '2'>请输入!</font>";
					return false;
				}
				text.innerHTML = "<img src = './images/succeed.png' width = '20' height = '20'> ";
				return true;
			
			}
			
			//验证导演
			function validateFilmDirector() {
				var obj = document.getElementById("filmDirector");
				var text = document.getElementById("td_4");
				if(obj.value.trim() == "" || obj.value == null) {
					//alert("用户名 不能为空！");
					text.innerHTML = "<font color = 'red' size = '2'>请输入!</font>";
					return false;
				}
				text.innerHTML = "<img src = './images/succeed.png' width = '20' height = '20'> ";
				return true;
			}
			
			//验证主演
			function validateFilmLeadingRole() {
				var obj = document.getElementById("filmLeadingRole");
				var text = document.getElementById("td_5");
				if(obj.value.trim() == "" || obj.value == null) {
					//alert("用户名 不能为空！");
					text.innerHTML = "<font color = 'red' size = '2'>请输入!</font>";
					return false;
				}
				text.innerHTML = "<img src = './images/succeed.png' width = '20' height = '20'> ";
				return true;
			}
			
			//语言
			function validateFilmLanguage() {
				var obj = document.getElementById("filmLanguage");
				var text = document.getElementById("td_6");
				if(obj.value.trim() == "" || obj.value == null) {
					//alert("用户名 不能为空！");
					text.innerHTML = "<font color = 'red' size = '2'>请输入!</font>";
					return false;
				}
				text.innerHTML = "<img src = './images/succeed.png' width = '20' height = '20'> ";
				return true;
			}
			
			//片长验证
			function validateFilmLastTime() {
				var obj = document.getElementById("filmLastTime");
				var text = document.getElementById("td_7");
				if(obj.value.trim() == "" || obj.value == null) {
					//alert("用户名 不能为空！");
					text.innerHTML = "<font color = 'red' size = '2'>请输入!</font>";
					return false;
				}
				text.innerHTML = "<img src = './images/succeed.png' width = '20' height = '20'> ";
				return true;
			}
			
			//影片种类验证
			function validateFilmType() {
				var obj = document.getElementById("filmType");
				var text = document.getElementById("td_8");
				if(obj.value.trim() == "" || obj.value == null) {
					//alert("用户名 不能为空！");
					text.innerHTML = "<font color = 'red' size = '2'>请输入!</font>";
					return false;
				}
				text.innerHTML = "<img src = './images/succeed.png' width = '20' height = '20'> ";
				return true;
			}
			
			
			//影片上线时间
			function validateFilmOnline() {
				var obj = document.getElementById("filmOnline");
				var text = document.getElementById("td_9");
				if(obj.value.trim() == "" || obj.value == null) {
					//alert("用户名 不能为空！");
					text.innerHTML = "<font color = 'red' size = '2'>请输入!</font>";
					return false;
				}
				text.innerHTML = "<img src = './images/succeed.png' width = '20' height = '20'> ";
				return true;
				
			}
			
			//验证上传文件输入框
			function validateFilmPost() {
				
				var text = document.getElementById("td_10");
				var objs = new Array();
				//alert("值:" + obj.value);
				for(var i = 1; i <= count; i++) {
					objs.push( document.getElementsByName( "filmPost" + i)[0] );
				}
				var flag = false;//是否是空值
				for(var i = 0; i < objs.length; i++) {
					//alert("文件输入框值:" + objs[i].value);
					if(objs[i].value == "" || objs[i].value == null ) {
						flag = true;
						break;
					}
				}
				//alert("数组长度:" + objs.length);
				if(flag) {
					//alert("用户名 不能为空！");
					text.innerHTML = "<font color = 'red' size = '2'>请选择图片!</font>";
					return false;
				}
				text.innerHTML = "<img src = './images/succeed.png' width = '20' height = '20'> ";
				return true;
			}
			
			//验证剧情简介
			function validateFilmContent() {
				var obj = document.getElementById("filmContent");
				var text = document.getElementById("td_11");
				if(obj.value.trim() == "" || obj.value == null) {
					//alert("用户名 不能为空！");
					text.innerHTML = "<font color = 'red' size = '2'>请输入!</font>";
					return false;
				}
				text.innerHTML = "<img src = './images/succeed.png' width = '20' height = '20'> ";
				return true;
			}
			
			//验证幕后花絮
			function validateFilmBackStory() {
				var obj = document.getElementById("filmBackStory");
				var text = document.getElementById("td_12");
				if(obj.value.trim() == "" || obj.value == null) {
					//alert("用户名 不能为空！");
					text.innerHTML = "<font color = 'red' size = '2'>请输入!</font>";
					return false;
				}
				text.innerHTML = "<img src = './images/succeed.png' width = '20' height = '20'> ";
				return true;
			}
			
			//验证幕后花絮
			function validateFilmAward() {
				var obj = document.getElementById("filmAward");
				var text = document.getElementById("td_13");
				if(obj.value.trim() == "" || obj.value == null) {
					//alert("用户名 不能为空！");
					text.innerHTML = "<font color = 'red' size = '2'>请输入!</font>";
					return false;
				}
				text.innerHTML = "<img src = './images/succeed.png' width = '20' height = '20'> ";
				return true;
				
			}
			
			function checkAll() {
					
					return validateFileName() && validateFilmAlias() && validateFilmCountry() && validateFilmDirector() && 
					validateFilmLeadingRole() && validateFilmLanguage() && validateFilmLastTime() && validateFilmType() && 
					validateFilmOnline() && validateFilmPost() && validateFilmContent() && validateFilmBackStory() && 
					validateFilmAward();
			
			}
			
	</script>
  </head>
  
  <body>
    <br />
    <br />
    <p align = "center"><font face = "黑体" size = "5" color = "black">新增影片</font></p>
    <div class="headeline"></div>
    <div id = "content">
    	<form action = "AddFilmServlet" method="post" enctype="multipart/form-data">
		    <table border = "0">
		    	<tr class = "title">
		    		<th>影片名:</th>
		    		<td class = "inputContent">
		    			<input type = "text" size = "43" name = "filmName" id = "fileName" checked = "checked" onblur="validateFileName();isShowroomNameExists();" onfocus="onfocusText('td_1')"/>
		    		</td>
		    		<td id = "td_1" width = "170" class = "inputContent"></td>
		    	</tr>
		    	<tr>
		    		<th class = "title">别名:</th>
		    		<td class = "inputContent">
		    			<input type = "text"  size = "43" name = "filmAlias" id = "filmAlias" onblur="validateFilmAlias(this);" onfocus="onfocusText('td_2')"/>
		    		</td>
		    		<td id = "td_2" width = "170"><font size = '2'></font></td>
		    	</tr>
		    	<tr>
		    		<th class = "title">国家/地区:</th>
		    		<td class = "inputContent">
		    			<input type = "text"  size = "43" name = "filmCountry" id = "filmCountry"  onblur="validateFilmCountry(this);" onfocus="onfocusText('td_3')"/>
		    		</td>
		    		<td id = "td_3" width = "170"></td>
		    	</tr>
		    	<tr>
		    		<th class = "title">导演:</th>
		    		<td class = "inputContent">
		    			<input type = "text"  size = "43" name = "filmDirector" id = "filmDirector" onblur="validateFilmDirector(this);" onfocus="onfocusText('td_4')"/>
		    		</td>
		    		<td id = "td_4" width = "170"></td>
		    	</tr>
		    	<tr>
		    		<th class = "title">主演:</th>
		    		<td class = "inputContent">
		    			<input type = "text"  size = "43" name = "filmLeadingRole" id = "filmLeadingRole"  onblur="validateFilmLeadingRole(this);" onfocus="onfocusText('td_5')"/>
		    		</td>
		    		<td id = "td_5" width = "170"></td>
		    	</tr>
		    	<tr>
		    		<th class = "title">语言:</th>
		    		<td class = "inputContent">
		    			<input type = "text"  size = "43" name = "filmLanguage" id = "filmLanguage"  onblur="validateFilmLanguage(this);" onfocus="onfocusText('td_6')"/>
		    		</td>
		    		<td id = "td_6" width = "170"></td>
		    	</tr>
		    	<tr>
		    		<th class = "title">片长<font size = "2">(单位:分钟)</font>:</th>
		    		<td class = "inputContent">
		    			<input type = "text"  size = "43" name = "filmLastTime" id = "filmLastTime"  onblur="validateFilmLastTime(this);" onfocus="onfocusText('td_7')"/>
		    		</td>
		    		<td id = "td_7" width = "170"></td>
		    	</tr>
		    	<tr>
		    		<th class = "title">类别:</th>
		    		<td class = "inputContent">
		    			<input type = "text"  size = "43" name = "filmType" id = "filmType"  onblur="validateFilmType(this);" onfocus="onfocusText('td_8')"/>
		    		</td>
		    		<td id = "td_8" width = "170"></td>
		    	</tr>
		    	<tr>
		    		<th class = "title">上线时间:</th>
		    		<td class = "inputContent">
		    			<input type = "text" size = "43"  class = "Wdate" name = "filmOnline"  id = "filmOnline" onclick="WdatePicker()" onblur="validateFilmOnline(this);" onfocus="onfocusText('td_9')" />
		    		</td>
		    		<td id = "td_9" width = "170"></td>
		    	</tr>
		    	<tr>
		    		<th class = "title" valign = "top">海报:</th>
		    		<td class = "inputContent" id = "postContainer">
		    			<input type = "file"  size = "43" name = "filmPost1" id = "filmPost"/>&nbsp;&nbsp;<input type = "button" value = '更多' onclick = "moreFileUpload()" /><br />
		    		</td>
		    		<td id = "td_10" width = "170"></td>
		    	</tr>
		    	<tr>
		    		<th class = "title" valign = 'top'>剧情简介:</th>
		    		<td class = "inputContent">
		    			<textarea rows="4" cols="35" name = "filmContent" id = "filmContent"  onblur="validateFilmContent(this);validateFilmPost();" onfocus="onfocusText('td_11')">
						</textarea>
		    		</td>
		    		<td id = "td_11" width = "170"></td>
		    	</tr>
		    	<tr>
		    		<th class = "title" valign = 'top'>幕后花絮:</th>
		    		<td class = "inputContent">
		    			<textarea rows="4" cols="35" name = "filmBackStory" id = "filmBackStory"  onblur="validateFilmBackStory(this)" onfocus="onfocusText('td_12')">
						</textarea>
		    		</td>
		    		<td id = "td_12" width = "170"></td>
		    	</tr>
		    	<tr>
		    		<th class = "title" valign = 'top'>获奖情况:</th>
		    		<td class = "inputContent">
		    			<textarea rows="4" cols="35" name = "filmAward" id = "filmAward" onblur="validateFilmAward(this)" onfocus="onfocusText('td_13')">
						</textarea>
		    		</td>
		    		<td id = "td_13" width = "170"></td>
		    	</tr>
		    	<tr class = "centerContent">
		    		<td>
		    			<input type = "reset" value = "重置" />
		    		</td>
		    		<td>
		    			<input type = "submit" value = "提交" onclick=" return checkAll();"/><br />
		    			<input type = "hidden" id = "postCount" value = "1" name = "postCount" />
		    		</td>
		    	</tr>
		    </table>
	    </form>
    </div>
    <!-- 返回顶部 -->
    <script type="text/javascript" src="js/scrolltopcontrol.js"></script>
  </body>
</html>
