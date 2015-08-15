
//用户点击登录时执行的方法
function login() {
	
	var loginName = $("#username").val();
	var psw = $("#password").val();
	
	if(loginName == "") {//未输入用户名
		
		var html = "<font color = 'red'> * 请输入用户名 !<font>";
		
		$("#loginNameNotice").html(html);
		
	}else if(psw == "") {//未输入密码
		
		var html = "<font color = 'red'> * 请输入密码 !<font>";
		
		$("#loginPasswordNotice").html(html);
		
	}else {//正常
		
		$.post(	'/ctms/LoginServlet', 
				{
					"loginName":loginName,
					"psw": psw
				}, 
					function(returnedDate, status) {
						
						if(returnedDate  < 0) {
							
							var html = "<font color = 'red'> * 用户名不存在或密码错误 !<font>";
							
							$("#loginNameNotice").html(html);
						}else {
							var url = "/ctms/frame/index.jsp";
							window.location.assign(url);
							
						}
					}
				);
	}
}