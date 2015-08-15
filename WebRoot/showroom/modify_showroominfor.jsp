<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import = "com.suehon.model.PageBean" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	PageBean pb = (PageBean)request.getAttribute("pb");
	List<Map<String, Object>> list = pb.getList();//待显示结果
	int pageSize = (Integer)request.getAttribute("pageSize");//每页显示数目
	String queryKey = "";
	String queryValue = "";
	if(null != request.getAttribute("queryValue")) {
		queryKey = request.getAttribute("queryKey").toString();
		queryValue = request.getAttribute("queryValue").toString();
	}

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>放映厅信息维护</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<!-- 外部引入文件开始 -->
	
	<script type = "text/javascript" src = "js/jquery-2.0.3.js"></script>
	<link href="artDialog4.1.6/skins/default.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="artDialog4.1.6/artDialog.js"></script>
	 <!-- 对iframe新增的工具-->
	<script type="text/javascript" src="artDialog4.1.6/plugins/iframeTools.js"></script>
	
	<!-- 外部引入文件结束 -->
	
	<style type="text/css">
				body {
					margin-left: 0px;
					margin-top: 0px;
					margin-right: 0px;
					margin-bottom: 0px;
				}
				.STYLE1 {font-size: 12px}
				.STYLE3 {font-size: 12px; font-weight: bold; }
				.STYLE4 {color: #03515d; font-size: 12px;
				}
			
			</style>

		<script>
				 
			/**分页部分**/
			function changePage(btn) {
			
				var currentPage = document.getElementById("currentPage");
				var totalPage = document.getElementById("totalPage");
				var fistPage = document.getElementById("fist_page");
				var prePage = document.getElementById("pre_page");
				var nextPage = document.getElementById("next_page");
				var lastPage = document.getElementById("last_page");
				var changePageForm = document.getElementById("changePageForm");
				
				if(btn.id == fistPage.id) {
					currentPage.value = 1; 
				}else if(btn.id == prePage.id) {
				
					currentPage.value = Number(currentPage.value) - 1; 
				}else if(btn.id == nextPage.id) {
				
					currentPage.value = Number(currentPage.value) + 1; 
				}else if(btn.id == lastPage.id) {
				
					currentPage.value = totalPage.value; 
				}
				changePageForm.submit();
			}
			/** 分页部分结束 **/
			
			//全选
			function checkAll(obj) {
			
				var elements = document.getElementsByName("item");
				if(obj.checked) {
					
					for(var i = 0; i < elements.length; i++) {
						elements[i].checked = true;
					}
					
				}else {
					
					for(var i = 0; i < elements.length; i++) {
						elements[i].checked = false;
					}
				}
				
				notice();
			}
			
			//提示用户当前选中个数
			function notice() {
			
				$("#checkedNotice").html("当前选中<font color = 'blank'>" +  + $("input:checked").length + "</font>项");
			
			}
			
			//删除条目
			function deleteItem(obj) {
				var items = document.getElementsByName("item");
				var count = 0;
				var str = new String();
				var dialog;
				for(var i = 0; i < items.length; i++) {
					if(items[i].checked == true) {
						count++;
						str = str + items[i].value + "-";
					}
				}
				if(count <= 0) {//没有选中要修改的项
								art.dialog({
	    							title: '信息提示',
	    							content: '请选择删除项！',
	    							icon: 'warning',
	    							lock: true,
	    							ok: function(){
	        							return true;
	    								}
								});	
				}else {//正常处理
					
					art.dialog({
 							title: '信息提示',
 							content: '确认删除选中项',
 							icon: 'warning',
 							lock: true,
 							ok: function(){
 							
 									str = str.substring(0, str.length - 1);//将最后一个"-"去掉
					
									$.post("DeleteShowroomServlet", 
											{'deleteItems':str},
											function(returnedDate, status) {
													if(returnedDate > 0) {
														art.dialog({
															    lock: true,
															    icon:'succeed',
															    content: "删除成功",
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
															
													}else {
														art.dialog({
															    lock: true,
															    icon:'error',
															    content: "删除失败",
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
												window.location.assign("ModifyShowroomPageServlet");
											});
     							return true;
 								},
					});
				}
			}
			
			/*
			function immedDelete(id) {
				
				window.location.assign("DeleteShowroomServlet?deleteItems=" + id);
				window.location.assign("ModifyShowroomPageServlet");
				
			}
			*/
			
			//修改条目
			function modify() {
				
				var items = document.getElementsByName("item");
				var count = 0;
				var str = new String();
				for(var i = 0; i < items.length; i++) {
					if(items[i].checked == true) {
						count++;
						str = str + items[i].value + "-";
					}
				}
				if(count <= 0) {//没有选中要修改的项
								art.dialog({
	    							title: '信息提示',
	    							content: '请选择项！',
	    							icon: 'warning',
	    							lock: true,
	    							ok: function(){
	        							return true;
	    								}
								});	
				}else if(count >= 2) {//选中的项目的多于两个
					
					art.dialog({
	   							title: '信息提示',
	   							content: '只能选择一项！',
	   							icon: 'warning',
	   							lock: true,
	   							ok: function(){
	       								return true;
	   								}
							});
					
				
				}else {//正常处理
					var checkedItemId = str.substring(0, str.length - 1);
					var showroomName;
					var showroomSiteAmount;
					var cont;
					
					
					//根据影厅id，异步获取单个影厅的名称，座位数量
					$.post("GetShowroomInfoServlet", 
							{"checkedItemId" : checkedItemId},
							function (returnedData, status) {
								
								var resultArr = $.parseJSON(returnedData);
								cont = "影厅名称:<input type = 'text' readonly = 'readyonly' value = " + resultArr[0].showroomname + " id = 'showroomName' name = 'showroomName'>" + "<br />" +  
							    		"影厅类型:<select id = 'type' name = 'type'></select>" + "<br />"; //+ 
							    		//"座位数量:<input type = 'text' id = 'showroomSiteAmount' name = 'showroomSiteAmount' value = '" + resultArr[0].SHOWROOMSITEAMOUNT +"'/>";
							   prePareSelectContent();	
							
								var dialog = art.dialog({
											title: "修改影厅信息",
										    content:cont,
										    fixed: true,
										    id: 'Fm7',
										    okVal: '确认',
										    ok: function () {
										    	
										    	if($("#type").val() == -1) {
										    		alert("请选择影厅类型");
										    		return false;//返回false，阻止窗口关闭
										    	}else {//此处未检测输入是否为数字
										    	
										    		$.post("ModifyShowroomInfoServlet",
										    				{"checkedItemId": checkedItemId,"showroomtype":$("#type").val()},
										    				function(returnedDate, status){
										    					if(returnedDate > 0) {//修改成功
										    						art.dialog({
										    							title:"提示",
														            	content: '修改成功',
														                icon: 'succeed',
														                fixed: true,
														                time: 1.5
														            });
															window.location.assign("ModifyShowroomPageServlet");//更新成功，重新加载页面														            
										    					}else {//失败
										    						art.dialog({
										    							title:"提示",
														            	content: '修改失败',
														                icon: 'error',
														                fixed: true,
														                time: 1.5
														            });
										    					}
										    				});
										    			//return true;//不论失败还是成功都关闭修改窗口
										    	}
										    },
										    cancel: true
										});
										
							});
				}
			}
			
			
			function immediaMidify(id) {
			
				//根据影厅id，异步获取单个影厅的名称，座位数量
					$.post("GetShowroomInfoServlet", 
							{"checkedItemId" : id},
							function (returnedData, status) {
								
								var resultArr = $.parseJSON(returnedData);
								cont = "影厅名称:<input type = 'text' readonly = 'readyonly' value = " + resultArr[0].showroomname + " id = 'showroomName' name = 'showroomName'>" + "<br />" +  
							    		"影厅类型:<select id = 'type' name = 'type'></select>" + "<br />"; //+ 
							    		//"座位数量:<input type = 'text' id = 'showroomSiteAmount' name = 'showroomSiteAmount' value = '" + resultArr[0].SHOWROOMSITEAMOUNT +"'/>";
							   prePareSelectContent();	
							
								var dialog = art.dialog({
											title: "修改影厅信息",
										    content:cont,
										    fixed: true,
										    id: 'Fm7',
										    okVal: '确认',
										    ok: function () {
										    	
										    	if($("#type").val() == -1) {
										    		alert("请选择影厅类型");
										    		return false;//返回false，阻止窗口关闭
										    	}else {//此处未检测输入是否为数字
										    	
										    		$.post("ModifyShowroomInfoServlet",
										    				{"checkedItemId": id,"showroomtype":$("#type").val()},
										    				function(returnedDate, status){
										    					if(returnedDate > 0) {//修改成功
										    						art.dialog({
										    							title:"提示",
														            	content: '修改成功',
														                icon: 'succeed',
														                fixed: true,
														                time: 1.5
														            });
															window.location.assign("ModifyShowroomPageServlet");//更新成功，重新加载页面														            
										    					}else {//失败
										    						art.dialog({
										    							title:"提示",
														            	content: '修改失败',
														                icon: 'error',
														                fixed: true,
														                time: 1.5
														            });
										    					}
										    				});
										    			//return true;//不论失败还是成功都关闭修改窗口
										    	}
										    },
										    cancel: true
										});
							});
			}
			
			
			
			
			
			
			
			
			
			
			
			
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
			
			function addShowroom() {
				window.location.assign("showroom/add_showroom.jsp");
			}
			
		</script>
  </head>
  
  <body>
  	<br /><br />
    <p align = "center"><font face = "黑体" size = "5" color = "black">放影厅信息维护</font></p>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="30" background="images/tab_05.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="12" height="30"><img src="images/tab_03.gif" width="12" height="30" /></td>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="46%" valign="middle"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="5%"><div align="center"><img src="images/tb.gif" width="16" height="16" /></div></td>
                <td width="95%" class="STYLE1"><span class="STYLE3">操作：</span></td>
              </tr>
            </table></td>
            <td width="54%"><table border="0" align="right" cellpadding="0" cellspacing="0">
              <tr>
                <td width="60"><table width="87%" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td class="STYLE1"><div align="center">
                      <input type="checkbox" name="checkbox62" value="checkbox" onclick = "checkAll(this)"/>
                    </div></td>
                    <td class="STYLE1"><div align="center">全选</div></td>
                  </tr>
                </table></td>
                <td width="60"><table width="90%" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td class="STYLE1"><div align="center"><img src="images/22.gif" width="14" height="14" /></div></td>
                    <td class="STYLE1"><div align="center"><a href = "javascript:void(0)" target="main" onclick = "addShowroom()">新增</a></div></td>
                  </tr>
                </table></td>
                <td width="60"><table width="90%" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td class="STYLE1"><div align="center"><img src="images/33.gif" width="14" height="14" /></div></td>
                    <td class="STYLE1"><div align="center"><a href = "javascript:void(0)" target = "main" onclick = "modify()">修改</a></div></td>
                  </tr>
                </table></td>
                <td width="52"><table width="88%" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td class="STYLE1"><div align="center"><img src="images/11.gif" width="14" height="14" /></div></td>
                    <td class="STYLE1"><div align="center"><a href="javascript:void(0)" target="main" onclick = "deleteItem(this)">删除</a></div></td>
                  </tr>
                </table></td>
              </tr>
            </table></td>
          </tr>
        </table></td>
        <td width="16"><img src="images/tab_07.gif" width="16" height="30" /></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="8" background="images/tab_12.gif">&nbsp;</td>
        <td><table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="b5d6e6" >
          <tr>
            <td width="3%" height="22" background="images/bg.gif" bgcolor="#FFFFFF"><div align="center">
              <input type="checkbox" class = "all" onclick = "checkAll(this)" />
            </div></td>
            <td width="3%" height="22" background="images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">序号</span></div></td>
            <td width="20%" height="22" background="images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">影厅名称</span></div></td>
            <td width="22%" height="22" background="images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">影厅类型</span></div></td>
            <td width="26%" background="images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">座位数量</span></div></td>
            <!-- <td width="23%" height="22" background="images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">内容</span></div></td> -->
            <td width="15%" height="22" background="images/bg.gif" bgcolor="#FFFFFF" class="STYLE1"><div align="center">基本操作</div></td>
          </tr>
          <!-- ****每一行内容开始****-->
           <% 	Map<String, Object> map; 
           		for(int i = 0; i < list.size();i++) { 
           			map = list.get(i);
           			%>
	          <tr>
	            <td height="20" bgcolor="#FFFFFF"><div align="center">
	              <input type="checkbox" class = "item" name = "item" onclick = "notice()" value = "<%= map.get("showroomid")%>"/>
	            </div></td>
	            <td height="20" bgcolor="#FFFFFF"><div align="center" class="STYLE1">
	              <div align="center"><%=map.get("showroomid") %></div>
	            </div></td>
	            <td height="20" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1"><%=map.get("showroomname") %></span></div></td>
	            <td height="20" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1"><%=map.get("ddcontent") %></span></div></td>
	            <td bgcolor="#FFFFFF"><div align="center"><span class="STYLE1"><%=map.get("showroomsiteamount") %></span></div></td>
	            <td height="20" bgcolor="#FFFFFF"><div align="center"><span class="STYLE4"><img src="images/edt.gif" width="16" height="16" /><a href = "javascript:void(0)" target = "main" onclick = "immediaMidify(<%=map.get("showroomid") %>)">修改</a>&nbsp; &nbsp;<img src="images/del.gif" width="16" height="16" /><a href = "javascript:void(0)" target = "main" onclick = "deleteItem(this)">删除</a></span></div></td>
	          </tr>
          <%} %>
           <!--****每一行内容结束****-->
          
        </table></td>
        <td width="8" background="images/tab_15.gif">&nbsp;</td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="35" background="images/tab_19.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="12" height="35"><img src="images/tab_18.gif" width="12" height="35" /></td>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td class="STYLE4">&nbsp;&nbsp;<font size = "2">共有 <%=list.size() %> 条记录,<span id = "checkedNotice">当前选中 0 项</span></font></td>
            <td><table border="0" align="right" cellpadding="0" cellspacing="0">
                <tr>
                  <td width="40"><img src="images/first.gif" width="37" height="15" id = "fist_page" onclick = "changePage(this)" /></td>
                  <td width="45"><img src="images/back.gif" width="43" height="15" id = "pre_page" onclick = "changePage(this)"/></td>
                  <td width="45"><img src="images/next.gif" width="43" height="15" id = "next_page" onclick = "changePage(this)"/></td>
                  <td width="40"><img src="images/last.gif" width="37" height="15" id = "last_page" onclick = "changePage(this)"/></td>
                  <td width="100"><div align="center"><span class="STYLE1">转到第
                    <input name="textfield" type="text" size="4" style="height:12px; width:20px; border:1px solid #999999;" /> 
                    页 </span></div></td>
                  <td width="40"><img src="images/go.gif" width="37" height="15" /></td>
                </tr>
            </table></td>
          </tr>
        </table></td>
        <td width="16"><img src="images/tab_20.gif" width="16" height="35" /></td>
      </tr>
    </table></td>
  </tr>
</table>
  </body>
</html>
