
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
 	<div id="content">
 		<table>
 			<tr>
 				<th>类别</th>
 				<th>操作1</th>
 				<th>操作2</th>
 			
 	 			
 			</tr>
 			
 			<%
 				DBconnectSql db = new DBconnectSql();
 				String sql = "select * from classify_wine;";
 				db.setSql(sql);
 				ResultSet rs = db.select();
 				int i = 1;
 				while(rs.next()){
 					
 				%>
 				
 				
 					<tr>
 						<td id="t<%=i %>">
 						<input type="hidden" id="cId<%=i %>" value="<%=rs.getString(1) %>">
 						<input type="text" class="valu" id="clas<%=i%>" value="<%=rs.getString(2)%>"  ></td>
 						<td><input type="button" class="bt" onclick="ups(<%=i %>)" value="修改"></td>
 						<td><input type="button" class="bt" onclick="dels(<%=i %>)" value="删除"></td>
 					</tr>
 					
 				<% i++;}
 			%>
 			
 		</table>
 <script type="text/javascript">
 window.i = "<%=i%>";
 </script>
 		<div id="add">
			<input type="text" id="new_classify" value="">
			<input type="button" class="btn"   onclick="add_calss()" value="添加">
		</div>
 	</div>

 </body>

 </html>
