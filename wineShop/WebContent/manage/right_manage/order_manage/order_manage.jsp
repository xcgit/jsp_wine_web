
<%@page import="cart_wine.wine"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="order.order"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link href="../../../css_manage/order_manage.css" rel="stylesheet"type="text/css">
          <script type="text/javascript" src="../../../js_manage/order_manage.js" charset="gbk"></script>
<title>Insert title here</title>
<script type="text/javascript">
	
	

	
	
</script>
</head>
<body onload="t()">
<%
String tct="1";
	try{
		  tct = request.getParameter("tabcCart");  
		if(tct==null)
			tct="1";
	//	System.out.println(tct);
		 
	} catch(Exception e){  
        
  }  


%>
<script type="text/javascript">
	window.tcb="<%=tct%>";
	function t(){
		var d = document.getElementById("d"+tcb);
		for(var  i = 1;i<=5;i++){
			document.getElementById("d"+i).style.display="none";
		}
		d.style.display="block";
		
	}
</script>

<div id="head">
<div id="he_top">


<ul>
	<li onclick="tab(1)" ><span>未付款</span></li>
	<li onclick="tab(2)" ><span>已付款</span></li>
	<li onclick="tab(3)"><span>已发货</span></li>
	<li onclick="tab(4)" ><span>交易成功</span></li>
	<li id="last" onclick="tab(5)"><span>已取消</span></li>
</ul></div>
	<div id="he_bottom">
		<table>
			<tr>
				<td id="show">商品信息</td><td>金额</td><td>订单状态</td><td>操作</td>
			</tr>
			
		</table>
	</div>
</div>
<div id="content">

<%!  
    
    public static final int PAGESIZE = 5;  //一页5个
    int pageCount;  //总页数
    int curPage = 1;  //当前页
%> 	<div id="d1">
<%  
    
   
    try{  
    	order o =new order();
        short st = 1; 
    	ResultSet rs = o.get_order(st);
       
       
        rs.last();  
        int size = rs.getRow();//数据库中总的记录条数 
       
        pageCount = (size%PAGESIZE==0)?(size/PAGESIZE):(size/PAGESIZE+1);  //计算总页数
        String tmp = request.getParameter("curPage");  //获取要显示的当前页码
        if(tmp==null){  
            tmp="1";  
        }  
        curPage = Integer.parseInt(tmp);  
        if(curPage>=pageCount) curPage = pageCount; 
        boolean flag = rs.absolute((curPage-1)*PAGESIZE+1);  //rs.absolute((curPage-1)*PAGESIZE+1); 使rs指向 当前页第一个数据
       
        int count = 0;  
          
        do{  
            if(count>=PAGESIZE)break;  
         
          
          
            o.setW_wId(rs.getString("w_wId"));
    		wine w = o.get_wine();
    		int quan =Integer.parseInt(rs.getString("w_quant"));
    		float pri = Float.parseFloat(w.getwPrice());
    		float price = pri * quan;
           
           
            count++;  
            %>  
        <table>
			<tr class="the_id">
				<td colspan="4">订单号:<input readonly="readonly" id="order_id" type="text" value="<%=rs.getString("w_o_Id")%>"></td>
			</tr>
			<tr class="ch">
				<td class="ch1"><span><img src="../../../<%=w.getwPicture() %>" /></span><textarea><%=w.getwName() %></textarea></td>
				<td class="ch2"><input type="text" value="￥<%=price%>"></td>
				<td class="ch3"><input type="text" value="等待付款"></td>
				<td class="ch4"><div>
				<input type="button" value="查看" onclick="shw('<%=rs.getString("w_o_Id")%>')">
				<input type="button" value="取消" onclick="deal(0)"></div></td>
			</tr>
			
			
			
		</table>
            <%  
        }while(rs.next());  
        
    }  
    catch(Exception e){  
          
    }  
%>  
	
	<div id="page">
<a href = "order_manage.jsp?curPage=1&tabcCart=1" >首页</a>  
<a href = "order_manage.jsp?curPage=<%=curPage-1%>&tabcCart=1" >上一页</a>  
<a href = "order_manage.jsp?curPage=<%=curPage+1%>&tabCart=1" >下一页</a>  
<a href = "order_manage.jsp?curPage=<%=pageCount%>&tabCart=1" >尾页</a>  
第<%=curPage%>页/共<%=pageCount%>页  	
</div>	
	
		



	
	

