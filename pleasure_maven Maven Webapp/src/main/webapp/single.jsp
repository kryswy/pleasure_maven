<%@ page language="java" pageEncoding="utf-8"%>
<html>
<head>
<title>享乐 - 产品详情</title>
<link rel="shortcut icon" href="favicon.ico" type="image/x-icon" />
<!-- Custom Theme files -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/jsp; charset=utf-8" />
<meta name="keywords" content="" />
<link href="css/bootstrap.css" type="text/css" rel="stylesheet"
	media="all">
<link href="css/style.css" type="text/css" rel="stylesheet" media="all">
<!-- js -->
<script src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap-3.1.1.min.js"></script>
<script src="js/imagezoom.js"></script>
<!-- //js -->
<!-- cart -->
<script src="js/simpleCart.min.js"></script>
<!-- cart -->
<!-- FlexSlider -->
<script defer src="js/jquery.flexslider.js"></script>
<link rel="stylesheet" href="css/flexslider.css" type="text/css"
	media="screen" />
<script>
	// Can also be used with $(document).ready()
	$(window).load(function() {
		$('.flexslider').flexslider({
			animation : "slide",
			controlNav : "thumbnails"
		});
		
	});
	

	function addProcductToCart(productID){
		var pAmount=$("#quantity").val();
		$.post("addProcductToCart.do", {amount:pAmount,productID:productID});
	}
	function addProcductToCollection(productID){
		$.post("addProcductToCollection.do", {productID:productID});
	}
</script>
<!--//FlexSlider -->
</head>
<body>
	<!--顶部栏-->
		<%@ include file="include/head.jsp" %>
	<!--顶部栏结束-->
	<!--//single-page-->
	<div class="single">
		<div class="container">
			<div  class="single-grids">
			
			<!-- 详情图片 -->
				<div class="col-md-4 single-grid">
					<div class="flexslider">
						<ul class="slides">
							<li data-thumb="productimgs/${product.imageURL1}">
								<div class="thumb-image">
									<img src="productimgs/${product.imageURL1}" data-imagezoom="true"
										class="img-responsive">
								</div>
							</li>
							<li data-thumb="productimgs/${product.imageURL2}">
								<div class="thumb-image">
									<img src="productimgs/${product.imageURL2}" data-imagezoom="true"
										class="img-responsive">
								</div>
							</li>
							<li data-thumb="productimgs/${product.imageURL3}">
								<div class="thumb-image">
									<img src="productimgs/${product.imageURL3}" data-imagezoom="true"
										class="img-responsive">
								</div>
							</li>
						</ul>
					</div>
				</div>
				<!-- 详情图片结束 -->
				
				<div style="width:450px;" class="col-md-4 single-grid simpleCart_shelfItem">
					<h3>${product.name}</h3>
					<p style="height:120px;">${product.description}</p>
					
					<div class="galry">
						<div class="prices">
							<h5 class="item_price">${product.price} 元</h5>
						</div>
						<div class="rating">
						</div>
						<div class="clearfix"></div>
					</div>
					<p style="height:160px;"></p>
					<p class="qty">数量 :</p>
					<input min="1" type="number" id="quantity" name="quantity" value="1" class="form-control input-small">
						
					<div class="btn_form">
						<input type="button" value="加入购物车" class="add-cart item_add" onclick="addProcductToCart(${product.productID});">
					</div>
					<div class="btn_form">
						<input type="button" value="加入收藏" class="add-cart item_add" onclick="addProcductToCollection(${product.productID});">
					</div>
					<div class="tag">
						<p id="classNameOut">
							类型 : ${pclass.name}
						</p>
							<p>
							销量 : ${product.hot}
						</p>
					</div>
				</div>
		
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	
	
	<!-- collapse -->
	<div class="collpse tabs">
		<div class="container">
			<div class="panel-group collpse" id="accordion" role="tablist"
				aria-multiselectable="true">
				
				<div class="panel panel-default">
					<div class="panel-heading" role="tab" id="headingOne">
						<h4 class="panel-title">
							<a role="button" data-toggle="collapse" data-parent="#accordion"
								href="#collapseOne" aria-expanded="true"
								aria-controls="collapseOne"> 地址 </a>
						</h4>
					</div>
					<div id="collapseOne" class="panel-collapse collapse in"
						role="tabpanel" aria-labelledby="headingOne">
						<div class="panel-body">${product.address}
						</div>
					</div>
				</div>
				
				<div class="panel panel-default">
					<div class="panel-heading" role="tab" id="headingThree">
						<h4 class="panel-title">
							<a class="collapsed" role="button" data-toggle="collapse"
								data-parent="#accordion" href="#collapseTwo"
								aria-expanded="false" aria-controls="collapseTwo"> 详细信息</a>
						</h4>
					</div>
					<div id="collapseTwo" class="panel-collapse collapse"
						role="tabpanel" aria-labelledby="headingThree">
						<div class="panel-body">${product.addition}
						</div>
					</div>
				</div>
				
				<div class="panel panel-default">
					<div class="panel-heading" role="tab" id="headingThree">
						<h4 class="panel-title">
							<a class="collapsed" role="button" data-toggle="collapse"
								data-parent="#accordion" href="#collapseThree"
								aria-expanded="false" aria-controls="collapseThree"> 评论
								(评论数量) </a>
						</h4>
					</div>
					<div id="collapseThree" class="panel-collapse collapse"
						role="tabpanel" aria-labelledby="headingThree">
						<div class="panel-body">评论评论评论
						</div>
					</div>
				</div>
				
			</div>
		</div>
	</div>
	<!--//collapse -->
	
	<!--footer-->
		<%@ include file="include/foot.jsp" %>
</html>