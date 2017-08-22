<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="DBconnect.DBconnectSql" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link href="../../css_manage/upd_del_wine.css" rel="stylesheet"type="text/css">
          <script type="text/javascript" src="../../js_manage/upd_del_wine.js" charset="gbk"></script>
    
        <title>JSP Page</title>
    </head>
<body>
	<%
	String s =session.getAttribute("dd").toString();
	DBconnectSql db =new DBconnectSql();
	 
	String sql_order = "delete from w_order where w_wId ="+s+";";
	db.setSql(sql_order);
	db.del_wine();
	
	String sql_cartItem = "delete from cartItem where c_w_Id ="+s+";";
	db.setSql(sql_cartItem);
	db.del_wine();
	
	String sql = "delete from wine where wId="+s+";";

	db.setSql(sql);
	boolean b = db.del_wine();
	

	if(b){%>
		<script type="text/javascript">
		alert("删除成功");
		window.location.href="../right.jsp"; 
		</script>
	<%}
%>
	
</body>
</html>