</div>
	<div id="d2">
	
	<%  
    
   
    try{  
    	order ord =new order();
        short st2 = 2; 
    	ResultSet rst = ord.get_order(st2);
       
       
        rst.last();  
        int size = rst.getRow();//数据库中总的记录条数 
       
        pageCount = (size%PAGESIZE==0)?(size/PAGESIZE):(size/PAGESIZE+1);  //计算总页数
        String tmp = request.getParameter("curPage");  //获取要显示的当前页码
        if(tmp==null){  
            tmp="1";  
        }  
        curPage = Integer.parseInt(tmp);  
        if(curPage>=pageCount) curPage = pageCount; 
        boolean flag = rst.absolute((curPage-1)*PAGESIZE+1);  //rs.absolute((curPage-1)*PAGESIZE+1); 使rs指向 当前页第一个数据
       
        int count = 0;  
          
        do{  
            if(count>=PAGESIZE)break;  
         
          
          
            ord.setW_wId(rst.getString("w_wId"));
    		wine w = ord.get_wine();
    		int quan =Integer.parseInt(rst.getString("w_quant"));
    		float pri = Float.parseFloat(w.getwPrice());
    		float price = pri * quan;
           
           
            count++;  
            %>  
      <table>
			<tr class="the_id">
				<td colspan="4">订单号:<input readonly="readonly" id="order_id_" type="text" value="<%=rst.getString("w_o_Id")%>"></td>
			</tr>
			<tr class="ch">
				<td class="ch1"><span><img src="../../../<%=w.getwPicture() %>" /></span><textarea><%=w.getwName() %></textarea></td>
				<td class="ch2"><input type="text" value="￥<%=price%>"></td>
				<td class="ch3"><input type="text" value="准备发货"></td>
				<td class="ch4"><div>
				<input type="button" value="查看" onclick="shw('<%=rst.getString("w_o_Id")%>')" >
				<input type="button" value="发货"onclick="deal_(3)"></div></td>
			</tr>
			
			
			
		</table>
            <%  
        }while(rst.next());  
        
    }  
    catch(Exception e){  
          
    }  
%>  
	
	<div id="page">
<a href = "order_manage.jsp?curPage=1&tabcCart=2" >首页</a>  
<a href = "order_manage.jsp?curPage=<%=curPage-1%>&tabcCart=2" >上一页</a>  
<a href = "order_manage.jsp?curPage=<%=curPage+1%>&tabcCart=2" >下一页</a>  
<a href = "order_manage.jsp?curPage=<%=pageCount%>&tabcCart=2" >尾页</a>  
第<%=curPage%>页/共<%=pageCount%>页  	
</div>	
	
	
	
</div>
	<div id="d3">
		<%  
    
   
    try{  
    	order orde =new order();
        short st3 = 3; 
    	ResultSet rsts = orde.get_order(st3);
       
       
        rsts.last();  
        int size = rsts.getRow();//数据库中总的记录条数 
       
        pageCount = (size%PAGESIZE==0)?(size/PAGESIZE):(size/PAGESIZE+1);  //计算总页数
        String tmp = request.getParameter("curPage");  //获取要显示的当前页码
        if(tmp==null){  
            tmp="1";  
        }  
        curPage = Integer.parseInt(tmp);  
        if(curPage>=pageCount) curPage = pageCount; 
        boolean flag = rsts.absolute((curPage-1)*PAGESIZE+1);  //rs.absolute((curPage-1)*PAGESIZE+1); 使rs指向 当前页第一个数据
       
        int count = 0;  
          
        do{  
            if(count>=PAGESIZE)break;  
         
          
          
            orde.setW_wId(rsts.getString("w_wId"));
    		wine w = orde.get_wine();
    		int quan =Integer.parseInt(rsts.getString("w_quant"));
    		float pri = Float.parseFloat(w.getwPrice());
    		float price = pri * quan;
           
           
            count++;  
            %>  
    <table>
			<tr class="the_id">
				<td colspan="4">订单号:<input readonly="readonly" type="text" value="<%=rsts.getString("w_o_Id")%>"></td>
			</tr>
			<tr class="ch">
				<td class="ch1"><span><img src="../../../<%=w.getwPicture() %>" /></span><textarea><%=w.getwName() %></textarea></td>
				<td class="ch2"><input type="text" value="￥<%=price%>"></td>
				<td class="ch3"><input type="text" value="等待确认"></td>
				<td class="ch4"><div><br>
				<input type="button" value="查看"  onclick="shw('<%=rsts.getString("w_o_Id")%>')">
				</div></td>
			</tr>
			
			
			
		</table>
            <%  
        }while(rsts.next());  
        
    }  
    catch(Exception e){  
          
    }  
%>  
	
	<div id="page">
<a href = "order_manage.jsp?curPage=1&tabcCart=3" >首页</a>  
<a href = "order_manage.jsp?curPage=<%=curPage-1%>&tabcCart=3" >上一页</a>  
<a href = "order_manage.jsp?curPage=<%=curPage+1%>&tabcCart=3" >下一页</a>  
<a href = "order_manage.jsp?curPage=<%=pageCount%>&tabcCart=3" >尾页</a>  
第<%=curPage%>页/共<%=pageCount%>页  	
</div>	
	
	

