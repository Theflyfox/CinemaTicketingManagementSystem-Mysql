function nipicIndexSearch (){
	
	$("#keyword").focus(function(){
		$(this).css("outline","none");
		$("#searchsort").show().stop(true,false).animate({"width" : "66px"},200);
	});


	$(document).click(function(evt){
		if($(evt.target).attr("id") == "searchsort" || $(evt.target).attr("id") == "keyword"  || $(evt.target).closest("#searchsort").length > 0){
			$("#searchsort").show();
		}else{
			$("#searchsort").stop(true,false).animate({"width":"0px"},500,function(){
				$(this).css("overflow","hidden");
				$(this).hide();
			});
		}
	});


	$("#searchsort").hover(function(){
		$(this).css("overflow","visible");
		$(".searchsortlist").show();	
	},function(){
		$(this).css("overflow","hidden");
		$(".searchsortlist").hide();	
	});


	$(".searchItem").hover(function(){
		$(this).css({"background-color":"#039","color":"#fff"}).siblings().css({"background-color":"#fff","color":"#333"});
	});
	
		
	
	$(".searchItem").click(function(){
		var itemName = $(this).html(),kw = $("#keyword").val();
		$(".selectedsort .itemName").html(itemName);
		//var url = "http://soso.nipic.com/search.asp?itemName=" + itemName + "&kw=" + kw;	
		//if(kw.length != 0){
		//	window.location.href = url;
		//}
	});

	
	//查询按钮被点击
	$("#searchbtn").click(function(){
		//获取用户查询条件，查询值
		var queryKey = $(".itemName").html(),queryValue = $("#keyword").val();
		
		if(queryValue.trim().length != 0) { //查询值不为空,将查询值中的大写英文字母转换为小写进行查询
			
//			alert(queryKey);
			var url = "MangeFilmOnscreenInfoServlet?queryKey=" + queryKey + "&queryValue=" + queryValue.trim().toLowerCase() + "&currentPage=1";
			//$("#currentPage").val("value", 1);//查询时将当前页设置为1，从第一条记录开始查
			window.location.assign(url);
			return false;
		}else {
			alert("请输入查询内容");
		}


		
	});

}