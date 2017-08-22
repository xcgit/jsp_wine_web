<%@page import="cart_wine.wine"%>
<%@page import="cart_wine.CartItem"%>
<%@page import="java.util.*"%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="DBconnect.DBconnectSql" %>


<html> 
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <link href="../css_cart/wine_buy.css" rel="stylesheet"type="text/css">
             <link href="../css_cart/header.css" rel="stylesheet"type="text/css">
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
			<li><a href="cart.jsp">我的购物车</a></li>
			<li><a href="../order/my_order.jsp">我的订单信息</a></li>
			<li><a href="">退出登录</a></li>
		</ul>
	
	</div>
	<%
	Map<String,wine> map = (Map<String,wine>)session.getAttribute("m");
	
	String user = new String(request.getParameter("user").getBytes("ISO-8859-1"),"utf-8");	
	String q = new String(request.getParameter("q").getBytes("ISO-8859-1"),"utf-8");
	String key[] = q.split("-");
	CartItem c =new CartItem();
	c.setC_u_Id(user);
		int i = 0;
		/* for(wine w : map.values()){
			out.println(w.getwId());
			i++;
		}  */
		
		
	/* 	
		for (Map.Entry<String, wine> m: map.entrySet())  {
			out.println(m.getKey()+"\t");
			} */
			Map<Integer,wine> carts=new LinkedHashMap<Integer,wine>();
	%>

	<div id="content">
		<span>生成订单</span>
		<table>
			<tr>
				<th>酒类名称</th><th>单价</th><th>数量</th><th >小计</th>
			</tr>
		<%
		int g = 0;
		float total = 0;
			while(g<key.length){
				wine w = map.get(key[g]);
				
				%>
				<tr id="show">
			 	<td id="in"><div><img src="../<%=w.getwPicture()%>"/></div>
			 	<div id="nm"><a href="#"><textarea readonly id="wName"><%=w.getwName() %></textarea></a></div></td>
			 	<td id="wp"><input type="text"value="￥<%=w.getwPrice() %>">
			 	</td><td id="wq"><input type="text"value="<%=c.quantity(w.getwId()) %>"></td>
			 	
			 	<td id="pq"><input type="text" value="￥<%=c.mul(w.getwPrice(),c.quantity(w.getwId()))%>" ></td> 
			 	
			 	
			</tr>
				
			
			
			<%	
			carts.put(g, w);
			
			total = total + c.mul(w.getwPrice(),c.quantity(w.getwId()));
			g++;
			}
		%>
		
		
<%
	session.setAttribute("map",carts); %>
		<tr  id="total">
			<td></td><td></td><td></td>
				<td>总计:<input type="text"value="￥<%=total %>" ></td>
			</tr>
		</table>		
			
			
			
		
		
		
		<span>收货地址</span><br>
		<div id="place"><span><input type="text" id="plac"></span></div>
		<div id="sub"><span><input type="submit" onclick="su()" value="提交订单"></span></div>
	</div>
	
	<div id="foot" style="margin-top:100px;">
<br/>
	关于我们<span>|</span>免责声明<span>|</span>肆水流年网站<span>|</span>站点地图<span>|</span>友情链接<span>|</span>联系我们

</div>

</body>
<script type="text/javascript">
	window.user = "<%=user%>";

	window.g = "<%=g%>";
</script>
</html>