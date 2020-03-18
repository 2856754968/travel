<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>路线详情</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/common.css">
<link rel="stylesheet" type="text/css" href="css/route-detail.css">
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
	<!-- 详情 start -->
	<div class="wrap">
		<div class="bread_box">
			<a href="/travel/default.jsp">首页</a> <span> &gt;</span> <a
				href="/travel/routeServlet?type=cateCid&cid=5">国内游</a><span>
				&gt;</span> <a href="#">${r.getRname()}</a>
		</div>
		<div class="prosum_box">
			<dl class="prosum_left">
				<dt>
					<img alt="" class="big_img"
						src="${r.getRouteImgList().get(0).getBigPic()}">
				</dt>
				<dd>
					<a class="up_img up_img_disable"></a>
					<c:forEach var="r" items="${r.getRouteImgList()}" varStatus="i">
						<a title="" class="little_img" data-bigpic="${r.getBigPic()}">
							<img src="${r.getSmallPic() }">
						</a>
					</c:forEach>
					<a class="down_img down_img_disable" style="margin-bottom: 0;"></a>
				</dd>
			</dl>
			<div class="prosum_right">
				<p class="pros_title">${r.getRname()}</p>
				<p class="hot">${r.getRouteIntroduce()}</p>
				<div class="pros_other">
					<p>经营商家 ：${r.getSeller().getSname() }</p>
					<p>咨询电话 : ${r.getSeller().getConsphone() }</p>
					<p>地址 ：${r.getSeller().getAddress() }</p>
				</div>
				<div class="pros_price">
					<p class="price">
						<strong>${r.getPrice()}</strong><span>起</span>
					</p>
					<p class="collect">
						<c:choose>
							<c:when test="${not empty user.uid}">
								<a class="btn" onclick="collect(${user.uid},${r.getRid()})"><i
									class="glyphicon glyphicon-heart-empty"></i><span id="sp">点击收藏</span></a>
							</c:when>
							<c:otherwise>
								<a class="btn already" disabled="disabled"><i
									class="glyphicon glyphicon-heart-empty"></i>点击收藏</a>
							</c:otherwise>
						</c:choose>
						<span id="count">已收藏${r.getCount()}次</span>
					</p>
				</div>
			</div>
		</div>
		<div class="you_need_konw">
			<span>旅游须知</span>
			<div class="notice">
				<p>
					1、旅行社已投保旅行社责任险。建议游客购买旅游意外保险 <br>
				<p>2、旅游者参加打猎、潜水、海边游泳、漂流、滑水、滑雪、滑草、蹦极、跳伞、滑翔、乘热气球、骑马、赛车、攀岩、水疗、水上飞机等属于高风险性游乐项目的，敬请旅游者务必在参加前充分了解项目的安全须知并确保身体状况能适应此类活动；如旅游者不具备较好的身体条件及技能，可能会造成身体伤害。</p>

				<p>3、参加出海活动时，请务必穿着救生设备。参加水上活动应注意自己的身体状况，有心脏病、冠心病、高血压、感冒、发烧和饮酒及餐后不可以参加水上活动及潜水。在海里活动时，严禁触摸海洋中各种鱼类，水母，海胆，珊瑚等海洋生物，避免被其蛰伤。老人和小孩必须有成年人陪同才能参加合适的水上活动。在海边游玩时，注意保管好随身携带的贵重物品。</p>

				<p>4、根据中国海关总署的规定，旅客在境外购买的物品，在进入中国海关时可能需要征收关税。详细内容见《中华人民共和国海关总署公告2010年第54号文件》。</p>

				<p>5、建议出发时行李托运，贵重物品、常用物品、常用药品、御寒衣物等请随身携带，尽量不要托运。行李延误属于不可抗力因素，我司将全力协助客人跟进后续工作，但我司对此不承担任何责任。</p>
				<p>
					1、旅行社已投保旅行社责任险。建议游客购买旅游意外保险 <br>
				<p>2、旅游者参加打猎、潜水、海边游泳、漂流、滑水、滑雪、滑草、蹦极、跳伞、滑翔、乘热气球、骑马、赛车、攀岩、水疗、水上飞机等属于高风险性游乐项目的，敬请旅游者务必在参加前充分了解项目的安全须知并确保身体状况能适应此类活动；如旅游者不具备较好的身体条件及技能，可能会造成身体伤害。</p>

				<p>3、参加出海活动时，请务必穿着救生设备。参加水上活动应注意自己的身体状况，有心脏病、冠心病、高血压、感冒、发烧和饮酒及餐后不可以参加水上活动及潜水。在海里活动时，严禁触摸海洋中各种鱼类，水母，海胆，珊瑚等海洋生物，避免被其蛰伤。老人和小孩必须有成年人陪同才能参加合适的水上活动。在海边游玩时，注意保管好随身携带的贵重物品。</p>

				<p>4、根据中国海关总署的规定，旅客在境外购买的物品，在进入中国海关时可能需要征收关税。详细内容见《中华人民共和国海关总署公告2010年第54号文件》。</p>

				<p>5、建议出发时行李托运，贵重物品、常用物品、常用药品、御寒衣物等请随身携带，尽量不要托运。行李延误属于不可抗力因素，我司将全力协助客人跟进后续工作，但我司对此不承担任何责任。</p>
			</div>
		</div>
	</div>
	<!-- 详情 end -->


	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="js/jquery-3.3.1.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="js/bootstrap.min.js"></script>

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
$(document).ready(function() {
	//焦点图效果
	//点击图片切换图片
	$('.little_img').on('mousemove', function() {
		$('.little_img').removeClass('cur_img');
		var big_pic = $(this).data('bigpic');
		$('.big_img').attr('src', big_pic);
		$(this).addClass('cur_img');
	});
	//上下切换
	var picindex = 0;
	var nextindex = 4;
	$('.down_img').on('click', function() {
		var num = $('.little_img').length;
		if ((nextindex + 1) <= num) {
			$('.little_img:eq(' + picindex + ')').hide();
			$('.little_img:eq(' + nextindex + ')').show();
			picindex = picindex + 1;
			nextindex = nextindex + 1;
		}
	});
	$('.up_img').on('click', function() {
		var num = $('.little_img').length;
		if (picindex > 0) {
			$('.little_img:eq(' + (nextindex - 1) + ')').hide();
			$('.little_img:eq(' + (picindex - 1) + ')').show();
			picindex = picindex - 1;
			nextindex = nextindex - 1;
		}
	});
	//自动播放
	 var timer = setInterval("auto_play()", 5000);
});

