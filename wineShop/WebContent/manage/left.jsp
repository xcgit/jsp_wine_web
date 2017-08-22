<%@page import="java.sql.ResultSet"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="DBconnect.DBconnectSql" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <link href="../css_manage/left.css" rel="stylesheet"type="text/css">
            <script type="text/javascript" src="../js_manage/left.js" charset="gbk"></script>
        <title>left</title>
<body>
<%
	DBconnectSql db = new DBconnectSql();
	String sql = "select * from classify_wine order by cId asc;" ;
	
	db.setSql(sql);
	ResultSet rs = db.select();
	rs.last();
 	int rows = rs.getRow();
 	rs.first();
	 
 	db.connectSql();
	
%>

<div id="left">
	<div id="left_content">
		<ul id="ul_1">
			<li id="li_head">商品管理</li>
			
		
			<li class="li_1"  onclick="" >
			<a onclick="to_show(1)"id="a1" target="right">
			<%=rs.getString(2)%>
			<input type="hidden"value="<%=rs.getString(1)%>" id="cId1">
			</a>
			</li>
			
		
			
			<%
				int i=1;
				while(rs.next()&&i<=rows){
					%>
						
			<li class="li_1" onclick="">
			<input type="hidden"value="<%=rs.getString(1)%>" id="cId<%=i+1%>">
			<a onclick="to_show(<%=i+1%>)"id="a<%=i+1%>" target="right">
			<%=rs.getString(2)%>
			</a>
			
			
			</li>
			
			
			<%
			i++;
			
				} %>
			

			</li>	
			
			
			
			
		</ul>
		
		
	</div>
</div>



</body>
</html>
