





function to_show(tr){
	var cId=document.getElementById("cId"+tr).value;
	//alert(cId);
	document.getElementById("a"+tr).href="../manage/right_manage/wine_show.jsp?Str="+cId;
}