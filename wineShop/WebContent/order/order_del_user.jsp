<%@page import="order.order"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
	<%
	String order_id = new String(request.getParameter("order_id").getBytes("ISO-8859-1"),"utf-8");
	
	order o =new order();
	
	o.setW_o_Id(order_id);
	
	boolean b = o.del_order();
	
	if(b){
		%>  
		<script type="text/javascript">
			
			alert("删除成功");
				
		
			window.location.href="my_order.jsp"
		</script>
		<%
	}
	%>
	<%=order_id %>
</body>
</html>