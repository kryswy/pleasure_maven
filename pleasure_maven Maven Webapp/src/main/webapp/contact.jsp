<%@ page language="java" pageEncoding="utf-8"%>
<html>
<head>
<title>Contact</title>
<link rel="shortcut icon" href="favicon.ico" type="image/x-icon" />
<!-- Custom Theme files -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/jsp; charset=utf-8" />
<meta name="keywords" content="" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //Custom Theme files -->
<link href="css/bootstrap.css" type="text/css" rel="stylesheet" media="all">
<link href="css/style.css" type="text/css" rel="stylesheet" media="all">
<!-- js -->
<script src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap-3.1.1.min.js"></script>
<!-- //js -->
<!-- cart -->
<script src="js/simpleCart.min.js"> </script>
<!-- cart -->
</head>
<body>
		<!--顶部栏-->
	<div class="header">
		<div class="container">
			<nav class="navbar navbar-default" >
				<!-- 享乐首页按钮 -->
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target="#bs-example-navbar-collapse-1">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<h1 class="navbar-brand">
						<a href="index.do">享乐</a>
					</h1>
				</div>
				<!-- 其他顶部按钮-->
				<div class="collapse navbar-collapse"
					id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<!-- 首页按钮 -->
						<li><a href="index.do" class="active">首页</a></li>
						<!-- 美食按钮 -->
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown">美食<b class="caret"></b></a>
							<ul class="dropdown-menu multi-column columns-4">
								<div class="row">
									<div class="col-sm-3">
										<h4>口味</h4>
										<ul class="multi-column-dropdown">
											<li><a class="list" href="products.jsp">中餐</a></li>
											<li><a class="list" href="products.jsp">火锅</a></li>
											<li><a class="list" href="products.jsp">西餐</a></li>
											<li><a class="list" href="products.jsp">自助餐</a></li>
											<li><a class="list" href="products.jsp">日本料理</a></li>
											<li><a class="list" href="products.jsp">甜品饮品</a></li>
										</ul>
									</div>
									<div class="col-sm-3">
										<h4>人数</h4>
										<ul class="multi-column-dropdown">
											<li><a class="list" href="products.jsp">单人餐</a></li>
											<li><a class="list" href="products.jsp">双人餐</a></li>
											<li><a class="list" href="products.jsp">3~4人餐</a></li>
											<li><a class="list" href="products.jsp">5~10人餐</a></li>
											<li><a class="list" href="products.jsp">10人以上</a></li>
											<li><a class="list" href="products.jsp">不限</a></li>
										</ul>
									</div>
									<div class="col-sm-3">
										<h4>时段</h4>
										<ul class="multi-column-dropdown">
											<li><a class="list" href="products.jsp">早餐</a></li>
											<li><a class="list" href="products.jsp">午餐</a></li>
											<li><a class="list" href="products.jsp">下午茶</a></li>
											<li><a class="list" href="products.jsp">晚餐</a></li>
											<li><a class="list" href="products.jsp">夜宵</a></li>
											<li><a class="list" href="products.jsp">不限</a></li>
										</ul>
									</div>
									<div class="col-sm-3">
										<h4>价格</h4>
										<ul class="multi-column-dropdown">
											<li><a class="list" href="products.jsp">0~50</a></li>
											<li><a class="list" href="products.jsp">50~100</a></li>
											<li><a class="list" href="products.jsp">100~200</a></li>
											<li><a class="list" href="products.jsp">200~500</a></li>
											<li><a class="list" href="products.jsp">500~1000</a></li>
											<li><a class="list" href="products.jsp">1000以上</a></li>
										</ul>
									</div>
								</div>
							</ul></li>
						<!-- 酒店按钮 -->
						<li class="dropdown grid"><a href="#"
							class="dropdown-toggle list1" data-toggle="dropdown">酒店<b
								class="caret"></b></a>
							<ul class="dropdown-menu multi-column columns-4">
								<div class="row">
									<div class="col-sm-3">
										<h4>出行选择</h4>
										<ul class="multi-column-dropdown">
											<li><a class="list" href="products.jsp">品质出游</a></li>
											<li><a class="list" href="products.jsp">情侣专享</a></li>
											<li><a class="list" href="products.jsp">家庭出行</a></li>
											<li><a class="list" href="products.jsp">经济出行</a></li>
										</ul>
									</div>
									<div class="col-sm-3">
										<h4>酒店类型</h4>
										<ul class="multi-column-dropdown">
											<li><a class="list" href="products.jsp">高端酒店</a></li>
											<li><a class="list" href="products.jsp">经济连锁</a></li>
											<li><a class="list" href="products.jsp">公寓民宿</a></li>
											<li><a class="list" href="products.jsp">客栈青旅</a></li>
										</ul>
									</div>
									<div class="col-sm-3">
										<h4>价格区间</h4>
										<ul class="multi-column-dropdown">
											<li><a class="list" href="products.jsp">0~100</a></li>
											<li><a class="list" href="products.jsp">100~200</a></li>
											<li><a class="list" href="products.jsp">200~500</a></li>
											<li><a class="list" href="products.jsp">500~1000</a></li>
											<li><a class="list" href="products.jsp">1000以上</a></li>
											<li><a class="list" href="products.jsp">不限</a></li>
										</ul>
									</div>
								</div>
							</ul></li>
						<!--休闲娱乐按钮 -->
						<li class="dropdown grid"><a href="#"
							class="dropdown-toggle list1" data-toggle="dropdown">休闲娱乐 <b
								class="caret"></b>
						</a>
							<ul class="dropdown-menu multi-column columns-4">
								<div class="row">
									<div class="col-sm-3">
										<h4>类型</h4>
										<ul class="multi-column-dropdown">
											<li><a class="list" href="products.jsp">足疗按摩</a></li>
											<li><a class="list" href="products.jsp">洗浴汗蒸</a></li>
											<li><a class="list" href="products.jsp">KTV</a></li>
											<li><a class="list" href="products.jsp">酒吧</a></li>
											<li><a class="list" href="products.jsp">运动健身</a></li>
											<li><a class="list" href="products.jsp">网吧网咖</a></li>
										</ul>
									</div>
									<div class="col-sm-3">
										<h4>类型</h4>
										<ul class="multi-column-dropdown">
											<li><a class="list" href="products.jsp">电玩/游戏厅</a></li>
											<li><a class="list" href="products.jsp">DIY手工</a></li>
											<li><a class="list" href="products.jsp">密室逃脱</a></li>
											<li><a class="list" href="products.jsp">茶馆</a></li>
											<li><a class="list" href="products.jsp">采摘/农家乐</a></li>
											<li><a class="list" href="products.jsp">轰趴</a></li>
										</ul>
									</div>
								</div>
							</ul></li>
						<!--生活服务按钮 -->
						<li class="dropdown grid"><a href="#"
							class="dropdown-toggle list1" data-toggle="dropdown">生活服务<b
								class="caret"></b></a>
							<ul class="dropdown-menu multi-column columns-3">
								<div class="row">
									<div class="col-sm-4">
										<h4>类型</h4>
										<ul class="multi-column-dropdown">
											<li><a class="list" href="products.jsp">美容美体</a></li>
											<li><a class="list" href="products.jsp">运动健身</a></li>
											<li><a class="list" href="products.jsp">衣物清洗</a></li>
											<li><a class="list" href="products.jsp">家政服务</a></li>
											<li><a class="list" href="products.jsp">汽车服务</a></li>
											<li><a class="list" href="products.jsp">体检/齿科</a></li>
										</ul>
									</div>
									<div class="col-sm-4">
										<h4>类型</h4>
										<ul class="multi-column-dropdown">
											<li><a class="list" href="products.jsp">鲜花</a></li>
											<li><a class="list" href="products.jsp">儿童乐园</a></li>
											<li><a class="list" href="products.jsp">幼儿教育</a></li>
											<li><a class="list" href="products.jsp">宠物</a></li>
											<li><a class="list" href="products.jsp">摄影写真</a></li>
											<li><a class="list" href="products.jsp">学习培训</a></li>
										</ul>
									</div>
								</div>
							</ul></li>
					</ul>
					<!--/.navbar-collapse-->
				</div>
				<!--//navbar-header-->
			</nav>
			<div class="header-info">
				<div class="header-right search-box">
					<a href="#"><span class="glyphicon glyphicon-search"
						aria-hidden="true"></span></a>
					<div class="search">
						<form class="navbar-form">
							<input type="text" class="form-control">
							<button type="submit" class="btn btn-default"
								aria-label="Left Align">搜索</button>
						</form>
					</div>
				</div>
				<div class="header-right login">
					<a href="#"><span class="glyphicon glyphicon-user"
						aria-hidden="true"></span></a>
					<div id="loginBox">
						<form id="loginForm">
							<fieldset id="body">
								<fieldset>
									<label for="email">账号</label> <input type="text" name="email"
										id="email">
								</fieldset>
								<fieldset>
									<label for="password">密码</label> <input type="password"
										name="password" id="password">
								</fieldset>
								<input type="submit" id="login" value="登录"> <label
									for="checkbox"><input type="checkbox" id="checkbox">
									<i>记住我在此设备</i></label>
							</fieldset>
							<p>
								新用户? <a class="sign" href="account.jsp">注册</a> <span><a
									href="#">忘记了你的密码?</a></span>
							</p>
						</form>
					</div>
				</div>
				<div class="header-right cart">
					<a href="#"><span class="glyphicon glyphicon-shopping-cart"
						aria-hidden="true"></span></a>
					<div class="cart-box">
						<h4>
							<a href="checkout.jsp"> <span class="simpleCart_total">
									$0.00 </span> (<span id="simpleCart_quantity"
								class="simpleCart_quantity"> 0 </span>)
							</a>
						</h4>
						<p>
							<a href="javascript:;" class="simpleCart_empty">清空购物车</a>
						</p>
						<div class="clearfix"></div>
					</div>
				</div>
				<div class="clearfix"></div>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
	<!--顶部栏结束-->
	<!--contact-->
	<div class="contact">
		<div class="container">
			<h2>Contact Us</h2>
			<div class="map">	
				<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d205251.8961757029!2d-82.55659211602483!3d36.50439253757311!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x885a856b70074b97%3A0x6f9cc0d30bcc841f!2sKingsport%2C+TN%2C+USA!5e0!3m2!1sen!2sin!4v1433743549812"></iframe>
			</div>
			<div class="contact-infom">
				<h4>Miscellaneous information :</h4>
				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,sheets containing Lorem Ipsum passages, 
					sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.It was popularised in the 1960s with the release of Letraset
					and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>
			</div>
			<div class="address">
				<div class="col-md-4 address-grids">
					<h4>Address :</h4>
					<ul>
						<span class="glyphicon glyphicon-map-marker" aria-hidden="true"></span>
						<p>	Eiusmod Tempor inc<br>
							St Dolore Place,<br>
							Kingsport 56777
						</p>
					</ul>
				</div>
				<div class="col-md-4 address-grids">
					<h4>Contact no :</h4>
					<p><span class="glyphicon glyphicon-earphone" aria-hidden="true"></span>+2 800 544 6035</p>
					<p><span class="glyphicon glyphicon-print" aria-hidden="true"></span>+2 100 889 9466</p>
				</div>
				<div class="col-md-4 address-grids">
					<h4>Email :</h4>
					<p><span class="glyphicon glyphicon-envelope" aria-hidden="true"></span><a href="mailto:example@mail.com">mail@example.com</a></p>
				</div>
				<div class="clearfix"> </div>
			</div>		
			<div class="contact-form">
				<h4>Contact form</h4>
				<form>
					<input type="text" value="Name" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Name';}" required="">
					<input type="text" value="Email" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Email';}" required="">
					<input type="text" value="Telephone" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Telephone';}" required="">
					<textarea type="text"  onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Message...';}" required="">Message...</textarea>
					<button class="btn1">Submit</button>
				</form>
			</div>	
		</div>
	</div>
	<!--//contact-->
	<!--footer-->
	<div class="footer">
		<div class="container">
			<div class="footer-grids">
				<div class="col-md-2 footer-grid">
					<h4>company</h4>
					<ul>
						<li><a href="products.jsp">products</a></li>
						<li><a href="#">Work Here</a></li>
						<li><a href="#">Team</a></li>
						<li><a href="#">Happenings</a></li>
						<li><a href="#">Dealer Locator</a></li>
					</ul>
				</div>
				<div class="col-md-2 footer-grid">
					<h4>service</h4>
					<ul>
						<li><a href="#">Support</a></li>
						<li><a href="#">FAQ</a></li>
						<li><a href="#">Warranty</a></li>
						<li><a href="contact.jsp">Contact Us</a></li>
					</ul>
				</div>
				<div class="col-md-3 footer-grid">
					<h4>order & returns</h4>
					<ul>
						<li><a href="#">Order Status</a></li>
						<li><a href="#">Shipping Policy</a></li>
						<li><a href="#">Return Policy</a></li>
						<li><a href="#">Digital Gift Card</a></li>
					</ul>
				</div>
				<div class="col-md-2 footer-grid">
					<h4>legal</h4>
					<ul>
						<li><a href="#">Privacy</a></li>
						<li><a href="#">Terms and Conditions</a></li>
						<li><a href="#">Social Responsibility</a></li>
					</ul>
				</div>
				<div class="col-md-3 footer-grid icons">
					<h4>Connect with Us</h4>
					<ul>
						<li><a href="#"><img src="images/i1.png" alt=""/>Follow us on Facebook</a></li>
						<li><a href="#"><img src="images/i2.png" alt=""/>Follow us on Twitter</a></li>
						<li><a href="#"><img src="images/i3.png" alt=""/>Follow us on Google-plus</a></li>
						<li><a href="#"><img src="images/i4.png" alt=""/>Follow us on Pinterest</a></li>
					</div>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	<!--footer-->
	<div class="footer-bottom">
		<div class="container">
			<p>Copyright &copy; 2015.Company name All rights reserved.More Templates <a href="http://www.cssmoban.com/" target="_blank" title="æ¨¡æ¿ä¹å®¶">æ¨¡æ¿ä¹å®¶</a> - Collect from <a href="http://www.cssmoban.com/" title="ç½é¡µæ¨¡æ¿" target="_blank">ç½é¡µæ¨¡æ¿</a></p>
		</div>
	</div>
</body>
</html>