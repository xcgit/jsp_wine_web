<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="DB.*"%><%@ page import="java.sql.*"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>


   <link href="../css_wine_shop/header.css" rel="stylesheet"type="text/css">
   <link href="../css_wine_shop/index.css" rel="stylesheet"type="text/css">
   <script type="text/javascript" src="../js/jquery-1.4.1.js" charset="gbk"></script>
   
 <script type="text/javascript" src="../js/index.js" charset="gbk"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script>


	$(function(){
		$(".swap_value").css("color","#444");
		
		$("input[type=image]").click(function(){
		
		
		
		
		
		$("#search_form").attr("action", "index.jsp");
		
		
		});
		$("#fi_page").attr("href","index.jsp?search_content="+$(".swap_value").val()+"&curPage=1"); 
		$("#la_page").attr("href","index.jsp?search_content="+$(".swap_value").val()+"&curPage=<%=curPage-1%>"); 
		$("#ne_page").attr("href","index.jsp?search_content="+$(".swap_value").val()+"&curPage=<%=curPage+1%>"); 
		$("#se_page").attr("href","index.jsp?search_content="+$(".swap_value").val()+"&curPage=<%=pageCount%>"); 
	
	});
	
	
	
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
		<img src="../picture/logo_.png" onclick="window.location.href='index.jsp'">
		<ul>
			<li><a href="#">用户名：<input type="text" id="use" value="<%=name %>" readonly style="border:none;width:40px;
	border:none;
	"></a></li>
			<li><a href="../cart_wine/cart.jsp">我的购物车</a></li>
			<li><a href="../order/my_order.jsp">我的订单信息</a></li>
			<li><a href="index_outlogin.jsp">退出登录</a></li>
		</ul>
	
	</div>
		<%String uId = session.getAttribute("uId").toString(); 
			session.setAttribute("uId",uId);
		
			
			%>
	
	
	
	<!-- content -->	
	<div id="content">
		<!-- <div id="top">
			<form name="forn">
     			 <input type="text" class="reac" id="re" value="">
     			 <input type="button" value="搜索" class="sub" onclick="reca()">
			</form>
			
		</div> -->
<div id="search_box"> 
<form id="search_form" method="post" action="#"> 
<input type="text" id="s" value="<%=search_content %>" name="search_content" class="swap_value" /> 
<input type="image" src="../picture/btn_rea.png" width="27" height="24" id="go" alt="Search" title="Search" /> 
</form> 
</div> 
		<div id="middle">
			<div class="cla">所有分类：<input type="text" id="inp1" readonly>
			<input type="text" id="inp2" readonly="readonly"><input type="text" id="inp3" readonly="readonly">
			<input type="hidden" id="inp4" onclick="btn()" value="确定">
			</div>
			<ul>
				<li class="the_one">种类：</li>
				<li><select onchange="cg()" id="sel">
				<option></option>
			<%
				connMysql c = new connMysql();
				c.setSql("select * from classify_wine;");
				ResultSet r = c.select();
				while(r.next()){
					%>
					<option><%=r.getString(2) %></option>
					<%
					
				}
			%>
			</select>
			
					
				</li>
			</ul>
			
			<ul id="pe">
				<li class="the_one">价格：</li>
				<li onclick="lg(7)">1-50</li>
				<li onclick="lg(8)">51-100</li>
				<li onclick="lg(9)">101-200</li>
				<li onclick="lg(10)">201-500</li>
				<li onclick="lg(11)">501-1000</li>
				<li onclick="lg(12)">1000以上</li>
					
			</ul>
			
			<ul class="du">
				<li class="the_one">度数：</li>
				<li onclick="lg_(14)">0-20度</li>
				<li onclick="lg_(15)">21-39度</li>
				<li onclick="lg_(16)">39度以上</li>
				
			</ul>
		</div>
		<!--悬浮客服  -->
	<div class="yb_conct">
  <div class="yb_bar">
    <ul>
      <li class="yb_top">返回顶部</li>
      <li class="yb_phone">1234-567-890</li>
      <li class="yb_QQ">
      <a  href="tencent://message/?uin=2089719628&Site=sc.chinaz.com&Menu=yes">qq客服</a>
      	 </li>
      <li class="yb_ercode" style="height:53px;">二维码 <br>
        <img class="hd_qr" src="../picture/erweima.png" width="125" alt="关注你附近"> </li>
    </ul>
  </div>
</div>
	
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
				<a href="../cart_wine/wine_to_sale.jsp?wId=<%=rs.getString(1) %>"><img src="../<%=rs.getString("wPicture") %>" style="opacity:0.9"></a>
				<input class="pric"type="text" readonly="readonly" value="¥<%=rs.getString("wPrice") %>">
					<a href="../cart_wine/wine_to_sale.jsp?wId=<%=rs.getString(1) %>"><textarea ><%=rs.getString("wName") %></textarea></a>
			
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
<a id="fi_page" href = "" >首页</a>  
<a id="la_page" href = "" >上一页</a>  
<a id="ne_page" href = "" >下一页</a>  
<a id="se_page" href = "" >尾页</a>  
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