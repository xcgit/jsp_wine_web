
function sub_order(){
	var place = document.getElementById("pla").value;
	
	if(place==""){
		alert("请输入收货地址");
	}else{
		
		window.location.href="../order/order.jsp?user="+user+"&wId="+wd+"&quant="+quant+"&place="+place;
	}
}