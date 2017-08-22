<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link href="../../css_login/reset_paswrd.css" rel="stylesheet" type="text/css"/>
 <script type="text/javascript" src="../../js/new_account.js" charset="gbk"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>注册账户</title>
</head>
<body >

<!-- head -->
<div id="head" >
	<img id="logo" src="../../picture/login/log.png"/>
	<p>注册账户</p>
</div>


<!-- content -->
<form name="reset_from"action="new_account_check.jsp" >
<div id="content"   >

	<div id="d0">
	<i class="iconfont">&#xe892;</i>
	请输入你的账户编号和登录密码
	
	</div>
	<div id="d1">
	<p>登&nbsp;录&nbsp;&nbsp;&nbsp;ID：</p>
	<input type="text" name="ac_id" id="ac_id" value="" maxlength="32" />
	</div>
	
	
	<div id="d1">
	<p>用户&nbsp;&nbsp;&nbsp;&nbsp;名：</p>
	<input type="text" name="name" id="name"value="" maxlength="32" />
	</div>
	
	
	
	<div id="d1">
	<p>登陆密码：</p>
	<input type="text" name="paswrd" id="paswrd" value="" maxlength="32" />
	</div>

		<div id="d3">
	
	<input type="submit" value="确定"  onclick="return check()"maxlength="32" />
	</div>
</div>
</form>
<!-- foot -->
<div id="foot">
<br/>
	关于我们<span>|</span>免责声明<span>|</span>肆水流年网站<span>|</span>站点地图<span>|</span>友情链接<span>|</span>联系我们

</div>

</body>
</html>