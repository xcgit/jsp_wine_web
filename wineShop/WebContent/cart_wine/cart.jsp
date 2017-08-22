<%@page import="cart_wine.wine"%>
<%@page import="cart_wine.CartItem"%>
<%@page import="java.util.Map"%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="DBconnect.DBconnectSql" %>

<html>
    <head> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link href="../css_cart/cart.css" rel="stylesheet"type="text/css">
          <script type="text/javascript" src="../js_cart/cart.js" charset="gbk"></script>
    	    <link href="../css_cart/header.css" rel="stylesheet"type="text/css">
        <title>JSP Page</title>
    </head>
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
			<li><a href="../wine_shop/index_outlogin.jsp">退出登录</a></li>
		</ul>
	
	</div>

	

<div id="content">
	<table>
		<tr id="th">
			<td class="cbx"><input id="cbk_all"onclick="cbk()"  type="checkbox">全选</td><td class="cbx">商品名称</td><td>单价</td><td>数量</td><td>小计</td><td>操作</td>
		</tr>
		
	<%
		//String user = session.getAttribute("user").toString();
		
		//String user = new String(request.getParameter("uName").getBytes("ISO-8859-1"),"utf-8");
		CartItem c =new CartItem();
		c.setC_u_Id(uId);
		
		Map<String,wine> map= c.getW();
		int i = 0;
		for (wine w : map.values()) {
			i++;
			  %> 
			  
			<input type="hidden" id ="wId<%=i %>" value="<%=w.getwId()%>">
			          
			<tr>
			<td  class="cbx"><input type="checkbox"  onclick="cb(<%=i %>)" id="cbk<%=i%>"></td>
				<td id="im"><div><img src="../<%=w.getwPicture()%>"/></div>
				<div id="nm"><a href="#"><textarea readonly id=""> <%=w.getwName() %></textarea></a></div>
			</td><td><%=w.getwPrice() %></td>
			<td>
				<%=c.quantity(w.getwId()) %>
			</td>
			<td id="tot<%=i %>"><%=c.mul(w.getwPrice(),c.quantity(w.getwId()))
				
			%></td>
			<td class="del"><input type="button" onclick="de(<%=i%>)"value="删除"/></td>
		</tr>
			
			<%
			        }
%>
	<tr id="total">
		<td colspan="3"class="dell"></td><td colspan="3">总计：<span style="color:red" id="total_num">￥0</span></td>
	</tr>
	<tr>
		<td colspan="6" id="sub"><input type="button" onclick="btn()"  value="结算" ></td>
	</tr>	
	<tr></tr>	
		

		
		
	</table>
	<input type="hidden" value="<%=i%>"id="hidd">
</div>

<div class="container">


</div>


<script type="text/javascript">
		window.map = "<%=map%>";
		window.user = "<%=uId%>";
		map.remove("1");

	</script>

<%
	session.setAttribute("m",map); %>
</body>
</html>