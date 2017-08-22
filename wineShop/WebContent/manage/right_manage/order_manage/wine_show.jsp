
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="DBconnect.DBconnectSql" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         
          <link href="../../css_manage/wine_shows.css" rel="stylesheet"type="text/css">
    
        <title>JSP Page</title>
    </head>
    <body  >
<div id="rigt">

 


<%
	String str = new String(request.getParameter("Str"));
	
	
	
	
	
	DBconnectSql db = new DBconnectSql();
	String sql = "select * from classify_wine where cId="+'"'+str+'"'+';';
	db.setSql(sql);
	ResultSet rs = db.select();
	if(rs.next()){
		str = rs.getString(2);
	}
	sql = "select * from wine where wClassify = "+'"'+str+'"'+';';
	db.setSql(sql);
	rs = db.select();
		

	int cols = 5;
	
	
	

%>
<div id="content">
<%

while(rs.next()){
%>
	<div class="show">
			<a href="upd_del_wine.jsp?wId='<%=rs.getString(1)%>'">
			<img src="../../<%=rs.getString("wPicture")%>"/>
			
			</a>
			<p>¥<%=rs.getString("wPrice") %></p>
			<%-- <%String s="upd_del_wine.jsp?wId='"+rs.getString(1)+"'"; %>
			<%=s %> --%>
			<span><a href="upd_del_wine.jsp?wId='<%=rs.getString(1)%>'">
			<%=rs.getString("wName") %>
			</a></span>
		</div>
	
	<%
	
}


%>
</div>

<%-- 

<div id="content">

		<div class="show">
			<a href="#"><img src="../../picture/1_1.png"/></a>
			<p>¥42.00</p>
			<span><a href="#">越杭永兴酒厂 十年陈花雕酒 清爽型半干糯米黄酒</a></span>
		</div>
			
		<div class="show">
			<a href="#"><img src="../../picture/1_1.png"/></a>
			<p>¥42.00</p>
			<span><a href="#">越杭永兴酒厂 十年陈花雕酒 清爽型半干糯米黄酒</a></span>
		</div>
		
		<div class="show">
			<a href="#"><img src="../../picture/1_1.png"/></a>
			<p>¥42.00</p>
			<span><a href="#">越杭永兴酒厂 十年陈花雕酒 清爽型半干糯米黄酒</a></span>
		</div>
		
		<div class="show">
			<a href="#"><img src="../../picture/1_1.png"/></a>
			<p>¥42.00</p>
			<span><a href="#">越杭永兴酒厂 十年陈花雕酒 清爽型半干糯米黄酒</a></span>
		</div>
		
	<div class="show">
			<a href="#"><img src="../../picture/1_1.png"/></a>
			<p>¥42.00</p>
			<span><a href="#">越杭永兴酒厂 十年陈花雕酒 清爽型半干糯米黄酒</a></span>
		</div>
</div>

--%>






<!--

<div id="div_table">

			<div class ="wine_img">
				<a href="#"><img src="../../picture/1_1.png"/></a>
			</div>
			<div class="wine_price">
				<p>¥42.00</p>
			</div>
			<div class="wine_name">
				<a href="#">越杭永兴酒厂 十年陈花雕酒 清爽型半干糯米黄酒</a>
			</div>
		</td>
		<td>
			<div>
			
			</div>
		</td>
		<td>
			<div>
			
			</div>
		</td>
		<td>
			<div>
			
			</div>
		</td>
		<td>
			<div>
			
			</div>
		</td>
	</tr>
	
</table>
<div>askldfjflkasjflk</div>
</div>
  -->

</div>
  </body>
</html>
