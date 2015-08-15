<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
int showroomId = Integer.parseInt(session.getAttribute("showroomId").toString());
String showroomName = session.getAttribute("showroomName").toString();
String showroomType = session.getAttribute("showroomType").toString();

session.removeAttribute("showroomId");
session.removeAttribute("showroomName");
session.removeAttribute("showroomType");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'site_demo.jsp' starting page</title>
    
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
	<link href="css/showroom_site.css" rel="stylesheet" type="text/css" />
	<!-- 外部引入文件结束 -->
	
	<script type = "text/javascript">
		//每一排座位的排号
		var siteRow = 1;
		//每一行允许的最大座位数
		var maxSiteAmout = 21;
		//字符串数字记录整个座位排布
		var totalSiteStr = "";
		//总座位数
		var totalSiteAmount = 0;
		
		/**限制输入只能是数字**/
		function onlyNumber(obj) {
			
			obj.value = obj.value.replace(/[^\d]/g,'');
		
		}
		
		
		/**添加座位**/
		function addSite() {
			
			$("#siteContainer").css("display" , "");
			var isSiteRowOk = checkSiteCol();
			var isAlignmentOk = checkAlignment();
			if(isSiteRowOk && isAlignmentOk) {
				
				//用户输入列数
				var siteCol = $("#siteCol").val();
				
				//用户选择的对齐方式
				var alignment = $("#sitePosition").val();
				//待添加的字符串
				var tr;
				
				if(alignment == 1) { //左对齐
					
					var resultStr = getBlankNumber(siteCol, alignment);
					var rightBlack = resultStr.split("-");
					tr = "<tr><td width = '40px'>" + siteRow +"排 </td>";
					
					for(var i = 0; i < siteCol; i++) {//填充左边座位数
					
						tr = tr + "<td><img alt = '" + siteRow + "," + (i + 1) + "' src = 'images/1.png' width = '25px' height = '25px' onclick = 'choose(this)'/></td>";
					}
					
					for(var i = 0; i < rightBlack[1]; i++) {//填充右边空格数
						tr = tr + "<td>&nbsp;&nbsp;&nbsp;</td>";
					}
					
					tr = tr + "</tr>";
					
					//向总的座位排布字符串添加此行座位排布
					totalSiteStr += siteRow + ":" + siteCol + ";" + "0(0)-" + siteCol + "(1)-" + rightBlack[1] + "(0)" + "/";
					
				}else if(alignment == 2){//居中对齐
				
					var resultStr = getBlankNumber(siteCol, alignment);
					var leftBlank = resultStr.split("-")[0];
					var rightBlank = resultStr.split("-")[1];
					
					tr = "<tr><td>" + siteRow +"排 </td>";
					
					for(var i = 0; i < leftBlank; i++) {//填充左空格
						tr = tr + "<td>&nbsp;&nbsp;&nbsp;</td>";
					}
					for(var i = 0; i < siteCol; i++) {//填充中间座位数
						tr = tr + "<td><img alt = '" + siteRow + "," + (i + 1) + "' src = 'images/1.png' width = '25px' height = '25px' onclick = 'choose(this)'/></td>";
					}
					for(var i = 0; i < rightBlank; i++) {//填充右空格
						tr = tr + "<td>&nbsp;&nbsp;&nbsp;</td>";
					}
					
					tr = tr + "</tr>";
					
					//向总的座位排布字符串添加此行座位排布
					totalSiteStr += siteRow + ":" + siteCol + ";"  + leftBlank + "(0)-" + siteCol + "(1)-" + rightBlank + "(0)" + "/";
					
				}else if(alignment == 3){//右对齐
				
					var resultStr = getBlankNumber(siteCol, alignment);
					
					tr = "<tr><td>" + siteRow +"排 </td>";
					
					for(var i = 0; i < resultStr; i++) {//填充左空格
						
						tr = tr + "<td>&nbsp;&nbsp;&nbsp;</td>";
					}
					
					for(var i = 0; i < siteCol; i++) {//填充座位
						tr = tr + "<td><img alt = '" + siteRow + "," + (i + 1) + "' src = 'images/1.png' width = '25px' height = '25px' onclick = 'choose(this)'/></td>";
					}
					
					tr = tr + "</tr>";
					
					//向总的座位排布字符串添加此行座位排布
					totalSiteStr += siteRow + ":" + siteCol + ";"  + resultStr + "(0)-" + 0 + "(0)-" + siteCol + "(1)" + "/";
					
				}else if(alignment == 4){//两侧对齐
					
					var resultStr = getBlankNumber(siteCol, alignment);
					var resultArr = resultStr.split("-");
					var leftSite = resultArr[0];
					var middleBlank = resultArr[1];
					var rightSite = resultArr[2];
					
					tr = "<tr><td>" + siteRow +"排 </td>";
					
					for(var i = 0; i < leftSite; i++) {//填充左座位数
						tr = tr + "<td><img alt = '" + siteRow + "," + (i + 1) + "' src = 'images/1.png' width = '25px' height = '25px' onclick = 'choose(this)'/></td>";
					}
					for(var i = 0; i < middleBlank; i++) {//填充中间空格数
						
						tr = tr + "<td>&nbsp;&nbsp;&nbsp;</td>";
					}
					for(var i = 0; i < rightSite; i++ ) {//填充右边座位数
						tr = tr + "<td><img alt = '" + siteRow + "," + (Number(leftSite) + 1 + i) + "' src = 'images/1.png' width = '25px' height = '25px' onclick = 'choose(this)'/></td>";
					}
					
					tr = tr + "</tr>";
					
					//向总的座位排布字符串添加此行座位排布
					totalSiteStr += siteRow + ":" + siteCol + ";"  + leftSite + "(1)-" + middleBlank + "(0)-" + rightSite + "(1)" + "/";
					
				}
				
				//进行总和的累加
				totalSiteAmount += Number(siteCol);
				//向容器中添加当前行座位
				$("#siteTable").append(tr);
				//使当前行数加1
				$("#siteRow").val(++siteRow);
				//alert(totalSiteStr);
			}
		}
		
		/**检验列数是否输入**/
		function checkSiteCol() {
			
			var siteCol = $("#siteCol").val();
			if(siteCol == "" || siteCol == null) {
				return false;
			}else if(siteCol > maxSiteAmout){//每行最大数为34个座位
				return false;
			}
			return true;
		}
		
		/**检测对齐方式是否选中**/
		function checkAlignment() {
			
			var val = $("#sitePosition").val();
			if(val == -1) {
				return false;
			}
		
			return true;
		}
		
		
		
		
		
		/**获取左边空个数，中间空格数，右边空个数**/
		function getBlankNumber(siteAmount, alignment) {
			
			//alert("用户座位数:" + siteAmount+ ", 对齐方式:" + alignment);
			
			
			if(alignment == 2) {//居中对齐,返回左右空格数
				
				var leftSiteAmount = maxSiteAmout - siteAmount;
				if(leftSiteAmount % 2 == 0) {
					return (leftSiteAmount / 2) + "-" + (leftSiteAmount / 2);
				}else {
					
					return (Math.round(leftSiteAmount / 2) + 1) + "-" + (leftSiteAmount - ( Math.round(leftSiteAmount / 2) + 1));
				}
				
			}else if(alignment == 3) {//右对齐,返回左空格数
				
				var leftBlank = maxSiteAmout - siteAmount;
				return leftBlank;
				
			}else if(alignment == 4) {//两侧对齐,返回左座位数，中间空格数，右座位数
				
				var rightAmount = 0;
				if(siteAmount % 2 == 0) {
					return (siteAmount / 2) + "-" + (maxSiteAmout - siteAmount) + "-" + (siteAmount / 2);
				}else {
					
					return (Math.round(siteAmount / 2) + 1) + "-" + (maxSiteAmout - siteAmount) + "-" + (siteAmount - (Math.round(siteAmount / 2) + 1));
				}
			}
			//左对齐
			return siteAmount + "-" + (maxSiteAmout - siteAmount);
		}
			
		
		/**清空所有座位**/			
		function clearAllSite(){
		
			$("#siteTable").empty();
			$("#siteRow").val(1);
			siteRow = 1;
		}	
		
		/**座位表提交**/
		function submitSitePosition() {
			
			$.post('SetShowroomSiteServlet', 
				{"totalSiteStr" : totalSiteStr,
				"totalSiteAmount":totalSiteAmount,
				"showroomId": $("#showroomId").val()
				},
				function(returnedDate, status) {
					
					if(returnedDate > 0) {
						art.dialog({
							title:'提示',
							content:'添加成功',
						    lock: true,
						    icon:'succeed',
						    background: '#600', // 背景色
						    opacity: 0.67,	// 透明度
						    init: function () {
						    	var that = this, i = 2;
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
						
						setTimeout("gotoAddShowroomPage()", 2000);
					}else {
					
						art.dialog({
							title:'提示',
							content:'添加失败',
						    lock: true,
						    icon:'error',
						    background: '#600', // 背景色
						    opacity: 0.67,	// 透明度
						    init: function () {
						    	var that = this, i = 2;
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
					}
				});
		
		}
	
		function gotoAddShowroomPage() {
		
			window.location.assign("../showroom/add_showroom.jsp");
		}
	
	</script>
	
	
  </head>
  
  <body>
    <div>
    	影厅名称:<input type = "text" value = "<%= showroomName %>" readonly="readonly" disabled='disabled' />
    	&nbsp;
    	&nbsp;
    	影厅类型:<input type = "text" value = "<%= showroomType %>" readonly="readonly" disabled='disabled' />
    	<input type = "hidden" value = "<%= showroomId %>" id = "showroomId" name = "showroomId" />
    	<br />
    	<br />
    	<br />
    	行号:<input type = "text" id = "siteRow" name = "siteRow" value = "1" onkeyup="onlyNumber(this)" readonly="readonly" disabled='disabled'>
    	座位数:<input type = "text" id = "siteCol" name = "siteCol" onkeyup="onlyNumber(this)" placeholder="整数，最大为21">
    	位置:<select id = "sitePosition">
    			<option value = "-1">==请选择==</option>
    			<option value = "1">左对齐</option>
    			<option value = "2">居中对齐</option>
    			<option value = "3">右对齐</option>
    			<option value = "4">两侧对齐</option>
    		</select>
    	<input type = "button" value = "添加座位" onclick="addSite()" />
    	&nbsp;&nbsp;&nbsp;&nbsp;
    	<input type = "button" value = "清空座位" onclick="clearAllSite()"/>
    	<input type = "button" value = "添加完毕" onclick="submitSitePosition()"/>
   	</div>
    <br />
    <br />
    
    <div id = "siteContainer" style = "display:none">
    	<center>
    		<!-- 提示性信息开始 -->
    		<table>
				<tr>
					<td>
						<img src = "images/1.png" width = "25px" height = "25px" align = "top">可选的座位
					</td>
					<td>
						<img src = "images/3.png" width = "25px" height = "25px" align = "top">已售出的座位
					</td>
					<td>
						<img src = "images/2.png" width = "25px" height = "25px" align = "top">您选的座位
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td>
						<img src = "images/screen.png" width = "600px" height = "25px" />
					</td>
				</tr>
			</table>
			<br />
			<br />
			
			<!-- 提示性信息结束 -->
			
			<!-- 座位容器开始 -->
    		<table id = "siteTable">
		
    		</table>
    		<!-- 座位容器结束 -->
    		
    		
    	</center>
    </div>
  </body>
</html>
