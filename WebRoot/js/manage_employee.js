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

	var url = "MangeEmployeeServlet?currentPage=" + currentPage.value + "&queryKey=" + $("#queryKey").val() + "&queryValue=" + $("#queryValue").val();
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
		
						$.post("DeleteEmployeeServlet", 
								{'employeeId':str},
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
									window.location.assign("MangeEmployeeServlet");
								});
					return true;
					},
		});
	}
}
			

			
/**新增员工**/
function addFilmOnscreen() {
	window.location.assign("employee/add_employee.jsp");
}


//用户直接点击属于当前行的修改
function immediateModify(employeeId) {
	//alert(filmId);
	window.location.assign("PrepareInfoForModifyEmployeeServlet?employeeId=" + employeeId);
}


//用户直接点击属于当前行的删除
function immediateDeleteItem(employeeId) {

		art.dialog({
				title: '信息提示',
				content: '确认删除选中项',
				icon: 'warning',
				lock: true,
				ok: function(){

				$.post("DeleteEmployeeServlet", 
						{'employeeId':employeeId},
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
							window.location.assign("MangeEmployeeServlet");
									});
						return true;
					},
		});

}


function gotoSpecialPage() {
	
	var inputPage =  $("#inputPage").val();
	if(inputPage > $("#totalPage").val() || inputPage <= 0) {
		
		return;
		
	}
	
	window.location.assign("MangeEmployeeServlet?currentPage=" + $("#inputPage").val());
}


















