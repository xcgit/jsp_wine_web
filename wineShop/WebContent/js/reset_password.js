
function forwa(){
	if(document.getElementById("reset_paswrd_username").value==""){
		alert("�������û���");
		return false;
	}else if(document.getElementById("reset_paswrd_question").value==""){
		alert("�������ܱ�����");
		return false;
	}
	else if(document.getElementById("reset_paswrd_answer").value==""){
		alert("�������ܱ���");
		return false;
	}else{
		return true;
	}
	
	
}
