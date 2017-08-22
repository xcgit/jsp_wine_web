
<%@page import="java.sql.ResultSet"%>
<%@page import="DBconnect.DBconnectSql" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link href="../../css_manage/add_wine.css" rel="stylesheet"type="text/css">
        
          <script type="text/javascript" src="../../js_manage/add_wine.js" charset="gbk"></script>
    
        <title>JSP Page</title>
    </head>
    <body >
<div id="right">
 
<div id="right_content">
	<form action="add_check_wine.jsp" onsubmit="return check()" method="get">
	<table id="r_table1">
		<tr id="tr_wId">
			<td><p>编号：</p></td>
			<td>
				<input class="wId" id="wId" type="text" onchange="i('wId')" name="wId"/>
			<td>
		</tr>
		<tr>
			<td><p>名称：</p></td>
			<td>
				<input type="text" class="wName" name="wName"/>
			<td>
		</tr>
		<tr>
			<td><p>类别：</p></td>
			<td>
		<span id ="hidden">
		<select name="wClassify" id="sele_wclass">
		<option value="" style="color: #b6b6b6"  selected>==请选择分类==</option>
		<%
			DBconnectSql db = new DBconnectSql();
			String sql = "select * from classify_wine order by cId asc;";
			db.setSql(sql);
			ResultSet rs = db.select();
			

			while(rs.next()){
				%>
				 <option value="<%=rs.getString(2)%>"><%=rs.getString(2)%></option>  
				
				<%
			}
		%>
		</select>
		</span>
		
				
				 
			<td>
		</tr>
		</table>
		<hr>
		<table id="r_table2">
		<tr>
			<td><p>价格：</p></td>
			<td>
				<input type="text" id="wPrice" onchange="i('wPrice')" name="wPrice"/>
			</td>
			<td><p>产地：</p></td>
			<td>
				<input type="text" name="wPlace" value="其他"style="color:#333;"onfocus="this.style.color='black'"/>
			</td>
			</tr>
			<tr>
			<td><p>口感：</p></td>
			<td>
				<input type="text" name="wTaste" value="其他"style="color:#333;"onfocus="this.style.color='black'"/>
			</td>
			<td><p>规格：</p></td>
			<td>
				<input type="text" name="wFormat"/>
			</td>
		</tr>
		<tr>
		<td><p>酒精度数：</p></td>
		<td>
		<input type="text" id="wDegree" onchange="i('wDegree')" name="wDegree" maxlength="4"/>
		</td>
		<td><p>品牌：</p></td>
		<td>
		<input type="text" name="wBrand"/>
		</td>
		</tr>
		<tr>
		<td><p>图片：</p></td>
		<td>
	
			
				
		<input type="file"   name="pic" style="width:300px;border:none" />
		
		</td>
		
		</tr>
		
	</table>

<div style="text-align:left">
<input type="submit" value="提交"   onclick="return check()" style="width:100px;height:30px;margin-left:44px;">
</div>

	</form>
	
	
</div>

</div>
  </body>
</html>
