
function su(){
	var place = document.getElementById("plac").value;
	if(place==""){
		alert("�������ջ���ַ");
	}else{
		window.location.href="../order/wine_cart_toOrder.jsp?user="+user+"&g="+g+"&place="+place;
	}
	
}