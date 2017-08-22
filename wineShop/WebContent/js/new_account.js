
function check(){
	if(document.getElementById("ac_id").value==""){
		alert("请输入用户编号");return false;
	}else if(document.getElementById("name").value==""){
		alert("请输入用户名");return false;
	}else if(document.getElementById("paswrd").value==""){
		alert("请输入密码");
		return false;
	}
	
	else{
		return true;
	}	
	}