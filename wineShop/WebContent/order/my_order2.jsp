
<%@page import="order.order"%>
<%@page import="cart_wine.wine"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="DBconnect.DBconnectSql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <link href="../css_cart/header.css" rel="stylesheet"type="text/css">
             <script type="text/javascript" src="../js/jquery-1.4.1.js" charset="gbk"></script>
              <link href="../css_order/my_order2.css" rel="stylesheet"type="text/css">
            <script type="text/javascript" src="../js_cart/my_order.js" charset="gbk"></script>
        <title>wine_to_sale</title>
 <%String op = new String(request.getParameter("op").getBytes("ISO-8859-1"),"utf-8");	 
	//out.println(op);
%>
<script type="text/javascript">
window.op="<%=op%>";
function opt(){
	
	for(var i = 1;i<=5;i++){
		if(op==i){
			document.getElementById("d"+i).style.display="block";
		}else
		document.getElementById("d"+i).style.display="none";
	}
}
</script>

<body onload="opt()">
	<div id="header">
	
		<%
	String name = session.getAttribute("name").toString(); 
		session.setAttribute("name",name);
	 
	String uId = session.getAttribute("uId").toString(); 
	session.setAttribute("uId",uId);
	
%>
	<img src="../picture/logo_.png" onclick="window.location.href='../wine_shop/index.jsp'">
		<ul>
			<li><a href="#">用户名：<input type="text" id="use" value="<%=name %>" readonly style="border:none;width:40px;
	border:none;
	"></a></li>
			<li><a href="../cart_wine/cart.jsp">我的购物车</a></li>
			<li><a href="my_order.jsp">我的订单信息</a></li>
			<li><a href="../wine_shop/index_outlogin.jsp">退出登录</a></li>
		</ul>
	
	</div>
	<% session.setAttribute("user",uId);%>
	
<div id="content">
	<div id="con_top">
		<ul>
			<li onclick="tab('1')">待付款</li><li onclick="tab('2')">待发货</li><li onclick="tab('3')">待收货</li>
			<li onclick="tab('4')">交易成功</li><li id="no_bord" onclick="tab('5')">已取消</li>
		</ul>
		
	</div>
	<div id="con_bottom">
		<div id="bot_th">
			<table>
			<tr>
				<td id="show">商品信息</td><td>金额</td><td>订单状态</td><td>操作</td>
			</tr>
			
		</table>
		</div>
		<%!  
    
    public static final int PAGESIZE = 4;  
    int pageCount;  
    int curPage = 1; 
    
%> 
<%String userId = session.getAttribute("user").toString(); %>
	<div id="d1">

	<%  
    //一页放12个  
   
    try{  
       
       
    	
		order o  = new order();
		o.setW_user(userId);
		short state = 1;
		ResultSet rs = o.get_order_(userId,state);
		String wPic="";
		float wPrice=0,pri=0;
		int quantity = 0;
        rs.last();  
        int size = rs.getRow();  
       
      //  out.println(size);
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
          o.setW_wId(rs.getString("w_wId"));
			wine w = new wine();
			w = o.get_wine();
			
			wPic=w.getwPicture();
			wPrice=Float.parseFloat(w.getwPrice());
			quantity = Integer.parseInt(rs.getString("w_quant"));
			pri = wPrice*quantity;
         
         
          count++;  
          %>  
   	
		<table class="tb">
			<tr class="the_id">
				<td colspan="4">订单号:<input readonly="readonly" id="order_id" type="text" value="<%=rs.getString("w_o_Id") %>"></td>
			</tr>
			<tr class="ch">
				<td class="ch1"><span><img src="../<%=wPic %>" /></span><textarea><%=w.getwName() %></textarea></td>
				<td class="ch2"><input type="text"  readonly value="￥<%=pri %>"/></td>
				<td class="ch3"><input type="text" readonly value="等待付款"/></td>
				<td class="ch4"><div>
				<input class="btn" type="button" value="查看" onclick="shw('<%=rs.getString("w_o_Id")%>')">
				<input class="btn" type="button" value="付款" onclick="window.location.href='../pay/pay_.jsp?price=<%=pri%>&pid=<%=rs.getString("w_o_Id") %>'">
				<input class="btn" type="button" value="取消" onclick="canc('<%=rs.getString("w_o_Id")%>')"></div></td>
			</tr>
			
			
			
		</table>
          <%  
      }while(rs.next());  
      
  }  
  catch(Exception e){  
        
  }  
