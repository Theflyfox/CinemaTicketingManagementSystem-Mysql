/**选择jf图表类型时，载入图片*/
function loadChartBySelectType() {
    
	var startTime = $("#startTime").val();
	var endTime = $("#endTime").val();
    
    if(startTime == "" || endTime == ""){
    	return ;
    }
    
	 var disabledImageZone=document.getElementById("displayChart");
	 //这样多简单,清理div中己有的东东:)
	 disabledImageZone.innerHTML="";
	 var imageZone = document.createElement('img');
	 imageZone.setAttribute('id','imageZone');
	 //提取服务器上的图片显示下来:
	 imageZone.setAttribute('src',"GetAttendanceOfFilmSerlvet?startTime=" + startTime + "&endTime=" + endTime);
	 disabledImageZone.appendChild(imageZone);
}

//设置开始时间
function pickStartTime() {
	
	$('#startTime').setTime();
	
}


//选取结束时间
function pickEndTime() {
	
	setEndTime();
	
}

//设置结束时间
function setEndTime() {
	
	var startTime = $("#startTime").val();
		
		if(startTime == "") {
			
			dialog = art.dialog({
				title:"信息提示",
				content:"请先选择开始时间!",
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
			
		}else {
			
			var nowTimeArr = startTime.split(":");
			var hour = nowTimeArr[0];
			var mins = nowTimeArr[1];
			var secs = nowTimeArr[2];
			
			$('#endTime').setTime({
			    drag:true,
			    h:[hour,23],
			    i:[mins,59],
			    s:[secs,59],
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
		}
}