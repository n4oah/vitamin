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
<script src="../js/simpledateformat.js"></script>
<style type="text/css">
body {
	overflow: 
}
.fc-event-container {
	height: 45px;
}

.fc-day-grid-event {
	height: 41px;
}

.fc-title {
	font-size: 26px;
}
</style>
</head>
<body>
	<input type="text" name="scheduleTitle">
	<input type="date" name="startDate">
	<input type="date" name="endDate">
	<button type="button">sasasa</button>
	<div class="d" style="width: 100%; display: inline-block;"></div>
</body>
<script type="text/javascript">
var path = "${pageContext.request.contextPath}";

function getRandomColor() {
	var letters = '0123456789ABCDEF';
	var color = '#';
	for (var i = 0; i < 6; i++) {
	  color += letters[Math.floor(Math.random() * letters.length)];
	}
	return color;
}

let sdf = new simpleDateFormat("yyyy-MM-dd");
function calendarMake(insert) {
	$.ajax({
		url: path+"/search/calendarData.do",
		type: "post",
		dataType: "json",
		success: function (data) {
			$('.d').removeClass("fc fc-unthemed fc-ltr");
			var calendarData = [];
			
			data.my.forEach(function (my, index) {
				var end = sdf.format(new Date(my.end));
				calendarData.push(
					{title: my.title,
					start: sdf.format(new Date(my.start)),
					end: end.substring(0, end.length-1)+(parseInt(end.substring(end.length-1))+1),
					});
			});
			
			var companySet = new Set();
			
			data.recruit.forEach(function (recruit, index) {
				var end = sdf.format(new Date(recruit.end));
				calendarData.push(
					{title: recruit.title+"("+recruit.recruitTitle+")",
					start: sdf.format(new Date(recruit.start)),
					end: end.substring(0, end.length-1)+(parseInt(end.substring(end.length-1))+1),
					className: "com"+recruit.companyNo,
					url: path+"/recruit/recruitDetail.do?no="+recruit.recruitNo
					});
				companySet.add(recruit.companyNo)
			});
			
			if (!insert) {
				$('.d').fullCalendar({
					schedulerLicenseKey: 'CC-Attribution-NonCommercial-NoDerivatives',
					events: calendarData
				});				
			} else {
				/* $('.d').fullCalendar('removeEvents'); */
				$('.d').fullCalendar("renderEvents", calendarData, true);				
			}
			
			for (let item of companySet) {
				var color = getRandomColor();
				$(".com"+item).css({"background-color": color, "border-color": color});
			}
		}
	});	
}

calendarMake();

$("button").click(function () {
	$.ajax({
		url: path+"/search/insertSchedule.do",
		data: $("<form>").append($("input").clone()).serialize(),
		type: "post",
		success: function () {
			calendarMake(true);
		}
	});
});
</script>
</html>