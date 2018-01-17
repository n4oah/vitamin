<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta http-equiv="content-script-type" content="text/javascript">
		<title>Insert title here</title>
		<%@ include file="/WEB-INF/jsp/include/basic.jsp"%>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-glyphicons.css" rel="stylesheet">
 
<script src="https://use.fontawesome.com/942e94bfdb.js"></script>
<link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/peoplesSearch.css">
<script src="${pageContext.request.contextPath}/js/waitMe.js"></script>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/waitMe.css">

<!-- include the jQuery and jQuery UI scripts -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
                
<!-- plus a jQuery UI theme, here I use "flick" -->
<link rel="stylesheet" href="https://code.jquery.com/ui/1.10.4/themes/flick/jquery-ui.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery-ui-slider-pips.css">
<script src="${pageContext.request.contextPath}/js/jquery-ui-slider-pips.js"></script>
		<link rel="stylesheet" href="../css/mCalendar.css">
		<script src="../js/mCalendar.js"></script>
		<script src="../js/simpledateformat.js"></script>
		<script src="../js/circleChart.min.js"></script>
<style>
.ma {
	margin-left: auto;
	margin-right: auto;
	text-align: center;
	display: flex;
	border: 1px solid #e2e2e2;
	width: 90%;
	margin-bottom: 10px;
}
.ma > div {
	flex: 1;
}
.ma > div:first-child {
	flex: 0.5;
}
</style>
	</head>
<body>
	<%@ include file="/WEB-INF/jsp/include/header.jsp" %>
<div id="wrapper" style="margin-top: 0px;">
<c:choose>
	<c:when test="${machine[0] != null}">
		<c:forEach items="${machine }" var="m">
			<div class="ma">
				<div>예상 적성도</div>
				<div class="circleChart" data-percent="${m.percent }"></div>
				<div><a href="${pageContext.request.contextPath }/recruit/recruitDetail.do?no=${m.recruit.recruitNo}">${m.recruit.title }</a></div>
				<c:choose>
					<c:when test="${m.recruit.careerStart != null && m.recruit.careerStart != -1}">
						<div>경력 ${m.recruit.careerStart }년~${m.recruit.careerEnd }년 차 모집</div>
					</c:when>
					<c:otherwise>
						<div>경력 제한 없음</div>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${m.recruit.yearPayStart != null && m.recruit.yearPayStart != -1}">
						<div>연봉 ${m.recruit.yearPayStart }00만원~${m.recruit.yearPayEnd }00만원</div>
					</c:when>
					<c:otherwise>
						<div>경력 제한 없음</div>
					</c:otherwise>
				</c:choose>
			</div>
		</c:forEach>
	</c:when>
	<c:otherwise>
	<div style="margin-left: auto; margin-right: auto; text-align: center; font-weight: bold;">
		<div>아직 추천 회사가 없습니다.</div>
		<div>먼저 입사 지원을 해주세요.</div>
	</div>
	</c:otherwise>
</c:choose>
</div>

<script type="text/javascript">
$(".circleChart").each(function (data) {
	var value = $(this).attr("data-percent");
	$(this).circleChart({
		  color: "#3459eb",
		  backgroundColor: "#e6e6e6",
		  background: true,
		  speed: 2000,
		  widthRatio: 0.2,
		  value: value,
		  unit: 'percent',
		  counterclockwise: false,
		  size: 110,
		  startAngle: 0,
		  animate: true,
		  backgroundFix: true,
		  lineCap: "round", // butt, round, square
		  animation: "easeInOutCubic", // linearTween, easeInQuad, easeOutQuad, easeInOutQuad, easeInCubic, easeOutCubic, easeInOutCubic, easeInQuart, easeOutQuart, easeInOutQuart, easeInQuint, easeOutQuint, easeInOutQuint, easeInSine, easeOutSine, easeInOutSine, easeInExpo, easeOutExpo, easeInOutExpo, easeInCirc, easeOutCirc, easeInOutCirc
		  text: value + '%',
		  redraw: false,
		  cAngle: 0.1,
		  textCenter: false,
		  textSize: false,
		  relativeTextSize: 1 / 7,
		  autoCss: true,
		  onDraw: function(){}
	});
})
</script>
</body>
</html>