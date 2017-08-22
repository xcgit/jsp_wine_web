<%@page import="java.sql.ResultSet"%>
<%@page import="DB.connMysql"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="../css_login/login.css" rel="stylesheet" type="text/css"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>登陆</title>
</head>
<body >
<%
	String name = new String(request.getParameter("username").getBytes("ISO-8859-1"),"utf-8");	
	String password = new String(request.getParameter("password").getBytes("ISO-8859-1"),"utf-8");	
	String u = new String(request.getParameter("u").getBytes("ISO-8859-1"),"utf-8");	
	String pas="";String uId="";
	connMysql c = new connMysql();

	/*管理员的验证  */
	if(u.equals("管理员")){
		c.setSql("select * from admin where aName= '"+name+"';");
		ResultSet b = c.select();
		while(b.next()){
			pas = b.getString("aPaswrd");
			//out.print("b.uid:"+uId);
			if(pas.equals(password)){
				session.setAttribute("admin",name);
				%>
				<script type="text/javascript">
				window.location.href="../../wineShop/manage/main.jsp";
				</script>
				<%
				
			}else{
				%>
				<script type="text/javascript">
					alert("密码错误");
					window.location.href="login.jsp";
				</script>
				<% 
			}
			
		}
		if(pas.equals("")){
			%>
			<script type="text/javascript">
			alert("账户不存在");
			window.location.href="login.jsp";
			</script>
			<%
		}

	
	}
	
	
	/*客服的验证  */
	if(u.equals("客服")){
		c.setSql("select * from customService where csName= '"+name+"';");
		ResultSet b = c.select();
		while(b.next()){
			pas = b.getString("csPaswrd");
			uId = b.getString("csId");
			//out.print("b.uid:"+uId);
			if(pas.equals(password)){
				session.setAttribute("uId",uId);
				session.setAttribute("name",name);
				%>
				<script type="text/javascript">
				window.location.href="../customService/custManage.jsp";
				</script>
				<%
				
			}else{
				%>
				<script type="text/javascript">
					alert("密码错误");
					window.location.href="login.jsp";
				</script>
				<% 
			}
			
		}
		if(pas.equals("")){
			%>
			<script type="text/javascript">
			alert("账户不存在");
			window.location.href="login.jsp";
			</script>
			<%
		}

	
	}
	
	/*用户的验证  */
	if(u.equals("用户")){
		c.setSql("select * from user where uName= '"+name+"';");
		ResultSet b = c.select();
		while(b.next()){
			pas = b.getString("uPassword");
			uId = b.getString("uId");
			//out.print("b.uid:"+uId);
			if(pas.equals(password)){
				session.setAttribute("uId",uId);
				session.setAttribute("name",name);
				%>
				<script type="text/javascript">
				window.location.href="../wine_shop/index.jsp";
				</script>
				<%
				
			}else{
				%>
				<script type="text/javascript">
					alert("密码错误");
					window.location.href="login.jsp";
				</script>
				<% 
			}
			
		}
		if(pas.equals("")){
			%>
			<script type="text/javascript">
			alert("账户不存在");
			window.location.href="login.jsp";
			</script>
			<%
		}

	
	}
	//out.print("name:"+name+" "+password+" "+u);
%>




<%-- 
<%
	String name = new String(request.getParameter("username").getBytes("ISO-8859-1"),"utf-8");	
	String password = new String(request.getParameter("password").getBytes("ISO-8859-1"),"utf-8");	
	String pas="";String uId="";
	
	
	
	connMysql c = new connMysql();
	c.setSql("select * from user where uName= '"+name+"';");
	ResultSet b = c.select();
	while(b.next()){
		pas = b.getString("uPassword");
		uId = b.getString("uId");
		if(pas.equals(password)){
			%>
			<script type="text/javascript">
		
		window.location.href="../wine_shop/index.jsp";
		</script>
			<%
		}else{
			%>
			<script type="text/javascript">
			alert("密码错误");
			window.location.href="login.jsp";
			</script>
			<%
		}
		
	}
	session.setAttribute("uId",uId);
	session.setAttribute("name",name);
	if(pas.equals("")){
		
		c.setSql("select * from admin where aName= '"+name+"';");
		b=c.select();
		while(b.next()){
			pas=b.getString("aPaswrd");
			
			if(pas.equals(password)){
				
				session.setAttribute("admin",name);
				%>
				
				
				<script type="text/javascript">
			
			
			window.location.href="../../wineShop/manage/main.jsp";
			</script>
				<%
			}else if(!pas.equals(password)){
				%>
				<script type="text/javascript">
				alert("密码错误");
				window.location.href="login.jsp";
				</script>
				<%
			}
		}
		
		if(pas.equals("")){
			%>
			<script type="text/javascript">
			alert("账户不存在");
			window.location.href="login.jsp";
			</script>
			<%
		}
	}
	

	
	
	

%>
 --%>
</body>
</html>