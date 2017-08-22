<%@page import="order.order"%>
<%@page import="java.util.Date"%>
<%@page import="cart_wine.wine"%>
<%@page import="DBconnect.DBconnectSql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <link href="../css_order/order.css" rel="stylesheet"type="text/css">
            <link href="../css_cart/header.css" rel="stylesheet"type="text/css">
            <script type="text/javascript" src="../js_cart/wine_buy.js" charset="gbk"></script>
        <title>wine_buy</title>
<body>

<%
	String name = session.getAttribute("name").toString(); 
	session.setAttribute("name",name);
	
	%>
 
	<div id="header">
	
		<img src="../picture/logo_.png"  oonclick="window.location.href='../wine_shop/index.jsp'">
		<ul>
			<li><a href="#">用户名：<input type="text" id="use" value="<%=name %>" readonly style="border:none;width:40px;
	border:none;
	"></a></li>
			<li><a href="../cart_wine/cart.jsp">我的购物车</a></li>
			<li><a href="my_order.jsp">我的订单信息</a></li>
			<li><a href="../wine_shop/index_outlogin.jsp">退出登录</a></li>
		</ul>
	
	</div>
	<%
	
	
	
		String user=new String(request.getParameter("user").getBytes("ISO-8859-1"),"utf-8");
		
		
		String wId = new String(request.getParameter("wId").getBytes("ISO-8859-1"),"utf-8");
		String quant = new String(request.getParameter("quant").getBytes("ISO-8859-1"),"utf-8");
		int qua = Integer.parseInt(quant);
		String place = new String(request.getParameter("place").getBytes("ISO-8859-1"),"utf-8");
		
		Date d =  new Date();
		String id = String.valueOf(d.getTime());
		short state = 1;
		
		order o =new order();
		o.setW_o_Id(id); o.setW_user(user); o.setW_wId(wId); o.setW_quant(qua);
		o.setW_place(place); o.setState(state);
		
		 boolean b =o.add_order();
 		if(b){
 		%>
 			<div id="content">
	<span>订单已生成</span>
		<div id="order_show">
			<div id="left">
				<img src="../picture/order.png">
			</div>
			<div id="right">
			<%
				String sql = "select * from wine where wId='"+wId+"';";
				DBconnectSql db = new DBconnectSql();
				db.setSql(sql);
				wine w =new wine();
				w.get_wine(db);
				float price = Float.parseFloat(w.getwPrice());
				float tot_price = price *   qua;
				
			%>
			
				<span>订单编号</span><input type="text" readonly="readonly" value="<%=id%>">
				<span>合计金额</span>
				<input type="text" readonly="readonly" id="pri" value="￥<%=tot_price%>">
				<span>收货地址</span><input type="text"readonly="readonly" value="<%=place%>">
				<input type="button" id="btn" onclick="window.location.href='../pay/pay_.jsp?price=<%=tot_price%>&pid=<%=id %>'" value="支付">
			</div>
		</div>
	</div>
 		<%
 		} 

	%>
<div id="foot" style="margin-top:100px;">
<br/>
	关于我们<span>|</span>免责声明<span>|</span>肆水流年网站<span>|</span>站点地图<span>|</span>友情链接<span>|</span>联系我们

</div>
	</body>
	</html>