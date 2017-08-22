<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="DBconnect.DBconnectSql"%>
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
String name = session.getAttribute("name").toString(); 
session.setAttribute("name",name);

String uId = session.getAttribute("uId").toString(); 
session.setAttribute("uId",uId);//1.评论用户id

String w_wId = new String(request.getParameter("w_wId").getBytes("ISO-8859-1"),"utf-8");	
String order_Id = new String(request.getParameter("order_Id").getBytes("ISO-8859-1"),"utf-8");	
String text = new String(request.getParameter("text").getBytes("ISO-8859-1"),"utf-8");	
	

/* out.println(w_wId+","+order_Id+","+text+","+uId); */
Date d  = new Date();
SimpleDateFormat sim = new SimpleDateFormat("yyyy年MM月dd日  hh:mm");
String time = sim.format(d);


long l = d.getTime();

DBconnectSql db = new DBconnectSql();
String sql = "insert into comment value ( '"+l+"','"+text+"','"+uId+"','"+w_wId+"','"+time+"');";
db.setSql(sql);
if(db.add_wine()){
	String s = "update w_order set state = 5 where w_o_Id = '"+order_Id+"';";
	db.setSql(s);
	db.upd_wine();
	%>
	<script type="text/javascript">
		alert("评论成功");
		window.location.href="AddComment.jsp?userId=<%=uId%>&w_wId=<%=w_wId%>&order_id=<%=order_Id%>";
	</script>
	
	<%
}
%>
</body>
</html>