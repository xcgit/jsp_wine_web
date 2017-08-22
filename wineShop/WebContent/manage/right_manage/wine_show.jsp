
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="DBconnect.DBconnectSql" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         
          <link href="../../css_manage/wine_shows.css" rel="stylesheet"type="text/css">
    
        <title>JSP Page</title>
    </head>
    <body  >
    <%String str = new String(request.getParameter("Str"));
    	String st=str;
    %>
   <div id="rigt">
    <%!  
    
    public static final int PAGESIZE = 15;  
    int pageCount;  
    int curPage = 1;  
%> 
	<%  
    //一页放12个  
   
    try{  
    	//out.println(str);
       
    	DBconnectSql db = new DBconnectSql();
    	String sql = "select * from classify_wine where cId="+'"'+str+'"'+';';
    	db.setSql(sql);
    	ResultSet rs = db.select();
    	if(rs.next()){
    		str = rs.getString(2);
    	}
    	sql = "select * from wine where wClassify = "+'"'+str+'"'+';';
    	db.setSql(sql);
    	rs = db.select();
    		
        rs.last();  
        int size = rs.getRow();  
       // out.println(size);
        pageCount = (size%PAGESIZE==0)?(size/PAGESIZE):(size/PAGESIZE+1);  
        String tmp = request.getParameter("curPage");  
        if(tmp==null){  
            tmp="1";  
        }  
        curPage = Integer.parseInt(tmp);  
        if(curPage>=pageCount) curPage = pageCount;  
        boolean flag = rs.absolute((curPage-1)*PAGESIZE+1);  
       
        int count = 0;  
        %>
        <div id="content">
        <% 
        do{  
            if(count>=PAGESIZE)break;  
            
            count++;  
            %>  
       <div class="show">
			<a href="upd_del_wine.jsp?wId='<%=rs.getString(1)%>'">
			<img src="../../<%=rs.getString("wPicture")%>"/>
			
			</a>
			<p>¥<%=rs.getString("wPrice") %></p>
			<%String s="upd_del_wine.jsp?wId='"+rs.getString(1)+"'"; %>
			
			<span><a href="upd_del_wine.jsp?wId='<%=rs.getString(1)%>'">
			<%=rs.getString("wName") %>
			</a></span>
		</div>
            <%  
        }while(rs.next());  
        
    }  
    catch(Exception e){  
          
    }  
%>  

		

	</div>
	<div id="bot">
	<div id="pa" style="text-align:center;color:#444;">
<a style="text-decoration:none;color:#444;" href = "wine_show.jsp?Str=<%=st %>&curPage=1" >首页</a>  
<a style="text-decoration:none;color:#444;" href = "wine_show.jsp?Str=<%=st %>&curPage=<%=curPage-1%>" >上一页</a>  
<a style="text-decoration:none;color:#444;" href = "wine_show.jsp?Str=<%=st %>&curPage=<%=curPage+1%>" >下一页</a>  
<a style="text-decoration:none;color:#444;" href = "wine_show.jsp?Str=<%=st %>&curPage=<%=pageCount%>" >尾页</a>  
第<%=curPage%>页/共<%=pageCount%>页  	
</div>	
	</div>
	
</div>
    
<%-- <div id="rigt">

 


<%
	String str = new String(request.getParameter("Str"));
	
	
	
	
	
	DBconnectSql db = new DBconnectSql();
	String sql = "select * from classify_wine where cId="+'"'+str+'"'+';';
	db.setSql(sql);
	ResultSet rs = db.select();
	if(rs.next()){
		str = rs.getString(2);
	}
	sql = "select * from wine where wClassify = "+'"'+str+'"'+';';
	db.setSql(sql);
	rs = db.select();
		

	int cols = 5;
	
	
	

%>
<div id="content">
<%

while(rs.next()){
%>
	<div class="show">
			<a href="upd_del_wine.jsp?wId='<%=rs.getString(1)%>'">
			<img src="../../<%=rs.getString("wPicture")%>"/>
			
			</a>
			<p>¥<%=rs.getString("wPrice") %></p>
			<%String s="upd_del_wine.jsp?wId='"+rs.getString(1)+"'"; %>
			<%=s %>
			<span><a href="upd_del_wine.jsp?wId='<%=rs.getString(1)%>'">
			<%=rs.getString("wName") %>
			</a></span>
		</div>
	
	<%
	
}


%>
</div> --%>

<%-- 

<div id="content">

		<div class="show">
			<a href="#"><img src="../../picture/1_1.png"/></a>
			<p>¥42.00</p>
			<span><a href="#">越杭永兴酒厂 十年陈花雕酒 清爽型半干糯米黄酒</a></span>
		</div>
			
		<div class="show">
			<a href="#"><img src="../../picture/1_1.png"/></a>
			<p>¥42.00</p>
			<span><a href="#">越杭永兴酒厂 十年陈花雕酒 清爽型半干糯米黄酒</a></span>
		</div>
		
		<div class="show">
			<a href="#"><img src="../../picture/1_1.png"/></a>
			<p>¥42.00</p>
			<span><a href="#">越杭永兴酒厂 十年陈花雕酒 清爽型半干糯米黄酒</a></span>
		</div>
		
		<div class="show">
			<a href="#"><img src="../../picture/1_1.png"/></a>
			<p>¥42.00</p>
			<span><a href="#">越杭永兴酒厂 十年陈花雕酒 清爽型半干糯米黄酒</a></span>
		</div>
		
	<div class="show">
			<a href="#"><img src="../../picture/1_1.png"/></a>
			<p>¥42.00</p>
			<span><a href="#">越杭永兴酒厂 十年陈花雕酒 清爽型半干糯米黄酒</a></span>
		</div>
</div>

--%>






<!--

<div id="div_table">

			<div class ="wine_img">
				<a href="#"><img src="../../picture/1_1.png"/></a>
			</div>
			<div class="wine_price">
				<p>¥42.00</p>
			</div>
			<div class="wine_name">
				<a href="#">越杭永兴酒厂 十年陈花雕酒 清爽型半干糯米黄酒</a>
			</div>
		</td>
		<td>
			<div>
			
			</div>
		</td>
		<td>
			<div>
			
			</div>
		</td>
		<td>
			<div>
			
			</div>
		</td>
		<td>
			<div>
			
			</div>
		</td>
	</tr>
	
</table>
<div>askldfjflkasjflk</div>
</div>
  -->

</div>
  </body>
</html>
