function pic_cha(){
	var pic = document.getElementById("pic").value;
	var s =""+pic;
	document.getElementById("wPic").value=s;
	alert(document.getElementById("wPic").value);
}
//输入完成后 去除空格
function i(id){
	document.getElementById(id).value=(document.getElementById(id).value).split(" ").join("");
}



function check(){
	
	var input = document.getElementsByTagName("input");
	
	
	
	//判断编号是否为空 和数字
	if(input[0].value==""){
		
		
		alert("请输入编号");
		return false;
	
	}else if(isNaN(parseInt(input[0].value, 10))){
		alert("需要输入的编号必须是数字");
		return false;
	}
	
	else if(input[1].value==""){
		alert("请输入名称");
		return false;
	}else if(document.getElementById("sele_wclass").value==""){
		
		alert("请选择类别");
		return false;
	}else if(input[2].value==""){
		alert("请输入价格");
		return false;
	}else if(isNaN(parseInt(input[2].value, 10))){
		alert("需要输入的价格必须是数字");
		return false;
	}
	
	else if(input[5].value==""){
		alert("请输入规格");
		return false;
	}else if(input[6].value==""){
		alert("请输入酒精度数");
		return false;
	}else if(isNaN(parseInt(input[6].value, 10))){
		alert("需要输入的酒精度数必须是数字");
		return false;
	}else if(parseFloat(input[6].value)<=0||parseFloat(input[6].value)>=90){
		alert("需要输入的酒精度数必须是1~90");
		return false;
	}
	
	else if(input[7].value==""){
		alert("请输入品牌");
		return false;
	}else if(input[8].value==""){
		alert("你还没选择图片");
		return false;
	}else
	
	
	
	return true;
	
	
	
}