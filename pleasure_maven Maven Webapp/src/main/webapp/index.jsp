<%@ page language="java" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>享乐 - 首页</title>
<link rel="shortcut icon" href="favicon.ico" type="image/x-icon" />
<!-- Custom Theme files -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />
<!-- //Custom Theme files -->
<link href="css/bootstrap.css" type="text/css" rel="stylesheet"
	media="all">
<link href="css/style.css" type="text/css" rel="stylesheet" media="all">
<!-- js -->
<script src="js/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$.post("getTop10.do");
	});
</script>
<script type="text/javascript" src="js/bootstrap-3.1.1.min.js"></script>
<!-- //js -->
<!-- cart -->
<script src="js/simpleCart.min.js"></script>
<!-- cart -->
</head>
<body>
	<!--顶部栏-->
	<%@ include file="include/head.jsp"%>
	<!--顶部栏结束-->
	<!--主界面块-->
	<div class="banner">
		<div class="container">
			<h2 class="hdng">
				享乐 <span> PLEASURE </span> for u
			</h2>
			<p>
				Life is shrot &nbsp;&nbsp;just enjoy yourself.<br>人&nbsp; 生
				&nbsp;苦&nbsp; 短&nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;及&nbsp; 时
				&nbsp;享&nbsp; 乐
			</p>
			<a href="searchByStr.do?searchStr=">享乐</a>
		</div>
	</div>
	<!--主界面块结束-->

	<div class="copyrights">
		<a href="http://www.cssmoban.com/">diyirem</a>
	</div>
	<!-- 热门推送 -->
	<div class="gallery">
		<div class="container">
			<div class="gallery-grids">
				<!-- 第一热门推送 -->
				<div class="col-md-8 gallery-grid glry-one" >
					<a href="getProductByID.do?id=${no1.productID}"><img src="productimgs/${no1.imageURL1}"
						class="img-responsive" style="width: 480px;height:270px;clear: both; display: block; margin:auto; "/>
						<div class="gallery-info">
							<p>
								<span class="glyphicon glyphicon-eye-open"></span> view
							</p>
							<a class="shop" href="single.jsp">详情</a>
							<div class="clearfix"></div>
						</div> </a>
					<div class="galy-info">
						<p  style="text-align: center;">${no1.name }</p>
						<div class="galry">
							<div class="prices">
								<h5 class="item_price" >${no1.price }</h5>
							</div>
							<div class="clearfix"></div>
						</div>
					</div>
				</div>
				<!-- 第一热门推送结束 -->
				<!-- 第二热门推送 -->
				<div class="col-md-4 gallery-grid glry-two" >
					<a href="getProductByID.do?id=${no2.productID}"><img src="productimgs/${no2.imageURL1}"
						class="img-responsive" alt=""  style="width: 480px;height:270px;clear: both; display: block; margin:auto;"/>
						<div class="gallery-info galrr-info-two">
							<p>
								<span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span>
								view
							</p>
							<a class="shop" href="single.jsp">立即购买</a>
							<div class="clearfix"></div>
						</div> </a>
					<div class="galy-info">
						<p style="text-align: center;">${no2.name }</p>
						<div class="galry">
							<div class="prices">
								<h5 class="item_price">${no1.price }</h5>
							</div>
							<div class="rating"></div>
							<div class="clearfix"></div>
						</div>
					</div>
				</div>
				<!-- 第二热门推送结束 -->
				<!-- 普通热门推送 -->
				<c:forEach var="product" items="${plist }">
				<div class="col-md-3 gallery-grid " >
					<a href="getProductByID.do?id=${product.productID}"><img src="productimgs/${product.imageURL1 }"
						class="img-responsive" alt=""  style="width: 320px;height:180px;clear: both; display: block; margin:auto;" />
						<div class="gallery-info">
							<p>
								<span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span>
								view
							</p>
							<a class="shop" href="single.jsp">立即购买</a>
							<div class="clearfix"></div>
						</div> </a>
					<div class="galy-info">
						<p>${product.name }</p>
						<div class="galry">
							<div class="prices">
								<h5 class="item_price">${product.price }</h5>
							</div>
							<div class="rating"></div>
							<div class="clearfix"></div>
						</div>
					</div>
				</div>
				</c:forEach>
				<!-- 普通热门推送结束 -->
			</div>
		</div>
	</div>
	<!-- 热门推送结束 -->

	<!--订阅-->
	<div class="subscribe">
		<div class="container">
			<h3>跟着享乐</h3>
			<form action="subscribe.do" method="post">
				<input type="text" class="text" value="邮箱" name="email" 
					onFocus="this.value = '';"
					onBlur="if (this.value == '') {this.value = 'Email';}"> <input
					type="submit" value="订阅">
			</form>
		</div>
	</div>
	<!--订阅结束-->
	
	<%@ include file="include/foot.jsp"%>
</body>
</html>