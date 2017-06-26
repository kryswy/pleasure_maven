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
</script>
<script type="text/javascript" src="js/bootstrap-3.1.1.min.js"></script>
<!-- //js -->
<!-- cart -->
<script src="js/simpleCart.min.js"></script>
<!-- cart -->
<!-- the jScrollPane script -->
<script type="text/javascript" src="js/jquery.jscrollpane.min.js"></script>
<script type="text/javascript" id="sourcecode">
var pID = ${requestScope.pClass.classID};
var pClassName ="${requestScope.pClass.name}";
var classID = ${requestScope.classID};

$(document).ready(function() {
	addLeftClass();
	$(".rsidebar").on('click','label.checkbox',function (){
		if ($(this).find("input").is(':checked') == true){
			$(this).find("input").removeAttr("checked");
		}else if ($(this).find("input").is(':checked') == false){
			$(this).find("input").attr("checked","checked")
		}
		return false;
	});
	$('.scroll-pane').jScrollPane();
});

function addLeftClass(){
		$.post("getChildsById.do", {classID: pID}, function (second) {	
			if(pID<=2){
				var classno=1;
				for (var i = 0; i<second.length; i++) {
					if (second[i].parentID == pID) {
						var html = "<section class='sky-form'><h4><span class='glyphicon glyphicon-minus' aria-hidden='true'></span>"+second[i].name+"</h4> <div class='row row1 scroll-pane'> <div class='col col-4'>";
						for (var j = 0; j < second.length; j++) {
							if (second[j].parentID == second[i].classID) {
								if (classID==second[j].classID){
									html += "<label class='checkbox'> <input type='radio' value="+second[j].classID+" name=class"+classno+" checked='checked'><i></i>"+second[j].name+"</label> ";
								} else {
									html += "<label class='checkbox'> <input type='radio' value="+second[j].classID+" name=class"+classno+"><i></i>"+second[j].name+"</label> ";
								}
							}	
						}
						html += "</div> </div> </section>";
						$("#sectionmark").before(html);
						classno++;
					}
				}
			}else{
				var html = "<section class='sky-form'><h4><span class='glyphicon glyphicon-minus' aria-hidden='true'></span>"+pClassName+"</h4> <div class='row row1 scroll-pane'> <div class='col col-4'>";
				for (var j = 0; j < second.length; j++) {
					if (second[j].parentID == pID) {
						if (classID==second[j].classID){
							html += "<label class='checkbox'> <input type='radio' value="+second[j].classID+" name=class1 checked='checked'><i></i>"+second[j].name+"</label> ";
						} else {
							html += "<label class='checkbox'> <input type='radio' value="+second[j].classID+" name=class1 ><i></i>"+second[j].name+"</label> ";
						}
					}
				}
				html += "</div> </div> </section>";
				$("#sectionmark").before(html);
			}		
		});
};
</script>
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
			<h2>${search_information }(搜索信息)</h2>


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
							<div class="clearfix"></div>
						</div>
					</div>
				</div>
				</c:forEach>
			</div>
			<!-- 产品信息列表结束 -->

			<form action="searchProduct.do" method="post">
			<!-- 左部筛选栏 -->
			<div class="col-md-3 rsidebar span_1_of_left">
				
				
				<div id="sectionmark"></div>
				<!-- 分类筛选 -->
				
				
				
				<!-- 分类筛选结束 -->

				<!-- 价格滑动 -->
				<section class="sky-form">
					<h4>
						<span class="glyphicon glyphicon-minus" aria-hidden="true"></span>Price
					</h4>
					<ul class="dropdown-menu1">
						<li><a href="#">
								<div id="slider-range"></div> <input type="text" id="amount" name="range"
								style="border: 0; font-weight: NORMAL;   font-family: 'Dosis-Regular';" />
						</a></li>
					</ul>
				</section>
				<!---->
				<script type="text/javascript" src="js/jquery-ui.min.js"></script>
				<link rel="stylesheet" type="text/css" href="css/jquery-ui.css">
				<script type='text/javascript'>
					//<![CDATA[ 
					$(window).load(function() {
									$("#slider-range").slider(
														{
															range : true,
															min : 0,
															max : 2000,
															values : [ 0, 2000 ],
															slide : function(event, ui) {
																$("#amount").val(ui.values[0]+"-"+ui.values[1]);
															}
														});
									$("#amount").val($("#slider-range").slider("values",0)+"-"+ $("#slider-range").slider("values",1));
									});//]]>
				</script>
				<!-- 价格滑动结束 -->
				<button type="submit" class="btn btn-default" aria-label="Left Align">搜索</button>
			</div>
			</form>
			<!-- 左部筛选栏结束 -->
			<div class="clearfix"></div>
		</div>
	</div>
	<!--//products-->
	<!--footer-->
	<%@ include file="include/foot.jsp"%>
</body>
</html>
