<%@page import="order.order"%>
<%@page import="DBconnect.DBconnectSql"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="DB.*"%><%@ page import="java.sql.*"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<body><%
	String name = session.getAttribute("name").toString(); 
	session.setAttribute("name",name);
	String order_id = new String(request.getParameter("order_id").getBytes("ISO-8859-1"),"utf-8");
	int  wqu = Integer.parseInt(new String(request.getParameter("wq").getBytes("ISO-8859-1"),"utf-8")) ;
	String place = new String(request.getParameter("place").getBytes("ISO-8859-1"),"utf-8");
	DBconnectSql db = new DBconnectSql();
	String sql = "update w_order set w_quant = "+wqu+" , w_place = '"+place+"' where w_o_Id = '"+order_id+"';";
	db.setSql(sql);
	//out.print(sql);
	if(db.upd_wine()){
		%>
		<script type="text/javascript">
		alert("修改成功");
		window.location.href="./order_inform.jsp?order_id="+<%=order_id%>;
		
		</script>
		
		<%
		
		
	}
%>
<%
	
%>


</body>
</html>