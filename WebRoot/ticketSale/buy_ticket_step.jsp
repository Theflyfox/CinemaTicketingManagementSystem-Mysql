<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import = "com.suehon.util.GetNowDateAndTime" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	List<Map<String, Object>> list = (List<Map<String, Object>>)request.getAttribute("list");
	GetNowDateAndTime g = new GetNowDateAndTime();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title></title>
    
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
	<script charset="utf-8" src="js/jquery.settime.js"></script>
	<link href="css/step.css" rel="stylesheet" type="text/css" />
	<link href="artDialog4.1.6/skins/default.css" rel="stylesheet" type="text/css" />
	<link href="css/table_scroll1.css" type="text/css" rel="stylesheet" />
	<link href="css/table_scroll2.css" type="text/css" rel="stylesheet" />
	<script type="text/javascript" src="js/jquery.tablescroll.js"></script>
		
	<!-- 外部引入文件结束 -->
	
	<style type="text/css">
		
		#filmOnscreenTable th {width : 130px; }
		#filmOnscreenTable td {width : 130px; height:150px}
		.key{ color:red;};
	</style>
	
	

	<script>
		
		var chooseDateAndTime = "";
		//影厅id
		var checkedFilmId = -1;
		//选择的总座位数
		var chooseSiteNum = 0;
		//存储用户选择的座位位置数组
		var choosenSitePositionArr = new Array();
		
		/********************************流程前进部分开始***************************************/
		function one() {
			 
			 	if($("input:checked").length <= 0) {
			 		alert("请选择影片");
			 		return;
			 	}
				$("#one").hide();
				$("#two").show();
				//调用获取影片开场时间方法
				asyGetFilmOnscreenStartDateAndTime();
				//$("#xzfyt").attr("class","done");
				$("#xzfyt").attr("class","current_prev");
				$("#xzsyrq").attr("class","current");
			 
		}
	
		function two() {
			 
				$("#two").hide();
				$("#three").show();
				
	
				$("#xzfyt").attr("class","done");
				$("#xzsyrq").attr("class","current_prev");
				$("#xzyp").attr("class","current");
			 	
			 	asyDrawSite();
			 	//方法调用
			 	asySetFilmNameAndType();
			 	
			 	$("#tick_chooseen_info").css("display", "");
			 
		}
	
		function three() {
				
				if(choosenSitePositionArr.length <= 0) {
					
					art.dialog({
	    							title: '信息提示',
	    							content: '请选择座位！',
	    							icon: 'warning',
	    							lock: true,
	    							ok: function(){
	        							return true;
	    								}
								});
					return false;
				}
					 	
				$("#three").hide();
				$("#four").show();
	
	
				$("#xzfyt").attr("class","done");
				$("#xzsyrq").attr("class","done");
				$("#xzyp").attr("class","current_prev");
				$("#kcsj").attr("class","current");
			 	$("#tick_chooseen_info").css("display", "");
			 	//隐藏购票信息
			 	//$("#tick_chooseen_info").css("display", "");
			 	setShouldPayValue();
		}
	
		function four() {
			 
				$("#four").hide();
				$("#five").show();
	
				$("#xzfyt").attr("class","done");
				$("#xzsyrq").attr("class","done");
				$("#xzyp").attr("class","done");
				$("#kcsj").attr("class","current_prev");
				$("#srpj").attr("class","current");
				
				//调用异步付款
				payMoneyForTheTrade();
				
				prepareInfoForPrintTicket();
			 
		}
	
		function five() {
			 
				$("#four").hide();
	
				//$("#xzfyt").attr("class","done");
				//$("#xzsyrq").attr("class","done");
				//$("#xzyp").attr("class","done");
				//$("#kcsj").attr("class","done");
				//$("#kcsj").attr("class","current_prev");
				$("#srpj").attr("class","current");
			 
		}
	
		/********************************流程前进部分结束***************************************/
		
		/********************************流程返回部分开始***************************************/
	
		function reone() {
			 
				$("#one").show();
				$("#two").hide();
	
				$("#xzfyt").attr("class","current");
				$("#xzsyrq").attr("class","done");
			 
		}
		function retwo() {
			 
				$("#three").hide();
				$("#two").show();
	
				$("#xzfyt").attr("class","current_prev");
				$("#xzsyrq").attr("class","current");
				$("#xzyp").attr("class","");
				
				//隐藏购票信息
			 	$("#tick_chooseen_info").css("display", "none");
		}
	
		function rethree() {
			 
				$("#four").hide();
				$("#three").show();
	
				$("#xzfyt").attr("class","done");
				$("#xzsyrq").attr("class","current_prev");
				$("#xzyp").attr("class","current");
				$("#kcsj").attr("class","last");
			 
		}
		
		function refour() {
			 
				$("#five").hide();
				$("#four").show();
	
				$("#xzsyrq").attr("class","done");
				$("#xzyp").attr("class","current_prev");
				$("#kcsj").attr("class","current");
				$("#srpj").attr("class","last");
			 
		}
	
		/********************************返回部分结束***************************************/
		
		//被选择的影片id
		function checkIt(val, obj) {
			
			if(obj.checked) {
				checkedFilmId = val;
			}
			//alert(checkedFilmId);
		}
	
		function chooseDate(obj) {
			
			$(obj).css("border", "2px solid red");
			//为选择的影片开场日期和时间赋值
			chooseDateAndTime = obj.innerHTML;
			//设置提示性信息，场次提示
			$("#changCi").text(chooseDateAndTime);
			//自动执行下一步
			//two();
			//alert(obj.innerHTML);
		}
	
		//异步获取影片的放映日期和时间
		function asyGetFilmOnscreenStartDateAndTime() {
		
				$.post('GetFilmOnscreenStartDateAndTimeServlet',
						{"filmId": checkedFilmId},
						
						function(returnedData, status) {
							
							$("#showTime").empty();//先移除目前的td子元素选项
							
							var html = ""; 
							var resultArray = $.parseJSON(returnedData);
							
							//设置影片价格值
							$("#filmOnscreenPrice").text(resultArray[0].onscreenprice);
							//设置上映计划id的值
							$("#onscreenIdValue").val(resultArray[0].onscreenid);
							
							for(var i = 0; i < resultArray.length; i++) {//添加新的子元素
								
								var result = resultArray[i];
								
								html += "<div style = 'white-space:nowrap;border :1px solid blue; display :inline' onclick='chooseDate(this)'>" + result.onscreendate +  " " + result.onscreenstarttime + "</div>" + "&nbsp;&nbsp;&nbsp;";
								
								if( (i + 1) % 4 == 0) {
									html += "<br />";
								}
								
							}
							
							$("#showTime").append(html);
						});
		}
	
		/**异步获取座位并画出**/	
		function asyDrawSite() {
		
			$.post('DrawSiteServlet',
			
				{"filmId" : checkedFilmId, startDateAndTime: chooseDateAndTime}, 
				function(returnedData, status) {
					
					$("#siteTable").empty();//先移除目前的子元素选项
							
				var resultArray = $.parseJSON(returnedData);
				
				//设置影厅名提示性信息
				$("#showroomName").text(resultArray[0].showroomname);
				
				$("#showroomId").val( resultArray[resultArray.length - 1].showromid);
				
				
				var tr;
				var result;
				var siteRow;
				var siteColStr;
				var leftNum;
				var leftFlag;
				var middleNum;
				var middleFlag;
				var rightNum;
				var rightFlag;
				var firstStr;
				var secondStr;
				var thirdStr;
				
				
				for(var i = 0; i < resultArray.length - 1; i++) {//循环取出每一行的分布数据
					
					tr = "";
					result = resultArray[i];
					
					siteRow = new String( result.siterow);
					siteColStr = new String (result.sitecol);//每一行的作为分布字符串格式为: "0(0)-32(1)-0(0)"
					
					firstStr = new String (siteColStr.split("-")[0]);
					
					secondStr = new String(siteColStr.split("-")[1]);
					
					thirdStr = new String (siteColStr.split("-")[2]);
					
					leftNum = Number(firstStr.substring(0, firstStr.indexOf("(")));
					leftFlag = Number (firstStr.substring(firstStr.indexOf("(") + 1, firstStr.length - 1));
					
					middleNum = Number(secondStr.substring(0, secondStr.indexOf("(")));
					middleFlag = Number(secondStr.substring(secondStr.indexOf("(") + 1, secondStr.length - 1));
					
					rightNum = Number(thirdStr.substring(0, thirdStr.indexOf("(")));
					rightFlag = Number(thirdStr.substring(thirdStr.indexOf("(") + 1, thirdStr.length - 1));
					
					
					//alert( (rightNum - 1) + "; " + rightFlag);
					
					tr = "<tr><td width = '40px'>" + siteRow + "</td>";
					
					
					for(var j = 0; j < leftNum; j++) {
						
						if(leftFlag == 0) {
							
							tr = tr + "<td>&nbsp;&nbsp;&nbsp;</td>";
						}else {
						
							tr = tr + "<td><img id = '" + siteRow + "," + (j + 1) + "' src = 'images/1.png' width = '25px' height = '25px' onclick = 'chooseSite(this)'/></td>";
						}
					}
					
					
					for(var j = 0; j < middleNum; j++) {
						
						if(middleFlag == 0) {
							
							tr = tr + "<td>&nbsp;&nbsp;&nbsp;</td>";
						}else {
						
							tr = tr + "<td><img id = '" + siteRow + "," + (leftNum  + j + 1) + "' src = 'images/1.png' width = '25px' height = '25px' onclick = 'chooseSite(this)'/></td>";
						}
					}
					
					for(var j = 0; j < rightNum; j++) {
						
						if(rightFlag == 0) {
							
							tr = tr + "<td>&nbsp;&nbsp;&nbsp;</td>";
						}else {
						
							tr = tr + "<td><img id = '" + siteRow + "," + (leftNum  + middleNum + j + 1) + "' src = 'images/1.png' width = '25px' height = '25px' onclick = 'chooseSite(this)'/></td>";
						}
					
					}
					
					//添加tr
					$("#siteTable").append(tr);
					}
				});
				
				setTimeout("asyRedrawSite()", 100);	
		}

		//重画座位，将已经售出的位置替换为不可选状态
		function asyRedrawSite() {
		
			$.post('GetAlreadySoldoutTicketServlet',
					{
					 "onscreenId":	$("#onscreenIdValue").val()
					},
				
					function(returnedData, status) {
						
						var resultArray = $.parseJSON(returnedData);
						
						 chageSite(resultArray);
					});
		}
		
		//将已卖出的座位替换为已卖出
		function chageSite(resultArray) {
				
			/*	
			var targetId = new String( row + "," + col );
			var obj = document.getElementById(targetId);
			obj.src = "images/3.png";
			*/
			var row = "";
			var col = "";
			var targetId = "";
			var obj = "";
			
			for(var i = 0; i < resultArray.length; i++) {
				
				row = new String(resultArray[i].siterow);
				col = new String(resultArray[i].sitecol);
				
				targetId = new String( (row + "," + col) );
//alert(targetId);
				obj = document.getElementById(targetId);
				obj.src = "images/3.png";
			}
		}
		

		//设置已选座位提示
		function setPosition(val) {
			
			var row = val.substring(0, val.indexOf(","));
			var col = val.substring(val.indexOf(",") + 1, val.length);
			
			var divStr = "<div style = 'overflow:hidden;width:54px; display:inline; border: 1px solid green' name = '" + row + "," + col + "'>" + row + "排"+ col + "座" +"</div><br/>";
			//alert("字符串 " + divStr);
			$("#choosenSitePosition").append(divStr);
			//alert(val);
			//alert(row + "; " + col);
		}
		
		//请除单个座位提示
		function removeSitePosition(val) {
		
			//var row = val.substring(0, val.indexOf(","));
			//var col = val.substring(val.indexOf(",") + 1, val.length);
			$("div[name=" + val + "]").next('br').remove();
			$("div[name=" + val + "]").remove();
		}
	
	
	
		//用户每单击一次座位执行的函数
		function chooseSite(obj) {
				
			var OriginalFileName = new String(obj.src);
			var place = obj.id;
			var finalFileName = OriginalFileName.substring(OriginalFileName.lastIndexOf("/") + 1, OriginalFileName.length);
			
			if(chooseSiteNum > 4 && finalFileName == "1.png") {//单词购买超过5张，给出提示，方法立即返回。
				dialog = art.dialog({
								title:"信息提示",
								content:"单次最多购买 5 张!",
							    lock: true,
							    icon:'warning',
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
				return;
			}
			
			if(finalFileName == "1.png") {//预订
				//将该座位状态改为“正在预订”
				obj.src = "images/2.png";
				//将购买票数 +1
				
				choosenSitePositionArr.push(obj.id);
				
				++chooseSiteNum;
				setPosition(obj.id);
				dmlTicketTrade(1, obj.id);
			}else if(finalFileName == "2.png"){//取消预订该座位
					
				//将该座位状态改为“正在预订”
				obj.src = "images/1.png";
				//将购买票数 -1
				--chooseSiteNum;
				removeSitePosition(obj.id);
				
				dmlTicketTrade(2, obj.id);
				
				
				var PrepareRemove = obj.id;//被取消的座位的id
				var position = -1; 
				for(var i = 0; i < choosenSitePositionArr.length; i++) {
					if(choosenSitePositionArr[i] == PrepareRemove) {
						position = i;
						break;
					}
				}
				//座位数组中移除这个座位
				choosenSitePositionArr.splice(position,1);
				
			}
			
			//将每一个座位位置用""-"隔开
			var str = choosenSitePositionArr.join("-");
			$("#choosenSitePositionArr").val(str);
			//alert("选中座位号:" + obj.alt);
			//alert(chooseSiteNum);
			setChoosenSiteNum(chooseSiteNum);
			setTotalMoney();
			//alert(obj.id);
			
		}
		
		
		function dmlTicketTrade(flag, sitePosition) {
			
			$.post('DmlTicketTradeServlet',
			
					{"flag":flag,//标志，1为预订，2为取消
					"sitePosition" :sitePosition, 
					"onscreenId" :$("#onscreenIdValue").val(),
					},
					
					function(returnedDate, status) {
					
					});
		}
		
		
		//设置已购买票数提示
		function setChoosenSiteNum(val) {
		
			$("#choosenSiteNum").text(val);
		}
		
		//设置共计金额
		function setTotalMoney() {
			
			var totalMoney = (Number($("#choosenSiteNum").text())) * (Number($("#filmOnscreenPrice").text()));
			
			$("#totalMoney").text(totalMoney);
		
		}
		
		
	
		//设置影片名和类型，还有海报
		function asySetFilmNameAndType() {
		
			$.post('GetFilmOtherInfoServlet', 
				{"filmId": checkedFilmId}, 
				function(returnedData, status) {
					
					var resultArray = $.parseJSON(returnedData);
					var postStr = resultArray[0].filmpost;
					var flag = postStr.indexOf("/");
					var post;
					if(flag > 0) {
						post = postStr.substring(0, flag);
					}else {
					
						post = postStr;
					}
					
					//设置海报内容
					document.getElementById("chooseFilmPost").src = "posts/" + post;
					//设置影片类型
					$("#choosenFilmType").text(resultArray[0].filetype);
					//设置影片名
					$("#choosenFilmName").text(resultArray[0].filmname);
					
				});
		}
		
		function setShouldPayValue() {
			
			//alert($("#totalMoney").text());
			$("#shouldPayNotice").val( $("#totalMoney").text() );
			$("#realPay").val( $("#totalMoney").text() );
		
		}
		
		function setRealPayValue(money) {
		
			$("#realPay").val(money);
		
		}
		
		
		//验证会员是否存在
		function checkVipNo() {
			
			if($("#vipNo").val().length > 15) {
				
				$.post('CheckVipServlet',
					
					{"vipNo":$("#vipNo").val()},
					
					function(returnedData, status) {
						
						if(returnedData > 1) {//存在,将否是会员的标识置为数字 1;并修改实际支付金额
						
								$("#isVipFlag").val(1);
								$("#isVipNotice").empty();
								$("#isVipNotice").append("<img src = './images/succeed.png' width = '20' height = '20'>");
								
								var shouldPay = $("#shouldPayNotice").val();
								var discount = returnedData;
								$("#discount").val( (Number(discount) / 100));
								var finalMoney = getSinglePriceafterdiscount(discount) * (Number($("#choosenSiteNum").text()));
								setRealPayValue( finalMoney );
								
								//修改底部红线内
								$("#totalMoney").text(finalMoney);
								$("#filmOnscreenPrice").text( getSinglePriceafterdiscount(discount) );
								
						}else {
							$("#isVipNotice").empty();
							$("#isVipNotice").append("<font color = 'red'>会员号不存在,不能享受优惠!</font>");
						}
					});
				
			}
			
		
		}
		
		//获取对应打折力度后的单张票价格
		function getSinglePriceafterdiscount(discountLevel) {
		
			var singlePrice = Number( $("#filmOnscreenPrice").text() ) * ( discountLevel / 100);
			return Math.ceil(singlePrice);//向上取整
		}
		
		
		
		
		
		
		//付款
		function payMoneyForTheTrade() {
			
			if($("#isVipFlag").val() == 1) {//会员
				
				$.post("PayMonyForTheTradeServlet",
				
					{"choosenSitePositionStr":$("#choosenSitePositionArr").val(),
						"onscreenId" : $("#onscreenIdValue").val(),
						"showroomId" :$("#showroomId").val(),
						"shouldPay" :$("#shouldPayNotice").val(),
						"realPay":$("#realPay").val(),
						"vipNo": $("#vipNo").val()
						},
					function(returnedData, status) {
					
											
					});
				
			}else {//非会员，非会员时传递到servlet端的表示为vipNo = -1
			
					$.post("PayMonyForTheTradeServlet",
				
					{"choosenSitePositionStr":$("#choosenSitePositionArr").val(),
						"onscreenId" : $("#onscreenIdValue").val(),
						"showroomId" :$("#showroomId").val(),
						"shouldPay" :$("#shouldPayNotice").val(),
						"realPay":$("#realPay").val(),
						"vipNo": -1
						},
					function(returnedData, status) {
					
						
					
					});
			}
		}		
		
		var tdcu = "";
		//准备打印每一张电影票
		function prepareInfoForPrintTicket() {
			
			var csps = $("#choosenSitePositionArr").val().split("-");			
			var count = csps.length;
			var ticket = "";
			//var sitePosition = "";
			var postSrc = document.getElementById("chooseFilmPost").src;
			var start = postSrc.lastIndexOf("/");
			var post = postSrc.substring(start, postSrc.length);
			var filmName = $("#choosenFilmName").text();
			var filmType = $("#choosenFilmType").text();
			var ChangCi = $("#changCi").text();
			var showroomName = $("#showroomName").text();
			var singalTicketPrice = $("#filmOnscreenPrice").text();
			
			var html = "";
			
			for(var i = 0; i < count; i++) {
				
				var targetName = csps[i];
				
				var sitePosition = document.getElementsByName(targetName)[0].innerHTML;
				
				//异步获取二维码图片途径
				$.post('GetTwoDemensionImgServlet',
						{	"showroomName":showroomName,
							"sitePosition":sitePosition,
							"filmType":filmType,
							"filmName":filmName,
							"ChangCi":ChangCi,
							"singalTicketPrice":singalTicketPrice,
							"postSrc":post
						}, 
						
						function(returnedData, status) {
							
							var resultArray = $.parseJSON(returnedData);
							//var url = resultArray[0].URL;
							
							
							html = "<!--startprint--><div style = 'border:1px blue dotted; width:410px;height:230px'><br /><img id = 'test' src = 'tdimage.jpg'" +  " width = '60' height = '60' /><table border = '0' cellspacing = '0'><caption align='top'><b>长春开心影院</b></caption><tr><th class = 'key'>影厅:</th><td class = 'value'>" + showroomName + "</td><th class = 'key'>座位:</th>	<td class = 'value'>" + resultArray[0].SITE + "</td></tr><tr><th class = 'key'>类别:</th><td>" + filmType +"</td></tr><tr><th class = 'key'>片名:</th><td  class = 'value' colspan = '5'>" + filmName +"</td></tr><tr><th class = 'key'>日期:</th><td class = 'value'>" + ChangCi +"</td ><th class = 'key'>票价:</th><td class = 'value'>" + singalTicketPrice + "</td></tr></table></div><br /><br /><!--endprint-->";
							$("#ticketCon").append(html);
							
							//document.getElementById("test").src = returnedData;
							//tdcu = returnedData;
						});
			}
		}
	
	
	
	</script>
	
  </head>
  
  <body>
    
	<br />
    <br />
    <p align = "center"><font face = "黑体" size = "5" color = "black">快速购票</font></p>
    
	<div class="formbox">
		<div class="flow_steps">
			<ul>
				<li id="xzfyt" class="current">&nbsp;&nbsp;选择影片</li>
				<li id="xzsyrq" >&nbsp;&nbsp;&nbsp;选择日期</li>
				<li id="xzyp">&nbsp;&nbsp;&nbsp;选择座位</li>
				<li id="kcsj">&nbsp;&nbsp;应交金额</li>
				<li id="srpj" class="last">&nbsp;&nbsp;&nbsp;打印影票</li>
			</ul>
		</div>

		<div class="formcon">

			<!--第一个开始-->

			<div id="one">
				<!-- 列出有上映计划的电影 -->
				<table align="center" border = "1" id = "filmOnscreenTable"> 
					<tr>
						<th>海报</th>
						<th>名称</th>
						<th>导演</th>
						<th>简介</th>
						<th>时长</th>
						<th>操作</th>
					</tr>
					<%
					String postFileName;
          			String temp = "";
					for(Map<String, Object> map : list) {
						
						if(map.get("filmpost") != null ) {
          					temp = map.get("filmpost").toString();
          				}
          				
          				if(temp.indexOf("/") > 0) {
          					postFileName = temp.substring(0, temp.indexOf("/"));
          				}else {
          					postFileName = temp;
          				}
					
					%>
					<tr>
						<td>
							<img width = "135px" height = "230px" src ="posts/<%=postFileName %>"  alt = "图片"/>
						</td>
						<td><%=map.get("filmname") %></td>
						<td><%= map.get("filmdirector") %></td>
						<td><%=	map.get("filmcontent").toString().substring(0, 50) %>...</td>
						<td><%=map.get("filmlasttime") %> 分钟</td>
						<td><input type = "radio" value = "<%=map.get("filmid") %>" width = "50px" name = "choose" onclick="checkIt(<%=map.get("filmid") %>, this)"/></td>
					</tr>
					<%} %>
				</table>
				
				<table>
					
				
				</table>
				
				<br />
				<br />
				<br />			
							
							
				<div align = "center">
					<button type="button" onclick="one()">下一步</button>
				</div>
			</div>
			<!--第一个结束-->



			<!--第二个开始-->

			<div id="two" style="display:none">
				
				<table align="center">
					<tr>
						<td align="right" width="140px">观影日期:</td>
						<td id = "showTime"></td>
						<td id = "td_1"></td>
					</tr>
					
				</table>
				<div >
					<center>			
						<button type="button" onclick="reone()">上一步</button>
						&nbsp;&nbsp;&nbsp;&nbsp;
						<button type="button" onclick="two()">下一步</button>
					</center>
				</div>
				
			</div>

			<!--第二个结束-->

			<!--第三个开始-->

			<div id="three" style="display:none">
				
				<div id = "siteContainer">
    				<center>
			    		<!-- 提示性信息开始 -->
			    		<table>
			    			
			    			<tr>
			    				<td></td>
			    				<td>
			    					<font color = "blue">
			    						<b><span id = "showroomName"></span></b>
			    					</font>
			    				</td>
			    			</tr>
			    		
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
				<br />
				<br />
				<div>
					<center>
						<button type="button" onclick="retwo()">上一步</button>&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" onclick="three()">下一步</button>
					</center>
				</div>
			</div>

			<!--第三个结束-->

			<!--第四个开始-->

			<div id="four" style="display:none">
				<table align="center">
					<tr>
						<td align="right" width="140px">收取金额:</td>
						<td>
							<input type = "text" disabled="disabled" id = "shouldPayNotice" /><small>单位:元</small>
						</td>
					</tr>
					
					<tr>
						<td align="right" width="140px"><b>会员号:</b></td>
						<td>
							<input type = "text" id = "vipNo" onkeyup="javascript:this.value = this.value.replace(/[^\d]/g,'');checkVipNo()" maxlength="16" placeholder = "请输入会员号"/>
						</td>
						<td id = "isVipNotice" align="left" width="140px"></td>
						<td><input type = "hidden" id = "isVipFlag" value = "-1"></td>
					</tr>
					<!-- 
					<tr>
						<td align="right" width="140px">会员等级:</td>
						<td><input type = "text" id = "vipLevel" disabled="disabled" value = "0"></td>
					</tr>
					 -->
					<tr>
						<td align="right" width="140px">享受折扣:</td>
						<td><input type = "text" id = "discount" disabled="disabled" value = "0"></td>
					</tr>
					<tr>
						<td align="right">实际应收金额:</td>
						<td><input type = "text" id = "realPay" disabled="disabled"/></td>
					</tr>
					
					<tr>
						<td></td> 
						<td>
							<button type="button" onclick="rethree()">上一步</button>
							&nbsp;&nbsp;&nbsp;&nbsp;
							<button type="button" onclick="four()">下一步</button>
						</td>
						<td id = "td_4"></td>
					</tr>
				</table>
			</div>

			<!--第四个结束-->

			<!--第五个开始-->
				<div id="five" style="display:none">
					<center>
						<div id = "ticketCon">
						
						</div>
					</center>
					<div>
						<center>
							<input type = "button" value = "打印影票" onclick = "alert('prepare to print film-ticket')"/>
						</center>
					</div>
				</div>
			
			<!--第五个结束-->
		</div>
	</div>
	
	<!-- 票信息 -->
	<div style="text-align:center; width:790; clear:both; margin-left:160px ;margin-bottom : 200px; border: 1px solid red; display:none" id = "tick_chooseen_info">
		<table>
			<tr>
				<td style = "text-align:center; width :120px">海报</td>
				<td style = "text-align:center; width :120px">影片名</td>
				<td style = "text-align:center; width :120px">类型</td>
				<td style = "text-align:center; width :120px">场次</td>
				<td style = "text-align:center; width :80px">座位</td>
				<td style = "text-align:center; width :120px">票价</td>
				<td style = "text-align:center; width :120px">票数</td>
				<td style = "text-align:center; width :120px">总计</td>
			</tr>
			<tr>
				<td><img src = "" alt = "海报" id = "chooseFilmPost" width = "120px" height = "140px" /></td>
				<th><span id = "choosenFilmName"></span></th>
				<th><span id = "choosenFilmType"></span></th>
				<th><span id = "changCi"></span></th>
				<th><div id = "choosenSitePosition"></div></th>
				<th><span id = "filmOnscreenPrice"></span>元/张</th>
				<th><span id = "choosenSiteNum">0</span></th>
				<th>￥<span id = "totalMoney">0</span></th>
			</tr>
			
		</table>
	</div>
    	<input type = "hidden" id = "onscreenIdValue">
		<input type = "hidden" id = "choosenSitePositionArr" />
		<input type = "hidden" id = "showroomId" />
  </body>
</html>
