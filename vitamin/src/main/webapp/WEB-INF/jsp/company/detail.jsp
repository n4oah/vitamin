<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>Insert title here</title>
		<%@ include file="/WEB-INF/jsp/include/basic.jsp"%>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/companySearch.css">
		<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-glyphicons.css" rel="stylesheet">
		 
		<script src="https://use.fontawesome.com/942e94bfdb.js"></script>
		<link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
	<%@ include file="/WEB-INF/jsp/include/header.jsp" %>
<style type="text/css">
html, body, #waha{
   	height:100%;
   	margin:0;
}
body > div {margin-bottom: 1vh}
div.top {width: 50vw; border-bottom: 0.3vh solid black}
div.top > .logo {width: 7.2vh}
div.top > .title {font-size: 3.5vh; color: #5566ff; font-weight: bold}
div.top > .bookmark {float: right; width: 3vh;}
div.top > .bookmark:hover {background-image: url("https://i.imgur.com/PRgfqvQ.png"); background-size: 3vh}
.summary {background-color: pink; width: 65vw; height: 6.8vh 6.8vw; border-radius: 1vw}
.vr {width: 0.2vw; height: 100%; background-color: gray; display: inline-block; position: absolute}
.sumtitle {display: inline-block; overflow: hidden; margin-top: -0.3vh}
.sumtitle > div:first-child {border-bottom: 0.2vh solid black; width: 100%; padding-bottom: 0.5vw; padding-to: 0.5vw}
.sumtitle > div:last-child {top: -0.3vh}
.sumtitle > * {margin: 0.4vw; text-align: center; color: black; font-size: 100%; font-weight: bold}
.chart, .graphTop {height: 18vh; width: 50vw}
.chart div[name='graph'] {width: 3.5vh; display: inline-block}
.graph1 {
    height: 79.6%;
    background-color: rgb(255, 83, 83)
}
.graph2 {
    height: 43.7%;
    background-color: rgb(137, 255, 83);
}
.graph3 {
    height: 98.6%;
    background-color: rgb(83, 109, 255);
}
.graphText {
	display: inline-block;
    position: absolute;
	height: auto;
	margin-left: 0.3vw;
	font-size: 2vh;
	font-weight: bold;
}
.graphName > span {font-size: 2vh}
.hover {
	position: absolute;
	font-weight: bold;
	font-size: 1vw;
	border-radius: 0.5vw;
	background-color: #ff8e00;
	padding: 0.1vw;
	border: 0.2vw solid black;
	z-index: 1000;
}
#header {
    padding: 5px 8px;
}
</style>
</head>
<body>
<div class="top" id="header">
	<img alt="NHN" src="http://file.gamedonga.co.kr/files/2014/01/21/nhnent.jpg" class="logo">
	<!--<img alt="${company.name}" src="${company.logo}" class="logo">-->
	
	<span class="title">NHN</span>
	<!--<span class="title">${company.name}</span>-->
	
	<img class="bookmark" alt="즐겨찾기" src="https://png.icons8.com/small/540/bookmark.png">
</div>

<div class="summary">
	<div class="sumtitle">
		<div>회사 규모</div>
		<div>대기업</div>
	</div>
	<div class="vr"></div>

	<div class="sumtitle">
		<div>회사 규모</div>
		<div>대기업</div>
	</div>
	<div class="vr"></div>

	<div class="sumtitle">
		<div>회사 규모</div>
		<div>대기업</div>
	</div>
	<div class="vr"></div>

	<div class="sumtitle">
		<div>회사 규모</div>
		<div>대기업</div>
	</div>
	<div class="vr"></div>

	<div class="sumtitle">
		<div>회사 규모</div>
		<div>대기업</div>
	</div>
</div>

<div class="chart">
	<div class="graphTop">
		<div class="graph1" name="graph"></div>
		<div class="graph2" name="graph"></div>
		<div class="graph3" name="graph"></div>
		<div class="graphText">회사와 적성이 맞을 것으로 예상 됩니다.</div>
	</div>
	<div class="graphName">
		<span>그래프 1</span>
		<span>그래프 2</span>
		<span>그래프 3</span>
	</div>
</div>


<script type="text/javascript">
	function resize() {
		var chk = false;
		if ($(window).width() < $(window).height()) {
			$(".summary").width($(window).width());
			$(".top").css({"width": "95%", "margin": "2.5%"});
			$(".logo").width("8.0vh");
			$(".bookmark").css({"width": "3.3vh", "background-size": $(".bookmark").width()});
			$(".sumtitle > *").css({"font-size": "200%"});
			chk = true;
		} else {
			chk = false;
			$(".top").css({"width": "50vw", "margin": ""});
			$(".top").css({"margin-left": ($(window).width()-$(".top").width())/2+'px'});
			$(".logo").width("");
			$(".bookmark").width("");
			$(".sumtitle > *").css({"font-size": "100%"});
			$(".summary").width("");
		}
		$(".chart").css({"margin-left": ($(window).width()-$(".chart").width())/2+'px'});
		$(".graphText").css({"margin-top": ($(".graphTop").height()-$(".graphText").height())/2+'px'});
		for (var i = 0; i < $(".graphTop > div[name='graph']").length; i++) {
			var margin = ($(".graphName > span:eq("+i+")").width()-$(".graphTop > div:eq("+i+")").width())/2+"px";
			$(".graphTop > div:eq("+i+")").css({"margin-left": margin, "margin-right": margin});
		}
		$(".top > .title").css({"margin-left": ($(".top").width()-$(".top > .title").width())/2-$(".top > .logo").width()+'px'});
		$(".sumtitle").width($(".summary").width()/$(".sumtitle").length-$(".sumtitle").length);
		$(".vr").height($(".summary").height()+"px");
		if (!chk) $(".summary").css({"margin-left": ($(window).width()-$(".summary").width())/2+'px'});
		else $(".summary").css({"margin-left": ""});
	}

	resize();

	$(window).resize(function() {
		resize();
	});

	$(".top > .bookmark").on("click", function () {
		if (confirm("즐겨찾기에 추가합니다.")) {
			
		} else {
			
		}
	});

	var d;
	
	$("div[name='graph']").hover(function (e) {
		d = $("<div>").css({"top": e.clientY, "left": e.clientX}).text(($(this).height()/$(this).parent().height()*100).toPrecision(3)+"%").addClass("hover");
		$(this).after(d);
	}, function () {
		$(".hover").animate({"opacity": 0}, 700, function () {
			$(this).remove();
		});
	});
</script>
</body>
</html>