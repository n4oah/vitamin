<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet" href="../css/mCalendar.css">
<script src="../js/mCalendar.js"></script>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/fullcalendar/fullcalendar.min.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/fullcalendar/fullcalendar.print.min.css" media="print" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/fullcalendar/moment.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/fullcalendar/fullcalendar.min.js" charset="utf-8"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/fullcalendar/locale-all.js"></script>
		
</head>
<body>
	<div style="display: flex;">
		<div class="c" style="flex: 1 1; display: inline-block; margin-right: 5px;"></div>
	</div>
	<div class="d" style="width: 500px; display: inline-block;"></div>
</body>
<script type="text/javascript">
$.mCalendar(".c", "2018-01-01", "2018-04-09");

var path = "${pageContext.rquest.contextPath}";
var calendarData;
$.ajax({
	url: path+"/search/calendarData.do",
	type: "post",
	dataType: "json",
	success: function (data) {
		calendarData = data;
	}
})

$('.d').fullCalendar({
	schedulerLicenseKey: 'CC-Attribution-NonCommercial-NoDerivatives',
	events: calendarData
});
</script>
</html>