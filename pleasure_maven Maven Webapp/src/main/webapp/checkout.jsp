<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" pageEncoding="utf-8"%>
<html>
<head>
<title>享乐 - 购物车</title>
<link rel="shortcut icon" href="favicon.ico" type="image/x-icon" />
<!-- Custom Theme files -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/jsp; charset=utf-8" />
<meta name="keywords" content="" />
<!-- //Custom Theme files -->
<link href="css/bootstrap.css" type="text/css" rel="stylesheet"
	media="all">
<link href="css/style.css" type="text/css" rel="stylesheet" media="all">
<!-- js -->
<script src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap-3.1.1.min.js"></script>
<!-- //js -->
<!-- cart -->
<%--<script src="js/simpleCart.min.js">--%>
	<%----%>
<%--</script>--%>
<!-- cart -->
</head>
<body>
	<!--顶部栏-->
		<%@ include file="include/head.jsp" %>
	<!--顶部栏结束-->
	<!--购物车内容-->
	<div class="cart-items">
		<div class="container">
			<h2>我的购物车</h2>
			<script>
				function countprice() {
					$.post("countprice.do",
							{
								cartID:${cart.cartID},
							},function (result) {
								getresult(result);
							});
				}
				function getresult(result) {
					$(".price").html("￥"+result);
				}
				$(document).ready(function(c) {
					countprice();
					$('.count').on('click', function(c) {
						if ($(".price").html() == "0.0￥"){
							alert("请先添加商品。");
						}else {
							setTimeout("countprice()",200);
							$.post("cartbuy.do",{
								cartID:${cart.cartID}
							},null,null);
							$(".simpleCart_shelfItem").empty();
							window.location.href="index.do";
						}
					});
					$('.close1').on('click', function(c) {
						$.post("deleteproduct.do",
								{
									cartID:${cart.cartID},
									productID:$(this).parent().find(".pid").val()
								},null,null);
						setTimeout("countprice()",200);
						$(this).parent().fadeOut('slow', function(c) {
							$(this).remove();
						});
					});
					$('.amount').change(function () {
						$.post("changeamount.do",
								{
									cartID:${cart.cartID},
									amount:$(this).val(),
									productID:$(this).next().val()
								},null,null);
						setTimeout("countprice()",200);
					});
				});
			</script>
			<div class="cart-header">
				<c:forEach var="product" items="${plist}">
					<c:forEach var="product2" items="${pmap}">
						<c:if test="${product.productID == product2.key.productID}">
							<div class="cart-sec simpleCart_shelfItem">
								<div class="close1"></div>
								<div class="cart-item cyc">
									<img src="productimgs/${product2.key.imageURL1}" class="img-responsive" alt="">
								</div>
								<div class="cart-item-info">
									<h3>
										<a href="getProductByID.do?id=${product2.key.productID}"> ${product2.key.name} </a><span>价格:￥${product2.key.price}</span>
									</h3>
									<ul class="qty">
										<li><p>产品描述:&nbsp;${product2.key.description}</p></li>
										<br><br/>数量：<input id="amount" style="width: 60px" min="1" max="99"
														   class="single-grid single-grid form-control input-small amount"
														   type="number" value='${product2.value}'/>
										<input class="pid" type="hidden" value="${product2.key.productID}"/><br/></li>
									</ul>
									<div class="delivery">
										<div class="clearfix"></div>
									</div>
								</div>
								<div class="clearfix"></div>
							</div>
						</c:if>
					</c:forEach>
				</c:forEach>
			</div>
		</div>
		<span class="price"></span>
		<a href="#"><img src="images/buy.png" class="count"></a>
	</div>
	<!--购物车内容结束-->
	
	
	<!--footer-->
		<%@ include file="include/foot.jsp" %>
</body>
</html>