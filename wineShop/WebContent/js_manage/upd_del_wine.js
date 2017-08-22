

function show(){
	var i = document.getElementById("upd_del");
	var sele_wclass = document.getElementById("sele_wclass");
	var input = document.getElementsByTagName("input");
	var wClass = document.getElementById("wClass");
	var wClassify = document.getElementById("wClassify");
	var wClass_value = wClass.value;
	
	
	var submit = document.getElementById("submit");
	if(!i.checked){
		
		input[1].setAttribute("readonly");
		input[1].style.border="none";
		input[2].setAttribute("readonly");
		input[2].style.border="none";
		wClass.style.display="block";
		wClassify.style.display="none";
		
		sele_wclass.setAttribute("disabled","true");
		sele_wclass.style.border="none";
		
		input[4].setAttribute("readonly");
		input[4].style.border="none";
		
		input[5].setAttribute("readonly");
		input[5].style.border="none";
		input[6].setAttribute("readonly");
		input[6].style.border="none";
		input[7].setAttribute("readonly");
		input[7].style.border="none";
		input[8].setAttribute("readonly");
		input[8].style.border="none";
		input[9].setAttribute("readonly");
		input[9].style.border="none";
		
		submit.style.display="none";
		
		wClass.value=wClass_value;
		
	}else{
		input[1].style.border="1px solid #D1D1D1";
		input[1].removeAttribute("readonly");
		input[2].style.border="1px solid #D1D1D1";
		input[2].removeAttribute("readonly");
		wClass.style.display="none";
		wClassify.style.display="block";
		
		sele_wclass.removeAttribute("disabled","false");
		sele_wclass.style.border="1px solid #D1D1D1";
		
		
		input[4].style.border="1px solid #D1D1D1";
		input[4].removeAttribute("readonly");
		input[5].style.border="1px solid #D1D1D1";
		input[5].removeAttribute("readonly");
		input[6].style.border="1px solid #D1D1D1";
		input[6].removeAttribute("readonly");
		input[7].style.border="1px solid #D1D1D1";
		input[7].removeAttribute("readonly");
		input[8].style.border="1px solid #D1D1D1";
		input[8].removeAttribute("readonly");
		input[9].style.border="1px solid #D1D1D1";
		input[9].removeAttribute("readonly");
		
		submit.style.display="block";
		wClass.value="";
		if(i.value=="upd"){
			
			i.value="del";
		
		}else{
			
			i.value="upd";
		
		}
	}
	

}


function upd(){

		
		/*document.form_u_d.action="u
		 * 
		 * pd_check.jsp";
		document.form_u_d.submit();*/
	
	document.form_u_d.action="upd_check.jsp";
	document.form_u_d.submit();

	
	
	
}




function del(){
	document.form_u_d.action="del_check.jsp";
	document.form_u_d.submit();
}


function i(id){
	document.getElementById(id).value=(document.getElementById(id).value).split(" ").join("");

}





