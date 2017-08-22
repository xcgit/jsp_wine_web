/*
function ic_(){
	var ic = document.getElementById("icon1");
	var quantity = document.getElementById("quantity");
	alert("123");
	
	if(quantity.value=="1"){
		ic.style.color="#777";
	}else {
		ic.style.color="#000";
		
		int i = parseInt(ic.value);
		i = i -1;
		ic.value=i.toString();
	}
}

function ic(){
	var ic = document.getElementById("icon2");
	int i = parseInt(ic.value);
	ic.value=i.toString();
	
}*/
function c(){
	var ic = document.getElementById("icon1");
	var quantity = document.getElementById("quantity");
	var quantity_ = parseInt(quantity.value);
	
		
		if(quantity_>1){
		quantity.value = quantity_-1;
		
		}
		if(quantity_==2){
			ic.style.color="#777";
		}
}

function add(){
	var ic = document.getElementById("icon1");
	ic.style.color="#000";
	var quantity = document.getElementById("quantity");
	var quantity_ = parseInt(quantity.value);
	quantity.value = quantity_+1;
	
}

function d(){
	var ic = document.getElementById("icon1");
	var quantity = document.getElementById("quantity");
	var quantity_ = parseInt(quantity.value);
	if(quantity_>1){
		ic.style.color="#000";
	}
}


function b_now(){
	
	if(document.getElementById("use").value==""){
		document.wine_form.action="login.jsp";
	}else{
	
	document.wine_form.action="wine_buy.jsp";
	
	}
}
function a_cart(){
	document.wine_form.action="wine_add_cart.jsp";
	
}
function login(){
	document.wine_form.action="../login/login.jsp";
	
}

function load(){
	var user = document.getElementById("use");
	var u = document.getElementById("uName");
	if(user.value==""){
		
	}else{
		
		u.value = user.value;
		
	}
}


