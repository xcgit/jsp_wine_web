
function check(){
	if(document.getElementById("ac_id").value==""){
		alert("�������û����");return false;
	}else if(document.getElementById("name").value==""){
		alert("�������û���");return false;
	}else if(document.getElementById("paswrd").value==""){
		alert("����������");
		return false;
	}
	
	else{
		return true;
	}	
	}