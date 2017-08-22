<%@page import="java.sql.ResultSet"%>
<%@page import="DBconnect.DBconnectSql" %>
<%@page import="copyPicture.CopyPict" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link href="../../css_manage/add_wine.css" rel="stylesheet"type="text/css">
          <script type="text/javascript" src="../js_manage/add_wine.js" charset="gbk"></script>
    
        <title>JSP Page</title>
    </head>
    <body >
<%
 
 String wId = new String(request.getParameter("wId").getBytes("ISO-8859-1"),"utf-8");

	DBconnectSql db = new DBconnectSql();
	String sql = "select * from wine where  wId  ='"+wId+"';";
	db.setSql(sql);

	ResultSet rs = db.select();
	if(rs.next()){//判断输入的编号是否已经存在  存在则返回
		
		%>
		
		<script >
		alert("你输入的编号已存在，请重新输入");
		window.history.back(-1);
   </script>
		<%
		
		
		
	}
	
	
%>
<script type="text/javascript">
//alert("'"+"  h y u".split(" ").join(""));

</script>
	<%
	
	
	String wName = new String(request.getParameter("wName").getBytes("ISO-8859-1"),"utf-8");
	String wClassify  = new String(request.getParameter("wClassify").getBytes("ISO-8859-1"),"utf-8");
	 String wPrice  = new String(request.getParameter("wPrice").getBytes("ISO-8859-1"),"utf-8");
	 String wDegree  = new String(request.getParameter("wDegree").getBytes("ISO-8859-1"),"utf-8");
	 String wPlace  = new String(request.getParameter("wPlace").getBytes("ISO-8859-1"),"utf-8");
	String wTaste  = new String(request.getParameter("wTaste").getBytes("ISO-8859-1"),"utf-8");
	String wFormat  = new String(request.getParameter("wFormat").getBytes("ISO-8859-1"),"utf-8");
	

	String wBrand  = new String(request.getParameter("wBrand").getBytes("ISO-8859-1"),"utf-8");  

	//处理图片
	String wPicture   = new String(request.getParameter("pic").getBytes("ISO-8859-1"),"utf-8");

	String pic = CopyPict.change(wPicture);//把路径里的“\”转成“/”
	//CopyPict.copyFile(pic,"e:/er.jpg");//复制图片打破指定路径
	String pic_ =pic.substring(pic.lastIndexOf("."),pic.length());
	 wPicture ="picture/"+wId+pic_;
	
	sql = "insert into wine(wId,wName,wClassify,wPrice,wPlace,wTaste,wFormat,wDegree,wBrand,wPicture) value ('"+
			wId+"','"+wName+"','"+wClassify+"',"+wPrice+",'"+wPlace+"','"+wTaste+"','"+wFormat+"',"+wDegree+",'"+wBrand+"','"
	+wPicture+"');";
	
	db.setSql(sql);
	
	
	
	//取得项目绝对路径
	
	
	String t=Thread.currentThread().getContextClassLoader().getResource("").getPath(); 
	 int num=t.indexOf(".metadata");
	 String path=t.substring(1,num)+"wineShop/WebContent/picture/"+wId+pic_;
	
	
	
	
	boolean b =db.add_wine();
	if(b){
		CopyPict.copyFile(pic,path);
		%>
		<script type="text/javascript">
		alert("添加成功");
		window.location.href="./add_wine.jsp"; 
		</script>
		
		
	<%}
	




%>
<%=path %> || <%=wId %>  <%=wClassify %>  <%=wPrice %>  <%=wPlace %>  <%=wTaste %>  <%=wFormat %>  <%=wDegree %>  <%=wBrand %> <%=sql %>
<%-- <%=wId %>  <%=wPrice %>  <%=wDegree %> --%>

</body>
</html>