<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    <title>新增影厅</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type = "text/javascript" src = "js/validate.js"></script>
	<script type = "text/javascript" src = "js/jquery-2.0.3.js"></script>
	<link href="artDialog4.1.6/skins/default.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="artDialog4.1.6/artDialog.js"></script>
	 <!-- 对iframe新增的工具-->
	<script type="text/javascript" src="artDialog4.1.6/plugins/iframeTools.js"></script>
	<script type = "text/javascript">
	
			//异步获取放影厅类型
			function prePareSelectContent() {
				$.post("ShowAddShowroomPageServlet",{},
					function (returnedData, status) {
						
						$("#type option").remove();//先移除目前的option子元素选项
						$("#type").append("<option value = '-1'>==请选择==</option>");
						var resultArray = $.parseJSON(returnedData);
						for(var i = 0; i < resultArray.length; i++) {//添加新的option子元素
							
							var result = resultArray[i];
							//alert(result.ID);
							$("#type").append("<option value = '" +result.ddid + "'> "+result.ddcontent + "</option>");
						}						
					}
				);
			}
			
		$(document).ready(function (){
			//调用函数
			prePareSelectContent();
		});
		
		
		/**表单验证开始**/
			
			//验证影厅名称
			function validateShowroomName() {
				var obj = document.getElementById("SHOWROOMNAME");
				var text = document.getElementById("td_1");
				if(isShowroomNameExists()) {
					//alert("用户名 不能为空！");
					text.innerHTML = "<font color = 'red' size = '2'>影厅名称已存在，请输入其它影厅名！</font>";
					return false;
					
				}else if(obj.value.trim() == "" || obj.value == null){
					text.innerHTML = "<font color = 'red' size = '2'>请填写影厅名称！</font>";
					return false;
				}
				
				text.innerHTML = "<img src = './images/succeed.png' width = '20' height = '20'> ";
				return true;
			}
			
			//验证放影厅类型
			function validateShowroomType() {
				
				var obj = document.getElementById("type");
				var text = document.getElementById("td_2");
				if(obj.value.trim() == "-1") {
					text.innerHTML = "<font color = 'red' size = '2'>请选择影厅类型！</font>";
					return false;
				}
				text.innerHTML = "<img src = './images/succeed.png' width = '20' height = '20'> ";
				return true;
			}
			
			//验证影厅座位
			function validateShowroomSiteAmount() {
				var obj = document.getElementById("SHOWROOMSITEAMOUNT");
				var text = document.getElementById("td_3");
				if(obj.value.trim() == "" || obj.value == null) {
					text.innerHTML = "<font color = 'red' size = '2'>请填写座位数量！</font>";
					return false;
				}else if(!$.isNumeric($("#SHOWROOMSITEAMOUNT").val())) {//是否是数字
					text.innerHTML = "<font color = 'red' size = '2'>请填写整数！</font>";
					return false;
				}
				text.innerHTML = "<img src = './images/succeed.png' width = '20' height = '20'> ";
				return true;
			}
			
			//清空提示信息
			function onfocusText(id) {
				document.getElementById(id).innerHTML = "";
			}
			var flag = false;
			//异步验证影厅名是否存在
			function isShowroomNameExists() {
				var text = document.getElementById("td_1");
				
				$.post("IsShowroomExistsServlet",
						{addShowroomName: $("#SHOWROOMNAME").val()},
							function(returnedDate, status) {
							if(returnedDate == -2) {
								text.innerHTML = "<font color = 'red' size = '2'>影厅名称已存在，请输入其它影厅名！</font>";
								flag = true;
							}
						});
				return flag;
			}
			
			//表单提交时，执行的函数
			function validateAll() {
				
				//var text = document.getElementById("td_1");
				//var temp = false;
				//if(text.innerHTML != "<font color = 'red' size = '2'>影厅名称已存在，请输入其它影厅名！</font>") {
				//	temp = true;
				//}
				//return validateShowroomName() && validateShowroomType() && validateShowroomSiteAmount() && temp;
				//alert("validateShowroomName " + validateShowroomName());
				//alert("validateShowroomType " + validateShowroomType());
				//alert("isShowroomNameExists " + isShowroomNameExists());
				return validateShowroomName() && validateShowroomType() && !isShowroomNameExists();
			}
		/**表单验证结束**/
		
		//表单提交
		function asSubmit() {
		
			var dialog;
			var timer;
			var isReady = false;
			//prePareSelectContent();
			isReady = validateAll();
			if(isReady) {
				
				dialog = art.dialog({
				    lock: true,
				    icon:'succeed',
				    background: '#600', // 背景色
				    opacity: 0.67,	// 透明度
				    init: function () {
				    	var that = this, i = 3;
				        var fn = function () {
				            that.title(i + '秒后关闭');
				            !i && that.close();
				            i --;
				        };
				        timer = setInterval(fn, 1000);
				        fn();
    					},
				    close: function () {
				    	clearInterval(timer);
				    }
				});
				$.post(
				'AddShowroomServlet',
				{SHOWROOMNAME:$("#SHOWROOMNAME").val(), SHOWROOMTYPE: $("#type").val(), SHOWROOMSITEAMOUNT: $("#SHOWROOMSITEAMOUNT").val()},
				function(returnedDate, status){
					if(-1 == returnedDate) {
						dialog.content("添加失败");
					}else {
						dialog.content("添加成功,稍后转向设置座位页面");
						$("#SHOWROOMNAME").val("");
						$("#SHOWROOMSITEAMOUNT").val("");
						$("#td_1").html("");
						$("#td_2").html("");
						$("#td_3").html("");
						
						//添加成功，转向设置座位分布页面
						setTimeout("gotoSetSitePage()", 2000);
					}
				});
			}
		}
		
		
		function gotoSetSitePage() {
		
			window.location.assign("../showroom/set_site.jsp");
		}
		
		
		
		
		
		
		//添加新影厅类型
		function addNewType() {
			$("#newTypeContainer").css("visibility", "visible ");	
		}
		
		
		
		function clickYesBtn() {
			if($("#newShowroomType").val().trim() != "") {
				$.post("AddShowroomTypeServlet",{showroomType: $("#newShowroomType").val()}, function(returnedDate,status) {
					 
					if(returnedDate > 0) {
						$("#newShowroomType").val("");
					}
				});
			}
			prePareSelectContent();
		}
		
		//取消按钮被点击
		function clickCalBtn() {
			//设置控件为不可见
			$("#newTypeContainer").css("visibility", "hidden");
		}
		
	</script>
	
  </head>
  
  <body>
  	<br /><br />
    <p align = "center"><font face = "黑体" size = "5" color = "black">新增放映厅</font></p>
    <div align = "center">
	    <form>
		    <table	border = "1" cellspacing="0" width = "80%">
			    <tbody>
			    	<tr>
			    		<th>影厅名称：</th>
			    		<td>
			    			<input type = "text" id = "SHOWROOMNAME" name = "SHOWROOMNAME" checked = "checked" onblur="validateShowroomName();isShowroomNameExists();" onfocus="onfocusText('td_1')">
			    		</td>
			    		<td id = "td_1" width = "170"></td>
			    	</tr>
			    	<tr>
			    		<th>影厅类型：</th>
			    		<td>
			    			<select id = "type" name = "SHOWROOMTYPE" onblur="validateShowroomType();" onfocus="onfocusText('td_2')">
			    				<option value = "-1">==请选择==</option>
			    			</select>
			    			<a href = "javascript:void(0)" onclick = "addNewType()">
			    				<small>新增类型</small>
			    			</a>
			    		</td>
			    		<td id = "td_2" width = "400"></td>
			    	</tr>
			    	<!-- 
			    	<tr>
			    		<th>座位数量：</th>
			    		<td>
			    			<input type = "text" id = "SHOWROOMSITEAMOUNT" name = "SHOWROOMSITEAMOUNT" onblur = "validateShowroomSiteAmount()" onfocus="onfocusText('td_3')">
			    		</td>
			    		<td id = "td_3" width = "400"></td>
			    	</tr>
			    	 -->
			    </tbody>
			    <tfoot>
			    	<tr>
			    		<th>操作:</th>
			    		<td><input type = "button" value = "添加" id = "submitBtn" onclick = "asSubmit();"></td>
			    		<td>
			    			<div id = "newTypeContainer" style = "visibility:hidden">
			    				新增影厅类型值: <input type = 'text' name = 'newShowroomType' id = 'newShowroomType' />
			    				<br />
			    				<input type = 'button' id = 'yesBtn' value = '确认' onclick = 'clickYesBtn();' />
			    				<input type = 'button' id = 'calBtn' value = '取消 ' onclick = 'clickCalBtn();' />
			    			</div>
			    		</td>
			    	</tr>
			    </tfoot>
		    </table>
	    </form>
    </div>
    
    <!-- <input type = "button" value = "测试" onclick = "asSubmit();"> -->
  </body>
</html>
