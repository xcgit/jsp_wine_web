<%@page import="cart_wine.wine"%>
<%@page import="order.order"%>
<%@page import="cart_wine.CartItem"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="DBconnect.DBconnectSql" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link href="../css_cart/header.css" rel="stylesheet"type="text/css">
            <link href="../css_order/wine_cart_order.css" rel="stylesheet"type="text/css">
            
            <script type="text/javascript" src="../js_cart/wine_cart_buy.js" charset="gbk"></script>
        <title>wine_buy</title>
<body>
		<div id="header">
		<%
	String name = session.getAttribute("name").toString(); 
		session.setAttribute("name",name);
	
	String uId = session.getAttribute("uId").toString(); 
	session.setAttribute("uId",uId);
	
%> 
		<img src="../picture/logo_.png"  onclick="window.location.href='../wine_shop/index.jsp'">
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
	String place=new String(request.getParameter("place").getBytes("ISO-8859-1"),"utf-8");
	
	String g=new String(request.getParameter("g").getBytes("ISO-8859-1"),"utf-8");
	int c = Integer.parseInt(g)-1;
	Map<Integer,wine> carts = (Map<Integer,wine>)session.getAttribute("map");
	
	
	CartItem ca = new CartItem();
	ca.setC_u_Id(user);
	order o =new order();
	o.setW_user(user);
	o.setW_place(place);
	short state = 1;
	int i = 0;
	Date d =new Date();
	float total=0;
	String od = String.valueOf(d.getTime());
	while(i<=c){
		String oid = String.valueOf(d.getTime()+i);
		wine w = carts.get(i);
		//out.println(oid);
		o.setW_o_Id(oid);
		o.setW_quant(Integer.parseInt(ca.quantity(w.getwId())));
		o.setState(state);
		o.setW_wId(w.getwId()); 
		//System.out.println(oid+" "+ca.quantity(w.getwId())+" "+w.getwId());
		o.add_order();
		total = total+Float.parseFloat(ca.quantity(w.getwId()))*Float.parseFloat(w.getwPrice());
		
		ca.setC_u_Id(user);
		ca.del_cart(user, w.getwId());
		
		
	//	out.println(w.getwId()+" "+i);
		i++;
	}
	
	
	/* out.println(g);
	out.w(carts.get(c).getwId()); */
	
	%>
	
	<div id="content">
	<span>订单已生成</span>
		<div id="order_show">
			<div id="left">
				<img src="../picture/order.png">
			</div>
			<div id="right">
				<span>订单编号</span><input type="text" readonly="readonly" value="<%=od %>">
				<span>合计金额</span>
				<input type="text" readonly="readonly" id="pri" value="￥<%=total %>">
				<span>收货地址</span><input type="text"readonly="readonly" value="<%=place%>">
				<input type="button" id="btn" onclick="window.location.href='../pay/pay_.jsp?price=<%=total%>&pid=<%=od %>'" value="支付">
			
			</div>
		</div>
	</div>
 	
	
	
	
	
	
	</body>
	</html>