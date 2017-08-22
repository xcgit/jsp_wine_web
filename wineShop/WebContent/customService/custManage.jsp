<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="DB.*"%><%@ page import="java.sql.*"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>


   <link href="../css_wine_shop/header.css" rel="stylesheet"type="text/css">
   <link href="../css_wine_shop/index.css" rel="stylesheet"type="text/css">
     <script type="text/javascript" src="../js/jquery-1.4.1.js" charset="gbk"></script>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>主页</title>
<script type="text/javascript">
	$(function(){
		var flag="none";
		$("a[name=none]").click(function(){
			if(flag=="none"){
				$("#content").css("display","block");
				flag="block";
				return;
			}
			if(flag=="block"){
				$("#content").css("display","none");
				flag="none";
				return;
			}
		});
		
		$("input[value=查询]").click(function(){
			if($("input[type=text]").val()==""){
				alert("请输入订单编号");
			}
			$("form").submit();
		});
		
	});
</script>

</head>
<body>
<div id="header">
	<%
	String name = session.getAttribute("name").toString(); 
	session.setAttribute("name",name);
	
	
%>
	
		<img src="../picture/logo_.png"  onclick="window.location.href='./custManage.jsp'">
		<ul>
			<li><a href="#">用户名：<input type="text" id="use" value="<%=name %>" readonly style="border:none;width:40px;
	border:none;
	"></a></li>
			
			<li><a href="../login/login.jsp">退出登录</a></li>
		</ul>
	
	</div>
<hr>
<center style="margin-top:40px;">
<a href="#" name="none" style="color:#444;font-size:16px;">更改订单信息</a>&nbsp;&nbsp;
<a href="./cust_comment.jsp" style="color:#444;font-size:16px;">管理评论</a></center>
<div id="content"  style="text-align:center;margin-top:50px;display:none">
<form action="order_inform.jsp">
<span style="color:#444;font-size:14px;margin-right:10px;">请输入订单编号：
	<input type="text" name="order_id" style="width:180px;height:23px;"></span>
	<input type="button" value="查询" style="width:80px;height:25px;background:#fff;font-size:14px;color:#444;">
</form>
</div>


<div id="foot" style="margin-top:400px;">
<br>
	关于我们<span>|</span>免责声明<span>|</span>肆水流年网站<span>|</span>站点地图<span>|</span>友情链接<span>|</span>联系我们

</div>
</body>
</html>