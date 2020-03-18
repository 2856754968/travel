<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
a {
	text-decoration: none
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>旅游网</title>
<!-- Bootstrap -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/common.css">
<link rel="stylesheet" type="text/css" href="css/index.css">
<script src="js/jquery-3.3.1.js"></script>
<script src="js/bootstrap.min.js"></script>
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
		</div>
	</div>
	</header>

	<!-- 头部 end -->
	<!-- 首页导航 -->
	<div class="navitem">
		<ul class="nav">
			<li class="nav-active"><a href="index.jsp">首页</a></li>
			<c:forEach var="bar" items="${bar}">
				<li><a href="/travel/routeServlet?type=cateCid&cid=${bar.getCid()}">${bar.getCname()}</a></li>
			</c:forEach>
			<li><a href="/travel/routeServlet?type=collect1">收藏排行榜</a></li>
		</ul>
	</div>

	<!-- banner start-->
	<section id="banner">
	<div id="carousel-example-generic" class="carousel slide"
		data-ride="carousel" data-interval="2000">
		<!-- Indicators -->
		<ol class="carousel-indicators">
			<li data-target="#carousel-example-generic" data-slide-to="0"
				class="active"></li>
			<li data-target="#carousel-example-generic" data-slide-to="1"></li>
			<li data-target="#carousel-example-generic" data-slide-to="2"></li>
		</ol>
		<!-- Wrapper for slides -->
		<div class="carousel-inner" role="listbox">
			<div class="item active">
				<img src="images/banner_1.jpg" alt="">
			</div>
			<div class="item">
				<img src="images/banner_2.jpg" alt="">
			</div>
			<div class="item">
				<img src="images/banner_3.jpg" alt="">
			</div>
		</div>
		<!-- Controls -->
		<a class="left carousel-control" href="#carousel-example-generic"
			role="button" data-slide="prev"> <span
			class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span> <span
			class="sr-only">Previous</span>
		</a> <a class="right carousel-control" href="#carousel-example-generic"
			role="button" data-slide="next"> <span
			class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			<span class="sr-only">Next</span>
		</a>
	</div>
	</section>
	<!-- banner end-->
	<!-- 旅游 start-->
	<section id="content"> <!-- 精选start--> <section
		class="hemai_jx">
	<div class="jx_top">
		<div class="jx_tit">
			<img src="images/icon_5.jpg" alt=""> <span>精选</span>
		</div>
		<!-- Nav tabs -->
		<ul class="jx_tabs" role="tablist">
			<li role="presentation" class="active"><span></span> <a
				href="#popularity" aria-controls="popularity" role="tab"
				data-toggle="tab">人气旅游</a></li>
			<li role="presentation"><span></span> <a href="#newest"
				aria-controls="newest" role="tab" data-toggle="tab">最新旅游</a></li>
			<li role="presentation"><span></span> <a href="#theme"
				aria-controls="theme" role="tab" data-toggle="tab">主题旅游</a></li>
		</ul>
	</div>
	<div class="jx_content">
		<!-- Tab panes -->
		<div class="tab-content">
			<div role="tabpanel" class="tab-pane active" id="popularity">
				<div class="row">
					<c:forEach var="r" items="${tourist}">
						<div class="col-md-3">
							<a href="/travel/searchServlet?type=detailed&rid=${r.getRid()}">
								<img src="${r.getRimage()}" alt="">
								<div class="has_border">
									<h3>${r.getRname() }</h3>
									<div class="price">
										网付价<em>￥</em><strong>${r.getPrice()}</strong><em>起</em>
									</div>
								</div>
							</a>
						</div>
					</c:forEach>
				</div>
			</div>
			<div role="tabpanel" class="tab-pane" id="newest">
				<div class="row">
					<c:forEach var="r" items="${newest}">
						<div class="col-md-3">
							<a href="/travel/searchServlet?type=detailed&rid=${r.getRid()}">
								<img src="${r.getRimage()}" alt="">
								<div class="has_border">
									<h3>${r.getRname() }</h3>
									<div class="price">
										网付价<em>￥</em><strong>${r.getPrice()}</strong><em>起</em>
									</div>
								</div>
							</a>
						</div>
					</c:forEach>
				</div>
			</div>
			<div role="tabpanel" class="tab-pane" id="theme">
				<div class="row">
					<c:forEach var="r" items="${theme}">
						<div class="col-md-3">
							<a href="/travel/searchServlet?type=detailed&rid=${r.getRid()}">
								<img src="${r.getRimage()}" alt="">
								<div class="has_border">
									<h3>${r.getRname() }</h3>
									<div class="price">
										网付价<em>￥</em><strong>${r.getPrice()}</strong><em>起</em>
									</div>
								</div>
							</a>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
	</section> <!-- 精选end--> <!-- 国内游 start--> <section class="hemai_jx">
	<div class="jx_top">
		<div class="jx_tit">
			<img src="images/icon_6.jpg" alt=""> <span>国内游</span>
		</div>
	</div>
	<div class="heima_gn">
		<div class="guonei_l">
			<img src="images/guonei_1.jpg" alt="">
		</div>
		<div class="guone_r">
			<div class="row">
				<c:forEach var="r" items="${travel}">
					<div class="col-md-3">
						<a href="/travel/searchServlet?type=detailed&rid=${r.getRid()}">
							<img src="${r.getRimage()}" alt="">
							<div class="has_border">
								<h3>${r.getRname() }</h3>
								<div class="price">
									网付价<em>￥</em><strong>${r.getPrice()}</strong><em>起</em>
								</div>
							</div>
						</a>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	</section> <!-- 国内游 end--> <!-- 境外游 start--> <section class="hemai_jx">
	<div class="jx_top">
		<div class="jx_tit">
			<img src="images/icon_7.jpg" alt=""> <span>境外游</span>
		</div>
	</div>
	<div class="heima_gn">
		<div class="guonei_l">
			<img src="images/jiangwai_1.jpg" alt="">
		</div>
	</div>
	</section> <!-- 境外游 end--> </section>
	<!-- 旅游 end-->
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