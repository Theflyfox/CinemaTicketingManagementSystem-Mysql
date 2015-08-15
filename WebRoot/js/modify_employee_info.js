
//修改员工信息表单提交
function sub() {
	
	$.post("ModifyEmployeeInfoServlet",
			{"employeeId": $("#employeeId").val(),
				"name": $("#name").val(),
				"gender": $("#gender").val(),
				"age": $("#age").val(),
				"birthDate": $("#birthDate").val(),
				"idCode": $("#idCode").val(),
				"phoneNo": $("#phoneNo").val(),
				"entryTime": $("#entryTime").val(),
				"position": $("#position").val(),
				"password": $("#password").val(),
			},
			function(returnedDate, status) {
				
				if(returnedDate > 0) {
					
					art.dialog({
						title: '信息提示',
						content: '修改成功',
						icon: 'succeed',
						lock: true,
						ok: function(){
							return true;
							}
					});	
					
				}else {
					
					art.dialog({
						title: '信息提示',
						content: '修改失败！',
						icon: 'error',
						lock: true,
						ok: function(){
							return true;
							}
					});	
				}
			
			setTimeout("gotoPgae()", 1000);
		
			});
}

function gotoPgae() {
	window.location.assign("/ctms/MangeEmployeeServlet");
}


