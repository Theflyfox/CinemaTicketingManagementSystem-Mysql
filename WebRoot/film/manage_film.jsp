<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import = "com.suehon.model.PageBean" %>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	
	PageBean pb = (PageBean)request.getAttribute("pb");
	List<Map<String, Object>> list = pb.getList();
	int pageSize = (Integer)request.getAttribute("pageSize");
	
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
    
    <title>My JSP 'manage_film.jsp' starting page</title>
    
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
	
	
	<!-- 外部引入文件结束 -->

	<style type="text/css">
			*{margin:0;padding:0;list-style-type:none;}
			a,img{border:0;}
			body{font:12px/180% Arial, Helvetica, sans-serif，"新宋体";}
			/* searchbox */
			.searchbox{background:#3366cc;height:28px;width:720px;margin:20px auto;padding:7px 0 0 10px;width:380px;}
			#keyword{float:left;height:21px;line-height:21px;border:none;padding:0px;}
			#searchsort{float:left;position:relative;display:none;width:66px;overflow:hidden;height:21px;background-color:#fff;font-size:12px;}
			#searchsort .selectedsort{height:17px;padding-top:4px;color:#555;line-height:1;text-align:center;white-space:nowrap;}
			#searchsort .searchsortlist{position:absolute;text-align:left;width:64px;display:none;background-color:#fff;box-shadow:1px 1px 1px rgba(0,0,0,0.3);left:1px;top:21px;border:1px solid #ccc;border-top:none;color:#555;}
			#searchsort .sortico{width:7px;height:4px;display:inline-block;font-size:0px;vertical-align:middle;margin-left:3px;background:url(images/searchIco.png) no-repeat;}
			#searchsort .searchItem{height:21px;line-height:21px;padding-left:4px;cursor:pointer;}
			#searchbtn{float:left;display:inline;margin:0px 0px 0px 3px;width:62px;height:23px;border:none;cursor:pointer;padding:0px;background:url(images/kwbtn.jpg) no-repeat;} 
		</style>
		
		<script>
				 
			/**分页部分开始**/
			
			function changePage(btn) {
			
				var currentPage = document.getElementById("currentPage");
				var totalPage = document.getElementById("totalPage");
				var fistPage = document.getElementById("first_page");
				var prePage = document.getElementById("pre_page");
				var nextPage = document.getElementById("next_page");
				var lastPage = document.getElementById("last_page");
				
				if(btn.id == fistPage.id) {
					currentPage.value = 1; 
				}else if(btn.id == prePage.id) {
					if(currentPage.value == 1) {
						return;
					}
					
					currentPage.value = Number(currentPage.value) - 1; 
				}else if(btn.id == nextPage.id ) {
					
					if(currentPage.value == totalPage.value) {
					
						return;
					}
					
					currentPage.value = Number(currentPage.value) + 1; 
				}else if(btn.id == lastPage.id) {
					
					currentPage.value = totalPage.value; 
				}
			
				var url = "ManageFilmInfoServlet?currentPage=" + currentPage.value + "&queryKey=" + $("#queryKey").val() + "&queryValue=" + $("#queryValue").val();
				window.location.assign(url);
				
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
 							content: '确认删除选中项?删除后将不可恢复!',
 							icon: 'warning',
 							lock: true,
 							ok: function(){
 							
 									str = str.substring(0, str.length - 1);//将最后一个"-"去掉
					
									$.post("DeleteFilmServlet", 
											{'filmId':str},
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
												window.location.assign("ManageFilmInfoServlet");
											});
     							return true;
 								},
					});
				}
			}
			
			
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
					
					 window.location.assign("PrepareInfoForModifyFilmServlet?filmId=" + checkedItemId);
				}
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
							$("#type").append("<option value = '" +result.DDID + "'> "+result.DDCONTENT + "</option>");
						}						
					}
				);
			}
			
			function addFilm() {
				window.location.assign("film/add_film.jsp");
			}
			
			//用户直接点击属于当前行的修改
			function immediateModify(filmId) {
				//alert(filmId);
				window.location.assign("PrepareInfoForModifyFilmServlet?filmId=" + filmId);
			}
			
			//用户直接点击属于当前行的删除
			function immediateDeleteItem(filmId) {
			
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
					art.dialog({
 							title: '信息提示',
 							content: '确认删除选中项',
 							icon: 'warning',
 							lock: true,
 							ok: function(){
 							
 									str = str.substring(0, str.length - 1);//将最后一个"-"去掉
					
									$.post("DeleteFilmServlet", 
											{'filmId':filmId},
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
												window.location.assign("ManageFilmInfoServlet");
											});
     							return true;
 								},
					});
			
			}
			
			function goToDetailPage(obj) {
				
				window.location.assign("ShowFilmDetailInfoServlet?filmId=" + obj.id);
			
			}
			
			
			
	function gotoSpecialPage() {
	
		var inputPage =  $("#inputPage").val();
		if(inputPage > $("#totalPage").val() || inputPage <= 0) {
			
			return;
			
		}
		
		window.location.assign("MangeFilmInfoServlet?currentPage=" + $("#inputPage").val());
	}
	</script>


  </head>
  
  <body>
    <br />
    <br />
    <p align = "center"><font face = "黑体" size = "5" color = "black">影片信息维护</font></p>
    <!-- 返回首页的锚点 -->
    <div class="headeline"></div>
  	
  	
  	<input type = "hidden" id = "currentPage" name = "currentPage" value = "<%= pb.getCurrentPage() %>" />
  	<input type = "hidden" id = "totalPage" value = "<%= pb.getTotalPage() %>" />
	<%-- <input type = "hidden" id = "queryKey"  name = "queryKey" <%if(queryKey != "") { %>  value = "<%= queryKey%> <%}%>"/> --%>
    <input type = "hidden" id = "queryValue" name = "queryValue"  <%if(queryValue != "") { %>  value = "<%= queryValue%> <%}%>"/>
    <!--*******搜索输入内容开始*******-->
		<div class="searchbox">
			<input name="keyword" id="keyword" type="text" style="width:228px"  placeholder="分类搜索,英文字母不区分大小写"/>
			<div id="searchsort" style="width:0px;">
				<div class="selectedsort">
					<span class="itemName" id="itemName">片名</span>
					<span class="sortico"></span>
				</div>
				<div class="searchsortlist">
					<div class="searchItem">片名</div>
					<div class="searchItem">主演</div>
					<div class="searchItem">导演</div>
					<div class="searchItem">类型</div>
					<div class="searchItem">国家</div>
				</div>
			</div>
			<input type="submit" id="searchbtn" value="" />
		</div>
		<script type="text/javascript">nipicIndexSearch();</script>
	<!--*******搜索输入内容结束*******-->
    
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
                    <td class="STYLE1"><div align="center"><a href = "javascript:void(0)" target="main" onclick = "addFilm()">新增</a></div></td>
                  </tr>
                </table></td>
                <td width="60"><table width="90%" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td class="STYLE1"><div align="center"><img src="images/33.gif" width="14" height="14" /></div></td>
                    <td class="STYLE1"><div align="center"><a href = "javascript:void(0)" target = "main" onclick = "modify()">修改</a></div></td>
                  </tr>
                </table></td>
                <td width="60"><table width="88%" border="0" cellpadding="0" cellspacing="0">
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
    <td>
    	<table width="100%" border="0" cellspacing="0" cellpadding="0">
      		<tr>
        		<td width="8" background="images/tab_12.gif">&nbsp;</td>
        		<td>
        			<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="b5d6e6" >
          				<tr>
            				<td width="8%" height="22" background="images/bg.gif" bgcolor="#FFFFFF">
            					<div align="center">
              						<input type="checkbox" class = "all" onclick = "checkAll(this)" />
              						<span class="STYLE1">序号</span>
            					</div>
            				</td>
            				<td width="10%" height="22" background="images/bg.gif" bgcolor="#FFFFFF">
            					<div align="center">
            						<span class="STYLE1">海报</span>
            					</div>
            				</td>
            				<td width="10%" height="22" background="images/bg.gif" bgcolor="#FFFFFF">
            					<div align="center">
            						<span class="STYLE1">影片名称</span>
            					</div>
            				</td>
            				<td width="10%" height="22" background="images/bg.gif" bgcolor="#FFFFFF">
            					<div align="center">
            						<span class="STYLE1">国家</span>
            					</div>
            				</td>
            				<td width="10%" background="images/bg.gif" bgcolor="#FFFFFF">
            					<div align="center">
            						<span class="STYLE1">导演</span>
            					</div>
            				</td>
            				
            	 			<td width="10%" height="22" background="images/bg.gif" bgcolor="#FFFFFF">
            	 				<div align="center">
            	 					<span class="STYLE1">主演</span>
            	 				</div>
            	 			</td>
            	 			<td width="10%" height="22" background="images/bg.gif" bgcolor="#FFFFFF">
            	 				<div align="center">
            	 					<span class="STYLE1">类型</span>
            	 				</div>
            	 			</td>
            	 			<td width="10%" height="22" background="images/bg.gif" bgcolor="#FFFFFF">
            	 				<div align="center">
            	 					<span class="STYLE1">上线日期</span>
            	 				</div>
            	 			</td>
            	 			 
            				<td width="15%" height="22" background="images/bg.gif" bgcolor="#FFFFFF" class="STYLE1">
            					<div align="center">基本操作</div>
            				</td>
         			 </tr>
          		<!-- ****每一行内容开始****-->
          		<%
          			String postFileName;
          			String temp = "";
          			for(int i = 0; i < list.size(); i++) {
          				Map<String, Object> map = list.get(i);
          				if(map.get("filmpost") != null ) {
          					temp = map.get("filmpost").toString();
          				}
          				
          				if(temp.indexOf("/") > 0) {
          					postFileName = temp.substring(0, temp.indexOf("/"));
          				}else {
          					postFileName = temp;
          				}
          				
          				//postFileName = temp.substring(0, temp.indexOf("/"));
          				
          		%>
		          	<tr>
			            <td height="20" bgcolor="#FFFFFF">
			            	<div align="center">
			              		<input type="checkbox" class = "item" name = "item" onclick = "notice()" value = "<%= map.get("filmid")%>"/>
			              		<%= map.get("filmid")%>
			            	</div>
			            </td>
			            <td height="20" bgcolor="#FFFFFF">
			            	<div align="center" class="STYLE1">
			              		<div align="center">
			              			<span class="STYLE1">
			              				<img width = "95px" height = "170px" src ="posts/<%=postFileName %>"  alt = "图片"/>
			              			</span>
			              		</div>
			            	</div>
			            </td>
			            <td height="20" bgcolor="#FFFFFF">
			            	<div align="center" class="STYLE1">
			              		<div align="center">
			              			<span class="STYLE1"><a href = "javascript:void(0)" target = 'main' id = '<%= map.get("filmid")%>' onclick = "goToDetailPage(this)"><%= map.get("filmname")%></a></span>
			              		</div>
			            	</div>
			            </td>
			            <td height="20" bgcolor="#FFFFFF">
			            	<div align="center">
			            		<span class="STYLE1"><%= map.get("filmcountry")%></span>
			            	</div>
			            </td>
			            <td height="20" bgcolor="#FFFFFF">
			            	<div align="center">
			            		<span class="STYLE1"><%= map.get("filmdirector")%></span>
			            	</div>
			            </td>
			            <td height="20" bgcolor="#FFFFFF">
			            	<div align="center">
			            		<span class="STYLE1"><%= map.get("filmleadingrole")%></span>
			            	</div>
			            </td>
			            <td height="20" bgcolor="#FFFFFF">
			            	<div align="center">
			            		<span class="STYLE1"><%= map.get("filetype")%></span>
			            	</div>
			            </td>
			            <td bgcolor="#FFFFFF">
			            	<div align="center">
			            		<span class="STYLE1"><%= map.get("filmonline")%></span>
			            	</div>
			            </td>
			            
			            <td height="20" bgcolor="#FFFFFF">
			            	<div align="center">
			            		<span class="STYLE4">
			            			<img src="images/edt.gif" width="16" height="16" />
			            			<a href = "javascript:void(0)" target = "main" onclick = "immediateModify(<%= map.get("filmid")%>)">修改</a>
			            			<img src="images/del.gif" width="16" height="16" />
			            			<a href = "javascript:void(0)" target = "main" onclick = "immediateDeleteItem(<%= map.get("filmid")%>)">删除</a>
			            		</span>
			            	</div>
			            </td>
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
            <td class="STYLE4">&nbsp;&nbsp;共有 <font color = "blue"><%=pb.getTotalPage()%> </font>条记录, 当前为第<font color = "blue"> <%= pb.getCurrentPage() %> </font>条记录,<span id = "checkedNotice">当前选中 0 项</span></td>
            <td><table border="0" align="right" cellpadding="0" cellspacing="0">
                <tr>
                  <td width="40">
                  	<img src="images/first.gif" width="37" height="15" id = "first_page" onclick = "changePage(this)" />
                  </td>
                  <td width="45">
                  	<img src="images/back.gif" width="43" height="15" id = "pre_page" onclick = "changePage(this)"/>
                  </td>
                  <td width="45">
                  	<img src="images/next.gif" width="43" height="15" id = "next_page" onclick = "changePage(this)"/>
                  </td>
                  <td width="40">
                  	<img src="images/last.gif" width="37" height="15" id = "last_page" onclick = "changePage(this)"/>
                  </td>
                  <td width="100">
                  	<div align="center">
                  		<span class="STYLE1">
	                  		转到第
	                    	<input name="textfield" type="text" size="4" style="height:12px; width:20px; border:1px solid #999999;" id = "inputPage" onclick="gotoSpecialPage()"/> 
	                    	页 
                    	</span>
                    </div>
                  </td>
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
	<!-- 返回顶部 -->
    <script type="text/javascript" src="js/scrolltopcontrol.js"></script>    
  </body>
</html>
