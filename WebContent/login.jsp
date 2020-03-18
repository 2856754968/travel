<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>旅游网-登录</title>
<link rel="stylesheet" type="text/css" href="css/common.css">
<link rel="stylesheet" type="text/css" href="css/login.css">
<!--导入jquery-->
<script src="js/jquery-3.3.1.js"></script>
</head>
<body>
	<!-- 头部 start -->
	<header id="header">
	<div class="top_banner">
		<img src="images/top_banner.jpg" alt="">
	</div>
	<div class="shortcut">
		<!-- 未登录状态  -->
		<c:if test="${empty user}">
			<div class="login_out">
				<a href="login.jsp">登录</a> <a href="register.jsp">注册</a>
			</div>
		</c:if>
		<c:if test="${!empty user }">
			<!-- 登录状态  -->
			<div class="login">
				<span>欢迎回来，${user.username}</span> <a
					href="/travel/routeServlet?type=cateUid&uid=${user.uid }"
					class="collection">我的收藏</a> <a href="javascript:;" onclick="exit()">退出</a>
			</div>
		</c:if>
	</div>
	<div class="header_wrap">
		<div class="topbar">
			<div class="logo">
				<a href="/"><img src="images/logo.jpg" alt=""></a>
			</div>
			<div class="search">
				<input name="search" type="text" placeholder="请输入路线名称"
					class="search_input" autocomplete="off"> <a
					href="javascript:;" class="search-button">搜索</a>
			</div>
			<div id="lns"></div>
			<div class="hottel">
				<div class="hot_pic">
					<img src="images/hot_tel.jpg" alt="">
				</div>
				<div class="hot_tel">
					<p class="hot_time">客服热线(9:00-6:00)</p>
					<p class="hot_num">400-618-9090</p>
				</div>
			</div>
			<input type="button" value="">
		</div>
	</div>
	</header>

	<!-- 头部 end -->

	<!-- 头部 end -->
	<section id="login_wrap">
	<div class="fullscreen-bg"
		style="background: url(images/login_bg.png); height: 532px;"></div>
	<div class="login-box">
		<div class="title">
			<span>欢迎登录旅游账户</span>
		</div>
		<div class="login_inner">
			<!--登录错误提示消息-->
			<div id="errorMsg" class="alert alert-danger">
				<c:if test="${not empty msg}">${msg }</c:if>
			</div>
			<form id="loginForm" action="/travel/LoginServlet" method="post"
				accept-charset="utf-8">
				<input type="hidden" name="action" value="login" /><input
					type="hidden" name="url" /><input name="username" type="text"
					placeholder="请输入账号" autocomplete="off"> </span><input
					name="password" type="password" placeholder="请输入密码"
					autocomplete="off">

				<div class="verify">
					<input name="check" type="text" placeholder="请输入验证码"
						autocomplete="off"> <span><img
						src="/travel/checkCode" alt="" onclick="changeCheckCode(this)"></span>
				</div>
				<div class="submit_btn">
					<button type="button" id=btn>登录</button>
					<div class="auto_login">
						<input type="checkbox" name="autoLogin" class="checkbox"
							value="自动登录"> <span>自动登录</span>
					</div>
				</div>
			</form>
			<div class="reg">
				没有账户？<a href="register.jsp">立即注册</a>&emsp; <a href="javascript:;"
					onclick="activation()">激活账户</a>
			</div>
		</div>
	</div>
	</section>
	<!-- 尾部 start-->
	<footer id="footer">
	<div class="why_select">
		<dl>
			<dt class="fl">
				<img src="images/icon_1.jpg" alt="">
			</dt>
			<dd>
				<h1>产品齐全</h1>
				<h2>产品全自主选，随心买</h2>
			</dd>
		</dl>
		<dl>
			<dt class="fl">
				<img src="images/icon_2.jpg" alt="">
			</dt>
			<dd>
				<h1>便利快捷</h1>
				<h2>24小时不打烊，随时买</h2>
			</dd>
		</dl>
		<dl>
			<dt class="fl">
				<img src="images/icon_3.jpg" alt="">
			</dt>
			<dd>
				<h1>安全支付</h1>
				<h2>知名支付工具，放心买</h2>
			</dd>
		</dl>
		<dl>
			<dt class="fl">
				<img src="images/icon_4.jpg" alt="">
			</dt>
			<dd style="margin-right: 0px;">
				<h1>贴心服务</h1>
				<h2>客服全年无休，安心买</h2>
			</dd>
		</dl>
	</div>
	<div class="company">
		<p>XXXXXXXXXXXXXXXXXX股份有限公司 版权所有Copyright 1999-2019, All Rights
			Reserved 湘ICP备16001112</p>
	</div>
	</footer>
