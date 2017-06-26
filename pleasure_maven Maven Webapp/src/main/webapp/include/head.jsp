<%@ page language="java" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>

<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />
<!-- //Custom Theme files -->
<link href="../css/bootstrap.css" type="text/css" rel="stylesheet" media="all">
<link href="../css/style.css" type="text/css" rel="stylesheet" media="all">
<!-- js -->
<script src="../js/jquery.min.js"></script>
<script type="text/javascript">
	var classIDforUn;
	function logoff(){
		$.ajax({
			type:"POST",
			url:"logoff.do",
		});
	}
	
	function getChilds(id){
		if(id==1||id==2){
			$.post("getChildsById.do", {classID:id},function(second){
				for(var i=second.length-1;i>=0;i--){	
					if(second[i].parentID==id){
						if(id==1){
							$("#row"+id).prepend("<div class=col-sm-3><h4>"+second[i].name+"</h4><ul id=ul"+id+"-"+i+" class=multi-column-dropdown></ul></div>");
						}else if(id==2){
							$("#row"+id).prepend("<div class=col-sm-4><h4>"+second[i].name+"</h4><ul id=ul"+id+"-"+i+" class=multi-column-dropdown></ul></div>");
						}	
						for(var j=0;j<second.length;j++){
							var html="";
							if(second[j].parentID==second[i].classID){
								html+="<li><a class=list href=getProductsByClassID.do?classID="+second[j].classID+">"+second[j].name+"</a></li>";
							}
							$("#ul"+id+"-"+i).append(html);
						}
						$("#ul"+id+"-"+i).append("<li><a class=list href=unconditional.do?parentID="+id+">不限</a></li>");
					}
            	}
            });
		}else if(id==3||id==4){
			$.post("getChildsById.do", {classID:id},function(second){
				var cols=Math.round(second.length/6);
				for(var i=0;i<cols;i++){
					$("#row"+id).append("<div class=col-sm-4><ul id=ul"+id+"-"+i+" class=multi-column-dropdown></ul></div>");
				}
				var time=0;
				var currentCol=0;
				var html="";
				for(var i=0;i<second.length;i++){
					if(time<6){
						html="<li><a class=list href=getProductsByClassID.do?classID="+second[i].classID+">"+second[i].name+"</a></li>";
						$("#ul"+id+"-"+currentCol).append(html);
						time++;
					}else{
						i--;
						currentCol++;
						html="";
						time=0;
					}
            	}
            });
		}
	}
	$(document).ready(function(){
		 getChilds(1);
		 getChilds(2);
		 getChilds(3);
		 getChilds(4);
		$.ajax({
			type:"POST",
			url:"checkLogin.do",
			success:function(msg){
				msg=msg.substr(0,1);
				//alert(msg);
				if(msg=="1"){
					//已登录且为普通用户
					$("#logined").css("display","block");
					$("#unlogin").css("display","none");
					
				}else if(msg=="0"){
					//未登录
					$("#logined").css("display","none");
					$("#unlogin").css("display","block");
				}else if(msg=="2"){
					//已登录且为管理员
					$("#logined").css("display","block");
					$("#unlogin").css("display","none");
					$("#admin").after("<p><span><a href=admin.do target=_blank>进入管理页面</a></span></p><p><span><a href=chat_m.do target=_blank>客服聊天</a></span></p>");
					
				}
			},
			dataType:"text"
		});
	});
