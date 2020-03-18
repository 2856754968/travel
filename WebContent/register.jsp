<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册</title>
<link rel="stylesheet" type="text/css" href="css/common.css">
<link rel="stylesheet" href="css/register.css">
<!--导入jquery-->
<script src="js/jquery-3.3.1.js"></script>
<style type="text/css">
#password {
	width: 256px;
	height: 32px;
	line-height: 32px;
	box-sizing: border-box;
	padding: 6px 12px;
	border-radius: 4px;
	border: 1px solid #a6a6a6;
	float: right;
}
</style>
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
				<input name="" type="text" placeholder="请输入路线名称"
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
		</div>
	</div>
	</header>

	<!-- 头部 end -->

	<div class="rg_layout">
		<div class="rg_form clearfix">
			<div class="rg_form_left">
				<p>新用户注册</p>
				<p>USER REGISTER</p>
			</div>
			<div class="rg_form_center">

				<!--注册表单-->
				<form id="registerForm" method="post" action="/travel/UserServlet">
					<!--提交处理请求的标识符-->
					<input type="hidden" name="action" value="register">
					<c:remove var="CODE_SERVER" scope="session" />
					<table style="margin-top: 25px;">
						<tr>
							<td class="td_left"><label for="username">用户名</label></td>
							<td class="td_right"><input type="text" id="username"
								name="username" placeholder="请输入账号"></td>
							<td><img src="" width="20" height="20"></td>
						</tr>
						<tr>
							<td class="td_left"><label for="password">密码</label></td>
							<td class="td_right"><input type="password" id="password"
								name="password" placeholder="请输入密码"></td>
							<td><img src="" width="20" height="20"></td>
						</tr>
						<tr>
							<td class="td_left"><label for="email">Email</label></td>
							<td class="td_right"><input type="text" id="email"
								name="email" placeholder="请输入Email"></td>
							<td><img src="" width="20" height="20"></td>
						</tr>
						<tr>
							<td class="td_left"><label for="name">姓名</label></td>
							<td class="td_right"><input type="text" id="name"
								name="name" placeholder="请输入真实姓名"></td>
							<td><img src="" width="20" height="20"></td>
						</tr>
						<tr>
							<td class="td_left"><label for="telephone">手机号</label></td>
							<td class="td_right"><input type="text" id="telephone"
								name="telephone" placeholder="请输入您的手机号"></td>
							<td><img src="" width="20" height="20"></td>
						</tr>

						<tr>
							<td class="td_left"><label for="sex">性别</label></td>
							<td class="td_right gender"><input type="radio" id="sex"
								name="sex" value="男" checked="checked"> 男 <input
								type="radio" name="sex" value="女"> 女</td>
						</tr>
						<tr>
							<td class="td_left"><label for="birthday">出生日期</label></td>
							<td class="td_right"><input type="date" id="birthday"
								name="birthday" placeholder="年/月/日"></td>
							<td><img src="" width="20" height="20"></td>
						</tr>
						<tr>
							<td class="td_left"><label for="">验证码</label></td>
							<td class="td_right "><input type="text" id="check"
								name="check" class="check"> <img src="checkCode"
								height="32px" alt="" onclick="changeCode(this)"> <script
									type="text/javascript">
									//图片点击事件
									function changeCode(img) {
										img.src = "checkCode?"
												+ new Date().getTime();
									}
								</script></td>
						</tr>

						<tr>
							<td class="td_left"></td>
							<td class="td_right "><input type="button" class="submit"
								value="注册" id="btn"> <span id="msg" style="color: red;"></span></td>
						</tr>
					</table>
				</form>
			</div>
			<div class="rg_form_right">
				<p>
					已有账号？ <a href="/travel/login.jsp">立即登录</a>
				</p>
			</div>
		</div>
	</div>

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
		$(".td_right").next().children().hide();
		var data1 = "";
		$(".submit")
				.click(
						function() {
							//邮箱正则表达式
							var reg = /^[A-Za-z\d]+([-_.][A-Za-z\d]+)*@([A-Za-z\d]+[-_.])+[A-Za-z\d]{2,4}$/;
							var phone = /^1(3[0-9]|4[57]|5[^4]|6[6]|7[0-8]|8[0-9]|9[8-9])\\d{8}$/;
							var username = $("#username").val();
							var password = $("#password").val();
							var email = $("#email").val();
							var name = $("#name").val();
							var telephone = $("#telephone").val();
							var birthday = $("#birthday").val();
							var Code = $("#check").val();
							var msg = "";
							if (username == "") {
								msg = "1";
								$("#username").parent().next().children().attr(
										"src", "images/2239488.jpg").show();
							} else {
								$("#username").parent().next().children().attr(
										"src", "images/1691750.jpg").show();
							}
							if (password == "") {
								msg = msg + "2";
								$("#password").parent().next().children().attr(
										"src", "images/2239488.jpg").show();
							} else {
								$("#password").parent().next().children().attr(
										"src", "images/1691750.jpg").show();
							}
							if (email == "") {
								$("#email").parent().next().children().attr(
										"src", "images/2239488.jpg").show();
								msg = msg + "3";
							} else {
								if (!reg.test(email)) {
									$("#email").parent().next().append(
											"<nobr>邮箱格式错误</nobr>");
								} else {
									$("#email").parent().next().children()
											.attr("src", "images/1691750.jpg")
											.show();
								}
							}

							if (telephone == "") {
								msg = msg + "4";
								$("#telephone").parent().next().children()
										.attr("src", "images/2239488.jpg")
										.show();

							} else {
								if (!reg.test(email)) {
									$("#telephone").parent().next().append(
											"<nobr>格式错误</nobr>");
								} else {
									$("#telephone").parent().next().children()
											.attr("src", "images/1691750.jpg")
											.show();
								}

							}
							if (name == "") {
								msg = msg + "5";
								$("#name").parent().next().children().attr(
										"src", "images/2239488.jpg").show();
							} else {
								$("#name").parent().next().children().attr(
										"src", "images/1691750.jpg").show();
							}
							if (birthday == "") {
								msg = msg + "6";
								$("#birthday").parent().next().children().attr(
										"src", "images/2239488.jpg").show();
							} else {
								$("#birthday").parent().next().children().attr(
										"src", "images/1691750.jpg").show();
							}
							if (data1 == true) {
								if (msg == "") {
									$("#registerForm").submit();
								}
							} else {
								$("#msg").html("验证码错误");
							}

						});
		$("#check").blur(function() {
			var check = $("#check").val();
			$.post("/travel/VerificationCodeServlet", {
				"type" : "register",
				"check" : check
			}, function(data) {
				if (data != true) {
					$("#msg").html("验证码错误");
				} else {
					$("#msg").html("验证码正确");
				}
				data1 = data;
			}, "JSON")
		});

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
	});
	function exit() {
		var result = confirm("确定要退出吗？");
		if (result) {
			location.href = "/travel/VerificationCodeServlet?type=exit&url="
					+ window.location.href;
		}
	}
</script>
</html>