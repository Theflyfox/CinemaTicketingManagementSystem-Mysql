<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import = "com.suehon.model.PageBean" %>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	
	PageBean pb = (PageBean)request.getAttribute("pb");
	List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
	int pageSize;
	if(pb != null) {
		list = pb.getList();
		pageSize = (Integer)request.getAttribute("pageSize");
	}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'sales_detail.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<!-- 外部引入文件开始 -->
	
	<script type = "text/javascript" src = "js/validate.js"></script>
	<script type = "text/javascript" src = "js/jquery-2.0.3.js"></script>
	<script type = "text/javascript" src="js/jquery.1.4.2-min.js"></script>
	<script type="text/javascript" src="artDialog4.1.6/artDialog.js"></script>
	 <!-- 对iframe新增的工具-->
	<script type="text/javascript" src="artDialog4.1.6/plugins/iframeTools.js"></script>
	<script type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>
	<script charset="utf-8" src="js/jquery.settime.js"></script>
	<script charset="utf-8" src="js/sales_detail.js"></script>
	
	<link href="artDialog4.1.6/skins/default.css" rel="stylesheet" type="text/css" />
	<link href="css/sales_detail.css" rel="stylesheet" type="text/css" />
	
	
	<!-- 外部引入文件结束 -->

  </head>
  
  <body>
    <br />
    <br />
    <p align = "center"><font face = "黑体" size = "5" color = "black">销售明细查询</font></p>
   
    <div id = "setTimeBox">
    	<form action = "GetSalesDetailsServlet" method = "post">
    	开始时间:<input class="pwdTrigger" type="text"  id = "startTime" name = "startTime" value = "<% if(request.getAttribute("startTime") != null) out.print(request.getAttribute("startTime")); %>" onclick="pickStartTime();" onblur="" onfocus=""/>
    	&nbsp;
    	结束时间:<input class="pwdTrigger" type="text"  id = "endTime" name = "endTime" value = "<% if(request.getAttribute("endTime") != null) out.print(request.getAttribute("endTime")); %>" onclick="pickEndTime();" onblur="" onfocus=""/>
    	&nbsp;
    	<input type = "submit" value = "确定" />
    	</form>
    </div>
    
    
    
    
    
    <br />
    <br />
     <!-- 返回首页的锚点 -->
    <div class="headeline"></div>
    <br />
    <br />
    
   	<input type = "hidden" id = "currentPage" name = "currentPage" value = "<%if(list.size() != 0) {out.print( pb.getCurrentPage() );} %>" />
  	<input type = "hidden" id = "totalPage" value = "<% if(list.size() != 0) {out.print(pb.getTotalPage());} %>" />
    
    <%if(list.size() != 0) {%>
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
                <td width="95%" class="STYLE1"><!-- <span class="STYLE3">操作：</span> --></td>
              </tr>
            </table></td>
            <td width="54%"><table border="0" align="right" cellpadding="0" cellspacing="0">
              <tr>
                <td width="60"><table width="87%" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td class="STYLE1"><div align="center">
                      <!-- <input type="checkbox" name="checkbox62" value="checkbox" onclick = "checkAll(this)"/> -->
                    </div></td>
                    <td class="STYLE1"><!-- <div align="center">全选</div> --></td>
                  </tr>
                </table></td>
                <td width="60"><table width="90%" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <!-- <td class="STYLE1"><div align="center"><img src="images/22.gif" width="14" height="14" /></div></td>
                    <td class="STYLE1"><div align="center"><a href = "javascript:void(0)" target="main" onclick = "addFilmOnscreen()">新增</a></div></td> -->
                  </tr>
                </table></td>
                <td width="60"><table width="90%" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                  	<!-- <td class="STYLE1"><div align="center"><img src="images/11.gif" width="14" height="14" /></div></td>
                    <td class="STYLE1"><div align="center"><a href="javascript:void(0)" target="main" onclick = "deleteItem(this)">删除</a></div></td> -->
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
            				<td width="8%" height="22" background="images/bg.gif" bgcolor="#FFFFFF">
            					<div align="center">
              						<!-- <input type="checkbox" class = "all" onclick = "checkAll(this)" /> -->
              						<span class="STYLE1">影厅名</span>
            					</div>
            				</td>
            				<td width="10%" height="22" background="images/bg.gif" bgcolor="#FFFFFF">
            					<div align="center">
            						<span class="STYLE1">影片名</span>
            					</div>
            				</td>
            				<td width="10%" height="22" background="images/bg.gif" bgcolor="#FFFFFF">
            					<div align="center">
            						<span class="STYLE1">上映时间</span>
            					</div>
            				</td>
            				<td width="10%" height="22" background="images/bg.gif" bgcolor="#FFFFFF">
            					<div align="center">
            						<span class="STYLE1">座位位置</span>
            					</div>
            				</td>
            				<td width="10%" background="images/bg.gif" bgcolor="#FFFFFF">
            					<div align="center">
            						<span class="STYLE1">应付款</span>
            					</div>
            				</td>
            				
            	 			<td width="10%" height="22" background="images/bg.gif" bgcolor="#FFFFFF">
            	 				<div align="center">
            	 					<span class="STYLE1">实付款</span>
            	 				</div>
            	 			</td>
            	 			<td width="10%" height="22" background="images/bg.gif" bgcolor="#FFFFFF">
            	 				<div align="center">
            	 					<span class="STYLE1">会员号</span>
            	 				</div>
            	 			</td>
            				<!-- 
            				<td width="15%" height="22" background="images/bg.gif" bgcolor="#FFFFFF" class="STYLE1">
            					<div align="center">会员号</div>
            				</td> -->
         			 </tr>
         			 
          		<!-- ****每一行内容开始****-->
          		
          		<%
          			if(list.size() != 0) {
          			
          				for(int i = 0; i < list.size(); i++) { 
          				
          					Map<String, Object> map = list.get(i);
          			
          				%>
          		
          		
		          	<tr>
			            <td height="20" bgcolor="#FFFFFF">
			            	<div align="center">
			            		<span class="STYLE1">
			              		<%= map.get("showroomname")%>
			              		</span>
			            	</div>
			            </td>
			            <td height="20" bgcolor="#FFFFFF">
			            	<div align="center" class="STYLE1">
			              		<div align="center">
			              			<span class="STYLE1">
			              				<%= map.get("filmname")%>
			              			</span>
			              		</div>
			            	</div>
			            </td>
			            <td height="20" bgcolor="#FFFFFF">
			            	<div align="center" class="STYLE1">
			              		<div align="center">
			              			<span class="STYLE1"><%= map.get("onscreendate")%> &nbsp; <%=map.get("onscreenstarttime") %></span>
			              		</div>
			            	</div>
			            </td>
			            <td height="20" bgcolor="#FFFFFF">
			            	<div align="center">
			            		<span class="STYLE1"><%= map.get("siterow")%> 排 <%= map.get("sitecol") %></span>
			            	</div>
			            </td>
			            <td height="20" bgcolor="#FFFFFF">
			            	<div align="center">
			            		<span class="STYLE1"><%= map.get("shouldpay")%></span>
			            	</div>
			            </td>
			            <td height="20" bgcolor="#FFFFFF">
			            	<div align="center">
			            		<span class="STYLE1"><%= map.get("realpay") %></span>
			            	</div>
			            </td>
			            <td height="20" bgcolor="#FFFFFF">
			            	<div align="center">
			            		<span class="STYLE1"><%= map.get("vipno")%></span>
			            	</div>
			            </td>
			            <%-- 
			            <td height="20" bgcolor="#FFFFFF">
			            	<div align="center">
			            		<span class="STYLE1"><%= map.get("VIPNO")%></span>
			            	</div>
			            </td> --%>
	          		</tr>
	          	<%	}
	          	} %>
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
            <td class="STYLE4">&nbsp;&nbsp;共有 <font color = "blue"><%if(list.size() != 0) out.print( pb.getTotalPage());%> </font>条记录, 当前为第<font color = "blue"> <%if(list.size() != 0) out.print( pb.getCurrentPage()); %> </font>条记录,<span id = "checkedNotice">当前选中 0 项</span></td>
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
	                    	<input name="textfield" type="text" size="4" style="height:12px; width:20px; border:1px solid #999999;" id = "inputPage" onkeyup="javascript:this.value = this.value.replace(/[^\d]/g,'');"/> 
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
     <%} %>
     <!-- 返回顶部 -->
    <script type="text/javascript" src="js/scrolltopcontrol.js"></script>  
  </body>
</html>
