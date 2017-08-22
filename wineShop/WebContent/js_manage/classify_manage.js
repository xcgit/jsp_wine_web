



function ups(id){
	var cal = document.getElementById("clas"+id);
	var cId = document.getElementById("cId"+id).value;
	
	if(cal.value==""){
		alert("请输入内容");
	}else {
		cal.style.border="1px solid #eee";
		var cName = cal.value;
		window.location.href="classify_upd.jsp?cName="+cName+"&cId="+cId;
	}
	
	
	
	
}

function dels(id){
	var cal = document.getElementById("clas"+id);
	var cName = cal.value;
	var cId = document.getElementById("cId"+id).value;
	
	window.location.href="classify_del.jsp?cName="+cName+"&cId="+cId;
	
}



function add_calss(){
	var new_classify=document.getElementById("new_classify");
	if(new_classify.value==""){
		alert("请输入要添加的类别");
	}else{
		window.location.href="classify_add.jsp?cName="+new_classify.value;
	}
	
}

