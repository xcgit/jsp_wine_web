<%@page import="cart_wine.wine"%>
<%@page import="DBconnect.DBconnectSql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <link href="../css_cart/wine_buy.css" rel="stylesheet"type="text/css">
           <link href="../css_cart/header.css" rel="stylesheet"type="text/css">
            <script type="text/javascript" src="../js_cart/wine_buy.js" charset="gbk"></script>
        <title>wine_buy</title>
        
         
<body>

	<%String user = session.getAttribute("user").toString(); 
	String name = session.getAttribute("name").toString(); 
	session.setAttribute("name",name);
	
	%>
	
	
	<div id="header">
	
		<img src="../picture/logo_.png"  onclick="window.location.href='../wine_shop/index.jsp'">
		<ul>
			<li><a href="#">用户名：<input type="text" id="use" value="<%=name %>" readonly style="border:none;width:40px;
	border:none;
	"></a></li>
			<li><a href="cart.jsp">我的购物车</a></li>
			<li><a href="../order/my_order.jsp">我的订单信息</a></li>
			<li><a href="../wine_shop/index_outlogin.jsp">退出登录</a></li>
		</ul>
	
	</div>
	
	<%
	String wId = new String(request.getParameter("wId").getBytes("ISO-8859-1"),"utf-8");
	String quantity = new String(request.getParameter("quantity").getBytes("ISO-8859-1"),"utf-8");
	String sql = "select * from wine where wId ='"+wId+"';";
	DBconnectSql db =new DBconnectSql();
	  db.setSql(sql);
	wine w = new wine();
	w.get_wine(db); 
	
	
	
	%>
	
	<div id="content">
	
		<span>生成订单</span>
		<table>
			
			<tr>
				<th>酒类名称</th><th>单价</th><th>数量</th><th >小计</th>
			</tr>
			<tr id="show">
			 	<td id="in"><div><img src="../<%=w.getwPicture()%>"/></div>
			 	<div id="nm"><a href="#"><textarea readonly id="wName"><%=w.getwName() %></textarea></a></div></td>
			 	<td id="wp"><input type="text"value="￥<%=w.getwPrice() %>">
			 	</td><td id="wq"><input type="text"value="<%=quantity %>"  ></td>
			 	
			 	<td id="pq"><input type="text" value="￥<%=Float.parseFloat(w.getwPrice())*Integer.parseInt(quantity) %>" ></td> 
			 	
			 	
			</tr>
			
			<tr  id="total">
			<td></td><td></td><td></td>
				<td>总计:<input type="text"value="￥<%=Float.parseFloat(w.getwPrice())*Integer.parseInt(quantity) %>" ></td>
			</tr>
		</table>
		
		<span>收货地址</span><br>
		<div id="place"><span><input id="pla" value=""type="text"></span></div>
		<div id="sub"><span><input type="submit" onclick="sub_order()" value="提交订单"></span></div>
		
			</div>
	
	<div id="foot" style="margin-top:100px;">
<br/>
	关于我们<span>|</span>免责声明<span>|</span>肆水流年网站<span>|</span>站点地图<span>|</span>友情链接<span>|</span>联系我们

</div>
	
</body>
<script type="text/javascript">
	window.user = "<%=user%>";
	window.wd = "<%=w.getwId()%>";
	window.quant = "<%=quantity%>";
</script>
</html>