
<%@page import="order.order"%>
<%@page import="cart_wine.wine"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="DBconnect.DBconnectSql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <link href="../css_cart/header.css" rel="stylesheet"type="text/css">
              <link href="../css_order/AddComment.css" rel="stylesheet"type="text/css">
            <script type="text/javascript" src="../js_cart/my_order.js" charset="gbk"></script>
        <title>wine_to_sale</title>
<script type="text/javascript"> 
function checkLen(obj)  
{ 
    var maxChars = 144;//最多字符数 
    if (obj.value.length > maxChars) 
    obj.value = obj.value.substring(0,maxChars); 
    var curr = maxChars - obj.value.length; 
    document.getElementById("countNum").innerHTML = curr.toString(); 
} 

function sub_form(){
	var text = document.getElementById("text").value;
	if(text==""){
		alert("评论内容不能为空");
		return false;
	}
	else{
		document.getElementById("the_form").submit();
	}
}


</script>
<body onload="">
	<div id="header">
	
		<%
	String name = session.getAttribute("name").toString(); 
		session.setAttribute("name",name);
	 
	String uId = session.getAttribute("uId").toString(); 
	session.setAttribute("uId",uId);//1.评论用户id
	
%>
	<img src="../picture/logo_.png" onclick="window.location.href='../wine_shop/index.jsp'">
		<ul>
			<li><a href="#">用户名：<input type="text" id="use" value="<%=name %>" readonly style="border:none;width:40px;
	border:none;
	"></a></li>
			<li><a href="../cart_wine/cart.jsp">我的购物车</a></li>
			<li><a href="my_order.jsp">我的订单信息</a></li>
			<li><a href="../wine_shop/index_outlogin.jsp">退出登录</a></li>
		</ul>
	
	</div>
	<% session.setAttribute("user",uId);
	String userId = session.getAttribute("user").toString();//用户id
	String w_wId = new String(request.getParameter("w_wId").getBytes("ISO-8859-1"),"utf-8");	//2.评论表里酒id
	String order_Id = new String(request.getParameter("order_id").getBytes("ISO-8859-1"),"utf-8");	//酒id
	DBconnectSql db = new DBconnectSql();
	db.setSql("select * from w_order where w_o_Id='"+order_Id+"' ;");
	ResultSet rs = db.select();
	String img  = "", quantity = "",wName="";
	float price = 0;  
	while(rs.next()){
		quantity = rs.getString("w_quant");
}
	db.setSql("select * from wine where wId = '"+w_wId+"' ;");
	rs = db.select();
	while(rs.next()){
		img = rs.getString("wPicture");
		wName = rs.getString("wName");
		price = rs.getFloat("wPrice");
	}
	float prices = price*Integer.parseInt(quantity);
	
	
	
	%>
<div id="content">
	<div id="top">
		<table>
			<tr><th>订单号：<%=order_Id %></th><th>商品信息</th><th>数量</th><th>交易金额</th></tr>
			<tr ><td id="im"><img src="../<%=img %>"></td>
			<td><%=wName %></td><td><%=quantity %></td><td><%=prices %></td></tr>
		</table>
	</div>
	
	<div id="bottom">
	<form id="the_form" action="./insert_comment.jsp">
	<input type="hidden" name="uId" value="<%=uId %>">
	<input type="hidden" name="w_wId" value="<%=w_wId %>">
	<input type="hidden" name="order_Id" value="<%=order_Id %>">
	
		<p>评价商品</p><br>
		<textArea cols="20"  id="text" onkeyup="checkLen(this)" name="text"></textArea><br>  <!--3.评论表里的内容  -->
		<div id="count">您还可以输入 <span id="countNum">144</span> 个文字</div> <br>
		<div id="btn"> <input type="button" onclick="return sub_form()" value="提交评论"></div>
	</form>	
	</div>
</div>	
<div id="foot">
<br>
	关于我们<span>|</span>免责声明<span>|</span>肆水流年网站<span>|</span>站点地图<span>|</span>友情链接<span>|</span>联系我们

</div>






</body>
</html>