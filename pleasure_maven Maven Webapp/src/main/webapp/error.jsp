<%@ page language="java" pageEncoding="utf-8"%>
<html>
<head>
<title>享乐 - 错误</title>
<link rel="shortcut icon" href="favicon.ico" type="image/x-icon" />
<!-- Custom Theme files -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />
<!-- //Custom Theme files -->
<link href="css/bootstrap.css" type="text/css" rel="stylesheet"
	media="all">
<link href="css/style.css" type="text/css" rel="stylesheet" media="all">
<script src="js/jquery.min.js"></script>
<script type="text/javascript">
var type = location.search;
type = type.substring(type.length-1,type.length);
	//控制错误类型  1未激活错误  2 未登录错误 3没有此用户 4密码错误
	$(document).ready(function() {
		if (type == "1") {
			$('.noActivate').css("display", "block");
		} else if (type == "2") {	
			$('.noLogin').css("display", "block");
		}else if(type == "3"){
			$('.noUser').css("display", "block");
		}else if(type == "4"){
			$('.pwdError').css("display", "block");
		}
	});
</script>
<script type="text/javascript" src="js/bootstrap-3.1.1.min.js"></script>
</head>

<body>
	<!--顶部栏-->
	<%@ include file="include/head.jsp"%>
	<!--顶部栏结束-->


	<!-- 没有登录提示 -->
	<div class="noLogin" style="display:none">
		<div class="register-top-grid" align="center">
			<p style="height:120px;"></p>
			<h3>请您登陆后再进行操作</h3>
			<p style="height:320px;"></p>
			<a href="index.do" style="color:#999999;">返回首页</a>
		</div>
	</div>
	<!-- 没有登录提示结束 -->


	<!-- 没有激活提示 -->
	<div class="noActivate" style="display:none">
		<div class="register-top-grid" align="center">
			<p style="height:120px;"></p>
			<h3>请您激活后再进行操作</h3>
			<p style="height:260px;"></p>
			<!-- a href为激活页面 -->
			<a href="resendemail.do" style="color:#999999;">重新发送激活邮件</a><br>
			<p style="height:60px;"></p>
			<a href="index.do" style="color:#999999;">返回首页</a>
		</div>
	</div>
	<!-- 没有激活提示结束 -->
	
	<!-- 没有此用户提示 -->
	<div class="noUser" style="display:none">
		<div class="register-top-grid" align="center">
			<p style="height:120px;"></p>
			<h3>找不到此用户</h3>
			<p style="height:320px;"></p>
			<a href="index.do" style="color:#999999;">返回首页</a>
		</div>
	</div>
	<!-- 没有此用户结束 -->
	
	<!-- 密码错误提示 -->
	<div class="pwdError" style="display:none">
		<div class="register-top-grid" align="center">
			<p style="height:120px;"></p>
			<h3>密码错误</h3>
			<p style="height:260px;"></p>
			<!-- a href为激活页面 -->
			<a href="retrievePassword.jsp" style="color:#999999;">忘记密码？</a><br>
			<p style="height:60px;"></p>
			<a href="index.do" style="color:#999999;">返回首页</a>
		</div>
	</div>
	<!-- 密码错误结束 -->
	

</body>
</html>