</script>
<script type="text/javascript" src="../js/bootstrap-3.1.1.min.js"></script>
<!-- //js -->
<!-- cart -->
<script src="../js/simpleCart.min.js">
</script>
<!-- cart -->
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
						<!-- 美食按钮 -->
						<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">美食<b class="caret"></b></a>
							<ul class="dropdown-menu multi-column columns-4">
								<div class="row" id="row1">
									<div class="col-sm-3">
										<h4>价格</h4>
										<ul class="multi-column-dropdown">
											<li><a class="list" href="pricesection.do?type=food&left=0&right=50">0~50</a></li>
											<li><a class="list" href="pricesection.do?type=food&left=50&right=100">50~100</a></li>
											<li><a class="list" href="pricesection.do?type=food&left=100&right=200">100~200</a></li>
											<li><a class="list" href="pricesection.do?type=food&left=200&right=500">200~500</a></li>
											<li><a class="list" href="pricesection.do?type=food&left=500&right=1000">500~1000</a></li>
											<li><a class="list" href="pricesection.do?type=food&left=1000&right=0">1000以上</a></li>
										</ul>
									</div>
								</div>
							</ul>
						</li>
						<!-- 酒店按钮 -->
						<li class="dropdown grid"><a href="#"
							class="dropdown-toggle list1" data-toggle="dropdown">酒店<b
								class="caret"></b></a>
							<ul class="dropdown-menu multi-column columns-3">
								<div class="row" id="row2">
									
									<div class="col-sm-4">
										<h4>价格区间</h4>
										<ul class="multi-column-dropdown">
											<li><a class="list" href="pricesection.do?type=hotel&left=0&right=100">0~100</a></li>
											<li><a class="list" href="pricesection.do?type=hotel&left=100&right=200">100~200</a></li>
											<li><a class="list" href="pricesection.do?type=hotel&left=200&right=500">200~500</a></li>
											<li><a class="list" href="pricesection.do?type=hotel&left=500&right=1000">500~1000</a></li>
											<li><a class="list" href="pricesection.do?type=hotel&left=1000&right=0">1000以上</a></li>
										</ul>
									</div>
								</div>
							</ul></li>
						<!--休闲娱乐按钮 -->
						<li class="dropdown grid"><a href="#"
							class="dropdown-toggle list1" data-toggle="dropdown">休闲娱乐 <b
								class="caret"></b>
						</a>
							<ul class="dropdown-menu multi-column columns-3">
								<div class="row" id="row3">
								
								</div>
							</ul></li>
						<!--生活服务按钮 -->
						<li class="dropdown grid"><a href="#"
							class="dropdown-toggle list1" data-toggle="dropdown">生活服务<b
								class="caret"></b></a>
							<ul class="dropdown-menu multi-column columns-3">
								<div class="row" id="row4">

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
						<form class="navbar-form" action="searchByStr.do" >
							<input type="text" class="form-control" name="searchStr">
							<button type="submit" class="btn btn-default"
								aria-label="Left Align">搜索</button>
						</form>
					</div>
				</div>
				<!-- 未登录 -->
				<div class="header-right login" id="unlogin">
					<a href="#"><span class="glyphicon glyphicon-user"
						aria-hidden="true"></span></a>
					<div id="loginBox">
						<!-- form 中 action 目标为登录判定 -->
						<form id="loginForm" action="login.do" method="post">
							<fieldset id="body">
								<fieldset>
									<label for="email">账号</label> <input type="text" name="userName"
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
				<!-- 已登录 -->
				<div class="header-right login" id="logined" style="display:none;">
					<a href=" "><span class="glyphicon glyphicon-user"
						aria-hidden="true"></span></a>
					<div id="loginBox">
						
						<form id="loginForm">
							<fieldset id="body">
								<fieldset>
									<label for="email">欢迎 ${user.userName} <span><a style="text-decoration:none; position:absolute;right:20px; color:#FD9F3E" >个人中心</a></span></label>
								</fieldset>

								<p><span><a href="collection.do">我的收藏</a></span></p>

								<p><span> <a href="getOrderByUserID.do?id=${user.userID}">我的订单</a></span></p>
								
								<c:if test="${user.activate==0}">
								<p><span> 尊敬的用户，您的账号尚未激活<br>您可以点击<a href="resendemail.do">这里</a><br>重新发送一封激活邮件</span></p>
								</c:if>
								
								<div  id="admin"></div>
								
								<input type="submit" id="login" value="注销" onclick="logoff();">
							</fieldset>

						</form>
					</div>
				</div>
				
				
				
				<div class="header-right cart">
					<a href="#"><span class="glyphicon glyphicon-shopping-cart"
						aria-hidden="true"></span></a>
					<div class="cart-box">
						<h4>
						</h4>
						<p>
							<a href="cart.do" class="simpleCart_empty">前往购物车</a>
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
	
</body>
</html>
