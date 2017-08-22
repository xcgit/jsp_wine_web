
function forwa(){
	if(document.getElementById("reset_paswrd_username").value==""){
		alert("请输入用户名");
		return false;
	}else if(document.getElementById("reset_paswrd_question").value==""){
		alert("请输入密保问题");
		return false;
	}
	else if(document.getElementById("reset_paswrd_answer").value==""){
		alert("请输入密保答案");
		return false;
	}else{
		return true;
	}
	
	
}
