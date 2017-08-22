<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <%@page import="java.sql.*"%>
  <%@page import="java.util.*"%>
  <%@page import="DB.*"%>   
<%@page import="DB.connMysql" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link href="../../css_login/reset_paswrd.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="../../js/identifying_code.js" charset="gbk"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>检测输入的信息</title>
</head>
<body>
	<%
	String ac_id =new String( request.getParameter("ac_id").getBytes("ISO-8859-1"),"utf-8");
	String name =new String( request.getParameter("name").getBytes("ISO-8859-1"),"utf-8");	
	String paswrd =new String( request.getParameter("paswrd").getBytes("ISO-8859-1"),"utf-8");	
	
	String sql = "select uId from user;";
	connMysql c = new connMysql();
	c.setSql(sql);
	ResultSet rs =c.select();
	boolean b = true;
	boolean d = false;
	while(rs.next()){
		String id = rs.getString(1);
			//out.println(reset_paswrd1);
		if(id.equals(ac_id)){
			%>
			<script type="text/javascript">
			alert("输入的用户编号已存在，请重新输入");
				window.location.href="new_account.jsp";
			</script>
			<%
		}else{
			b = false;
		}
	}
	if(b==false){
		sql = "insert into user value('"+ac_id+"','"+name+"','"+paswrd+"');";
		c.setSql(sql);
		d=c.insert();
		
	}
	if(d){
		%>
		<script type="text/javascript">
			alert("注册成功，返回登陆");
			window.location.href="../login.jsp";
		</script>
		<%
	}
	
	
	
	
	
	%>

</body>
</html>