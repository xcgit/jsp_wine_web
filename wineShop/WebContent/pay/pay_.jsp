<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
 <link href="../css_wine_shop/header.css" rel="stylesheet"type="text/css">
  <link href="../css_pay/pay.css" rel="stylesheet"type="text/css">
<title>Insert title here</title>
</head>


<body>

		<div id="header">
	<%
	 String name = session.getAttribute("name").toString(); 
	session.setAttribute("name",name); 
	
	String price=new String(request.getParameter("price").getBytes("ISO-8859-1"),"utf-8");
	String pid=new String(request.getParameter("pid").getBytes("ISO-8859-1"),"utf-8");
	%> 
		<img src="../picture/logo_.png"  onclick="window.location.href='../wine_shop/index.jsp'">
		<ul>
			<li><a href="#">用户名：<input type="text" id="use" value="<%=name %>" readonly style="border:none;width:40px;
	border:none;
	"></a></li>
			<li><a href="../cart_wine/cart.jsp">我的购物车</a></li>
			<li><a href="../order/my_order.jsp">我的订单信息</a></li>
			<li><a href="../wine_shop/index_outlogin.jsp">退出登录</a></li>
		</ul>
	
	</div>
<div id="content">
	<div id="top">
		<span></span>支付金额：<input type="text" NAME="p3_Amt" id="money" readonly value="￥<%=price %>">
		 编号：<input type="text" readonly id="pid"NAME="p2_Order" value="<%=pid %>">
	</div>
	<div id="bottom">
		
 <form action="../buyServlet" name="form1" method="post" >
<input type="hidden" name="p3_Amt" value="0.01">
<input type="hidden" name="p2_Order"value="<%=pid %>"/>

