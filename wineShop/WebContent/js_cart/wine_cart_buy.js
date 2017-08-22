
function su(){
	var place = document.getElementById("plac").value;
	if(place==""){
		alert("请输入收货地址");
	}else{
		window.location.href="../order/wine_cart_toOrder.jsp?user="+user+"&g="+g+"&place="+place;
	}
	
}