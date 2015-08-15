function generatVipNo() {
	
	$.post("GenerateVipNoServlet", 
			{}, 
			
			function(returnedData, status) {
					
				var resultArray = $.parseJSON(returnedData);
				var flag = Number(resultArray[0].ADDRESULT);
				var vipNo = resultArray[0].VIPNO;
				
				if(flag > 0) {
					
					$("#vipNo").val(vipNo);
					dialog = art.dialog({
						title:"信息提示",
						content:"添加成功!" + "\n" +  "会员号:" + vipNo,
					    lock: true,
					    icon:'succeed',
					    background: '#600', // 背景色
					    opacity: 0.67,	// 透明度
					    ok:function() {
					    	
					    	$("#vipNo").val("");
					    	return true;
					    },
					    init: function () {
					    	var that = this, i = 3000;
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
					
					
					dialog = art.dialog({
						title:"信息提示",
						content:"添加失败!",
					    lock: true,
					    icon:'error',
					    background: '#600', // 背景色
					    opacity: 0.67,	// 透明度
					    ok:true,
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
			});
}