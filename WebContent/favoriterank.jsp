<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>收藏排行榜</title>
<link rel="stylesheet" type="text/css" href="css/common.css">
<link rel="stylesheet" type="text/css" href="css/ranking-list.css">
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
		</div>
	</div>
	</header>

	<!-- 头部 end -->

	<div class="contant">
		<div class="shaixuan">
			<span>线路名称</span> <input type="text" name="rname"> <span>金额</span>
			<input type="text" name="begin">~<input type="text"
				name="end"><span id="msg"></span>
			<button>搜索</button>
		</div>
		<div class="list clearfix">
			<ul>
				<c:forEach var="r" items="${list.beanList}" varStatus="i">
					<li><span class="num one">${i.getCount()}</span> <a
						href="/travel/searchServlet?type=detailed&rid=${r.getRid()}"><img
							src="${r.getRimage()}" alt=""></a>
						<h4>
							<a href="/travel/searchServlet?type=detailed&rid=${r.getRid()}">
								${r.getRname()}...</a>
						</h4>
						<p>
							<b class="price">&yen;<span>${r.getPrice()}</span>起
							</b> <span class="shouchang">已收藏${r.getCount()}次</span>
						</p></li>
				</c:forEach>
			</ul>
		</div>
		<div class="pageNum">
			<ul>
				<!-- 如果当前页大于1 -->
				<c:if test="${list.pageCode>1 }">
					<li><a href="${list.url}&pc=1">首页</a></li>
					<li class="threeword"><a
						href="${list.url}&pc=${list.pageCode-1}">上一页</a></li>
				</c:if>
				<!-- 显示页码 -->
				<c:choose>
					<%--如果总页数小于10 --%>
					<c:when test="${list.totalPage()<=10 }">
						<c:set var="begin" value="1" />
						<c:set var="end" value="${list.totalPage()}" />
					</c:when>
					<c:otherwise>
						<%--设置开始页码--%>
						<c:set var="begin" value="${list.pageCode-5}" />
						<c:set var="end" value="${list.pageCode+4}" />
						<%--头溢出--%>
						<c:if test="${begin<1 }">
							<c:set var="begin" value="1" />
							<c:set var="end" value="10" />
						</c:if>
						<%--尾溢出--%>
						<c:if test="${end>list.totalPage() }">
							<c:set var="begin" value="${list.pageCode-9}" />
							<c:set var="end" value="${list.totalPage()}" />
						</c:if>
					</c:otherwise>
				</c:choose>
				<c:forEach begin="${begin}" end="${end }" var="x">
					<li><a href="${list.url}&pc=${x}">${x}</a></li>
				</c:forEach>
				<!-- 如果当前页数等于总页数-->
				<c:if test="${list.pageCode<list.totalPage() }">
					<li class="threeword"><a
						href="${list.url}&pc=${list.pageCode+1}">下一页</a></li>
					<li class="threeword"><a
						href="${list.url}&pc=${list.totalPage()}">尾页</a></li>
				</c:if>
			</ul>
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
		$("#lns").css({
			"border" : "1px #ccc solid",
			"width" : "500px",
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

		$(".shaixuan>button").click(
				function() {
					var rname = $("input[name='rname']").val();
					var begin = $("input[name='begin']").val();
					var end = $("input[name='end']").val();
					if (rname == "" && begin == 0 && end == 0) {
						$("#msg").html("请输入要搜索内容");
					} else {
						if (begin == 0) {
							begin = 0;
						}
						if (end == 0) {
							end = 10000;
						}
						location = "/travel/routeServlet?type=collect&rname="
								+ rname + "&begin=" + begin + "&end=" + end;
					}
				});
	});
	function exit() {
		var result = confirm("确定要退出吗？");
		if (result) {
			location.href = "/travel/VerificationCodeServlet?type=exit&url=index.jsp";
		}
	}
</script>
</html>