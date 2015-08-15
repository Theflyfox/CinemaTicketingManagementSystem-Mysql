<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'add_film_to_screen.jsp' starting page</title>
    
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
	<link href="css/step.css" rel="stylesheet" type="text/css" />
	<link href="artDialog4.1.6/skins/default.css" rel="stylesheet" type="text/css" />
	<script charset="utf-8" src="js/jquery.settime.js"></script>
	
	<!-- 外部引入文件结束 -->


	<script type="text/javascript">
	
	/********************************流程前进部分开始***************************************/
	function one() {
		 
			$("#one").hide();
			$("#two").show();
			
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
		 
	}

	function three() {
		 
			$("#three").hide();
			$("#four").show();


			$("#xzfyt").attr("class","done");
			$("#xzsyrq").attr("class","done");
			$("#xzyp").attr("class","current_prev");
			$("#kcsj").attr("class","current");
		 
	}

	function four() {
		 
			$("#four").hide();
			$("#five").show();

			$("#xzfyt").attr("class","done");
			$("#xzsyrq").attr("class","done");
			$("#xzyp").attr("class","done");
			$("#kcsj").attr("class","current_prev");
			$("#srpj").attr("class","current");
		 
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
	
	
	/********************************异步获取信息开始***************************************/
	
		/**异步获取放影厅名和类型**/
		function prePareSelectContent() {
			$.post("GetShowroomNameAndTypeServlet",{},
				function (returnedData, status) {
					
					$("#showroomName option").remove();//先移除目前的option子元素选项
					$("#showroomName").append("<option value = '-1'>=======请选择=======</option>");
					var resultArray = $.parseJSON(returnedData);
					for(var i = 0; i < resultArray.length; i++) {//添加新的option子元素
						
						var result = resultArray[i];
						//alert(result.ID);
						$("#showroomName").append("<option value = '" +result.showroomid + "'>"+result.showroomname +"("+  result.ddcontent +")</option>");
					}						
				}
			);
		}
	
		
		/**异步获取影片名和其id**/
		function prePareChooseFilmContent() {
		
			$.post("GetFilmNameAndIdServlet",{},
				function (returnedData, status) {
					
					$("#chooseFilm option").remove();//先移除目前的option子元素选项
					$("#chooseFilm").append("<option value = '-1'>========请选择影片========</option>");
					var resultArray = $.parseJSON(returnedData);
					if(resultArray.length <= 0) {//当前月份无可添加影片
						$("#chooseFilm").append("<option value = '-2'>当前无可添加影片，请先添加影片</option>");
					}else {
						for(var i = 0; i < resultArray.length; i++) {//添加新的option子元素
						
						var result = resultArray[i];
						//alert(result.ID);
						$("#chooseFilm").append("<option value = '" +result.filmid + "'>" + result.filmname + "</option>");
					}
					}
											
				}
			);
		}
	
	/********************************异步获取信息结束***************************************/
	
	
	/***********************************客户端验证开始*********************************************/
	
	/**清空提示信息**/
	function onfocusText(id) {
		document.getElementById(id).innerHTML = "";
	}
	
	/**验证影厅名称**/
	function validateshowroomName() {
	
		var obj = document.getElementById("showroomName");
		var text = document.getElementById("td_1");
		if(obj.value.trim() == "" || obj.value == -1) {
			//alert("用户名 不能为空！");
			text.innerHTML = "<font color = 'red' size = '2'>请选择放影厅!</font>";
			return false;
		}
		
		text.innerHTML = "<img src = './images/succeed.png' width = '20' height = '20'> ";
		return true;
	}
	
	/**验证上映日期**/
	function validateFilmOnscreenDate() {
	
		var obj = document.getElementById("filmOnscreenDate");
		var text = document.getElementById("td_2");
		if(obj.value.trim() == "" || obj.value == null) {
			//alert("用户名 不能为空！");
			text.innerHTML = "<font color = 'red' size = '2'>请选择上映日期!</font>";
			return false;
		}
		
		text.innerHTML = "<img src = './images/succeed.png' width = '20' height = '20'> ";
		return true;
	}
	
	/**验证选择影片**/
	function validateFilmOnscreen() {
	
		var obj = document.getElementById("chooseFilm");
		var text = document.getElementById("td_3");
		if(obj.value.trim() == -1 || obj.value == "") {
			//alert("用户名 不能为空！");
			text.innerHTML = "<font color = 'red' size = '2'>请选择影片!</font>";
			return false;
		}
		
		text.innerHTML = "<img src = './images/succeed.png' width = '20' height = '20'> ";
		return true;
	}
	
	/**验证上开场时间**/
	function validateStartTime() {
	
		var obj = document.getElementById("startTime");
		var text = document.getElementById("td_4");
		if(obj.value.trim() == "" || obj.value == null) {
			//alert("用户名 不能为空！");
			text.innerHTML = "<font color = 'red' size = '2'>请选择上映日期!</font>";
			return false;
		}
		
		text.innerHTML = "<img src = './images/succeed.png' width = '20' height = '20'> ";
		return true;
	}
	
	/**验证票价**/
	function validateFilmPrice() {
	
		var obj = document.getElementById("filmPrice");
		var text = document.getElementById("td_5");
		if(obj.value.trim() == "" || obj.value == null) {
			//alert("用户名 不能为空！");
			text.innerHTML = "<font color = 'red' size = '2'>请输入票价!</font>";
			return false;
		}
		
		text.innerHTML = "<img src = './images/succeed.png' width = '20' height = '20'> ";
		return true;
	}
	
	/**异步获取影片其他信息**/
	function showOntherFilmInfo(obj) {
	
		if(obj.value > 0) {
		
			$.post("GetFilmOtherInfoServlet",{filmId: obj.value},
				function (returnedData, status) {
					
					var resultArray = $.parseJSON(returnedData);
					
					document.getElementById("filmType").value = resultArray[0].filetype;
					document.getElementById("filmLastTime").value = resultArray[0].filmlasttime;
					document.getElementById("filmLanguage").value = resultArray[0].filmlanguage;
				}
			);
		}
	}
	
	
	function checkAll() {
	
		return validateshowroomName() && validateFilmOnscreenDate() && validateFilmOnscreen() && validateStartTime() && validateFilmPrice();
	
	
	
	}
			
	/***********************************客户端验证结束*********************************************/
	
	
	
	/**时间选取**/
	function pickTime() {
	
		var date = new Date();
		var nowYear = date.getFullYear();//当前年
		var nowMonth = date.getMonth() + 1;//当前月
		var nowDay = date.getDate();//当前日
		var nowHour = date.getHours();//当前时
		//var mins = date.getMinutes();//当前分
		//var secs = date.getSeconds();//当前秒
		//startTime
		var inputDateStr = $("#filmOnscreenDate").val();//用户输入的日期
		var inputDateArray = inputDateStr.split("-");
		var inputYear = inputDateArray[0];
		var inputMonth = inputDateArray[1];
		var inputDay = inputDateArray[2];
		
		//如果是当前如期,设置可选时间为当前时间之后
		if(inputMonth == nowMonth && inputDay == nowDay &&  inputYear == nowYear) {
			//alert("same day");
			$('#startTime').setTime({
						    drag:true,
						    h:[nowHour,23],
						    i:[0,59],
						    s:[0,59],
						    a:0.05,
						    constraint:'',
						    'starteffect': function(d){
						    	$('#msg').html(d[0]);
						    },
						    'onmove':function(e){
						    	$('#msg').html(e[0] + '/' + e[1]);
						    },
						    zindex:'0',
						    'cursor':'move',
						    'area':[[50,600],[10 ,5000]],
						    'callback':function(){
						    //alert(1)
						    }
						});
		}else {
		
			//alert("not same day");
			$('#startTime').setTime();
		
		}
		
		if($("#startTime").attr("value") != "") {
			getEndTime();
		}
		
		
	}
	
	
	/**设置影片结束时间输入框的值**/
	function setEndTime() {
		
			getEndTime();
	}
	
	
	/**获取影片结束时间**/
	function getEndTime() {

					
			var startTimeStr =  $("#filmOnscreenDate").val() + " " + $("#startTime").attr("value");
			
			//alert(startTimeStr);
			
			
			//开始的年份
			var startYear = parseInt( startTimeStr.substring(0, startTimeStr.indexOf("-")));
			
			//开始的月份
			var startMon = parseInt(startTimeStr.substring(startTimeStr.indexOf("-") + 1, startTimeStr.lastIndexOf("-")));
			
			//开始的日
			var startDay = parseInt(startTimeStr.substring(startTimeStr.lastIndexOf("-") + 1, startTimeStr.lastIndexOf("-") + 3));				

			
			//开始时的时
			var startHour = parseInt( startTimeStr.substring(startTimeStr.indexOf(":") -2, startTimeStr.indexOf(":")));
			
			//开始时的分
			var startMins = parseInt(startTimeStr.substring(startTimeStr.indexOf(":") + 1, startTimeStr.length));

			//开始时的秒
			var startSec = parseInt(startTimeStr.substring(startTimeStr.lastIndexOf(":") + 1, startTimeStr.length));
			
			//alert(startYear + "年" + startMon + "月" + startDay + "日");
			//alert(startHour + "时" + startMins + "分" + startSec + "秒");
			
			//按照输入日期生成开始日期sd
			var sd = new Date();
				
			sd.setFullYear(startYear);
			sd.setMonth(startMon - 1);
			sd.setDate(startDay);
			sd.setHours(startHour);
			sd.setMinutes(startMins);
			sd.setSeconds(startSec);
			
			//电影时长(单位:分钟)
			var distenceMins = parseInt( $("#filmLastTime").val() );


			//结束时间距离起点的毫秒数
			var endMsec = sd.getTime() + distenceMins * 60 * 1000;
				
			//alert(endMsec);
			
			//按照结束时间距离起点毫秒数生成结束Date对象
			var endDate = new Date();
			endDate.setTime(endMsec);
			

			//获取结束时的年、月、日、时、分、秒
			var endYear = endDate.getFullYear();
			var endMon = (endDate.getMonth() + 1) > 9 ? (endDate.getMonth() + 1) : "0" + (endDate.getMonth() + 1);
			var endDay = endDate.getDate() > 9 ? endDate.getDate() : "0" + endDate.getDate();
			var endHour = endDate.getHours() > 9 ? endDate.getHours() : "0" + endDate.getHours();
			var endMins = endDate.getMinutes() > 9 ? endDate.getMinutes() : "0" + endDate.getMinutes();
			var endSec = endDate.getSeconds() > 9 ? endDate.getSeconds() : "0" + endDate.getSeconds();

			//alert(endYear + "年" + endMon + "月" + endDay + "日");
			//alert(endHour + "时" + endMins + "分" + endSec + "秒");

			var endInputValue = endYear + "-" + endMon + "-" + endDay + " " + endHour + ":" + endMins + ":" + endSec;

			$("#endTime").val(endInputValue);
		}
	
	
	
	
	
	/**页面提交**/
	function submitPlan() {
		
			var dialog;
			var timer;
			var isReady = false;
			isReady = checkAll();
			
			//所有信息都填写完整,可以正常提交
			if(isReady) {
			
				$.post(
					'AddFilmOnscreenServlet',
					{
						showroomId:$("#showroomName").val(), 
						filmOnscreenDate: $("#filmOnscreenDate").val(), 
						chooseFilmId: $("#chooseFilm").val(),
						startTime: $("#startTime").val(),
						endTime: $("#endTime").val(),
						filmPrice: $("#filmPrice").val()
					},
					
					function(returnedDate, status){
					
						if(-1 == returnedDate) {
						
								dialog = art.dialog({
									title:"信息提示",
									content:"计划已存在,请不要重复添加!",
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
						}else if(returnedDate == -2){
						
								dialog = art.dialog({
									title:"信息提示",
									content:"添加失败,请重新添加!",
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
							
						}else if(returnedDate == -3) {
						
							dialog = art.dialog({
									title:"信息提示",
									content:"该影厅在该时间段正在上映影片,添加失败!",
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
						
						}else if(returnedDate == 1) {
							
							
								dialog = art.dialog({
									title:"信息提示",
									content:"添加成功!",
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
						//添加成功，重新载入页面，供用户再次添加上映计划
						//window.location.assign("onscreen/add_film_to_screen.jsp");
							setTimeout("init()", 2000);
						}
				});
			}
	}
	
	
	function init() {
		
		window.location.assign("../onscreen/add_film_to_screen.jsp");
		
	} 
	
	
	
	
	
</script>
	


  </head>
  
  <body onload="prePareSelectContent();prePareChooseFilmContent()">
    <br />
    <br />
    <p align = "center"><font face = "黑体" size = "5" color = "black">添加上映计划</font></p>
    
    
   
	<div class="formbox">
		<div class="flow_steps">
			<ul>
				<li id="xzfyt" class="current">选择放映厅</li>
				<li id="xzsyrq" >选择上映日期</li>
				<li id="xzyp">选择影片</li>
				<li id="kcsj">开场时间</li>
				<li id="srpj" class="last">输入票价</li>
			</ul>
		</div>

		
			
		<div class="formcon">

			<!--第一个开始-->

			<div id="one">
				<table align="center">
					<tr>
						<td align="right" width="140px">影厅名:</td>
						<td>
							<select id = "showroomName" onchange="validateshowroomName(this);" onfocus="onfocusText('td_1')">
								<option value = "-1">=======请选择=======</option>
							</select>
						</td>
						<td id = "td_1"></td>
					</tr>
					
					
					<tr>
						<td></td>
						<td>
							<button type="button" onclick="one()">下一步</button>
						</td>
					</tr>
				</table>
			</div>
			<!--第一个结束-->

			<!--第二个开始-->

			<div id="two" style="display:none">
				<table align="center">
					<tr>
						<td align="right" width="140px">上映日期:</td>
						<td>
							<input type = "text" size = "43"  class = "Wdate" name = "filmOnscreenDate"  id = "filmOnscreenDate" onclick="WdatePicker({minDate:'%y-%M-{%d}'})" onchange="validateFilmOnscreenDate(this)" onfocus="onfocusText('td_2')" />
						</td>
						<td id = "td_2"></td>
					</tr>
					<tr>
						<td></td> 
						<td>
							<button type="button" onclick="reone()">上一步</button>
							&nbsp;&nbsp;&nbsp;&nbsp;
							<button type="button" onclick="two()">下一步</button>
						</td>
					</tr>
				</table>
			</div>

			<!--第二个结束-->

			<!--第三个开始-->

			<div id="three" style="display:none">
				<table align="center">
					<tr>
						<td align="right" width="140px">选择影片:</td>
						<td>
							<select id = "chooseFilm"  onchange="showOntherFilmInfo(this)" onfocus="onfocusText('td_3')">
								<option value = "-1">========请选择影片========</option>
							</select>
						</td>
						<td id = "td_3"></td>
					</tr>
					
					<tr>
						<td align="right" width="140px">类型:</td>
						<td>
							<input type = "text" readonly="readonly" id = "filmType" />
						</td>
					</tr>
					
					<tr>
						<td align="right" width="140px">时长:</td>
						<td>
							<input type = "text" readonly="readonly" id = "filmLastTime" name = "filmLastTime"/>
						</td>
					</tr>
					
					<tr>
						<td align="right" width="140px">语言:</td>
						<td>
							<input type = "text" readonly="readonly" id = "filmLanguage" />
						</td>
					</tr>
					
					<tr>
						<td></td> 
						<td><button type="button" onclick="retwo()">上一步</button>&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" onclick="three()">下一步</button></td>
					</tr>
				</table>
			</div>

			<!--第三个结束-->

			<!--第四个开始-->

			<div id="four" style="display:none">
				<table align="center">
					<tr>
						<td align="right" width="140px">开场时间:</td>
						<td>
							<input class="pwdTrigger" type="text"  id = "startTime" name = "startTime" onclick="pickTime();" onblur="validateStartTime()" onfocus="onfocusText('td_4')"/>
						</td>
						<td id = "td_4"></td>
					</tr>
					
					<tr>
						<td align="right" width="140px">结束时间:</td>
						<td>
							<input class="pwdTrigger" type="text"  id = "endTime" name = "endTime" readonly="readonly" onclick="setEndTime();"/>
						</td>
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
				<table align="center">
					<tr>
						<td align="right" width="140px">票价:</td>
						<td><input class="pwdTrigger" type="text"  id = "filmPrice" name = "filmPrice" onblur="validateFilmPrice()"  onfocus="onfocusText('td_5')" onkeyup="javascript:this.value = this.value.replace(/[^\d]/g,'');"/></td>
						<td id = "td_5"></td>
					</tr>
					<tr>
						<td></td> 
						<td>
							<button type="button" onclick="refour()">上一步</button>
							&nbsp;&nbsp;&nbsp;&nbsp;
							<button type="button" onclick="submitPlan()">提交</button>
						</td>
						
					</tr>
				</table>
			</div>
			
			<!--第五个结束-->
		</div>
	</div>


	<div style="text-align:center;clear:both">
	
	</div>
  </body>
</html>
