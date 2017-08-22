
function tab(d){
	
	for(var i = 1;i<=5;i++){
		if(d==i){
			document.getElementById("d"+i).style.display="block";
		}else
		document.getElementById("d"+i).style.display="none";
	}
}

function shw(id){
	window.location.href="./order_show_user.jsp?order_id="+id;
	
}

function comment(wid,order_id){
	$("input[value=ÒÑÆÀÂÛ]").click(function(event){
		event.preventDefault();
	});
	$("input[value=ÆÀÂÛ]").click(function(){
		window.location.href="./AddComment.jsp?w_wId="+wid+"&order_id="+order_id;
	});
	
	
}

function canc(id){
	window.location.href="./order_cancel_send_user.jsp?order_id="+id+"&state=0";
	
}
function rece(id){
	window.location.href="./order_cancel_send_user.jsp?order_id="+id+"&state=4";
	
}
function del(id){
	window.location.href="./order_del_user.jsp?order_id="+id;
	
}