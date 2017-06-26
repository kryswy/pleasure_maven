<%@ page language="java" pageEncoding="utf-8"%>
<html>
<head>
<title>享乐 - 找回密码</title>
<link rel="shortcut icon" href="favicon.ico" type="image/x-icon" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/jsp; charset=utf-8" />
<meta name="keywords" content="" />
<!-- //Custom Theme files -->
<link href="css/bootstrap.css" type="text/css" rel="stylesheet"
	media="all">
<link href="css/style.css" type="text/css" rel="stylesheet" media="all">
<style type="text/css">
#retrievePasswordInput {
	display: none;
}

#retrievePasswordSubmit {
	display: none;
}
</style>
<!-- js -->
<script src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap-3.1.1.min.js"></script>
<script type="text/javascript">
	var second = 61;
	function showInput() {
		/* 	if(boolean){ */
		$('#retrievePasswordInput').css('display', 'block');
		$('#retrievePasswordSubmit').css('display', 'block');
		/* 	} */
	};

	function sendPasswordEmail() {
		var userName=$("#userName").val();
		var email=$("#eemail").val();
		$.ajax({
			   type: "POST",
			   url: "checkEmail.do?userName="+userName+"&email="+email,
			   async: false,
			   success: function(msg){
				   if(msg==1){
					   $("#emailHint").html("");
					   $.ajax({
							type:"POST",
							url:"sendRePwdCode.do?userName="+userName+"&email="+email,
							success:function(msg){//msg为6位验证码
								$("#check").click(function(){
									var code=$("#passwordCode").val();
									msg=msg.substr(0,6);
									if(code==msg && code!=""){
										//show下面
										 showInput();
										 $("#codeHint").html("");
									}else{
										$("#codeHint").html("验证码不正确");
										$("#codeHint").css("color","red");
									}
								});
							},
							dataType:"text"
						});
					}else if(msg==0){
						$("#emailHint").html("该邮箱与注册时的邮箱不一致");
						$("#emailHint").css("color","red");
					}
			   }
			});
		
		$('#sendEmail').attr("disabled", "disabled");
		$('#sendEmail').css('background', '#ffffff');

		minuteCount();
	}

	function minuteCount() {
		count = setTimeout("minuteCount()", 1000);
		second--;
		$('#sendEmail').val("请等待:" + second + "秒");

		if (second == -1) {
			second = 61;
			$('#sendEmail').removeAttr("disabled");
			$('#sendEmail').val("发送验证码");
			clearTimeout(count);
		}
	}
	
	function checkUserName(){
		var userName=$("#userName").val();
		$.ajax({
			   type: "POST",
			   url: "checkUserName.do",
			   data: "userName="+userName,
			   async: false,
			   success: function(msg){
				   if(msg==1){
						$("#userNameHint").html("不存在此用户");
						$("#userNameHint").css("color","red");
					}else if(msg==0){
						$("#userNameHint").html("");
					}
			   }
			});
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
		 var ids  = ["checkPassword()","checkRePassword()"];
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
		$("#ppassword").blur(function(){
			checkPassword();
		});
		$("#repassword").change(function(){
			checkRePassword();
		});
	});
</script>
<!-- //js -->
<!-- cart -->
<script src="js/simpleCart.min.js"></script>
</head>

<body>
	<!--顶部栏-->
	<%@ include file="include/head.jsp"%>
	<!--顶部栏结束-->

	<div class="account">
		<div class="container">
			<div class="register">
				<form action="resetPwd.do" method="post" onSubmit="return checkAll();">
					<div class="register-top-grid">
						<h3>找回密码</h3>
						<div class="input">
							<span>账号<label>*</label></span> <input type="text" id="userName" name="userName">
							<div id="userNameHint"></div>
						</div>

						<div class="input" style="position:relative;">
							<span>邮箱地址<label>*</label></span> <input type="text"  name="email" id="eemail"> <span
								style="position:absolute;z-index:100;left:560px; top:26px;"><input
								type="button" class="btn btn-default" id="sendEmail"
								value="发送验证码"
								style="border-radius:0px;border:none;background:#eeeeee;outline:none;"
								onclick="sendPasswordEmail();"/></span>
								<div id="emailHint"></div>
						</div>

						<div class="input" style="position:relative;">
							<span>验证码<label>*</label></span> <input type="text"  name="passwordCode" id="passwordCode"> <br>
							<span style="position:absolute;z-index:100;left:602px; top:25px;">
								<input type="button" class="btn btn-default" id="check"
								style="border-radius:0px; border:none;background:#eeeeee;outline:none;"
								value="验证" />
							</span>
							<div id="codeHint"></div>
						</div>
					</div>

					<div class="register-bottom-grid" id="retrievePasswordInput">
						<h3>密码修改</h3>
						<div class="input">
							<span>密码<label>*</label></span> <input type="password" id="ppassword" name="password">
							<div id="passwordHint">密码长度应为6-20位</div>
						</div>
						<div class="input">
							<span>确认密码<label>*</label></span> <input type="password" id="repassword"  name="repassword">
							<div id="pwdHint"></div>
						</div>
					</div>
					<div class="register-but" id="retrievePasswordSubmit">
						<input type="submit" value="提交">
					</div>
				</form>

			</div>
		</div>
	</div>


	<!--底部栏-->
	<%@ include file="include/foot.jsp"%>
</body>
</html>
