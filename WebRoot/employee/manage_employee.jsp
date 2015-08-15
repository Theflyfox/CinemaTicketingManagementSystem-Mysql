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
    
    <title>My JSP 'manage_employee.jsp' starting page</title>
    
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
	<script type="text/javascript" src="js/search_employee.js"></script>
	<script type="text/javascript" src="artDialog4.1.6/artDialog.js"></script>
	 <!-- 对iframe新增的工具-->
	<script type="text/javascript" src="artDialog4.1.6/plugins/iframeTools.js"></script>
	<script type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>
	
	<script type="text/javascript" src="js/manage_employee.js"></script>
	
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
	
	
  </head>
  
  <body>
    <br />
    <br />
     <!-- 返回首页的锚点 -->
    <div class="headeline"></div>
    <p align = "center"><font face = "黑体" size = "5" color = "black">员工信息维护</font></p>
    <br />
    <br />
    
   	<input type = "hidden" id = "currentPage" name = "currentPage" value = "<%= pb.getCurrentPage() %>" />
  	<input type = "hidden" id = "totalPage" value = "<%= pb.getTotalPage() %>" />
   	<input type = "hidden" id = "queryKey" name = "queryKey" value = "<%= request.getAttribute("queryKey") %>" />
   	<input type = "hidden" id = "queryValue" name = "queryValue" value = "<%= request.getAttribute("queryValue") %>" />
    
    <!--*******搜索输入内容开始*******-->
		<div class="searchbox">
			<input name="keyword" id="keyword" type="text" style="width:228px"  placeholder="分类搜索,日期格式为XXXX-XX-XX"/>
			<div id="searchsort" style="width:0px;">
				<div class="selectedsort">
					<span class="itemName" id="itemName">姓名</span>
					<span class="sortico"></span>
				</div>
				<div class="searchsortlist">
					<div class="searchItem">用户名</div>
					<div class="searchItem">性别</div>
					<div class="searchItem">手机号</div>
					<div class="searchItem">职位</div>
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
                    <td class="STYLE1"><div align="center"><a href = "javascript:void(0)" target="main" onclick = "addFilmOnscreen()">新增</a></div></td>
                  </tr>
                </table></td>
                <td width="60"><table width="90%" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                  	<td class="STYLE1"><div align="center"><img src="images/11.gif" width="14" height="14" /></div></td>
                    <td class="STYLE1"><div align="center"><a href="javascript:void(0)" target="main" onclick = "deleteItem(this)">删除</a></div></td>
                  </tr>
                </table></td>
                <td width="60"><table width="88%" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    
                    <!--  
                    <td class="STYLE1"><div align="center"><img src="images/33.gif" width="14" height="14" /></div></td>
                    <td class="STYLE1"><div align="center"><a href = "javascript:void(0)" target = "main" onclick = "modify()">修改</a></div></td>
                    -->
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
            				<td width="7%" height="22" background="images/bg.gif" bgcolor="#FFFFFF">
            					<div align="center">
              						<input type="checkbox" class = "all" onclick = "checkAll(this)" />
              						<span class="STYLE1">用户名</span>
            					</div>
            				</td>
            				<td width="10%" height="22" background="images/bg.gif" bgcolor="#FFFFFF">
            					<div align="center">
            						<span class="STYLE1">照片</span>
            					</div>
            				</td>
            				<td width="10%" height="22" background="images/bg.gif" bgcolor="#FFFFFF">
            					<div align="center">
            						<span class="STYLE1">姓名</span>
            					</div>
            				</td>
            				<td width="5%" height="22" background="images/bg.gif" bgcolor="#FFFFFF">
            					<div align="center">
            						<span class="STYLE1">性别</span>
            					</div>
            				</td>
            				<td width="10%" height="22" background="images/bg.gif" bgcolor="#FFFFFF">
            					<div align="center">
            						<span class="STYLE1">年龄</span>
            					</div>
            				</td>
            				<td width="10%" background="images/bg.gif" bgcolor="#FFFFFF">
            					<div align="center">
            						<span class="STYLE1">出生日期</span>
            					</div>
            				</td>
            				
            	 			<td width="10%" height="22" background="images/bg.gif" bgcolor="#FFFFFF">
            	 				<div align="center">
            	 					<span class="STYLE1">证件号</span>
            	 				</div>
            	 			</td>
            	 			<td width="10%" height="22" background="images/bg.gif" bgcolor="#FFFFFF">
            	 				<div align="center">
            	 					<span class="STYLE1">手机号</span>
            	 				</div>
            	 			</td>
            	 			<td width="10%" height="22" background="images/bg.gif" bgcolor="#FFFFFF">
            	 				<div align="center">
            	 					<span class="STYLE1">上岗时间</span>
            	 				</div>
            	 			</td>
            	 			<td width="10%" height="22" background="images/bg.gif" bgcolor="#FFFFFF">
            	 				<div align="center">
            	 					<span class="STYLE1">职位</span>
            	 				</div>
            	 			</td>
            				<td width="15%" height="22" background="images/bg.gif" bgcolor="#FFFFFF" class="STYLE1">
            					<div align="center">操作</div>
            				</td>
         			 </tr>
         			 
          		<!-- ****每一行内容开始****-->
          		<%
          			for(int i = 0; i < list.size(); i++) {
          				Map<String, Object> map = list.get(i);
          				
          		%>
          		
          		
		          	<tr>
			            <td height="20" bgcolor="#FFFFFF">
			            	<div align="center">
			              		<input type="checkbox" class = "item" name = "item" onclick = "notice()" value = "<%= map.get("employeeid")%>"/>
			              		<%= map.get("employeeid")%>
			            	</div>
			            </td>
			            <td height="20" bgcolor="#FFFFFF">
			            	<div align="center">
			              		<img src = "posts/<%= map.get("photo") %>" alt = "员工照片" width = "95px" height = "140px">
			            	</div>
			            </td>
			            <td height="20" bgcolor="#FFFFFF">
			            	<div align="center" class="STYLE1">
			              		<div align="center">
			              			<span class="STYLE1">
			              				<%= map.get("name")%>
			              			</span>
			              		</div>
			            	</div>
			            </td>
			            <td height="20" bgcolor="#FFFFFF">
			            	<div align="center" class="STYLE1">
			              		<div align="center">
			              			<span class="STYLE1"><%= map.get("gender")%></span>
			              		</div>
			            	</div>
			            </td>
			            <td height="20" bgcolor="#FFFFFF">
			            	<div align="center" class="STYLE1">
			              		<div align="center">
			              			<span class="STYLE1"><%= map.get("age")%></span>
			              		</div>
			            	</div>
			            </td>
			            <td height="20" bgcolor="#FFFFFF">
			            	<div align="center">
			            		<span class="STYLE1"><%= map.get("birthdate")%></span>
			            	</div>
			            </td>
			            <td height="20" bgcolor="#FFFFFF">
			            	<div align="center">
			            		<span class="STYLE1"><%= map.get("idcode")%></span>
			            	</div>
			            </td>
			            <td height="20" bgcolor="#FFFFFF">
			            	<div align="center">
			            		<span class="STYLE1">
			            		<%= map.get("phoneno")%>
			            		</span>
			            	</div>
			            </td>
			            <td height="20" bgcolor="#FFFFFF">
			            	<div align="center">
			            		<span class="STYLE1"><%= map.get("entrytime")%></span>
			            	</div>
			            </td>
			            <td height="20" bgcolor="#FFFFFF">
			            	<div align="center">
			            		<span class="STYLE1"><%= map.get("position")%></span>
			            	</div>
			            </td>
			            
			            <td height="20" bgcolor="#FFFFFF">
			            	<div align="center">
			            		<span class="STYLE4">
			            			 <img src="images/edt.gif" width="16" height="16" />
			            			<a href = "javascript:void(0)" target = "main" onclick = "immediateModify(<%= map.get("employeeid")%>)">修改</a>
			            			<br/>
			            			<img src="images/del.gif" width="16" height="16" /> 
			            			<a href = "javascript:void(0)" target = "main" onclick = "immediateDeleteItem(<%= map.get("employeeid")%>)">删除</a>
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
	                    	<input name="textfield" type="text" size="4" style="height:12px; width:20px; border:1px solid #999999;" id = "inputPage"  onkeyup="javascript:this.value = this.value.replace(/[^\d]/g,'');"/> 
	                    	页 
                    	</span>
                    </div>
                  </td>
                  <td width="40"><img src="images/go.gif" width="37" height="15" onclick="gotoSpecialPage()"/></td>
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
