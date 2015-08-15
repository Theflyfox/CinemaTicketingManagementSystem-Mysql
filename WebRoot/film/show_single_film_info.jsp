<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	List<Map<String, Object>> list = (List<Map<String, Object>>)request.getAttribute("list");
	Map<String, Object> map = list.get(0);
	String postStr = map.get("filmpost").toString();
	String[] postArr = postStr.split("/");	
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
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	
	<!-- 外部引入文件开始 -->
	
	<link rel="stylesheet" type="text/css" href="css/add_film.css">
	<script type = "text/javascript" src = "js/validate.js"></script>
	<script type = "text/javascript" src = "js/jquery-2.0.3.js"></script>
	<script type = "text/javascript" src="js/jquery.1.4.2-min.js"></script>
	<link href="artDialog4.1.6/skins/default.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="artDialog4.1.6/artDialog.js"></script>
	 <!-- 对iframe新增的工具-->
	<script type="text/javascript" src="artDialog4.1.6/plugins/iframeTools.js"></script>
	<link rel="stylesheet" type="text/css" href="css/show_single_film_info.css">
	
	<!-- 外部引入文件结束 -->
	
	
	
  </head>
  
  <body>
  	<BR />
  	<BR />
  	<div class="headeline"></div>
  	<p align = "center"><font face = "黑体" size = "5" color = "black">影片详情</font></p>
	  	<div style="width:400px;margin-left: 50">
	  		<table>
	  			<tr>
	  				<td>
	  					<font color = "blue"><%=map.get("filmname") %></font>
	  				</td>
	  			</tr>
	  			<tr>
	  				<td>
	  					<img width = "430px" height = "550px" src ="posts/<%=postArr[0] %>"  alt = "电影海报"/>
	  				</td>
	  			</tr>
	  		
	  		
	  		</table>	
	  	</div>
		<br />
		<br />
		<br />
		<br />  
    	<div style="width:700px;margin-left: 50">
	    	<table border = "0">
	    		<tr>
	    			<th width = "200" colspan = '4' class = "align_left">◎<font color = "blue"><%=map.get("filmname") %></font> - 影片资料</th>
	    		</tr>
	    		<tr>
	    			<th width = "200" class = "align_right" valign="top">◎国家/地区:</th>
	    			<td width = "300" ><%=map.get("filmcountry") %></td>
	    			<th width = "200" class = "align_right" valign="top">◎语言:</th>
	    			<td width = "300"><%=map.get("filmlanguage") %></td>
	    		</tr>
	    		<tr>
	    			<th width = "200" class = "align_right" valign="top">◎类型:</th>
	    			<td width = "300"><%=map.get("filetype") %></td>
	    			<th width = "300" class = "align_right" valign="top">◎导演:</th>
	    			<td width = "300"><%=map.get("filmdirector") %></td>
	    		</tr>
	    		<tr>
	    			<th width = "200" class = "align_right" valign="top">◎更多中文名:</th>
	    			<td width = "300"><%=map.get("filmalais") %></td>
	    			<tr>
	    			<th width = "200" class = "align_right" valign="top">◎主演:</th>
	    			<td width = "300"><%=map.get("filmleadingrole") %></td>
	    		</tr>
	    		<tr>
	    			<th width = "200" class = "align_right" valign="top">◎上映时间:</th>
	    			<td width = "300"><%=map.get("filmonline") %></td>
	    			<%-- 
	    			<th width = "100" class = "align_right">剧情:</th>
	    			<td><%=map.get("FILMCONTENT") %></td> --%>
	    		</tr>
	    		<tr>
	    			<th width = "200" class = "align_right" valign="top">◎片长:</th>
	    			<td width = "300"><%=map.get("filmlasttime") %> 分钟</td>
	    			<%-- 
	    			<th width = "100" class = "align_right">幕后花絮:</th>
	    			<td><%=map.get("FILMBACKSTORY") %></td> --%>
	    		</tr>
	    	</table>
	    	
			<hr />
		
			<table border = "0">
	    		<tr>
	    			<th width = "200" colspan = '4' class = "align_left" valign="top">◎<font color = "blue"><%=map.get("filmname") %></font> - 更多图片</th>
	    		</tr>
	    		<tr>
	    			<%for(int i = 1; i < postArr.length; i++) {
	    			%>
	    				<td>
	    					<img width = "200px" height = "200px" src ="posts/<%=postArr[i] %>"  alt = "图片"/>
	    				</td>
	    			<%
	    			} 
	    			%>
	    		</tr>
	    	</table>
	    	
    		<hr />
		
			
			<table border = "0">
	    		<tr>
	    			<th width = "200" colspan = '4' class = "align_left" valign="top">◎<font color = "blue"><%=map.get("filmname") %></font> - 剧情</th>
	    		</tr>
	    		<tr>
	    			<td>&nbsp;&nbsp;&nbsp;&nbsp;<%=map.get("filmcontent") %></td>
	    		</tr>
	    	</table>
	    	
    		<hr />
			
			<table border = "0">
	    		<tr>
	    			<th width = "200" colspan = '4' class = "align_left" valign="top">◎<font color = "blue"><%=map.get("filmname") %></font> - 幕后花絮</th>
	    		</tr>
	    		<tr>
	    			<td>&nbsp;&nbsp;&nbsp;&nbsp;<%=map.get("filmbackstory") %></td>
	    		</tr>
	    	</table>
	    	
    		<hr />
			
			<table border = "0">
	    		<tr>
	    			<th width = "200" colspan = '4' class = "align_left" valign="top">◎<font color = "blue"><%=map.get("filmname") %></font> - 获奖情况</th>
	    		</tr>
	    		<tr>
	    			<td>&nbsp;&nbsp;&nbsp;&nbsp;<%=map.get("filmaward") %></td>
	    		</tr>
	    	</table>
    	</div>
    	<!-- 返回顶部 -->
    	<script type="text/javascript" src="js/scrolltopcontrol.js"></script>
  </body>
</html>
