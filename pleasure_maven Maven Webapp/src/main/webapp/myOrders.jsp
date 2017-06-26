<%@ page language="java" pageEncoding="utf-8"%>
<html>
<head>
<title>享乐 - 我的订单</title>
<!-- Custom Theme files -->
<link rel="shortcut icon" href="favicon.ico" type="image/x-icon" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />
<!-- //Custom Theme files -->
<link href="css/bootstrap.css" type="text/css" rel="stylesheet"
	media="all">
<link href="css/style.css" type="text/css" rel="stylesheet" media="all">
<script src="js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap-3.1.1.min.js"></script>
</head>

<body>
	<!--顶部栏-->
	<%@ include file="include/head.jsp"%>
	<!--顶部栏结束-->

	<p style="height: 40px;"></p>
	<div class="register-top-grid">
		<h2>(我的订单)</h2>
	</div>
	<div id="orderOutList">
		<%=request.getAttribute("html")%>
	</div>
	
</body>
</html>
