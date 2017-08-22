
<%@page import="DBconnect.DBconnectSql"%>
<%@page import="cart_wine.wine"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="order.order"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link href="../css_manage/order_show.css" rel="stylesheet"type="text/css">
           <link href="../css_cart/header.css" rel="stylesheet"type="text/css">
          <script type="text/javascript" src="../../../js_manage/order_manage.js" charset="gbk"></script>
<title>Insert title here</title>
</head>

<body onload="">
	<div id="header">
	 	<%String user = session.getAttribute("user").toString(); 
	String name = session.getAttribute("name").toString(); 
	session.setAttribute("name",name);
	
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
	String o_id = new String(request.getParameter("order_id").getBytes("ISO-8859-1"),"utf-8");	
	order o = new order();
	o.setW_o_Id(o_id);
	ResultSet rs = o.get_order();
	String uId="",uName="",place="",wPic="",wId="",wName="",wPrice="",w_quan="";
	while(rs.next()){
		w_quan = rs.getString("w_quant");
		uId = rs.getString("w_user");
		wId = rs.getString("w_wId");
		place = rs.getString("w_place");
		
	}
	DBconnectSql db = new DBconnectSql();
	String sql = "select * from user where uId ='"+uId+"';";
	db.setSql(sql);
	rs = db.select();
	while(rs.next()){
		uName=rs.getString("uName");
	}
	sql = "select * from wine where wId='"+wId+"';";
	db.setSql(sql);
	rs = db.select();
	while(rs.next()){
		wPic = rs.getString("wPicture");
		wName = rs.getString("wName");
		wPrice = rs.getString("wPrice");
	}
	
	%>
	
	<div id="content">
		<span>订单编号：<input type="text" style="background:transparent;" readonly="readonly" value="<%=o_id %>">
		</span>
		<div id="cont">
		<div id="re">收货人信息</div>
			<div id="receive">
				<span>收货人：<input type="text" style="background:transparent;"  readonly  value="<%=uName %>"></span>
				<span>收货地址：<input type="text" style="background:transparent;" readonly="readonly" value="<%=place %>"></span>
			</div>
			<hr>
			
		<div id="re">商品信息</div>
		<div id="order_mess">
			<table>
				<tr id="sh">
					<th id="mess_name">商品名称</th><th>单价</th><th>数量</th><th>小计</th>
				</tr>
				<tr id="mess">
					<td><div id="mes_left"><img src="../<%=wPic %>"></div><div id="mes_right">
					<input id="nm" type="text" readonly="readonly" value="<%=wName%>"></div></td>
					<td>￥<%=wPrice %></td><td><%=w_quan %></td><td>￥<%=Float.parseFloat(wPrice)*Float.parseFloat(w_quan) %></td>
				</tr>
			</table>
		</div>
		</div>
	</div>
<div id="foot">
<br/>
	关于我们<span>|</span>免责声明<span>|</span>肆水流年网站<span>|</span>站点地图<span>|</span>友情链接<span>|</span>联系我们

</div>
</body>
</html>
