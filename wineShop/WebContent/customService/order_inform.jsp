<%@page import="DBconnect.DBconnectSql"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="DB.*"%><%@ page import="java.sql.*"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>


   <link href="../css_wine_shop/header.css" rel="stylesheet"type="text/css">
     <script type="text/javascript" src="../js/jquery-1.4.1.js" charset="gbk"></script>
     <link href="../css_customService/cust_order_inform.css" rel="stylesheet"type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript">
 
	$(function(){
		var s = parseInt($("#s1").val(), 10);
		
		var p = parseFloat($("input[type=hidden]").val());
		$("#s2").click(function(){
			s--;
			if(s<=1){
				s=1;
			}
			$("#s1").val(s);
			
		$("#pri").val("￥"+s*p);
		
		});
		
	$("#s3").click(function(){
		s++;
		$("#s1").val(s);
		$("#pri").val("￥"+s*p);
		});
	});
	
	$(function(){
		var v = $("#place").val();
		$("#sub").click(function(event){
			if($("#place").val()==""){
				alert("请输入收货地址！");
				event.preventDefault();
			}
			
		});
		
		
	});
	
	
	
	
</script>
<title>主页</title>
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

<%
	String order_id = new String(request.getParameter("order_id").getBytes("ISO-8859-1"),"utf-8");
	DBconnectSql db = new DBconnectSql();
	String sql = "select * from w_order where  w_o_Id = '"+order_id+"';";
	db.setSql(sql);
	String state ="",img="",wname="",wId="",wPlace="",wqu="";
	float price=0,wprice=0;
	ResultSet rs = db.select();
	while(rs.next()){
		state = rs.getString("state");
		wId = rs.getString("w_wId");
		wPlace = rs.getString("w_place");
		wqu = rs.getString("w_quant");
	}
	if(state.equals("")||state.equals("2")||state.equals("3")||state.equals("4")||state.equals("5")||state.equals("0")){
		%>
		<script type="text/javascript">
			alert("订单编号不正确！");
			window.location.href="./custManage.jsp";
		</script>
		<% 
	}
	String sql_W = "select * from wine where wId = '"+wId+"';";
	db.setSql(sql_W);
	ResultSet re =db.select();
	while(re.next()){
		img = re.getString("wPicture");
		wname = re.getString("wName");
		wprice = Float.parseFloat(re.getString("wPrice"));
		price = Integer.parseInt(wqu)*wprice;	
	}
	
%>
<div id="content">
<input type="hidden" value="<%=wprice %>">
<form  action="do_order_inform.jsp">
<input type="hidden" name="order_id" value="<%=order_id %>">
<table>
	<tr class="fir"><td colspan="2">订单号:<%=order_id %></td><td>数量</td><td>价格</td><td>收货地址</td><td>操作</td></tr>
	<tr><td><img src="../<%=img %>" style="width:80px;height:80px"/> </td>
	<td><textarea readonly="readonly"><%=wname %></textarea></td>
	<td class="ad_re"><input type="text" readonly="readonly" name="wq" value="<%=wqu%>" id="s1"> <div id="a_r"><b id="s2">－</b><b id="s3">＋</b></div>
	<td><input type="text" readonly="readonly" id="pri"  value="￥<%=price %>"/></td>
	<td class="pla"><input id="place" type="text"  name="place" value="<%=wPlace %>"/></td>
	<td class="btn"><input type="submit" id="sub"  value="修改"/></td>
	</tr>
	
</table>
</form>
</div>


<div id="foot" style="margin-top:400px;">
<br>
	关于我们<span>|</span>免责声明<span>|</span>肆水流年网站<span>|</span>站点地图<span>|</span>友情链接<span>|</span>联系我们

</div>
</body>
</html>