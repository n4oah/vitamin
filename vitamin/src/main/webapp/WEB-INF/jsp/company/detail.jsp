<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
		<link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
	<%@ include file="/WEB-INF/jsp/include/header.jsp" %>
	<script src="../js/snow.js"></script>
	<script src="../js/simpledateformat.js"></script>
<style type="text/css">
html, body, #waha{
   	height:100%;
   	margin:0;
}
* {font-family: 'Nanum Gothic', sans-serif, serif;}
div.top {width: 50vw; border-bottom: 0.3vh solid black}
div.top > .logo {width: 7.2vh}
div.top > .title {font-size: 3.5vh; color: #5566ff; font-weight: bold}
div.top > .bookmark {float: right; width: 3vh;}
div.top > .bookmark:hover {background-image: url("https://i.imgur.com/PRgfqvQ.png"); background-size: 3vh}
.summary {background-color: pink; width: 65vw; height: 6.8vh 6.8vw; border-radius: 1vw}
.vr {width: 0.2vw; height: 100%; background-color: gray; display: inline-block; position: absolute}
.sumtitle {display: inline-block; overflow: hidden; margin-top: -0.3vh}
/* .sumtitle > div:first-child {border-bottom: 0.2vh solid black; width: 100%; padding-bottom: 0.5vw; padding-to: 0.5vw} */
.sumtitle > div:last-child {top: -0.3vh}
.sumtitle > * {text-align: center; color: black; font-size: 100%; font-weight: bold}
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
.recruitList {
	height: 10vw;
	text-align: center;
}
.recruitList > div {
	display: inline-block;
}
.recruitList img {
	width: 50%;
}
.recruit {
	width: 15%;
	height: 100%;
	border: 1px solid black;
	vertical-align: middle;
    line-height: 2vw;
}
h6 {
	display: inline-block;
}
.recTitle {
	font-weight: bold;
}
.recTitle, .recContent {
	border-bottom: 1px solid gray;
}
.recContent > div {
	text-align: left;
	display: inline-block;
	width: 45%;
	overflow: hidden; 
	text-overflow: ellipsis;
	white-space: nowrap; 
}
.detail, .comment {
	border: 1px solid #e4e4e4;
	margin-left: auto;
    margin-right: auto;
}
.detail {width: 30vw;}
.comment {width: 50vw;}
.detail span {text-align: left;}
.detail > div {border-left: 3px solid blue; padding-left: 3px; border-bottom: 1px solid black;}
.detail > div:first-child {font-weight: bold; background: #e0e0e0;}
.detail > div > span:first-child {
	display: inline-block;
    width: 100px;
}
.input-group-addon {padding-top: 0px; padding-bottom: 0px;}
.heart {
	background-image: url("https://i.imgur.com/ZttVr5D.png");
	background-repeat: no-repeat;
	background-position: -15px;
	background-size: 15px;
}
.heart:hover,  .selected {
	background-image: url("https://i.imgur.com/ZttVr5D.png");
	background-position: 0px;
}
.col-lg-6 {width: 100%}
.commentTitle {font-weight: bold; font-size: 2vw; border-left: 5px solid blue; padding-left: 5px;}
.regDate {width: 100px; display: inline-block; border-right: 1px solid #e4e4e4}
.input-group {border-bottom: 1px solid #e4e4e4;}
hr {
	width: 100%;
    border: 0;
    background: black;
    height: 0.2vw;
    margin-top: 0.2vw;
    margin-bottom: 0.2vw;
}
.sumtitle > div:first-child {
	margin-top: 0.2vw;
}
body > div {margin-bottom: 4vh; margin-left: auto; margin-right: auto;}
.sumtitle:not(:last-child) {
	border-right: 0.21vw solid gray;
}
.sum {display: flex; width: 65vw; background-cl}
.sumtitle {margin-left: auto; margin-right: auto; flex: 1 1;}
.input-group {width: 100%}
.plus {text-align: center; background: #e0e0e0; margin: 0;}
</style>
</head>
<body>
<div class="top" id="header">
	<img alt="${com.companyName}" src="../images/${logo }" class="logo">
	
	<span class="title">${com.companyName}</span>
	
	<img class="bookmark" alt="즐겨찾기" src="https://png.icons8.com/small/540/bookmark.png">
</div>

<div class="sum">
	<div class="sumtitle">
		<div>회사 유형</div>
		<hr>
		<div>${com.companyType}</div>
	</div>
	<div class="sumtitle">
		<div>사업 내용</div>
		<hr>
		<div>${com.businessContent }</div>
	</div>
	<div class="sumtitle">
		<div>사원 수</div>
		<hr>
		<div>${com.employeeCount}</div>
	</div>
	<div class="sumtitle">
		<div>전화번호</div>
		<hr>
		<div>${com.telNumber }</div>
	</div>
	<div class="sumtitle">
		<div>회사 규모</div>
		<hr>
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


<div class="recruitList">
	<div class="prev"><img src="https://i.imgur.com/oLfh9Tj.png"></div>
	<c:forEach begin="0" end="5" var="i">
		<div class="recruit" 
		<c:if test="${i >= 3 }">
			style="display: none;"
		</c:if>
		>
			<div class="recTitle">${i }년 신입 및 경력사원 모집</div>
			<div class="recContent">
				<div>연봉 | 1만원</div>
				<div>지역 | 서울 외</div>
			</div>
			<div class="recContent">
				<div>필요 | JSP 외</div>
				<div>업종 | 기술</div>
			</div>
			<div class="recDate">
				<div>12/19~12/22</div>
			</div>
		</div>
	</c:forEach>
	<div class="next"><img src="https://i.imgur.com/XQJb8Kq.png"></div>
</div>

<div class="detail">
	<div>
		<span class="detailTitle">기업명</span>
		<span>NHN</span>
	</div>
	
	<div>
		<span class="detailTitle">대표자명</span>
		<span>아무개</span>
	</div>
	
	<div>
		<span class="detailTitle">업종</span>
		<span>IT</span>
	</div>
	
	<div>
		<span class="detailTitle">사업형태</span>
		<span>광고</span>
	</div>
	
	<div>
		<span class="detailTitle">설립일</span>
		<span>2006년</span>
	</div>
</div>

<div class="comment">
	<div class="commentTitle">회사 후기</div>
	<div class="row">
	  <div class="col-lg-6">
	    <div class="input-group">
	      <span class="input-group-addon">
	      	<img src="https://i.imgur.com/5MJKaCv.png" width="15" class="heart">
	      </span>
	      <input type="text" class="form-control commentContent" aria-label="...">
	      <span class="input-group-addon">
    		<a class="commentWrite">제출</a>
	      </span>
	    </div><!-- /input-group -->
	  </div><!-- /.col-lg-6 -->
  	</div>
  	<div class="row">
	  <div class="col-lg-6 commentList">
	  <c:forEach items="${commentList }" var="comment">
	    <div class="input-group comment">
	      <span class="regDate">
	      	<fmt:formatDate value="${comment.regDate }" pattern="yyyy-MM-dd"/>
	      </span>
	      <span class="content">
	      	${comment.content }
	      </span>
	    </div><!-- /input-group -->
	   </c:forEach>
	  </div><!-- /.col-lg-6 -->
  	</div>
  	<div class="row plus">
  		<a>더보기</a>
  	</div>
</div>

<script type="text/javascript">
	var path = "${pageContext.request.contextPath}";
	/* $(document).ready(function () {
		var maxTop = $(document).height();
		console.log(maxTop)
		$.snowfall(document, {
			flakePosition: 'absolute',
			minSize: 5,
			flakeCount: 250,
			round: true,
		}, maxTop);
	}); */
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
		//$(".chart").css({"margin-left": ($(window).width()-$(".chart").width())/2+'px'});
		$(".graphText").css({"margin-top": ($(".graphTop").height()-$(".graphText").height())/2+'px'});
		for (var i = 0; i < $('.graphTop > div[name="graph"]').length; i++) {
			var margin = ($(".graphName > span:eq("+i+")").width()-$(".graphTop > div:eq("+i+")").width())/2+"px";
			$(".graphTop > div:eq("+i+")").css({"margin-left": margin, "margin-right": margin});
		}
		$(".top > .title").css({"margin-left": ($(".top").width()-$(".top > .title").width())/2-$(".top > .logo").width()+'px'});
		//$(".sumtitle").width($(".summary").width()/$(".sumtitle").length-$(".sumtitle").length);
		$(".vr").height($(".summary").height()+"px");
		//if (!chk) $(".summary").css({"margin-left": ($(window).width()-$(".summary").width())/2+'px'});
		//else $(".summary").css({"margin-left": ""});
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
		d = $("<div>").css({"top": e.pageY, "left": e.clientX}).text(($(this).height()/$(this).parent().height()*100).toPrecision(3)+"%").addClass("hover");
		$(this).after(d);
	}, function () {
		$(".hover").animate({"opacity": 0}, 700, function () {
			$(this).remove();
		});
	});
	
	var reIndex = 0;
	var reMaxIndex = $(".recruit").length-3;
	
	$(".prev").click(function () {
		if (reIndex <= 0) return;
		reIndex--;
		$(".recruit:eq("+reIndex+")").css({"display": ""}, 200);
		$(".recruit:eq("+(reIndex+3)+")").css({"display": "none"}, 200);
	});
	
	$(".next").click(function () {
		if (reIndex >= reMaxIndex) return;
		$(".recruit:eq("+(reIndex+3)+")").css({"display": ""});
		$(".recruit:eq("+reIndex+")").css({"display": "none"});
		reIndex++;
	});
	
	$(".heart").click(function () {
		$(this).toggleClass("selected");
		// , 500, "linear"
		/* $(this).animate({
			"background-position": "0px"
		}, 500); */
	});
	
	$(".commentWrite").click(function () {
		var data = "score=";
		
		if ($(".selected").length) data += "1";
		else data += "0";
		
		data += "&content="+$(".commentContent").val();
		
		data += "&companyNo=${param.no}";
		
		$.ajax({
			type: "post",
			url: path+"/company/reviewWrite.do",
			data: data,
			success: function (data) {
				$(".heart").removeClass("selected");
				$(".commentContent").val("");
				var div = $("<div>").addClass("input-group comment");
				var regDate = $("<span>").addClass("regDate");
				var content = $("<span>").addClass("content");
				
				data = JSON.parse(data);
				
				data.forEach(function (comment) {
					var date = new Date(comment.regDate);
					var sdf = new simpleDateFormat("yyyy-MM-dd");
					comment.regDate = sdf.format(date);
					$(".commentList").prepend(div.append(regDate.text(comment.regDate)).append(content.text(comment.content)));			
				})
			}
		});
	});

</script>
</body>
</html>