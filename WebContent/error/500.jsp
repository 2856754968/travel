<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>500-对不起，服务器繁忙，请稍后再试！</title>
<script type="text/javascript" src="../js/jquery-3.3.1.js"></script>
<style type="text/css">
.full-screen {
  background-color: rgb(51, 51, 51);
  width: 100vw;
  height: 100vh;
  color: white;
  font-family: 'Arial Black';
  text-align: center;
}

.container {
  padding-top: 4em;
  width: 50%;
  display: block;
  margin: 0 auto;
}

.error-num {
  font-size: 8em;
}

.eye {
  background: #fff;
  border-radius: 50%;
  display: inline-block;
  height: 100px;
  position: relative;
  width: 100px;
  &::after {
    background: #000;
    border-radius: 50%;
    bottom: 56.1px;
    content: ' ';
    height: 33px;
    position: absolute;
    right: 33px;
    width: 33px;
  }
}

.italic {
  font-style: italic;
}

p {
  margin-bottom: 4em;
}

a {
  color: white;
  text-decoration: none;
  text-transform: uppercase;
  &:hover {
    color: lightgray;
  }
}
</style>
</head>
<body>
	<div class="full-screen">
		<div class='container'>
			<span class="error-num">5</span>
			<div class='eye'></div>
			<div class='eye'></div>
			<p class="sub-text">
				Oh eyeballs! Something went wrong. We're <span class="italic">looking</span>
				to see what happened.
			</p>
			<p>
				》<a style="cursor: pointer" onclick="history.back()">返回上一页面</a><br>
				》<a href="index.jsp">返回网站首页</a>
			</p>
		</div>
	</div>
</body>
<script type="text/javascript">
$(function() {
	$(".full-screen").mousemove(function(event) {
		  var eye = $(".eye");
		  var x = (eye.offset().left) + (eye.width() / 2);
		  var y = (eye.offset().top) + (eye.height() / 2);
		  var rad = Math.atan2(event.pageX - x, event.pageY - y);
		  var rot = (rad * (180 / Math.PI) * -1) + 180;
		  eye.css({
		    '-webkit-transform': 'rotate(' + rot + 'deg)',
		    '-moz-transform': 'rotate(' + rot + 'deg)',
		    '-ms-transform': 'rotate(' + rot + 'deg)',
		    'transform': 'rotate(' + rot + 'deg)'
		  });
		});
})

</script>
</html>