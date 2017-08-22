function cg(){
	var input1 = document.getElementById("inp1");
	var input4 = document.getElementById("inp4");
	
	
	var select = document.getElementById("sel");
	if((select.value)==""){
		input4.type="hidden";
	}else{
		input4.type="button";
	}
	
	
	input1.value=select.value;
}

function lg(d){
	var input4 = document.getElementById("inp4");
	var input2 = document.getElementById("inp2");
	var lis = document.getElementsByTagName("li");
	var li = lis[d];
	input2.value=li.innerHTML;
	input4.type="button";
}
function lg_(d){
	var input4 = document.getElementById("inp4");
	var input3 = document.getElementById("inp3");
	var lis = document.getElementsByTagName("li");
	var li = lis[d];
	input3.value=li.innerHTML;
	input4.type="button";
}

function btn(){
	var input1 = document.getElementById("inp1").value;
	var input2 = document.getElementById("inp2").value;
	var input3 = document.getElementById("inp3").value;
	
	window.location.href="index_outlogin2.jsp?classify="+input1+"&price="+input2+"&degree="+input3;
}


function reca(){
	var v = document.getElementById("re").value;
	if(v==""){
		alert("«Î ‰»Îƒ⁄»›");
	}else{
		window.location.href="../wine_shop/index_rea.jsp?re="+v;	
	}
	
}




