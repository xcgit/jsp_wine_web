
function sub_order(){
	var place = document.getElementById("pla").value;
	
	if(place==""){
		alert("�������ջ���ַ");
	}else{
		
		window.location.href="../order/order.jsp?user="+user+"&wId="+wd+"&quant="+quant+"&place="+place;
	}
}