<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="DBconnect.DBconnectSql" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link href="../../css_manage/upd_del_wine.css" rel="stylesheet"type="text/css">
          <script type="text/javascript" src="../../js_manage/upd_del_wine.js" charset="gbk"></script>
    
        <title>JSP Page</title>
    </head>
<body>
<% 
 	
	String wId = new String(request.getParameter("wId").getBytes("ISO-8859-1"),"utf-8");
	String wName = new String(request.getParameter("wName").getBytes("ISO-8859-1"),"utf-8");

	String wClass  = new String(request.getParameter("wClassify").getBytes("ISO-8859-1"),"utf-8");
	if(wClass==""){
	 wClass  = new String(request.getParameter("wClassify").getBytes("ISO-8859-1"),"utf-8");}
	 String wPrice  = new String(request.getParameter("wPrice").getBytes("ISO-8859-1"),"utf-8");
	 String wDegree  = new String(request.getParameter("wDegree").getBytes("ISO-8859-1"),"utf-8");
	 String wPlace  = new String(request.getParameter("wPlace").getBytes("ISO-8859-1"),"utf-8");
	String wTaste  = new String(request.getParameter("wTaste").getBytes("ISO-8859-1"),"utf-8");
	String wFormat  = new String(request.getParameter("wFormat").getBytes("ISO-8859-1"),"utf-8");
	String wBrand  = new String(request.getParameter("wBrand").getBytes("ISO-8859-1"),"utf-8");  
	
	String s =session.getAttribute("dd").toString();
	
	DBconnectSql db = new DBconnectSql();
	String sql = "update wine set wId ='"+wId+"',wName='"+wName+"',wClassify='"+wClass+"',wPrice="+wPrice+",wDegree="
		+wDegree+",wPlace='"+wPlace+"',wTaste='"+wTaste+"',wFormat='"+wFormat+"',wBrand='"+wBrand
		+"' where wId="+s+";";
		db.setSql(sql);
		boolean b=db.upd_wine();
		
		if(b){%>
			<script type="text/javascript">
			alert("修改成功");
			window.location.href="./upd_del_wine.jsp?wId='<%=wId%>'"; 
			</script>
		<%}
%>
     

</body>
</html>