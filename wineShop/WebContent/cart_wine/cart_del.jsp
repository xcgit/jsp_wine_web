<%@page import="cart_wine.CartItem"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link href="../css_cart/cart.css" rel="stylesheet"type="text/css">
          <script type="text/javascript" src="../js_cart/cart.js" charset="gbk"></script>
    
        <title>JSP Page</title>
    </head>
<body>
	<% 
	String user = new String(request.getParameter("user").getBytes("ISO-8859-1"),"utf-8");
	String c_w_Id = new String(request.getParameter("c_w_Id").getBytes("ISO-8859-1"),"utf-8");
	 
	CartItem c = new CartItem();
	
	
	boolean b =c.del_cart(user,c_w_Id);
	if(b){
		
		%>
			<script type="text/javascript">
			alert("删除成功");
			window.location.href="./cart.jsp"; 
			</script>
		<%
		//out.println("删除成功");
	}
	%>

</body>
</html>