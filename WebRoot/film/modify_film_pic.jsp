<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	
	String postStr = request.getSession().getAttribute("postStr").toString();
	int filmId = Integer.parseInt(request.getSession().getAttribute("filmId").toString());
	
	//request.getSession().removeAttribute("postStr");
	//request.getSession().removeAttribute("filmId");
	
	
	
	String [] postFile = postStr.split("/");
	
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'modify_film_pic.jsp' starting page</title>
    
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
	<script type="text/javascript" src="js/search.js"></script>
	<script type="text/javascript" src="artDialog4.1.6/artDialog.js"></script>
	 <!-- 对iframe新增的工具-->
	<script type="text/javascript" src="artDialog4.1.6/plugins/iframeTools.js"></script>
	<script type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>
	<link href="artDialog4.1.6/skins/default.css" rel="stylesheet" type="text/css" />
	<link href="css/manage_pic.css" rel="stylesheet" type="text/css"   />
	<link href="css/file_upload.css" rel="stylesheet" type="text/css"   />
		
	<!-- 外部引入文件结束 -->

	<script type="text/javascript">
	
		$(document).ready(function(){
	
			$(".zp_box").live('mouseenter',function(){
				$(this).children().stop(false,true);
				$(this).children(".pop_tit").slideDown("fast");
			}).live('mouseleave',function(){
				$(this).children().stop(false,true);
				$(this).children(".pop_tit").slideUp("fast");
			});
		});
		
		//删除图片
		function deletePic(val) {
			
			art.dialog({
	 						title: '信息提示',
	 						content: '确认删除选中项?删除后将不可恢复!',
	 						icon: 'warning',
	 						lock: true,
	 						ok: function(){
	 							
	 							window.location.assign("http://localhost:8080/ctms/DeleteFilmPicServlet?filmId=" + <%= filmId%> + "&picNo=" + val);
							},
							cancle:true,
 						});
			
		}
		
		
		function showUploadForm() {
		
			$("#fileUpLoad").css("visibility", "visible ");
		
		
		
		}
		
		//上传控件
		$(function(){
				$("input[type=file]").change(function(){
						$(this).parents(".uploader").find(".filename").val($(this).val());
				});
				$("input[type=file]").each(function(){
					if($(this).val()==""){$(this).parents(".uploader").find(".filename").val("No file selected...");}
				});
		});
		
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
		
		function checkAll() {
		
			return validateFilmPost();
		}
		
		
	</script>

  </head>
  
  <body>
  
  
  
  
    <div class="demo">
	<%for(int i = 0; i < postFile.length; i++) {
	 %>
		<div class="zp_box">
			<div class="pop_tit">
				<span class="p_tit1">
					<%if(postFile.length != 1) { %>
					<a href = "javascript:void(0)" target = "main" onclick = "deletePic(<%=i %>)">
						删除
					</a>
					<%} %>
				</span>&nbsp;
				<span class="p_tit2">
					<a href = "javascript:void(0)" target = "main" onclick = "showUploadForm()">上传新图片</a>
				</span>
			</div>
			<img width = "200px" height = "200px" src ="posts/<%=postFile[i] %>"  alt = "图片"/>
		</div>
	<%} %>	
	</div>
	<div style = "clear:both;visibility:hidden" id = "fileUpLoad">
	
	<!-- ****上传新图片表单 ****-->
	<form action = "AddMoreFilmPostServlet" method="post" enctype="multipart/form-data">
		<table>
			<tr>
	    		<th class = "title" valign = "top">新海报:</th>
	    		<td class = "inputContent" id = "postContainer">
	    			<input type = "file"  size = "43" name = "filmPost1" id = "filmPost"/>&nbsp;&nbsp;<input type = "button" value = '更多' onclick = "moreFileUpload()" /><br />
	    		</td>
	    		<td id = "td_10" width = "170"></td>
		    </tr>
		    <tr class = "centerContent">
		    		<td>
		    		</td>
		    		<td>
		    			<input type = "submit" value = "提交" onclick=" return checkAll()"/><br />
		    			<input type = "hidden" id = "filmId" value = "<%= filmId%>" name = "filmId" />
		    		</td>
		    	</tr>
		</table>
	</form>
	
	</div>
</body>
  </body>
</html>
