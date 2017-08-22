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
	String stat = new String(request.getParameter("state").getBytes("ISO-8859-1"),"utf-8");
	short state = 1;
	if(stat.equals("0")){
		state = 0;
	}
	if(stat.equals("4")){
		state = 4;
	} 
	order o =new order();
	o.setState(state);
	o.setW_o_Id(order_id);
	boolean b = o.upd_state();
	
	if(b){
		%>
		<script type="text/javascript">
			if(<%=state%>==4){
			alert("确认收货成功");}else{
				alert("订单已取消");
			}
			window.location.href="my_order.jsp";
		</script>
		<%
	}
	%>
	<%=order_id %>
</body>
</html>