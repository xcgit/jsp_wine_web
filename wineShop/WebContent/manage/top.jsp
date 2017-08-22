

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../css_manage/top.css" rel="stylesheet"type="text/css">
            <script type="text/javascript" src="../js/jquery-1.4.1.js" charset="gbk"></script>
 			<script type="text/javascript" src="../js_manage/change.js" charset="gbk"></script>
    
        <title>top</title>
    </head>
 <body>
<%--  <%
 String admin = session.getAttribute("admin").toString();
 %><%=admin %> --%>
 
 <div id="top">
 	<div>
 		<h2>肆水流年商城后台管理</h2>
 	</div>
 	
 	<div id="top_row">
   <div id="top_admin">
   	管理员：admin
   	
   </div>
   <div id="top_wine_manage">
   	<a href="left.jsp"target="left"
   	onclick="parent.right.location.href ='right.jsp';"
   	>酒类管理</a>
   	
   	<!-- 
   		一个a标签控制两个frame内容  一个用target 指向，一个用onclick 
   	 -->
   </div >
   <div id="top_order_manage">
   <a href="left.jsp" target="left" 
   onclick="parent.right.location.href ='./right_manage/order_manage/order_manage.jsp';">订单管理</a>
   </div>
   <div id="top_order_manage">
   <a href="classify_manage.jsp" target="right"style="position:absolute;"
  >分类管理</a>
   <a href="../login/login.jsp" target="_top" style="position:relative; ;top:0px;left:95px;"> 
  退出</a> <!-- target="_top" 能使页面整个跳转-->
   </div>
   </div>
 </div>
 <script type="text/javascript">
 	$(function(){
 		$("a[target=right]").mouseover(function(){
 			
 		});
 	});
 </script>
 </body>
</html>
