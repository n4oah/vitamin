<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="/WEB-INF/jsp/include/basic.jsp"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
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
.modal, .modal2 {
	display: none;
}
</style>
</head>
<body>
<%@ include file="/WEB-INF/jsp/include/header.jsp" %>

<div class="modal">
	<input type="text" name="scheduleTitle">
	<input type="date" name="startDate">
	<input type="date" name="endDate">
	<button type="button">추가</button>
</div>
<div class="modal2">
	<input type="date" name="startDate">
	<input type="date" name="endDate">
	<input type="hidden" name="scheduleNo">
	<div>
		<button class="modify" type="button">수정</button>
		<button class="remove" type="button">삭제</button>
	</div>
</div>
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

var color = ["tomato", "rgb(71, 187, 72)", "rgb(104, 165, 92)", "rgb(120, 89, 185)",
	"rgb(81, 139, 127)"];

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
					className: "my_"+my.scheduleNo
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
					events: calendarData,
					eventRender: function (event, element) {
				        element.click(function() {
				        	$("[name='startDate']").val(event.start._i);
				            var end = event.end._i;
				        	$("[name='endDate']").val(end.substring(0, end.length-1)+(parseInt(end.substring(end.length-1))-1));
				        	$("[name='scheduleNo']").val(event.className[0].replace("my_", ""));
				        	$("[name='scheduleTitle']").val(event.title);
				            $(".modal2").dialog({title: event.title});
				            $(".ui-dialog-title").attr("contenteditable", true);
				        });
				    }
				});		
				
				var button = $(".fc-today-button");
				button.removeClass("fc-today-button fc-button fc-state-default fc-corner-left fc-corner-right fc-state-disabled");
				button.addClass("fc-button fc-state-default");
				
				button.attr("disabled", false);
				
				button.off("click").on("click", function () {
					$(".modal").dialog();
				});
				
				button.text("일정 추가");
			} else {
				$('.d').fullCalendar("renderEvents", calendarData, true);				
			}
			
			var i = 0;
			for (let item of companySet) {
				if (i > color.length) i = 0;
				var cl = color[i++];
				$(".com"+item).css({"background-color": cl, "border-color": cl});
			}
		}
	});	
}

calendarMake();

$(".modal > button").click(function () {
	$.ajax({
		url: path+"/search/insertSchedule.do",
		data: $("<form>").append($(".modal input").clone()).serialize(),
		type: "post",
		success: function () {
			window.location.reload();
		}
	});
});

$(".modify").click(function () {
	$.ajax({
		url: path+"/search/updateSchedule.do",
		data: $("<form>").append($(".modal2 input").clone()).serialize()+"&scheduleTitle="+$(".ui-dialog-title").text(),
		type: "post",
		success: function () {
			window.location.reload();
		}
	});
});

$(".remove").click(function () {
	$.ajax({
		url: path+"/search/removeSchedule.do",
		data: $("<form>").append($(".modal2 input").clone()).serialize()+"&scheduleTitle="+$(".ui-dialog-title").text(),
		type: "post",
		success: function () {
			window.location.reload();
		}
	});
});
</script>
</html>