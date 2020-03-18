<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="js/jquery-3.3.1.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
 <%
   if(true)
//当用户访问a.jsp页面时会抛出异常,即500了！
//这时服务器会转发到b.jsp,在这之前会执行过滤器！
   	throw new RuntimeException("嘻嘻~");
   %>
	<h3>输入框联想搜索功能</h3>
	请输入：
	<input type="text" name="uname">
	<input type="button" value="搜索">
	<div id="lns"></div>
	<c:forEach var="r" items="${route}">
		<c:out value="${r.getRimage()}"/>
	</c:forEach>


</body>
<script type="text/javascript">
	$(function() {
		$("#lns").css({
			"border" : "1px #ccc solid",
			"width" : "500px",
			"position" : "absolute",
			"top" : "84px",
			"left" : "72px",
			"display" : "none"
		});

		// 键盘松开的时候触发联想功能
		$("input[name=uname]").keyup(function() {
			var uname = $(this).val();
			if (uname != "") {
				$.post("/travel/searchServlet", {
					"type" : "index",
					"rname" : uname
				}, function(result) {
					$("#lns").empty();
					$.each(result, function(i, s) {
						$("#lns").show();
						$("#lns").append("<div>" + s.rname + "</div>");
					})
					$("input[name=uname]").blur(function() {
						$("#lns").hide();
					});
				}, "JSON");
			} else {
				$("#lns").html("");
				$("#lns").hide();
			}
		});
	});
</script>
</html>