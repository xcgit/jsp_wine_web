

<%@page import="cart_wine.wine"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="DBconnect.DBconnectSql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <link href="../css_cart/wine_to_sale.css" rel="stylesheet"type="text/css">
            <link href="../css_cart/header.css" rel="stylesheet"type="text/css">
            <script type="text/javascript" src="../js_cart/wine_to_sale.js" charset="gbk"></script>
        <title>wine_to_sale</title>
<body onload="">

	<div id="header">
	
		<img src="../picture/logo_.png"  onclick="window.location.href='../wine_shop/index_outlogin.jsp'">
	
		<ul id="u2">
			<li><a href="../login/login.jsp">登录</a></li>
			
			
		</ul>
		<script type="text/javascript">
			window.id="13";
		</script>
	
	</div>

	

	<%
	
	
	
		//	session.setAttribute("user","u123");
	//session.setAttribute("user","u123");
			String wId = new String(request.getParameter("wId").getBytes("ISO-8859-1"),"utf-8");	
			
			DBconnectSql db = new DBconnectSql();
			String sql = "select * from wine where wId ='"+wId+"';";
			 db.setSql(sql);
			/*ResultSet rs = db.select(); */
			wine w = new wine();
			w.get_wine(db);
			
		%>
	<div id="content">
		
		<div id="left">
			<img src="../<%=w.getwPicture()%>" style="background:transparent;opacity:0.9"/>
		</div>
		
		
		
		<div id="right">
		<form name="wine_form" action="">
		
			
			<input type="hidden" id="wId"name="wId"value="<%=w.getwId()%>">
			<table>
				
				<tr>
					<td><input type="text" readonly  id="wName" name="wName"value="<%=w.getwName()%>"> </td>
					
				</tr>
				
				<tr>
					<td>价格：<input readonly id="wPrice"type="text" name="wPrice" value="￥<%=w.getwPrice()%>"></td>
				</tr>
				<tr><td><hr></td></tr>
				</table>
				<table id="t2">
				<tr>
					<td>分类：<input readonly type="text" id="wClassify" name="wClassify" value="<%=w.getwClassify()%>"></td>
					<td>产地：<input readonly id="wPlace"type="text"name="wPlace"  value="<%=w.getwPlace()%>"></td>
				</tr>
				
				<tr>
					<td>口感：<input readonly id="wTaste"type="text" name="wTaste" value="<%=w.getwTaste()%>"></td>
					<td>规格：<input readonly id="wFormat"type="text" name="wFormat" value="<%=w.getwFormat()%>"></td>
				</tr>
				<tr>
					<% 
					String degree="" ;
					if(w.getwDegree()==null){
						degree= "无";
					}else{
						degree=w.getwDegree();
					}
				%>
					<td>酒精度：<input readonly id="wTaste"type="text" name="wDegree" value="<%=degree%>"></td>
					<td>品牌：<input readonly id="wFormat"type="text" name="wBrand" value="<%=w.getwBrand()%>"></td>
				</tr>
			</table>
			<div id="q_l"><p>购买数量：</p></div><div id="q_r">
			<div>
			<i class="iconfont"  id="icon1" onclick="c()">&#xe972;</i><input id="quantity" name="quantity"type="text"onchange="d()" value="1">
			<i class="iconfont" id="icon2"onclick="add()">&#xe971;</i>
			</div>
			</div>
			
			<div id="sub">
				<input type="submit" id="add_cart" onclick="login()" value="加入购物车">
				<input type="submit" id="buy_now"value="立即购买"  onclick="login()" >
			</div>
			</form>
		</div>
	</div>
		
<div id="foot">
<br>
	关于我们<span>|</span>免责声明<span>|</span>肆水流年网站<span>|</span>站点地图<span>|</span>友情链接<span>|</span>联系我们

</div>
	
</body>
</html>