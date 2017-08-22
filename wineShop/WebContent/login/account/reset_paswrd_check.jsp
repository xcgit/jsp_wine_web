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
	String userId =new String( request.getParameter("reset_paswrd_username").getBytes("ISO-8859-1"),"utf-8");
	String reset_paswrd1 =new String( request.getParameter("reset_paswrd1").getBytes("ISO-8859-1"),"utf-8");	
	String reset_paswrd2 =new String( request.getParameter("reset_paswrd2").getBytes("ISO-8859-1"),"utf-8");	
	
	String sql = "select uId from user;";
	connMysql c = new connMysql();
	c.setSql(sql);
	ResultSet rs =c.select();
	boolean b = false;
	boolean d = false;
	while(rs.next()){
		String id = rs.getString(1);
			//out.println(reset_paswrd1);
		if(id.equals(userId)){
			b=true;
		}
	}
	if(b==false){
		{
			%>
			<script type="text/javascript">
			alert("输入信息错误");
				window.location.href="reset_paswrd.jsp";
			</script>
			<%
		}
	}else{
		sql = "select * from user where uId='"+userId+"';";
		c.setSql(sql);
		ResultSet r  = c.select();
		while(r.next()){
			String uPassword = r.getString("uPassword");
			if(uPassword.equals(reset_paswrd1)){
				sql = "update user set uPassword ='"+reset_paswrd2+"';";
				c.setSql(sql);
				d = c.update();
				out.println(d);
				
				%>
				<script type="text/javascript">
					alert("密码修改成功");
					window.location.href="../login.jsp";
				</script>
				<%
			}
			
		}
		
	}
	
	
	
	
	
	
%>




</body>
</html>