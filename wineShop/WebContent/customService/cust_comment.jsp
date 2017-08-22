<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="DB.*"%><%@ page import="java.sql.*"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>


   <link href="../css_wine_shop/header.css" rel="stylesheet"type="text/css">
   <link href="../css_customService/cust_comment.css" rel="stylesheet"type="text/css">
   <script type="text/javascript" src="../js/jquery-1.4.1.js" charset="gbk"></script>
   
 <script type="text/javascript" src="../js/index.js" charset="gbk"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script>


	
	
	
	/*客服代码  */

	 $(function() {
			// 悬浮窗口
			$(".yb_conct").hover(function() {
				$(".yb_conct").css("right", "5px");
				$(".yb_bar .yb_ercode").css('height', '200px');
			}, function() {
				$(".yb_conct").css("right", "-127px");
				$(".yb_bar .yb_ercode").css('height', '53px');
			});
			// 返回顶部
			$(".yb_top").click(function() {
				$("html,body").animate({
					'scrollTop': '0px'
				}, 300);
			});
		});


</script>

<title>主页</title>
</head>
<body >
<!-- 
处理搜索的内容
 -->
<%  String sql = "select * from wine;"; 
String search_content="";
	try{
		 search_content="";
		 search_content = new String(request.getParameter("search_content").getBytes("ISO-8859-1"),"utf-8");	
		//out.println(search_content);
		if(!search_content.equals("")){
			
			sql = "select * from wine where wName like '"+'%'+search_content+"%' ;"; 
	//		out.println(sql);
		}
		
	} catch(Exception e){  
		
	}
	
	
	
%>


<div id="ou">
		<div id="header">
	<%
	String name = session.getAttribute("name").toString(); 
	session.setAttribute("name",name);
	%> 
		<img src="../picture/logo_.png" onclick="window.location.href='./custManage.jsp'">
		<ul>
			<li><a href="#">用户名：<input type="text" id="use" value="<%=name %>" readonly style="border:none;width:40px;
	border:none;
	"></a></li>
			
			<li><a href="../login/login.jsp">退出登录</a></li>
		</ul>
	
	</div>
		<%String uId = session.getAttribute("uId").toString(); 
			session.setAttribute("uId",uId);
		
			
			%>
	
	
	
	

			
	<div id="bottom">
<%!  
    
    public static final int PAGESIZE = 12;  
    int pageCount;  
    int curPage = 1;  
%> 
	<%  
    //一页放12个  
   
    try{  
       
       
        
        connMysql co = new connMysql();
        co.setSql(sql);
        
        ResultSet rs =co.select();  
        rs.last();  
        int size = rs.getRow();  
        pageCount = (size%PAGESIZE==0)?(size/PAGESIZE):(size/PAGESIZE+1);  
        String tmp = request.getParameter("curPage");  
        if(tmp==null){  
            tmp="1";  
        }  
        curPage = Integer.parseInt(tmp);  
        if(curPage>=pageCount) curPage = pageCount;  
        boolean flag = rs.absolute((curPage-1)*PAGESIZE+1);  
       
        int count = 0;  
          
        do{  
            if(count>=PAGESIZE)break;  
            int empno = rs.getInt(1);  
            String ename = rs.getString(2);  
            String job = rs.getString(3);  
          
           
           
            count++;  
            %>  
        <div class="cont">
				<a href="comm_show.jsp?wId=<%=rs.getString(1) %>"><img src="../<%=rs.getString("wPicture") %>" style="opacity:0.9"></a>
				<input class="pric"type="text" readonly="readonly" value="¥<%=rs.getString("wPrice") %>">
					<a href="comm_show.jsp?wId=<%=rs.getString(1) %>"><textarea ><%=rs.getString("wName") %></textarea></a>
			
			</div>
            <%  
        }while(rs.next());  
        
    }  
    catch(Exception e){  
          
    }  
%>  

		

	</div>
	<div id="bot">
	<div id="pa">
<a id="fi_page" href = "cust_comment.jsp?curPage=1" >首页</a>  
<a id="la_page" href = "cust_comment.jsp?curPage=<%=curPage-1%>" >上一页</a>  
<a id="ne_page" href = "cust_comment.jsp?curPage=<%=curPage+1%>" >下一页</a>  
<a id="se_page" href = "cust_comment.jsp?curPage=<%=pageCount%>" >尾页</a>  
第<%=curPage%>页/共<%=pageCount%>页  	
</div>	
	</div>
	
</div>
	
</div>
<br>
<div id="foot">
<br/>
	关于我们<span>|</span>免责声明<span>|</span>肆水流年网站<span>|</span>站点地图<span>|</span>友情链接<span>|</span>联系我们

</div>


</body>
</html>