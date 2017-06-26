<%@ page language="java" pageEncoding="utf-8"%>

<html>
<head>
<title>修改产品</title>
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
<script src="js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap-3.1.1.min.js"></script>
<script type="text/javascript">
	$(function($) {
		$('#updateForm').attr("action",
				"updateProduct.do?id=" + ${product.productID});
	});
	
	//根据文件路径文本框显示内容
	function image_1() {
		$('#image1').val($('#file1').val());
		var lastName = $('#file1').val().substring(
				$('#file1').val().lastIndexOf("."));
		var startTime = new Date().getTime();
		$('#trueimage1').val("D:\\" + startTime + lastName);
	}
	function image_2() {
		$('#image2').val($('#file2').val());
		var lastName = $('#file2').val().substring(
				$('#file2').val().lastIndexOf("."));
		var startTime = new Date().getTime();
		$('#trueimage2').val("D:\\" + startTime + lastName);
	}
	function image_3() {
		$('#image3').val($('#file3').val());
		var lastName = $('#file3').val().substring(
				$('#file3').val().lastIndexOf("."));
		var startTime = new Date().getTime();
		$('#trueimage3').val("D:\\" + startTime + lastName);
	}

	//隐藏input[file]的文字信息。通过button控制
	function clickfile1() {
		$('#file1').click();
	}
	function clickfile2() {
		$('#file2').click();
	}
	function clickfile3() {
		$('#file3').click();
	}

	//点击文件上传
	function uploadFiles() {
		var filenames = new Array();
		filenames[0] = $('#trueimage1').val();
		filenames[1] = $('#trueimage2').val();
		filenames[2] = $('#trueimage3').val();
		var formData = new FormData($("#uploadFilesForm")[0]);
		$.ajax({
			type : "POST",
			url : "upFiles.do?filenames=" + filenames,
			data : formData,
			contentType : false,
			processData : false,
			success : function() {
				$('#uploadFilesResult').empty();
				$('#uploadFilesResult').css('color', 'green');
				$('#uploadFilesResult').append("上传成功");
			}
		});
	}
</script>
</head>

