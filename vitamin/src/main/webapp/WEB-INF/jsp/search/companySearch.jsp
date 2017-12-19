<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/companySearch.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<body>
<div class="sectionContent container" >

	<div class="city_wrapper">
		<c:forEach items="${cityList }" var="city">
			<span class="showSelect btn-secondary" data-target="#ddCity${city.cityCode }" id="ddCityBtn">${city.subName }</span>
		</c:forEach>
	</div>
	
	<c:forEach items="${cityList }" var="city">
			<div class="optContainer" id="ddCity${city.cityCode }">
			    <label class="checked"><input type="checkbox" name="name"><b>${city.subName }전체</b></label>
				
			    <h5>지역</h5>
			    
			    <c:forEach items="${areaList }" var="area">
			    	<c:if test="${area.cityCode eq city.cityCode}">
				    	<label><input type="checkbox">${area.name }</label>
				    </c:if>
			    </c:forEach>
		    </div>
	</c:forEach>
	
	<div class="detail_wrapper">
		<div class="career">
			<Strong class="career_title">경력</Strong>
				<span><input type="checkbox" value = 0>신입</span>
				<span><input type="checkbox" value = 1>경력</span>

			<span>
				
			</span>
		</div>
		
		<div class="education">
			
		</div>
		
		<div class="salary">
			
		</div>
	</div>
</div>
<script src="https://code.jquery.com/jquery.js"></script>
<script>
	$(":checkbox").on('click', function(){
	    $(this).parent().toggleClass("checked");
	});

	$(".showSelect").click(function () {
		$(this).toggleClass("open").siblings("span").removeClass("open");
		$($(this).data("target")).fadeToggle("fast").siblings("div.optContainer").hide();
	});
</script>
</body>
</html>