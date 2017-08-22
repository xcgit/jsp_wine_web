<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="DBconnect.DBconnectSql" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link href="../../css_manage/upd_del_wine.css" rel="stylesheet"type="text/css">
          <script type="text/javascript" src="../../js_manage/upd_del_wine.js" charset="gbk"></script>
    
        <title>JSP Page</title>
  <!--       这些js代码只能写在body上，写在独立文件里没有反应 -->
        <script type="text/javascript">
         
        function checkNum(Str){
        	var patrn = /^(-)?\d+(\.\d+)?$/;
			if(patrn.exec(Str)==null||Str==""){
				return false;
			}else {
				return true;
			}
        } 
        
        	function al(id){
        		var v=document.getElementById(id);
        		if(v.value==""){
        			alert("请输入内容，不能为空");
        		}else  if(id=="wId"){
        			if(checkNum(v.value)){
        				}
        			else{
        				alert("需要输入的编号必须是数字");}
        			
        		}else if(id=="wPrice"){
        			if(checkNum(v.value)){
    				}
    			else{
    				alert("需要输入的价格必须是数字");}
        		}else if(id=="wDegree"){
        			if(checkNum(v.value)){
    				}
    			else{
    				alert("需要输入的酒精度必须是数字");}
        		}
        		
        		
        	}
        	
        	function se_al(){
        	var s=	document.getElementById("sele_wclass");
        	if(s.value==""){
        		alert("请选择一个类别");
        	}
        	}
        	
        </script>
    </head>
    <body >
    <%
    	String wId = new String(request.getParameter("wId"));
    	//String wId =session.getAttribute("aa").toString();
    
    	DBconnectSql db  = new DBconnectSql();
    	ResultSet rs = null; 
    	
    %>
    

<div id="upd_del_wine">

<div id = "div_check_box">
	<input type="checkbox" value="upd" onclick="show()"id="upd_del"/><span>编辑或删除</span>
	
</div>
<div id="content">
	
<div id="d_left">
<%
	String sq_="select wPicture from wine where wId ="+wId+";";
	db.setSql(sq_);
	ResultSet r_pic=db.select();
	while(r_pic.next()){
%>

	
	<img src="../../<%=r_pic.getString("wPicture") %>"><% }%>
</div>
<div id="d_right">



<form name="form_u_d" method="get">
		<table>
			<tr>
			
			<td><p>商品编号：</p></td><td><input type="text" onblur="al('wId')" onchange="i('wId')" readonly id="wId" name="wId"value=<%=wId %>></td>
			
			</tr>

<%
			
			String sql = "select * from wine where wId="+wId+";";
			db.setSql(sql);
			 rs = db.select();
			
	while(rs.next()){
	%>
	<tr>
			
			<td><p>名称：</p></td><td><input type="text" onblur="al('wName')" name="wName" id="wName"readonly  value="<%=rs.getString(2) %>"></td>
			
			</tr>
	<tr>
	
	<td><p>类别：</p></td>
	<td id="wClass">
	<input type="text" name="wClass" readonly  value="<%=rs.getString(3) %>">
	<%
	}
			
				%>



			
			<td id="wClassify"style="display:none">
			
			
		<span id ="hidden">
		<select name="wClassify" onblur="se_al()" disabled="disabled" id="sele_wclass">
		<option value="" disabled selected>==请选择分类==</option>
		<%
			String sql2 = "select * from classify_wine;";
			DBconnectSql d =new DBconnectSql();
			d.setSql(sql2);
			ResultSet r = d.select();
	
			while(r.next()){
				%>
				 <option value="<%=r.getString(2)%>"><%=r.getString(2)%></option>  

		<%	}
		%>
		</select>
		</span>
		</td>
		</tr>
		</table>
		<hr>
		
		<table id="d_right_table2">
		
		<% 
			rs=db.select();
			while(rs.next()){
				%>
				<tr>
			<td><p>价格：</p></td>
			<td>
				<input type="text" id="wPrice" onblur="al('wPrice')" onchange="i('wPrice')" value="<%=rs.getString(4)%>" name="wPrice"/>
			</td>
			<td><p>产地：</p></td>
			<td>
				<input type="text" id="wPlace" name="wPlace" onblur="al('wPlace')" value="<%=rs.getString(5)%>" />
			</td>
		</tr>
				<tr>
			<td><p>口感：</p></td>
			<td>
				<input type="text" id="wTaste" name="wTaste" onblur="al('wTaste')" value="<%=rs.getString(6)%>" />
			</td>
			<td><p>规格：</p></td>
			<td>
				<input type="text" id="wFormat" name="wFormat" onblur="al('wFormat')" value="<%=rs.getString(7)%>"/>
			</td>
		</tr>
		<tr>
		<td><p>酒精度数：</p></td>
		<td>
		<input type="text" id="wDegree" onchange="i('wDegree')" onblur="al('wDegree')" name="wDegree" value="<%=rs.getString(8)%>"maxlength="4"/>
		</td>
		<td><p>品牌：</p></td>
		<td>
		<input type="text" id="wBrand"name="wBrand" onblur="al('wBrand')"value="<%=rs.getString(9)%>"/>
		</td>
		</tr>
				<%
			}
		%>
		</table>
		<input type="hidden" id="wd" value="qweuop"/>
		<%
		session.setAttribute("dd",wId);
		%>
		<div id="submit">
		
		<input type="submit"name="submit1" onclick="upd()"value="修改"><input type="submit"name="submit2"onclick="del()" value="删除"></div>
	</form>
	
	
</div>
</div>
</div>
</body>
</html>