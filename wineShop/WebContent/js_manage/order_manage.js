function tab(id){
	
	
	for(var i = 1;i<=5;i++){
		var tab = document.getElementById("d"+i);
		if(id==i){
			tab.style.display="block";
		}else{
		tab.style.display="none";
		}
	}
	
}

function deal(state){
	var order_id = document.getElementById("order_id").value;
	window.location.href="../order_manage/order_cancel_send.jsp?order_id="+order_id+"&state="+state;
}
function deal_(st){
	var order_id_= document.getElementById("order_id_").value;
	window.location.href="../order_manage/order_cancel_send.jsp?order_id="+order_id_+"&state="+st;
}

function shw(id){
	window.location.href="order_show.jsp?order_id="+id;
	
}