//自动轮播方法
function auto_play() {
	var cur_index = $('.prosum_left dd').find('a.cur_img').index();
	cur_index = cur_index - 1;
	var num = $('.little_img').length;
	var max_index = 3;
	if ((num - 1) < 3) {
		max_index = num - 1;
	}
	if (cur_index < max_index) {
		var next_index = cur_index + 1;
		var big_pic = $('.little_img:eq(' + next_index + ')').data(
				'bigpic');
		$('.little_img').removeClass('cur_img');
		$('.little_img:eq(' + next_index + ')').addClass('cur_img');
		$('.big_img').attr('src', big_pic);
	} else {
		var big_pic = $('.little_img:eq(0)').data('bigpic');
		$('.little_img').removeClass('cur_img');
		$('.little_img:eq(0)').addClass('cur_img');
		$('.big_img').attr('src', big_pic);
	}
}
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
		count();
	});
	
	function collect(uid,rid) {
		var msg = $("#sp").text();
		if(uid==0){
			alert("请先登录或注册在进行收藏");
		}else if(msg=="点击收藏"){
			//未收藏
			if(uid!=0&&rid!=0){
				var  myDate=new Date();
				$.post("/travel/searchServlet",{"type":"collect","uid":uid,"date":myDate.toLocaleDateString(),"rid":rid},function(data){
					if(data){
						alert("收藏成功");
					}else{
						alert("收藏失败，请稍后再试");
					}
					count();
				},"JSON");
			}
		}else if(msg=="取消收藏"){
			//已收藏
				$.getJSON("/travel/searchServlet",{"type":"count","uid":uid,"rid":rid},function(data){
					if(data){
						alert("取消成功");
						count();
					}
				});
		}
	}
	
	function exit() {
		var result = confirm("确定要退出吗？");
		if(result){
			location.href="/travel/VerificationCodeServlet?type=exit&url=index.jsp"
		}
	}
	
	function count() {
		var uid = ${user.uid}
		var rid = ${r.getRid()};
		$.getJSON("/travel/searchServlet",{"type":"collection","uid":uid,"rid":rid},function(data){
			$.each(data,function(i,s){
				if(s.sp>0){
					$("#sp").text("取消收藏");	
					$("#count").text("已收藏"+s.count+"次");
					//alert(s.sp+"  "+s.count);
				}else if(s.sp<=0){
					$("#sp").text("点击收藏");	
					$("#count").text("已收藏"+s.count+"次");
				}
			})
		});
	}
</script>
</html>