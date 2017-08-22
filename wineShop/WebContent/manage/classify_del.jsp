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
 	String sql_wId ="select * from wine where wClassify ='"+cName+"';" ;
 	DBconnectSql d = new DBconnectSql();
 	d.setSql(sql_wId);
 	ResultSet rs_wId = d.select();
 	while(rs_wId.next()){
 		String wId = rs_wId.getString("wId");
 		String sql_order = "delete from w_order where w_wId ='"+wId+"';";
 		d.setSql(sql_order);
 		d.del_wine();
 		String sql_cartItem = "delete from cartItem where c_w_Id ='"+wId+"';";
 		d.setSql(sql_cartItem);
 		d.del_wine();
 		String sql_ = "delete from wine where wId ='"+wId+"';";
 		d.setSql(sql_);
 		d.del_wine();
 		
 	}
 	
 //	d.del_wine();
 	
	String sql = "delete from classify_wine where cId='"+cId+"';";
	DBconnectSql db = new DBconnectSql();
	
	
	db.setSql(sql);
	boolean b =db.del_wine();
	if(b){
		%>
		<script type="text/javascript">
			alert("删除成功");
			window.location.href="classify_manage.jsp";
		</script>
	<%
	}
 %>


</body>
</html>