%>  

		<div id="bot">
	<div id="pa">
<a href = "my_order2.jsp?curPage=1&op=1" >首页</a>  
<a href = "my_order2.jsp?op=1&curPage=<%=curPage-1%>" >上一页</a>  
<a href = "my_order2.jsp?op=1&curPage=<%=curPage+1%>" >下一页</a>  
<a href = "my_order2.jsp?op=1&curPage=<%=pageCount%>" >尾页</a>    
第<%=curPage%>页/共<%=pageCount%>页  	
</div>	
	</div>	

	</div>			
		<%-- 	<div id="d1">
		<%
		String userId = session.getAttribute("user").toString();
		order o  = new order();
		o.setW_user(userId);
		short state = 1;
		ResultSet rs = o.get_order_(userId,state);
		String wPic="";
		float wPrice=0,pri=0;
		int quantity = 0;
		while(rs.next()){
			o.setW_wId(rs.getString("w_wId"));
			wine w = new wine();
			w = o.get_wine();
			
			wPic=w.getwPicture();
			wPrice=Float.parseFloat(w.getwPrice());
			quantity = Integer.parseInt(rs.getString("w_quant"));
			pri = wPrice*quantity;
			%>
			
		<table class="tb">
			<tr class="the_id">
				<td colspan="4">订单号:<input readonly="readonly" id="order_id" type="text" value="<%=rs.getString("w_o_Id") %>"></td>
			</tr>
			<tr class="ch">
				<td class="ch1"><span><img src="../<%=wPic %>" /></span><textarea><%=w.getwName() %></textarea></td>
				<td class="ch2"><input type="text"  readonly value="￥<%=pri %>"/></td>
				<td class="ch3"><input type="text" readonly value="等待付款"/></td>
				<td class="ch4"><div>
				<input class="btn" type="button" value="查看" onclick="shw('<%=rs.getString("w_o_Id")%>')">
				<input class="btn" type="button" value="付款" onclick="window.location.href='../pay/pay_.jsp?price=<%=pri%>&pid=<%=rs.getString("w_o_Id") %>'">
				<input class="btn" type="button" value="取消" onclick="canc('<%=rs.getString("w_o_Id")%>')"></div></td>
			</tr>
			
			
			
		</table>
			<%
		}
		%></div> --%>
		<div id="d2">

	<%  
    //一页放12个  
   
    try{  
       
       
    	order o2  = new order();
		o2.setW_user(userId);
		short state2 = 2;
		ResultSet rs2 = o2.get_order_(userId,state2);
		String wPic2="";
		float wPrice2=0,pri2=0;
		int quantity2 = 0;
        rs2.last();  
        int size = rs2.getRow();  
       
      //  out.println(size);
        pageCount = (size%PAGESIZE==0)?(size/PAGESIZE):(size/PAGESIZE+1);  
        String tmp = request.getParameter("curPage");  
        if(tmp==null){  
            tmp="1";  
        }  
        curPage = Integer.parseInt(tmp);  
        if(curPage>=pageCount) curPage = pageCount;  
        boolean flag = rs2.absolute((curPage-1)*PAGESIZE+1);  
       
        int count = 0;  
        
      do{  
          if(count>=PAGESIZE)break;  
          o2.setW_wId(rs2.getString("w_wId"));
			wine w = new wine();
			w = o2.get_wine();
			
			wPic2=w.getwPicture();
			wPrice2=Float.parseFloat(w.getwPrice());
			quantity2 = Integer.parseInt(rs2.getString("w_quant"));
			pri2 = wPrice2*quantity2;
         
         
          count++;  
          %>  
   <table>
			<tr class="the_id">
				<td colspan="4">订单号:<input readonly="readonly" id="order_id" type="text" value="<%=rs2.getString("w_o_Id") %>"></td>
			</tr>
			<tr class="ch">
				<td class="ch1"><span><img src="../<%=wPic2 %>" /></span><textarea><%=w.getwName() %></textarea></td>
				<td class="ch2"><input type="text" readonly value="￥<%=pri2 %>"/></td>
				<td class="ch3"><input type="text" readonly value="等待发货"/></td>
				<td class="ch4"><div><br>
				<input type="button" value="查看" onclick="shw('<%=rs2.getString("w_o_Id")%>')">
				</div></td>
			</tr>
			
			
			
		</table>
          <%  
      }while(rs2.next());  
      
  }  
  catch(Exception e){  
        
  }  
