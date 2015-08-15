/**选择jf图表类型时，载入图片*/
function loadChartBySelectType(obj) {
    var month=obj.value;
    
    if(month=="-1"){
    	return ;
    }
    
	 var disabledImageZone=document.getElementById("displayChart");
	 //这样多简单,清理div中己有的东东:)
	 disabledImageZone.innerHTML="";
	 var imageZone = document.createElement('img');
	 imageZone.setAttribute('id','imageZone');
	 //提取服务器上的图片显示下来:
	 imageZone.setAttribute('src',"GetAttendanceRateByShowroomServlet?month="+month);
	 disabledImageZone.appendChild(imageZone);
}