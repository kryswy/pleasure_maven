<%@ page language="java" pageEncoding="utf-8"%>
<jsp>
<head>
<title>享乐 - 账号注册</title>
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
<script type="text/javascript">
function checkFirstName(){
	var flag=false;
	var firstName=$("#firstName").val();
	if(firstName==""){
		$("#firstNameHint").html("姓不能为空");
		$("#firstNameHint").css("color","red");
	}else{
		flag=true;
		$("#firstNameHint").html("");
	}
	return flag;
}
function checkLastName(){
	var flag=false;
	var lastName=$("#lastName").val();
	if(lastName==""){
		$("#lastNameHint").html("名不能为空");
		$("#lastNameHint").css("color","red");
	}else{
		flag=true;
		$("#lastNameHint").html("");
	}
	return flag;
}
function checkPassword(){
	var flag=false;
	var password=$("#ppassword").val();
	if(password==""){
		$("#passwordHint").html("密码不能为空");
		$("#passwordHint").css("color","red");
	}else{
		if(password.length<6){
			$("#passwordHint").html("密码不应少于6位");
			$("#passwordHint").css("color","red");
		}else if(password.length>20){
			$("#passwordHint").html("密码不应多于20位");
			$("#passwordHint").css("color","red");
		}else{
			flag=true;
			$("#passwordHint").html("");
		}
	}
	return flag;
}
function checkUserName(){
	var flag=false;
	var userName=$("#userName").val();
	if(userName==""){
		$("#userNameHint").html("用户名不能为空");
		$("#userNameHint").css("color","red");
	}else{
		if(userName.length<4){
			$("#userNameHint").html("用户名应不少于4位");
			$("#userNameHint").css("color","red");
		}else if(userName.length>10){
			$("#userNameHint").html("用户名应不多于10位");
			$("#userNameHint").css("color","red");
		}else{
			$.ajax({
				   type: "POST",
				   url: "checkUserName.do",
				   data: "userName="+userName,
				   async: false,
				   success: function(msg){
					   if(msg==1){
							$("#userNameHint").html("该用户名可以使用");
							$("#userNameHint").css("color","green");
							flag=true;
						}else if(msg==0){
							$("#userNameHint").html("该用户名被占用");
							$("#userNameHint").css("color","red");
						}
				   }
				});
		}
	}
	return flag;
}
function checkEmail(){
	var flag=false;
	var email=$("#eemail").val();
	if(email==""){
		$("#emailHint").html("邮箱不能为空");
		$("#emailHint").css("color","red");
	}else{
		var reg=/^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/;
		if(reg.test(email)){
			flag=true;
			$("#emailHint").html("");
		}else{
			$("#emailHint").html("请输入正确格式的邮箱");
			$("#emailHint").css("color","red");
		}
	}
	
	return flag;
}
function checkRePassword(){
	var flag=false;
	var password=$("#ppassword").val();
	var repassword=$("#repassword").val();
	if(repassword==password){
		flag=true;
		$("#pwdHint").html("");
	}else{
		$("#pwdHint").html("两次输入的密码不一致");
		$("#pwdHint").css("color","red");
	}
	return flag;
}
function checkAll(){
	 var ids  = ["checkFirstName()","checkLastName()","checkPassword()","checkUserName()","checkEmail()","checkRePassword()"];
	 var sum = 0;
	 for(var i = 0; i<ids.length ;i++){
	     if ( eval(ids[i]) ){
	    	 sum++;
	     }
	 }
	 return ids.length == sum ? true : false;
}
	$(document).ready(function(){
		$("#userName").blur(function(){
			checkUserName();
		});
		$("#eemail").blur(function(){
			checkEmail();
		});
		$("#repassword").change(function(){
			checkRePassword();
		});
		$("#firstName").blur(function(){
			checkFirstName();
		});
		$("#lastName").blur(function(){
			checkLastName();
		});
		$("#ppassword").blur(function(){
			checkPassword();
		});
	});
</script>
<script type="text/javascript" src="js/bootstrap-3.1.1.min.js"></script>
<!-- //js -->
<!-- cart -->
<script src="js/simpleCart.min.js">
	
</script>
<!-- cart -->
</head>
<body>
	<!--顶部栏-->
	<%@ include file="include/head.jsp"%>
	<!--顶部栏结束-->


	<!--account-->
	<div class="account">
		<div class="container">
			<div class="register">
				<form action="register.do" method="post" onSubmit="return checkAll();">
					<div class="register-top-grid">
						<h3>个人信息</h3>
						<div class="input">
							<span>姓<label>*</label></span> <input type="text" id="firstName" name="firstName">
							<div id="firstNameHint"></div>
						</div>
						<div class="input">
							<span>名<label>*</label></span> <input type="text" id="lastName" name="lastName">
							<div id="lastNameHint"></div>
						</div>
						<div class="input">
							<span>用户名<label>*</label></span> <input id="userName" type="text" name="userName">
							<br><div id="userNameHint">用户名应以汉字、字母、数字、下划线组成，且长度为4-10位</div>
						</div>
						
						<div class="input">
							<span>电子邮箱<label>*</label></span> <input type="text" id="eemail" name="email">
							<div id="emailHint">请输入您常用的邮箱</div>
						</div>
						
						<div class="clearfix"></div>
					</div>
					<div class="register-bottom-grid">
						<h3>登录信息</h3>
						<div class="input">
							<span>密码<label>*</label></span> <input type="password" id="ppassword" name="password">
						</div>
						<div id="passwordHint">密码长度应为6-20位</div>
						
						<div class="input">
							<span>确认密码<label>*</label></span> <input type="password" id="repassword"  name="repassword">
							<div id="pwdHint"></div>
						</div>
					</div>
					
					<div class="register-but">
						<input type="submit" value="注册">
					</div>
					
				</form>
				
				


			</div>
		</div>
	</div>
	<!--//account-->
	<!--footer-->
	<%@ include file="include/foot.jsp"%>
</body>
</html>