%>  

		<div id="bot">
	<div id="pa">
<a href = "my_order2.jsp?curPage=1&op=2" >首页</a>  
<a href = "my_order2.jsp?op=2&curPage=<%=curPage-1%>" >上一页</a>  
<a href = "my_order2.jsp?op=2&curPage=<%=curPage+1%>" >下一页</a>  
<a href = "my_order2.jsp?op=2&curPage=<%=pageCount%>" >尾页</a>   
第<%=curPage%>页/共<%=pageCount%>页  	
</div>	
	</div>	

	</div>				
				<%-- 	<div id="d2">
		<%
		
		order o2  = new order();
		o2.setW_user(userId);
		short state2 = 2;
		ResultSet rs2 = o2.get_order_(userId,state2);
		String wPic2="";
		float wPrice2=0,pri2=0;
		int quantity2 = 0;
		while(rs2.next()){
			o2.setW_wId(rs2.getString("w_wId"));
			wine w = new wine();
			w = o2.get_wine();
			
			wPic2=w.getwPicture();
			wPrice2=Float.parseFloat(w.getwPrice());
			quantity2 = Integer.parseInt(rs2.getString("w_quant"));
			pri2 = wPrice2*quantity2;
			%>
			
		<table>
			<tr class="the_id">
				<td colspan="4">订单号:<input readonly="readonly" id="order_id" type="text" value="<%=rs2.getString("w_o_Id") %>"></td>
			</tr>
			<tr class="ch">
				<td class="ch1"><span><img src="../<%=wPic2 %>" /></span><textarea><%=w.getwName() %></textarea></td>
				<td class="ch2"><input type="text" readonly value="￥<%=pri2 %>"/></td>
				<td class="ch3"><input type="text" readonly value="等待发货"/></td>
				<td class="ch4"><div><br>
				<input type="button" value="查看" onclick="shw('<%=rs2.getString("w_o_Id")%>')">
				</div></td>
			</tr>
			
			
			
		</table>
			<%
		}
		%></div> --%>
	<div id="d3">

	<%  
    //一页放12个  
   
    try{  
       
       
    	order o3  = new order();
		o3.setW_user(userId);
		short state3 = 3;
		ResultSet rs3 = o3.get_order_(userId,state3);
		String wPic3="";
		float wPrice3=0,pri3=0;
		int quantity3 = 0;
        rs3.last();  
        int size = rs3.getRow();  
       
      //  out.println(size);
        pageCount = (size%PAGESIZE==0)?(size/PAGESIZE):(size/PAGESIZE+1);  
        String tmp = request.getParameter("curPage");  
        if(tmp==null){  
            tmp="1";  
        }  
        curPage = Integer.parseInt(tmp);  
        if(curPage>=pageCount) curPage = pageCount;  
        boolean flag = rs3.absolute((curPage-1)*PAGESIZE+1);  
       
        int count = 0;  
        
      do{  
          if(count>=PAGESIZE)break;  
          o3.setW_wId(rs3.getString("w_wId"));
			wine w = new wine();
			w = o3.get_wine();
			
			wPic3=w.getwPicture();
			wPrice3=Float.parseFloat(w.getwPrice());
			quantity3 = Integer.parseInt(rs3.getString("w_quant"));
			pri3 = wPrice3*quantity3;
         
         
          count++;  
          %>  
    <table>
			<tr class="the_id">
				<td colspan="4">订单号:<input readonly="readonly" id="order_id" type="text" value="<%=rs3.getString("w_o_Id") %>"></td>
			</tr>
			<tr class="ch">
				<td class="ch1"><span><img src="../<%=wPic3 %>" /></span><textarea><%=w.getwName() %></textarea></td>
				<td class="ch2"><input type="text" readonly value="￥<%=pri3 %>"/></td>
				<td class="ch3"><input type="text" readonly value="等待收获"/></td>
				<td class="ch4"><div>
				<input type="button" value="查看" onclick="shw('<%=rs3.getString("w_o_Id")%>')">
				<input type="button" value="确认收货" onclick="rece('<%=rs3.getString("w_o_Id")%>')">
				</div></td>
			</tr>
			
			
			
		</table>
          <%  
      }while(rs3.next());  
      
  }  
  catch(Exception e){  
        
  }  