</body>
<script type="text/javascript">
	$(function() {
		$("input[name='url']").val(document.referrer);
		$("#lns").css({
			"border" : "1px #ccc solid",
			"width" : "495px",
			"position" : "absolute",
			"top" : "235px",
			"left" : "370px",
			"display" : "none",
			"background-color" : "#FFFFFF",
			"z-index" : "99"
		});
		$("#lns").hover(function() {
			$("#lns").show();
		}, function() {
			$("#lns").hide();
		})
		$("input[name='search']").keyup(
				function() {
					var uname = $(this).val();
					if (uname != "") {//如果输入的不为空则发送ajax请求
						$.post("/travel/searchServlet", {
							"type" : "index",
							"rname" : uname
						}, function(result) {
							$("#lns").empty();
							$.each(result, function(i, s) {
								$("#lns").show();
								$("#lns").append(
										"<div><a href='/travel/searchServlet?type=detailed&rid="
												+ s.rid + "'>" + s.rname
												+ "</a></div>");
							})

							// 点击其他地方的时候隐藏
							//$("input[name='search']").blur(function() {
							//	$("#lns").hide();
							//});
						}, "JSON");
					} else {
						$("#lns").html("");
						$("#lns").hide();
					}

				});
		$(".search-button")
				.click(
						function() {
							var rname = $("input[name='search']").val();
							if (rname == "") {
								return;
							} else {
								location = "/travel/routeServlet?type=searchRname&rname="
										+ rname;
							}
						});

		var data1 = false;
		$("#btn").click(function() {
			var check = $("input[name='check']").val();
			if (check == "") {
				$("#errorMsg").html("请输入验证码");
			} else {
				$.post("/travel/VerificationCodeServlet", {
					"type" : "register",
					"check" : check
				}, function(data) {
					if (data != true) {
						$("#errorMsg").html("验证码错误");
					}
					data1 = data;
				}, "JSON");
			}

		})

		$("#btn").click(function() {
			var username = $("input[name='username']").val();
			var password = $("input[name='password']").val();
			if (username == "") {
				$("#errorMsg").html("用户名不能为空");
			} else if (password == "") {
				$("#errorMsg").html("密码不能为空");
			}
			if (username != "" && password != "" && data1) {
				$("#loginForm").submit();
			}
		})
	});

	function activation() {
		$("#loginForm").children().remove();
		$("#loginForm")
				.append(
						"<input type='text' name='code' placeholder='请输入激活码'><br><input type='button' value='激活' onclick='activation1()'>")
	}

	function activation1() {
		var code = $("input[name='code']").val();
		if (code == "") {
			$("#errorMsg").html("请输入激活码");
		} else {
			$.post("/travel/VerificationCodeServlet", {
				"type" : "userCode",
				"code" : code
			}, function(data) {
				if (data) {
					location = "/travel/login.jsp";
				} else {
					$("#errorMsg").html("激活失败");
				}
			}, "JSON")
		}
	}
	function exit() {
		var result = confirm("确定要退出吗？");
		if (result) {
			location.href = "/travel/VerificationCodeServlet?type=exit&url="
					+ window.location.href;
		}
	}
</script>
</html>