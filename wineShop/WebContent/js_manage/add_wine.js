function pic_cha(){
	var pic = document.getElementById("pic").value;
	var s =""+pic;
	document.getElementById("wPic").value=s;
	alert(document.getElementById("wPic").value);
}
//������ɺ� ȥ���ո�
function i(id){
	document.getElementById(id).value=(document.getElementById(id).value).split(" ").join("");
}



function check(){
	
	var input = document.getElementsByTagName("input");
	
	
	
	//�жϱ���Ƿ�Ϊ�� ������
	if(input[0].value==""){
		
		
		alert("��������");
		return false;
	
	}else if(isNaN(parseInt(input[0].value, 10))){
		alert("��Ҫ����ı�ű���������");
		return false;
	}
	
	else if(input[1].value==""){
		alert("����������");
		return false;
	}else if(document.getElementById("sele_wclass").value==""){
		
		alert("��ѡ�����");
		return false;
	}else if(input[2].value==""){
		alert("������۸�");
		return false;
	}else if(isNaN(parseInt(input[2].value, 10))){
		alert("��Ҫ����ļ۸����������");
		return false;
	}
	
	else if(input[5].value==""){
		alert("��������");
		return false;
	}else if(input[6].value==""){
		alert("������ƾ�����");
		return false;
	}else if(isNaN(parseInt(input[6].value, 10))){
		alert("��Ҫ����ľƾ���������������");
		return false;
	}else if(parseFloat(input[6].value)<=0||parseFloat(input[6].value)>=90){
		alert("��Ҫ����ľƾ�����������1~90");
		return false;
	}
	
	else if(input[7].value==""){
		alert("������Ʒ��");
		return false;
	}else if(input[8].value==""){
		alert("�㻹ûѡ��ͼƬ");
		return false;
	}else
	
	
	
	return true;
	
	
	
}