%>  

		<div id="bot">
	<div id="pa">
<a href = "my_order2.jsp?curPage=1&op=3" >首页</a>  
<a href = "my_order2.jsp?op=3&curPage=<%=curPage-1%>" >上一页</a>  
<a href = "my_order2.jsp?op=3&curPage=<%=curPage+1%>" >下一页</a>  
<a href = "my_order2.jsp?op=3&curPage=<%=pageCount%>" >尾页</a>    
第<%=curPage%>页/共<%=pageCount%>页  	
</div>	
	</div>	

	</div>				
<%-- 						<div id="d3">
		<%
		
		order o3  = new order();
		o3.setW_user(userId);
		short state3 = 3;
		ResultSet rs3 = o3.get_order_(userId,state3);
		String wPic3="";
		float wPrice3=0,pri3=0;
		int quantity3 = 0;
		while(rs3.next()){
			o3.setW_wId(rs3.getString("w_wId"));
			wine w = new wine();
			w = o3.get_wine();
			
			wPic3=w.getwPicture();
			wPrice3=Float.parseFloat(w.getwPrice());
			quantity3 = Integer.parseInt(rs3.getString("w_quant"));
			pri3 = wPrice3*quantity3;
			%>
			
		<table>
			<tr class="the_id">
				<td colspan="4">订单号:<input readonly="readonly" id="order_id" type="text" value="<%=rs3.getString("w_o_Id") %>"></td>
			</tr>
			<tr class="ch">
				<td class="ch1"><span><img src="../<%=wPic3 %>" /></span><textarea><%=w.getwName() %></textarea></td>
				<td class="ch2"><input type="text" readonly value="￥<%=pri3 %>"/></td>
				<td class="ch3"><input type="text" readonly value="等待收获"/></td>
				<td class="ch4"><div>
				<input type="button" value="查看" onclick="shw('<%=rs3.getString("w_o_Id")%>')">
				<input type="button" value="确认收货" onclick="rece('<%=rs3.getString("w_o_Id")%>')">
				</div></td>
			</tr>
			
			
			
		</table>
			<%
		}
		%></div> --%>
		<div id="d4">

	<%  
    //一页放12个  
   
    try{  
       
       
    	order o4  = new order();
		o4.setW_user(userId);
		short state4 = 4;
		short state4_=5;
		ResultSet rs4 = o4.get_order_2(userId,state4,state4_);
		String wPic4="";
		float wPrice4=0,pri4=0;
		int quantity4 = 0;
        rs4.last();  
        int size = rs4.getRow();  
        String st=""; 
        String t="";
      //  out.println(size);
        pageCount = (size%PAGESIZE==0)?(size/PAGESIZE):(size/PAGESIZE+1);  
        String tmp = request.getParameter("curPage");  
        if(tmp==null){  
            tmp="1";  
        }  
        curPage = Integer.parseInt(tmp);  
        if(curPage>=pageCount) curPage = pageCount;  
        boolean flag = rs4.absolute((curPage-1)*PAGESIZE+1);  
       
        int count = 0;  
        
      do{  
          if(count>=PAGESIZE)break;  
          o4.setW_wId(rs4.getString("w_wId"));
			wine w = new wine();
			w = o4.get_wine();
			
			wPic4=w.getwPicture();
			wPrice4=Float.parseFloat(w.getwPrice());
			quantity4 = Integer.parseInt(rs4.getString("w_quant"));
			pri4 = wPrice4*quantity4;
			st = rs4.getString("state");
         	if(st.equals("4")){
         		t="评论";
         	}else{
         		t="已评论";
         	}
         	
         
          count++;  
          %>  
     <table>
			<tr class="the_id">
				<td colspan="4">订单号:<input readonly="readonly" id="order_id" type="text" value="<%=rs4.getString("w_o_Id") %>"></td>
			</tr>
			<tr class="ch">
				<td class="ch1"><span><img src="../<%=wPic4 %>" /></span><textarea><%=w.getwName() %></textarea></td>
				<td class="ch2"><input type="text" readonly value="￥<%=pri4 %>"/></td>
				<td class="ch3"><input type="text" readonly value="交易成功"/></td>
				<td class="ch4"><div>
				<input type="button" value="查看" onclick="shw('<%=rs4.getString("w_o_Id")%>')">
				<input type="button" value="<%=t %>" onclick="comment('<%=rs4.getString("w_wId")%>','<%=rs4.getString("w_o_Id")%>')">
				<input type="button" value="删除"  onclick="del('<%=rs4.getString("w_o_Id")%>')">
				</div></td>
			</tr>
			
			
			
		</table>
          <%  
      }while(rs4.next());  
      
  }  
  catch(Exception e){  
        
  }  
