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

	var url = "GetSalesDetailsServlet?currentPage=" + currentPage.value + "&startTime=" + $("#startTime").val() + "&endTime=" + $("#endTime").val();
	window.location.assign(url);
	
}

/** 分页部分结束 **/

//用户点击转到XX页执行的方法
function gotoSpecialPage() {
	
	var inputPage =  $("#inputPage").val();
	if(inputPage > $("#totalPage").val() || inputPage <= 0) {
		
		return;
		
	}
	
	var url = "GetSalesDetailsServlet?currentPage=" + $("#inputPage").val() + "&startTime=" + $("#startTime").val() + "&endTime=" + $("#endTime").val();
	window.location.assign(url);
}




















