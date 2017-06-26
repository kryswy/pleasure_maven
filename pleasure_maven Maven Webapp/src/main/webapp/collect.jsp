<%@ page language="java" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>享乐 - 分类查找</title>
<link rel="shortcut icon" href="favicon.ico" type="image/x-icon" />
<!-- Custom Theme files -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/jsp; charset=utf-8" />
<meta name="keywords" content="" />
<!-- //Custom Theme files -->
<link href="css/bootstrap.css" type="text/css" rel="stylesheet"
	media="all">
<link href="css/style.css" type="text/css" rel="stylesheet" media="all">
<link href="css/form.css" rel="stylesheet" type="text/css" media="all" />
<!-- js -->
<script src="js/jquery.min.js"></script>
<script type="text/javascript">
	function addProcductToCart(productID){
		var pAmount=$("#pAmount").val();
		$.post("addProcductToCart.do", {amount:pAmount,productID:productID});
	}
	function deleteProcductFromCart(productID){
		$.post("deleteProcductFromCollection.do", {productID:productID});
		window.location.reload();
	}
</script>
<script type="text/javascript" src="js/bootstrap-3.1.1.min.js"></script>
<!-- //js -->
<!-- cart -->
<script src="js/simpleCart.min.js"></script>
<!-- cart -->
<!-- the jScrollPane script -->
<script type="text/javascript" src="js/jquery.jscrollpane.min.js"></script>
<script type="text/javascript" id="sourcecode"></script>
<!-- //the jScrollPane script -->
<script type="text/javascript" src="js/jquery.mousewheel.js"></script>
<!-- the mousewheel plugin -->
</head>
<body>
	<!--顶部栏-->
	<%@ include file="include/head.jsp"%>
	<!--顶部栏结束-->
	<!--products-->
	<div class="products">
		<div class="container">
			<h2>(我的收藏)</h2>


			<!-- 产品信息列表 -->
			<div class="col-md-9 product-model-sec">
				<c:forEach var="product" items="${plist}">
				<div class="product-grid">
					<a href="getProductByID.do?id=${product.productID }">
						<div class="more-product">
							<span> </span>
						</div>
						<div class="product-img b-link-stripe b-animate-go  thickbox" style="width: 256px;height: 128px";>
							<img src="productimgs/${product.imageURL1}" class="img-responsive" >
							<div class="b-wrapper">
								<h4 class="b-animate b-from-left  b-delay03">
									<button>详情</button>
								</h4>
							</div>
						</div>
					</a>
					<div class="product-info simpleCart_shelfItem">
						<div class="product-info-cust prt_name">
							<h4 style="height:30px;">${product.name }</h4>
							<span class="item_price">${product.price}</span> 
							
							<input type="text" id="pAmount" class="item_quantity" value="1" /> 
							<input type="button" class="item_add items" value="添加" onclick="addProcductToCart(${product.productID});">
							<input type="button" class="item_add items" value="移除" onclick="deleteProcductFromCart(${product.productID});">
							<div class="clearfix"></div>
						</div>
					</div>
				</div>
				</c:forEach>
			</div>
			<!-- 产品信息列表结束 -->

			
		</div>
	</div>
	<!--//products-->
	<!--footer-->
	<%@ include file="include/foot.jsp"%>
</body>
</html>