%>  

		<div id="bot">
	<div id="pa">
<a href = "my_order2.jsp?curPage=1&op=4" >首页</a>  
<a href = "my_order2.jsp?op=4&curPage=<%=curPage-1%>" >上一页</a>  
<a href = "my_order2.jsp?op=4&curPage=<%=curPage+1%>" >下一页</a>  
<a href = "my_order2.jsp?op=4&curPage=<%=pageCount%>" >尾页</a>    
第<%=curPage%>页/共<%=pageCount%>页  	
</div>	
	</div>	

	</div>		
<%-- 							<div id="d4">
		<%
		
		order o4  = new order();
		o4.setW_user(userId);
		short state4 = 4;
		ResultSet rs4 = o4.get_order_(userId,state4);
		String wPic4="";
		float wPrice4=0,pri4=0;
		int quantity4 = 0;
		while(rs4.next()){
			o4.setW_wId(rs4.getString("w_wId"));
			wine w = new wine();
			w = o4.get_wine();
			
			wPic4=w.getwPicture();
			wPrice4=Float.parseFloat(w.getwPrice());
			quantity4 = Integer.parseInt(rs4.getString("w_quant"));
			pri4 = wPrice4*quantity4;
			%>
			
		<table>
			<tr class="the_id">
				<td colspan="4">订单号:<input readonly="readonly" id="order_id" type="text" value="<%=rs4.getString("w_o_Id") %>"></td>
			</tr>
			<tr class="ch">
				<td class="ch1"><span><img src="../<%=wPic4 %>" /></span><textarea><%=w.getwName() %></textarea></td>
				<td class="ch2"><input type="text" readonly value="￥<%=pri4 %>"/></td>
				<td class="ch3"><input type="text" readonly value="交易成功"/></td>
				<td class="ch4"><div>
				<input type="button" value="查看" onclick="shw('<%=rs4.getString("w_o_Id")%>')">
				<input type="button" value="删除"  onclick="del('<%=rs4.getString("w_o_Id")%>')">
				</div></td>
			</tr>
			
			
			
		</table>
			<%
		}
		%></div> --%>
		<div id="d5">

	<%  
    //一页放12个  
   
    try{  
       
       
    	order o5  = new order();
		o5.setW_user(userId);
		short state5 = 0;
		ResultSet rs5 = o5.get_order_(userId,state5);
		String wPic5="";
		float wPrice5=0,pri5=0;
		int quantity5 = 0;
        rs5.last();  
        int size = rs5.getRow();  
       
      //  out.println(size);
        pageCount = (size%PAGESIZE==0)?(size/PAGESIZE):(size/PAGESIZE+1);  
        String tmp = request.getParameter("curPage");  
        if(tmp==null){  
            tmp="1";  
        }  
        curPage = Integer.parseInt(tmp);  
        if(curPage>=pageCount) curPage = pageCount;  
        boolean flag = rs5.absolute((curPage-1)*PAGESIZE+1);  
       
        int count = 0;  
        
      do{  
          if(count>=PAGESIZE)break;  
          o5.setW_wId(rs5.getString("w_wId"));
			wine w = new wine();
			w = o5.get_wine();
			
			wPic5=w.getwPicture();
			wPrice5=Float.parseFloat(w.getwPrice());
			quantity5 = Integer.parseInt(rs5.getString("w_quant"));
			pri5 = wPrice5 * quantity5;
         
         
          count++;  
          %>  
      <table>
			<tr class="the_id">
				<td colspan="4">订单号:<input readonly="readonly" id="order_id" type="text" value="<%=rs5.getString("w_o_Id") %>"></td>
			</tr>
			<tr class="ch">
				<td class="ch1"><span><img src="../<%=wPic5 %>" /></span><textarea><%=w.getwName() %></textarea></td>
				<td class="ch2"><input type="text" readonly value="￥<%=pri5 %>"/></td>
				<td class="ch3"><input type="text" readonly value="交易关闭"/></td>
				<td class="ch4"><div>
				<input type="button" value="查看" onclick="shw('<%=rs5.getString("w_o_Id")%>')">
				<input type="button" value="删除" onclick="del('<%=rs5.getString("w_o_Id")%>')">
				</div></td>
			</tr>
			
			
			
		</table>
          <%  
      }while(rs5.next());  
      
  }  
  catch(Exception e){  
        
  }  
