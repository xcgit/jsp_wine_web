<%@page import="cart_wine.*"%>
<%@page import="cart_wine.CartItem"%>
<%@page import="java.util.Date"%>
<%@page import="javax.xml.crypto.Data"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="DBconnect.DBconnectSql"%>
<%@page  import="java.util.*"%> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <link href="../css_cart/wine_to_sale.css" rel="stylesheet"type="text/css">
            <script type="text/javascript" src="../js_cart/wine_to_sale.js" charset="gbk"></script>
        <title>wine_add_cart</title>
<body>
	<%
		String c_w_Id = new String(request.getParameter("wId").getBytes("ISO-8859-1"),"utf-8");
		String c_u_Id = new String(request.getParameter("uName").getBytes("ISO-8859-1"),"utf-8");
		String quantity = new String(request.getParameter("quantity").getBytes("ISO-8859-1"),"utf-8");
/* 
		Date d =new Date();
		String  i = String.valueOf(d.getTime());
	 */
		CartItem c = new CartItem();
		
		c.setcQuantity(quantity);
		c.setC_w_Id(c_w_Id);
		c.setC_u_Id(c_u_Id);
		
		
		if(c.add_cart()){
			
			%>
	
		
			<script type="text/javascript">
			window.wId="<%=c_w_Id%>";
			alert("添加到购物车成功");
			window.location.href="./wine_to_sale.jsp?wId="+wId; 
			</script>
			
			<%
			
		}
		
		
		
		
	%>
	
</body>
</html>