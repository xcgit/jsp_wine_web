<%@page import="java.sql.ResultSet"%>
<%@page import="DBconnect.DBconnectSql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../css_manage/classify_manage.css" rel="stylesheet"type="text/css">
 			<script type="text/javascript" src="../js_manage/classify_manage.js" charset="gbk"></script>
    
        <title>t</title>
    </head>
 <body>
<%
	String cName = new String(request.getParameter("cName").getBytes("ISO-8859-1"),"utf-8");
	String cId = new String(request.getParameter("cId").getBytes("ISO-8859-1"),"utf-8");
	String sql = "update classify_wine set cName='"+cName+"' where cId = '"+cId+"';";
	DBconnectSql db = new DBconnectSql();
	db.setSql(sql);
	boolean b= db.upd_wine();
	if(b==true){
		%> 
			<script type="text/javascript">
				alert("修改成功");
				window.location.href="classify_manage.jsp";
			</script>
		<%
	}
%><%=sql +cId %>
</body>
</html>