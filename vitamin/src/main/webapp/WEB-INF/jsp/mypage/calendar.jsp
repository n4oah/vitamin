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
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/basic.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/fullcalendar/fullcalendar.min.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/fullcalendar/fullcalendar.print.min.css" media="print" />
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/fullcalendar/moment.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/fullcalendar/fullcalendar.min.js" charset="utf-8"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/fullcalendar/locale-all.js"></script>
		<link rel="stylesheet" href="../css/mCalendar.css">
      	<script src="../js/mCalendar.js"></script> 
		
		
		<script type="text/javascript">
			$(document).ready(function() {
				
				$.mCalendar("#calendar", "2010-01-01", "2011-12-02");
				
				
		/* 	    $('#calendar').fullCalendar({
			      header: {
			        left: 'prev,next today',
			        center: 'title',
			        right: 'month,agendaWeek,agendaDay,listWeek'
			      },
			      defaultDate: '2017-12-12',
			      locale:"ko",
			      navLinks: true, // can click day/week names to navigate views
			      editable: true,
			      eventLimit: true, // allow "more" link when too many events
			      events: [
			        {
			          title: 'All Day Event',
			          start: '2017-12-01',
			        },
			        {
			          title: 'Long Event',
			          start: '2017-12-07',
			          end: '2017-12-10'
			        },
			        {
			          id: 999,
			          title: 'Repeating Event',
			          start: '2017-12-09T16:00:00'
			        },
			        {
			          id: 999,
			          title: 'Repeating Event',
			          start: '2017-12-16T16:00:00'
			        },
			        {
			          title: 'Conference',
			          start: '2017-12-11',
			          end: '2017-12-13'
			        },
			        {
			          title: 'Meeting',
			          start: '2017-12-12T10:30:00',
			          end: '2017-12-12T12:30:00'
			        },
			        {
			          title: 'Lunch',
			          start: '2017-12-12T12:00:00'
			        },
			        {
			          title: 'Meeting',
			          start: '2017-12-12T14:30:00'
			        },
			        {
			          title: 'Happy Hour',
			          start: '2017-12-12T17:30:00'
			        },
			        {
			          title: 'Dinner',
			          start: '2017-12-12T20:00:00'
			        },
			        {
			          title: 'Birthday Party',
			          start: '2017-12-13T07:00:00'
			        },
			        {
			          title: 'Click for Google',
			          url: 'http://google.com/',
			          start: '2017-12-28'
			        }
			      ]
			    }); */
		
			  });
		</script>
		<style>
		  #calendar {
		    max-width: 900px;
		    margin: 0 auto;
		  }
		</style>
	</head>
<body>
	<%@ include file="/WEB-INF/jsp/include/header.jsp" %>
	<div id="wrapper" style="margin-top: 0px;">
		<section class="container">
			<div class="row">
				<div id="calendar"></div>
			 </div>
		</section>
	</div>
	<%@ include file="/WEB-INF/jsp/include/footer.jsp" %>
</body>
</html>