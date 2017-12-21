<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link href='${pageContext.request.contextPath}/css/fullcalendar.min.css' rel='stylesheet' />
<link href='${pageContext.request.contextPath}/css/fullcalendar.print.min.css' rel='stylesheet' media='print' />
<script src='${pageContext.request.contextPath}/lib/moment.min.js'></script>
<script src='${pageContext.request.contextPath}/lib/jquery.min.js'></script>
<script src='${pageContext.request.contextPath}/js/fullcalendar.min.js'></script>

<style>

	body {
		margin: 40px 10px;
		padding: 0;
		font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
		font-size: 14px;
	}

	#calendar {
		max-width: 900px;
		margin: 0 auto;
	}

</style>
		<title>Insert title here</title>
		<%@ include file="/WEB-INF/jsp/include/basic.jsp"%>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/basic.css">
	</head>
<body>
	<%@ include file="/WEB-INF/jsp/include/header.jsp" %>
	<div id="wrapper" style="margin-top: 0px;">
		<section class="container">
			<div class="row">
				<div id='calendar'></div>
			</div>
		</section>
	</div>
	
	
	<%@ include file="/WEB-INF/jsp/include/footer.jsp" %>
	<script>

	$(document).ready(function() {
		
		$('#calendar').fullCalendar({
			header: {
				left: 'prev,next today',
				center: 'title',
				right: 'month,basicWeek,basicDay'
			},
			defaultDate: '2017-12-12',
			navLinks: true, // can click day/week names to navigate views
			editable: true,
			eventLimit: true, // allow "more" link when too many events
			events: [
				{
					title: 'All Day Event',
					start: '2017-11-01'
				},
				{
					title: 'Long Event',
					start: '2017-11-07',
					end: '2017-11-21'
				},
				{
					id: 999,
					title: 'Repeating Event',
					start: '2017-11-09T16:00:00'
				},
				{
					id: 999,
					title: 'Repeating Event',
					start: '2017-11-16T16:00:00'
				},
				{
					title: 'Conference',
					start: '2017-11-11',
					end: '2017-11-13'
				},
				{
					title: 'Meeting',
					start: '2017-11-12T10:30:00',
					end: '2017-11-12T12:30:00'
				},
				{
					title: 'Lunch',
					start: '2017-11-12T12:00:00'
				},
				{
					title: 'Meeting',
					start: '2017-11-12T14:30:00'
				},
				{
					title: 'Happy Hour',
					start: '2017-11-12T17:30:00'
				},
				{
					title: 'Dinner',
					start: '2017-11-12T20:00:00'
				},
				{
					title: 'Birthday Party',
					start: '2017-11-13T07:00:00'
				},
				{
					title: 'Click for Google',
					url: 'http://google.com/',
					start: '2017-11-28'
				}
			]
		});
		
	});

</script>
</body>
</html>