%>  

		<div id="bot">
	<div id="pa">
<a href = "my_order2.jsp?curPage=1&op=5" >首页</a>  
<a href = "my_order2.jsp?op=5&curPage=<%=curPage-1%>" >上一页</a>  
<a href = "my_order2.jsp?op=5&curPage=<%=curPage+1%>" >下一页</a>  
<a href = "my_order2.jsp?op=5&curPage=<%=pageCount%>" >尾页</a>  
第<%=curPage%>页/共<%=pageCount%>页  	
</div>	
	</div>	

	</div>

	
		
		
		
		
		
<%-- 			<div id="d5">
		<%
		
		order o5  = new order();
		o5.setW_user(userId);
		short state5 = 0;
		ResultSet rs5 = o5.get_order_(userId,state5);
		String wPic5="";
		float wPrice5=0,pri5=0;
		int quantity5 = 0;
		while(rs5.next()){
			o5.setW_wId(rs5.getString("w_wId"));
			wine w = new wine();
			w = o5.get_wine();
			
			wPic5=w.getwPicture();
			wPrice5=Float.parseFloat(w.getwPrice());
			quantity5 = Integer.parseInt(rs5.getString("w_quant"));
			pri5 = wPrice5 * quantity5;
			%>
			
		<table>
			<tr class="the_id">
				<td colspan="4">订单号:<input readonly="readonly" id="order_id" type="text" value="<%=rs5.getString("w_o_Id") %>"></td>
			</tr>
			<tr class="ch">
				<td class="ch1"><span><img src="../<%=wPic5 %>" /></span><textarea><%=w.getwName() %></textarea></td>
				<td class="ch2"><input type="text" readonly value="￥<%=pri5 %>"/></td>
				<td class="ch3"><input type="text" readonly value="交易关闭"/></td>
				<td class="ch4"><div>
				<input type="button" value="查看" onclick="shw('<%=rs5.getString("w_o_Id")%>')">
				<input type="button" value="删除" onclick="del('<%=rs5.getString("w_o_Id")%>')">
				</div></td>
			</tr>
			
			
			
		</table>
			<%
		}
		%></div> --%>
		
		
		
	</div>
</div>
<div id="foot">
<br>
	关于我们<span>|</span>免责声明<span>|</span>肆水流年网站<span>|</span>站点地图<span>|</span>友情链接<span>|</span>联系我们

</div>
</body>
</html>