<div class="divBank">
	<div class="divText">选择网上银行</div>
	<div style="margin-left: 20px;" >
	  <div style="margin-bottom: 20px;">
	 
		<input id="ICBC-NET-B2C" type="radio" name="pd_FrpId" value="ICBC-NET-B2C" checked="checked"/>
		<img name="ICBC-NET-B2C" align="middle" src="../bank_img/gongShang.bmp"/>
		
		<input id="CMBCHINA-NET-B2C" type="radio" name="pd_FrpId" value="CMBCHINA-NET-B2C"/>
		<img name="CMBCHINA-NET-B2C" align="middle" src="../bank_img/cmb.bmp"/>

		<input id="ABC-NET-B2C" type="radio" name="pd_FrpId" value="ABC-NET-B2C"/>
		<img name="ABC-NET-B2C" align="middle" src="../bank_img/abc.bmp"/>
		
		<input id="CCB-NET-B2C" type="radio" name="pd_FrpId" value="CCB-NET-B2C"/>
		<img name="CCB-NET-B2C" align="middle" src="../bank_img/ccb.bmp"/>
	  </div>	
	  <div style="margin-bottom: 20px;">
		<input id="BCCB-NET-B2C" type="radio" name="pd_FrpId" value="BCCB-NET-B2C"/>
		<img name="BCCB-NET-B2C" align="middle" src="../bank_img/bj.bmp"/>

		<input id="BOCO-NET-B2C" type="radio" name="pd_FrpId" value="BOCO-NET-B2C"/>
		<img name="BOCO-NET-B2C" align="middle" src="../bank_img/bcc.bmp"/>

		<input id="CIB-NET-B2C" type="radio" name="pd_FrpId" value="CIB-NET-B2C"/>
		<img name="CIB-NET-B2C" align="middle" src="../bank_img/cib.bmp"/>

		<input id="NJCB-NET-B2C" type="radio" name="pd_FrpId" value="NJCB-NET-B2C"/>
		<img name="NJCB-NET-B2C" align="middle" src="../bank_img/nanjing.bmp"/>
	  </div>
	  <div style="margin-bottom: 20px;">
		<input id="CMBC-NET-B2C" type="radio" name="pd_FrpId" value="CMBC-NET-B2C"/>
		<img name="CMBC-NET-B2C" align="middle" src="../bank_img/cmbc.bmp"/>

		<input id="CEB-NET-B2C" type="radio" name="pd_FrpId" value="CEB-NET-B2C"/>
		<img name="CEB-NET-B2C" align="middle" src="../bank_img/guangda.bmp"/>

		<input id="BOC-NET-B2C" type="radio" name="pd_FrpId" value="BOC-NET-B2C"/>
		<img name="BOC-NET-B2C" align="middle" src="../bank_img/bc.bmp"/>

		<input id="PINGANBANK-NET" type="radio" name="pd_FrpId" value="PINGANBANK-NET"/>
		<img name="PINGANBANK-NET" align="middle" src="../bank_img/pingan.bmp"/>
	  </div>
	  <div style="margin-bottom: 20px;">
		<input id="CBHB-NET-B2C" type="radio" name="pd_FrpId" value="CBHB-NET-B2C"/>
		<img name="CBHB-NET-B2C" align="middle" src="../bank_img/bh.bmp"/>

		<input id="HKBEA-NET-B2C" type="radio" name="pd_FrpId" value="HKBEA-NET-B2C"/>
		<img name="HKBEA-NET-B2C" align="middle" src="../bank_img/dy.bmp"/>

		<input id="NBCB-NET-B2C" type="radio" name="pd_FrpId" value="NBCB-NET-B2C"/>
		<img name="NBCB-NET-B2C" align="middle" src="../bank_img/ningbo.bmp"/>

		<input id="ECITIC-NET-B2C" type="radio" name="pd_FrpId" value="ECITIC-NET-B2C"/>
		<img name="ECITIC-NET-B2C" align="middle" src="../bank_img/zx.bmp"/>
	  </div>
	  <div style="margin-bottom: 20px;">
		<input id="SDB-NET-B2C" type="radio" name="pd_FrpId" value="SDB-NET-B2C"/>
		<img name="SDB-NET-B2C" align="middle" src="../bank_img/sfz.bmp"/>

		<input id="GDB-NET-B2C" type="radio" name="pd_FrpId" value="GDB-NET-B2C"/>
		<img name="GDB-NET-B2C" align="middle" src="../bank_img/gf.bmp"/>

		<input id="SHB-NET-B2C" type="radio" name="pd_FrpId" value="SHB-NET-B2C"/>
		<img name="SHB-NET-B2C" align="middle" src="../bank_img/sh.bmp"/>

		<input id="SPDB-NET-B2C" type="radio" name="pd_FrpId" value="SPDB-NET-B2C"/>
		<img name="SPDB-NET-B2C" align="middle" src="../bank_img/shpd.bmp"/>
	  </div>
	  <div style="margin-bottom: 20px;">
		<input id="POST-NET-B2C" type="radio" name="pd_FrpId" value="POST-NET-B2C"/>
		<img name="POST-NET-B2C" align="middle" src="../bank_img/post.bmp"/>

		<input id="BJRCB-NET-B2C" type="radio" name="pd_FrpId" value="BJRCB-NET-B2C"/>
		<img name="BJRCB-NET-B2C" align="middle" src="../bank_img/beijingnongshang.bmp"/>

		<input id="HXB-NET-B2C" type="radio" name="pd_FrpId" value="HXB-NET-B2C"/>
		<img name="HXB-NET-B2C" align="middle" src="../bank_img/hx.bmp"/>

		<input id="CZ-NET-B2C" type="radio" name="pd_FrpId" value="CZ-NET-B2C"/>
		<img name="CZ-NET-B2C" align="middle" src="../bank_img/zheshang.bmp"/>
	  </div>
	</div>
	<div style="margin: 40px;">
		<input type="submit" id="btn" value="下一步"/>
	</div>
</div>
</form>
	</div>
</div>
<div id="foot">
<br/>
	关于我们<span>|</span>免责声明<span>|</span>肆水流年网站<span>|</span>站点地图<span>|</span>友情链接<span>|</span>联系我们

</div>


















</body>
</html>