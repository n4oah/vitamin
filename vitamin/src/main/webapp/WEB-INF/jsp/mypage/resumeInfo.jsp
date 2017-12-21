<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>이력서 정보</title>
		<%@ include file="/WEB-INF/jsp/include/basic.jsp"%>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/basic.css">
		<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  		<link rel="stylesheet" href="/resources/demos/style.css">
		<script type="text/javascript">
			$( function() {
			    $( "#birth" ).datepicker({
			    	changeYear: true,
			    	yearRange:"1917:2017",
			    	changeMonth: true,
			    	monthNamesShort: ["1","2","3","4","5","6","7","8","9","10","11","12"],
			    	dateFormat: "yy-mm-dd",
			    	maxDate:-1
			    	});
			    
			    $( "#highenter" ).datepicker({
			    	changeYear: true,
			    	yearRange:"1917:2017",
			    	changeMonth: true,
			    	monthNamesShort: ["1","2","3","4","5","6","7","8","9","10","11","12"],
			    	dateFormat: "yy-mm-dd",
			    	maxDate:-1
			    	});
			    
			    $( "#highgraduate" ).datepicker({
			    	changeYear: true,
			    	yearRange:"1917:2017",
			    	changeMonth: true,
			    	monthNamesShort: ["1","2","3","4","5","6","7","8","9","10","11","12"],
			    	dateFormat: "yy-mm-dd",
			    	maxDate: -1
			    	});
			  } );
		</script>
	</head>
<body>
	<%@ include file="/WEB-INF/jsp/include/header.jsp" %>
	<div id="wrapper" style="margin-top: 0px;">
		<section class="container">
			<div class="row">
			<div class="cal-lg-12">
				<div class="col-lg-6">
					<h1>기본 정보</h1>
					<div class="form-group">
	      				<label for="name">이름:</label>
				      	<input type="text" class="form-control" id="name" placeholder="이름">
				      	<label for="birth">생년월일:</label>
				      	<input type="text" class="form-control" id="birth" placeholder="생년월일" readonly="readonly">
				      	<label for="birth">이메일:</label>
				      	<input type="text" class="form-control" id="email" placeholder="이메일">
				    </div>
			    </div>
			    
			    <table class="table table-striped table-hover">
			    	<tr>
			    		<th>재학기간</th>
			    		<th>학교명</th>
			    		<th>전공</th>
			    		<th>학점</th>
			    	</tr>
			    	<tr>
			    		<td>
			    			<span class="col-lg-3" >
				    			<input type="text" class="form-control" id="highenter" placeholder="입학" readonly="readonly">
				    			~
				    			<input type="text" class="form-control" id="highgraduate" placeholder="졸업" readonly="readonly">
				    		</span>
			    		<td>
			    	</tr>
			    </table>
			</div>
			    
			</div>
		</section>
	</div>
	<%@ include file="/WEB-INF/jsp/include/footer.jsp" %>
</body>
</html>