

<%@page import="cart_wine.wine"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="DBconnect.DBconnectSql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <link href="../css_customService/comm_show.css" rel="stylesheet"type="text/css">
               <script type="text/javascript" src="../js/jquery-1.4.1.js" charset="gbk"></script>
            <link href="../css_cart/header.css" rel="stylesheet"type="text/css">
            <script type="text/javascript" src="../js_cart/wine_to_sale.js" charset="gbk"></script>
        <title>wine_to_sale</title>
   <script type="text/javascript">
   var text = ""; 
   
   $(function(){
	  
	   $(".comm_content > textArea").focus(function(){
		   text = $(this).html();
	   });
	   
	   $(".upd_pinglun input[value=修改]").click(function(event){
		   if($(this).parent().parent().find("textArea").html()==""){
			   event.preventDefault(); 
		   		alert("评论内容不能为空！");
			   $(this).parent().parent().find("textArea").html(text);
		   }
		   else if(text==""||($(this).parent().parent().find("textArea").html()==text)){
			   event.preventDefault(); 
			  	alert("评论没有修改！请修改后再点击！");
			  
		   }
		  
		   else{
			   $(this).parent().parent().parent().attr("action", "cust_upd.jsp");
		   }
	   });
	 
	   $(".upd_pinglun input[value=删除]").click(function(){
		   $(this).parent().parent().parent().attr("action", "cust_del.jsp");
	   });
	   
   });
   </script>
<body onload="">

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


	

	<%
	
	
	String uId = session.getAttribute("uId").toString(); 
	session.setAttribute("uId",uId);
	session.setAttribute("user",uId);
	
		//	session.setAttribute("user","u123");
	//session.setAttribute("user","u123");
			String wId = new String(request.getParameter("wId").getBytes("ISO-8859-1"),"utf-8");	
			
			DBconnectSql db = new DBconnectSql();
			String sql = "select * from wine where wId ='"+wId+"';";
			 db.setSql(sql);
			/*ResultSet rs = db.select(); */
			wine w = new wine();
			w.get_wine(db);
			
		%>
	<div id="content" >
		
		<div id="left">
			<img src="../<%=w.getwPicture()%>" style="background:transparent;opacity:0.9"/>
		</div>
		
		
		
		<div id="right">
		<form name="wine_form" action="">
			<input type="hidden" id="uName"name="uName"value="<%=uId %>">
			
			<input type="hidden" id="wId"name="wId"value="<%=w.getwId()%>">
			<table>
				
				<tr>
					<td><input type="text" readonly  id="wName" name="wName"value="<%=w.getwName()%>"> </td>
					
				</tr>
				
				<tr>
					<td>价格：<input readonly id="wPrice"type="text" name="wPrice" value="￥<%=w.getwPrice()%>"></td>
				</tr>
				<tr><td><hr></td></tr>
				</table>
				<table id="t2">
				<tr>
					<td>分类：<input readonly type="text" id="wClassify" name="wClassify" value="<%=w.getwClassify()%>"></td>
					<td>产地：<input readonly id="wPlace"type="text"name="wPlace"  value="<%=w.getwPlace()%>"></td>
				</tr>
				
				<tr>
					<td>口感：<input readonly id="wTaste"type="text" name="wTaste" value="<%=w.getwTaste()%>"></td>
					<td>规格：<input readonly id="wFormat"type="text" name="wFormat" value="<%=w.getwFormat()%>"></td>
				</tr>
				<% 
					String degree="" ;
					if(w.getwDegree()==null){
						degree= "无";
					}else{
						degree=w.getwDegree();
					}
				%>
				
				<tr>
					<td>酒精度：<input readonly id="wTaste"type="text" name="wDegree" value="<%=degree%>"></td>
					<td>品牌：<input readonly id="wFormat"type="text" name="wBrand" value="<%=w.getwBrand()%>"></td>
				</tr>
			</table>
			<div id="q_l"><p>购买数量：</p></div><div id="q_r">
			<div>
			<i class="iconfont"  id="icon1" onclick="">&#xe972;</i><input id="quantity" name="quantity"type="text"onchange="d()" value="1">
			<i class="iconfont" id="icon2"onclick="">&#xe971;</i>
			</div>
			</div>
			
			<div id="sub">
				<input disabled="disabled" type="submit" id="add_cart" onclick="a_cart()" value="加入购物车">
				<input disabled="disabled" type="submit" id="buy_now"value="立即购买"  onclick="b_now()">
			</div>
			</form>
		</div>
		
	

	</div>
			<div id="comment">
	<hr>
	<%
		
		DBconnectSql dbc = new DBconnectSql();
		dbc.setSql("select * from comment where comm_wId = '"+wId+"';");
		ResultSet re = dbc.select();
		re.last();
		int i = 0;
		 i = re.getRow();
		re.first();
		re.previous();
		String comm_id="";
		%><div id="comm_top">已评论  <%=i %> </div><%
		while(re.next()){
			String comm_uId = re.getString("comm_uId");
			comm_id = re.getString("comm_Id");
			DBconnectSql dbc_ = new DBconnectSql();
			dbc_.setSql("select * from user where uId = '"+comm_uId+"';");
			ResultSet r = dbc_.select();
			String comment_name="";
			while(r.next()){
				comment_name = r.getString("uName");
			}
			%>
			<form >
			<div class="pinglun">
			<div class="comm_uName">用户名：<%=comment_name %></div>
			<div class="comm_content"><textarea rows="3" cols="" name="te" maxlength="162"><%=re.getString("comm_content") %></textarea>
			<br>
			<div class="comm_date"><%=re.getString("comm_date") %></div></div>
			<input type="hidden" name="commid" value="<%=comm_id%>">
			<input type="hidden" name="wId" value="<%=wId%>">
			<div class="upd_pinglun"><input type="submit" value="修改"><br><input type="submit" value="删除"></div>
			</div>
			</form>
			<%
			}
	%>
	
	
		<%-- <div id="comm_top">已评论  <%=i %> </div>
		<div class="pinglun">
			<div class="comm_uName">123</div>
			<div class="comm_content">非常漂亮的外观，大小适中，苹果6s用的，大概可以充7次，
			手感很好，用之前买的快充充电器2个口一起给充电宝充电不到5个小时，按下开关充电，
			不通电后会自动关闭，尤其是自带的数据短线，质量真心不错，一拖二还另外带一个typec转换头，
			光这配件就值20多元，输出输入都支持高通3.0快充，微淘中的充电常识很多，长见识！<br>
			<div class="comm_date">2017年03月12日 10:38</div></div>
		
		</div>
		<div class="pinglun">
			<div class="comm_uName">123</div>
			<div class="comm_content">非常漂亮的外观，大小适中，苹果6s用的，大概可以充7次，
			手感很好，用之前买的快充充电器2个口一起给充电宝充电不到5个小时，按下开关充电，
			不通电后会自动关闭，尤其是自带的数据短线，质量真心不错，一拖二还另外带一个typec转换头，
			光这配件就值20多元，输出输入都支持高通3.0快充，微淘中的充电常识很多，长见识！<br>
			<div class="comm_date">2017年03月12日 10:38</div></div>
			
		</div> --%>
	</div>
<div id="foot">
<br>
	关于我们<span>|</span>免责声明<span>|</span>肆水流年网站<span>|</span>站点地图<span>|</span>友情链接<span>|</span>联系我们

</div>
	
</body>
</html>