<body>
	<!--顶部栏-->
	<div class="header">
		<div class="container">
			<nav class="navbar navbar-default">
				<!-- 享乐首页按钮 -->
				<div class="navbar-header">
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
						<!--添加产品按钮 -->
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown">增加产品<b class="caret"></b></a>
							<ul class="dropdown-menu multi-column columns-1">
								<div class="row">
									<div class="col-sm-6">
										<h4>类型</h4>
										<ul class="multi-column-dropdown">
											<li><a href="#" class="list" onclick="showAdd();">美食</a></li>
											<li><a href="#" class="list" onclick="showAdd();">酒店</a></li>
											<li><a href="#" class="list" onclick="showAdd();">休闲娱乐</a></li>
											<li><a href="#" class="list" onclick="showAdd();">生活服务</a></li>
										</ul>
									</div>
								</div>
							</ul></li>
						<!-- 删除产品按钮 -->
						<li class="dropdown grid"><a href="#"
							class="dropdown-toggle list1" data-toggle="dropdown">删除产品<b
								class="caret"></b></a>
							<ul class="dropdown-menu multi-column columns-1">
								<div class="row">
									<div class="col-sm-6">
										<h4>类型</h4>
										<ul class="multi-column-dropdown">
											<li><a class="list" onclick="showDelete();">美食</a></li>
											<li><a class="list" onclick="showDelete();">酒店</a></li>
											<li><a class="list" onclick="showDelete();">休闲娱乐</a></li>
											<li><a class="list" onclick="showDelete();">生活服务</a></li>
										</ul>
									</div>
								</div>
							</ul></li>
						<!--修改产品按钮 -->
						<li class="dropdown grid"><a href="#"
							class="dropdown-toggle list1" data-toggle="dropdown">修改产品 <b
								class="caret"></b>
						</a>
							<ul class="dropdown-menu multi-column columns-1">
								<div class="row">
									<div class="col-sm-6">
										<h4>类型</h4>
										<ul class="multi-column-dropdown">
											<li><a class="list" onclick="showUpdate();">美食</a></li>
											<li><a class="list" onclick="showUpdate();">酒店</a></li>
											<li><a class="list" onclick="showUpdate();">休闲娱乐</a></li>
											<li><a class="list" onclick="showUpdate();">生活服务</a></li>
										</ul>
									</div>
								</div>
							</ul></li>
						<!--生活服务按钮 -->
						<li class="dropdown grid"><a href="#"
							class="dropdown-toggle list1" data-toggle="dropdown">查询产品<b
								class="caret"></b></a>
							<ul class="dropdown-menu multi-column columns-1">
								<div class="row">
									<div class="col-sm-6">
										<h4>类型</h4>
										<ul class="multi-column-dropdown">
											<li><a class="list" onclick="showSearch();">美食</a></li>
											<li><a class="list" onclick="showSearch();">酒店</a></li>
											<li><a class="list" onclick="showSearch();">休闲娱乐</a></li>
											<li><a class="list" onclick="showSearch();">生活服务</a></li>
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
						<form class="navbar-form" action="products.jsp">
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
						<!-- form 中 action 目标为登录判定 -->
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
								<input type="submit" id="login" value="登录">
							</fieldset>
							<p>
								新用户? <a class="sign" href="account.jsp">注册</a>
								<!-- a 中 href 为密码找回界面 -->
								<span><a href="retrievePassword.jsp">忘记了你的密码?</a></span>
							</p>
						</form>
					</div>
				</div>
				<!-- 				<div class="header-right cart">
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
				</div> -->
				<div class="clearfix"></div>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
	<!--顶部栏结束-->

	<div class="account" style="position:relative;">
		<div class="container">
			<div class="register">
				<form action="" method="post" enctype="multipart/form-data"
					id="updateForm">
					<div class="register-top-grid">
						<h3>修改产品</h3>
						<div style="display:none">
						<input type="text" name="productID" value=${product.productID } />
						</div>
						<div class="input">
							<span>产品名称<label>*</label></span> <input type="text" name="name"
								value=${product.name }>
						</div>

						<div class="input">
							<span>产品价格<label>*</label></span> <input type="text" name="price"
								value=${product.price }>
						</div>

						<div class="input">
							<span>产品描述<label>*(45字以内)</label></span> <input type="text"
								maxLength="45" name="description" value=${product.description }>
						</div>

						<div class="input">
							<span>详细描述<label>*(300字以内)</label></span>
							<textarea name="addition" maxlength="300" class="addTextarea"
								style="	border: 1px solid #555;
									outline-color: #FD9F3E;
									width: 96%;
									font-size: 1em;
									padding: 0.5em;
									resize: none; 
									height:240;">${product.addition }</textarea>
						</div>
						
						请至少选择一张图片

							<p style="height:60px;"></p >
							<div style="display:none;">
								<input type="text" name="imageURL1" id="trueimage1"
									readonly="readonly" value=${product.imageURL1 }> <input type="text"
									name="imageURL2" id="trueimage2" readonly="readonly" value=${product.imageURL2 }> <input
									type="text" name="imageURL3" id="trueimage3"
									readonly="readonly" value=${product.imageURL3 }>
							</div>
							<div class="input">
								<span>文件一路径<label>*</label></span> <input type="text"
									id="image1" readonly="readonly" value=${product.imageURL1 }>
							</div>
							<div class="input">
								<span>文件二路径<label></label></span> <input type="text" id="image2"
									readonly="readonly" value=${product.imageURL2 }>
							</div>
							<div class="input">
								<span>文件三路径<label></label></span> <input type="text" id="image3"
									readonly="readonly" value=${product.imageURL3 }>
							</div>
			

						<div class="input">
							<span>店家地址<label>*</label></span> <input type="text"
								name="address" value=${product.address }>
						</div>

						<div>
							<section>
								<select name="class1">
									<option value="1">中餐</option>
									<option value="2">西餐</option>
									<option value="3">火锅</option>
								</select> <select name="class2">
									<option value="2">1~2</option>
									<option value="2">2~4</option>
									<option value="2">5~10</option>
								</select> <select name="class3">
									<option value="3">早餐</option>
									<option value="3">午餐</option>
									<option value="3">晚餐</option>
								</select>
							</section>
						</div>
						<div class="clearfix"></div>
					</div>

					<div class="register-but">
						<input type="submit" value="修改">
					</div>

				</form>

				<form id="uploadFilesForm" style="position:absolute;top:680px;"
					action="upFiles.do" method="post" enctype="multipart/form-data">
					<div class="input">
						<label for="file1"> <input type="button" value="上传图片一"
							onclick="clickfile1();"></label> <input type="file" name="files"
							id="file1" accept="image/bmp,image/jpeg,image/png"
							onchange="image_1();" style="display:none;" /> <label
							for="file2"> <input type="button" value="上传图片二"
							onclick="clickfile2();"></label> <input type="file" name="files"
							id="file2" accept="image/bmp,image/jpeg,image/png"
							onchange="image_2();" style="display:none;" /> <label
							for="file3"> <input type="button" value="上传图片三"
							onclick="clickfile3();">
						</label> <input type="file" name="files" id="file3"
							accept="image/bmp,image/jpeg,image/png" onchange="image_3();"
							style="display:none;" /> <input type="button" value="上传文件"
							onclick="uploadFiles();"> <a id="uploadFilesResult"></a>
					</div>
				</form>

			</div>
		</div>
	</div>

	<!-- 增加产品界面结束 -->
</body>
</html>
