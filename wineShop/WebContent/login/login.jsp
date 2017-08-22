<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="../css_login/login.css" rel="stylesheet" type="text/css"/>

  <script type="text/javascript" src="../js/jquery-1.4.1.js" charset="gbk"></script>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <script type="text/javascript">
  	$(function(){
  		$("input[type=submit]").click(function(event){
  			if($("#username").val()==""){
  				alert("请输入用户名");
  				event.preventDefault();
  			}
  			else if($("#password").val()==""){
  				alert("请输入密码");
  				event.preventDefault();
  			}
  			
  		});
  	});
  </script>
<title>登陆</title>
</head>
<body >
<div id="ou">
<!-- head -->
<div id="head" >
	<img id="logo" src="../picture/login/log.png"/>
</div>


<!-- content -->
<div id="content"   >

<div id="left">
<img src="../picture/login/full.png">
</div><div id="right">
<form id="form_login" action="login_check.jsp">

<div id="d0">
	<p>账户登录</p>
</div>


	<div id="d1">
		<div id="div_i">
		<i class="iconfont">&#xe66b;</i>
		</div>	
		<div id="div_username">
		<input name="username" id="username" type="text" value="" maxlength="32" />
		</div>
	</div>
	<div id="d2">
		<div id="div_i">
		<i class="iconfont">&#xe65e;</i>
		</div>
		<div id="div_paswrd">
		<input name="password" id="password" type="password" value="" maxlength="32"/>
		</div>
	</div>
		<div id="d5">
		<input type="radio" name="u" checked="checked" value="用户">用户
		<input type="radio" name="u" value="客服">客服
		<input type="radio" name="u" value="管理员">管理员
		
	</div>
	<div id="d3">
		<input type="submit" value="登&nbsp&nbsp录" />
	</div>

	<div id="d4">
		
		<div id="div_new_account">
			<a href="./account/new_account.jsp">免费注册</a>
		</div>
		<div id="div_reset_paswrd">
			<a href="./account/reset_paswrd.jsp">更改密码</a>
		</div>
	</div>
	
</form>

</div>
</div>

<div id="foot">
<br>
	关于我们<span>|</span>免责声明<span>|</span>肆水流年网站<span>|</span>站点地图<span>|</span>友情链接<span>|</span>联系我们

</div>
</div>
</body>
</html>