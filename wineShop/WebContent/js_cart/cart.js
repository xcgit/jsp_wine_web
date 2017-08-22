
window.tot=0;//全局变量

function cbk(){
	
	var i = document.getElementById("hidd").value;
	 
	
	
	if(document.getElementById("cbk_all").checked==true){
	while(i>0){
		
		document.getElementById("cbk"+i).checked=true;
		tot= tot+parseInt(document.getElementById("tot"+i).innerHTML);
		
		i--;
	}
	}
	 if(document.getElementById("cbk_all").checked==false){
		while(i>0){
			
			document.getElementById("cbk"+i).checked=false;
			
			i--;
		}
		tot = 0;
	}
	document.getElementById("total_num").innerHTML="￥"+tot;
	
}


function cb(id){
	var i = document.getElementById("hidd").value;
	
	var cb = "cbk"+id;
	
	var c = document.getElementById(cb);
	var cbkAll = document.getElementById("cbk_all");
	if(c.checked){
		tot = tot+parseInt(document.getElementById("tot"+id).innerHTML);
		while(i>0){
			
			if(document.getElementById("cbk"+i).checked==true){
				i--;
			}else{
				break;
			}	
			
		}
		
		}else {
		
		tot = tot-parseInt(document.getElementById("tot"+id).innerHTML);
		cbkAll.checked=false;
	}
	if(i==0){
		document.getElementById("cbk_all").checked=true;
	}
	
	
	if(tot<=0){
		tot=0;
		var i_ = document.getElementById("hidd").value;
		//alert("cbk"+i_);
		for(i_;i_>=1;i_--){
			
			document.getElementById("cbk"+i_).checked=false;
		}
			
			
			
	}
	
	document.getElementById("total_num").innerHTML="￥"+tot;
}

function de(id){
	
	var v = document.getElementById("wId"+id);
	var c= "../cart_wine/cart_del.jsp?user="+user+"&c_w_Id="+v.value;
	window.location.href=c;
	
	
}

function btn(){
	var i = document.getElementById("hidd").value;
	var q ="";
	while(i>0){
		if(document.getElementById("cbk"+i).checked==true){
			q = i+"-"+q;
		}
		i--;
	}
	if(q==""){
		alert("请选中要购买的商品");
	}else{
		window.location.href="wine_cart_buy.jsp?q="+q+"&user="+user;
	}
	

}




