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
<%String name = session.getAttribute("name").toString(); 
session.setAttribute("name",name);
String uId = session.getAttribute("uId").toString(); 
session.setAttribute("uId",uId);
session.setAttribute("user",uId);
String wId = new String(request.getParameter("wId").getBytes("ISO-8859-1"),"utf-8");	

String commid = new String(request.getParameter("commid").getBytes("ISO-8859-1"),"utf-8");	
/* out.println(commid); */
String text = new String(request.getParameter("te").getBytes("ISO-8859-1"),"utf-8");	
//out.println(text);

DBconnectSql db = new DBconnectSql();
String sql = "update  comment set comm_content = '"+text+"' where comm_Id = '"+commid+"';";
db.setSql(sql);
if(db.upd_wine()){
	%>
<script type="text/javascript">
	alert("修改成功");
	window.location.href="comm_show.jsp?wId=<%=wId%>";
</script>	
	<%
}


%>
</body>
</html>