</div>
	
	
	<div id="d4">
	<%  
    
   
    try{  
    	order order =new order();
        short st4 = 4; 
    	ResultSet rstsu = order.get_order(st4);
       
        rstsu.last();  
        int size = rstsu.getRow();//数据库中总的记录条数 
       
        pageCount = (size%PAGESIZE==0)?(size/PAGESIZE):(size/PAGESIZE+1);  //计算总页数
        String tmp = request.getParameter("curPage");  //获取要显示的当前页码
        if(tmp==null){  
            tmp="1";  
        }  
        curPage = Integer.parseInt(tmp);  
        if(curPage>=pageCount) curPage = pageCount; 
        boolean flag = rstsu.absolute((curPage-1)*PAGESIZE+1);  //rs.absolute((curPage-1)*PAGESIZE+1); 使rs指向 当前页第一个数据
       
        int count = 0;  
          
        do{  
            if(count>=PAGESIZE)break;  
         
          
          
            order.setW_wId(rstsu.getString("w_wId"));
    		wine w = order.get_wine();
    		int quan =Integer.parseInt(rstsu.getString("w_quant"));
    		float pri = Float.parseFloat(w.getwPrice());
    		float price = pri * quan;
           
           
            count++;  
            %>  
    <table>
			<tr class="the_id">
				<td colspan="4">订单号:<input readonly="readonly" type="text" value="<%=rstsu.getString("w_o_Id")%>"></td>
			</tr>
			<tr class="ch">
				<td class="ch1"><span><img src="../../../<%=w.getwPicture() %>" /></span><textarea><%=w.getwName() %></textarea></td>
				<td class="ch2"><input type="text" value="￥<%=price%>"></td>
				<td class="ch3"><input type="text" value="交易成功"></td>
				<td class="ch4"><div><br>
				<input type="button" value="查看"  onclick="shw('<%=rstsu.getString("w_o_Id")%>')">
				</div></td>
			</tr>
			
			
			
		</table>
            <%  
        }while(rstsu.next());  
        
    }  
    catch(Exception e){  
          
    }  
%>  
	
	<div id="page">
<a href = "order_manage.jsp?curPage=1&tabcCart=4" >首页</a>  
<a href = "order_manage.jsp?curPage=<%=curPage-1%>&tabcCart=4" >上一页</a>  
<a href = "order_manage.jsp?curPage=<%=curPage+1%>&tabcCart=4" >下一页</a>  
<a href = "order_manage.jsp?curPage=<%=pageCount%>&tabcCart=4" >尾页</a>  
第<%=curPage%>页/共<%=pageCount%>页  	
</div>	
	
	
	
	
	
</div>
	
		
	<div id="d5">
	<%  
    
   
    try{  
    	order order_ =new order();
        short st5 = 0; 
    	ResultSet rstsul = order_.get_order(st5);
       
        rstsul.last();  
        int size = rstsul.getRow();//数据库中总的记录条数 
       
        pageCount = (size%PAGESIZE==0)?(size/PAGESIZE):(size/PAGESIZE+1);  //计算总页数
        String tmp = request.getParameter("curPage");  //获取要显示的当前页码
        if(tmp==null){  
            tmp="1";  
        }  
        curPage = Integer.parseInt(tmp);  
        if(curPage>=pageCount) curPage = pageCount; 
        boolean flag = rstsul.absolute((curPage-1)*PAGESIZE+1);  //rs.absolute((curPage-1)*PAGESIZE+1); 使rs指向 当前页第一个数据
       
        int count = 0;  
          
        do{  
            if(count>=PAGESIZE)break;  
         
          
          
            order_.setW_wId(rstsul.getString("w_wId"));
    		wine w = order_.get_wine();
    		int quan =Integer.parseInt(rstsul.getString("w_quant"));
    		float pri = Float.parseFloat(w.getwPrice());
    		float price = pri * quan;
           
           
            count++;  
            %>  
    <table>
			<tr class="the_id">
				<td colspan="4">订单号:<input readonly="readonly" type="text" value="<%=rstsul.getString("w_o_Id")%>"></td>
			</tr>
			<tr class="ch">
				<td class="ch1"><span><img src="../../../<%=w.getwPicture() %>" /></span><textarea><%=w.getwName() %></textarea></td>
				<td class="ch2"><input type="text" value="￥<%=price%>"></td>
				<td class="ch3"><input type="text" value="交易关闭"></td>
				<td class="ch4"><div><br>
				<input type="button" value="查看"  onclick="shw('<%=rstsul.getString("w_o_Id")%>')">
				</div></td>
			</tr>
			
			
			
		</table>
		
            <%  
        }while(rstsul.next());  
        
    }  
    catch(Exception e){  
          
    }  
%>  



	
	<div id="page">
<a href = "order_manage.jsp?curPage=1&tabcCart=5" >首页</a>  
<a href = "order_manage.jsp?curPage=<%=curPage-1%>&tabcCart=5" >上一页</a>  
<a href = "order_manage.jsp?curPage=<%=curPage+1%>&tabcCart=5" >下一页</a>  
<a href = "order_manage.jsp?curPage=<%=pageCount%>&tabcCart=5" >尾页</a>  
第<%=curPage%>页/共<%=pageCount%>页  	
</div>	
	
	
	
</div>
	
</div>


</body>
</html>