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
</head>
<body>
	<div style="display: flex;">
		<div class="c" style="flex: 1 1; display: inline-block;"></div>
	</div>
</body>
<script type="text/javascript">
var a = [];
console.log(typeof(a) === 'object' ? a.length : "sads")
$.mCalendar(".c", "2018-01-01", "2018-05-02");
</script>
</html>