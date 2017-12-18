<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/companySearch.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<body>
<div class="sectionContent container" >

	<div>
		<c:forEach items="${cityList }" var="city">
			<span class="showSelect btn-secondary" data-target="#ddCity${city.cityCode }" id="ddCityBtn">${city.subName }</span>
		</c:forEach>
	</div>
	
	<c:forEach items="${cityList }" var="city">
		<c:choose>
			<c:when test="${city.cityCode eq 11}">
				<div class="optContainer" id="ddCity${city.cityCode }" >
				    <label class="checked"><input type="checkbox" name="name"><b>서울전체</b></label>
					
				    <h5>지역</h5>
				    
				    <c:forEach items="${areaList }" var="area">
				    	<c:if test="${area.cityCode eq 11}">
					    	<label><input type="checkbox">${area.name }</label>
					    </c:if>
				    </c:forEach>
			    </div>
			</c:when>
			
			<c:when test="${city.cityCode eq 21}">
				<div class="optContainer" id="ddCity${city.cityCode }" >
		
				    <label class="checked"><input type="checkbox" name="name"><b>부산전체</b></label>
					
				    <h5>지역</h5>
				    
				    <c:forEach items="${areaList }" var="area">
				    	<c:if test="${area.cityCode eq 21}">
					    	<label><input type="checkbox">${area.name }</label>
					    </c:if>
				    </c:forEach>
			    </div>
			</c:when>
			
			<c:when test="${city.cityCode eq 22}">
				<div class="optContainer" id="ddCity${city.cityCode }" >
		
				    <label class="checked"><input type="checkbox" name="name"><b>대구전체</b></label>
					
				    <h5>지역</h5>
				    
				    <c:forEach items="${areaList }" var="area">
				    	<c:if test="${area.cityCode eq 22}">
					    	<label><input type="checkbox">${area.name }</label>
					    </c:if>
				    </c:forEach>
			    </div>
			</c:when>
			
			<c:when test="${city.cityCode eq 23}">
				<div class="optContainer" id="ddCity${city.cityCode }" >
		
				    <label class="checked"><input type="checkbox" name="name"><b>인천전체</b></label>
					
				    <h5>지역</h5>
				    
				    <c:forEach items="${areaList }" var="area">
				    	<c:if test="${area.cityCode eq 23}">
					    	<label><input type="checkbox">${area.name }</label>
					    </c:if>
				    </c:forEach>
			    </div>
			</c:when>
			
			<c:when test="${city.cityCode eq 24}">
				<div class="optContainer" id="ddCity${city.cityCode }" >
				    <label class="checked"><input type="checkbox" name="name"><b>광주전체</b></label>
					
				    <h5>지역</h5>
				    
				    <c:forEach items="${areaList }" var="area">
				    	<c:if test="${area.cityCode eq 24}">
					    	<label><input type="checkbox">${area.name }</label>
					    </c:if>
				    </c:forEach>
			    </div>
			</c:when>
			
			<c:when test="${city.cityCode eq 25}">
				<div class="optContainer" id="ddCity${city.cityCode }" >
		
				    <label class="checked"><input type="checkbox" name="name"><b>대전전체</b></label>
					
				    <h5>지역</h5>
				    
				    <c:forEach items="${areaList }" var="area">
				    	<c:if test="${area.cityCode eq 25}">
					    	<label><input type="checkbox">${area.name }</label>
					    </c:if>
				    </c:forEach>
			    </div>
			</c:when>
			
			<c:when test="${city.cityCode eq 26}">
				<div class="optContainer" id="ddCity${city.cityCode }" >
		
			    	<label class="checked"><input type="checkbox" name="name"><b>울산전체</b></label>
				
				    <h5>지역</h5>
				    
				    <c:forEach items="${areaList }" var="area">
				    	<c:if test="${area.cityCode eq 26}">
					    	<label><input type="checkbox">${area.name }</label>
					    </c:if>
				    </c:forEach>
			    </div>
			</c:when>
			
			<c:when test="${city.cityCode eq 29}">
				<div class="optContainer" id="ddCity${city.cityCode }" >
		
				    <label class="checked"><input type="checkbox" name="name"><b>세종전체</b></label>
					
				    <h5>지역</h5>
				    
				    <c:forEach items="${areaList }" var="area">
				    	<c:if test="${area.cityCode eq 29}">
					    	<label><input type="checkbox">${area.name }</label>
					    </c:if>
				    </c:forEach>
				</div>
			</c:when>
			
			<c:when test="${city.cityCode eq 31}">
				<div class="optContainer" id="ddCity${city.cityCode }" >
		
				    <label class="checked"><input type="checkbox" name="name"><b>경기전체</b></label>
					
				    <h5>지역</h5>
				    
				    <c:forEach items="${areaList }" var="area">
				    	<c:if test="${area.cityCode eq 31}">
					    	<label><input type="checkbox">${area.name }</label>
					    </c:if>
				    </c:forEach>
			    </div>
			</c:when>
			
			<c:when test="${city.cityCode eq 32}">
				<div class="optContainer" id="ddCity${city.cityCode }" >
		
				    <label class="checked"><input type="checkbox" name="name"><b>강원전체</b></label>
					
				    <h5>지역</h5>
				    
				    <c:forEach items="${areaList }" var="area">
				    	<c:if test="${area.cityCode eq 32}">
					    	<label><input type="checkbox">${area.name }</label>
					    </c:if>
				    </c:forEach>
			    </div>
			</c:when>
			
			<c:when test="${city.cityCode eq 33}">
				<div class="optContainer" id="ddCity${city.cityCode }" >
			
				    <label class="checked"><input type="checkbox" name="name"><b>충북전체</b></label>
					
				    <h5>지역</h5>
				    
				    <c:forEach items="${areaList }" var="area">
				    	<c:if test="${area.cityCode eq 33}">
					    	<label><input type="checkbox">${area.name }</label>
					    </c:if>
				    </c:forEach>
			    </div>
			</c:when>
			
			<c:when test="${city.cityCode eq 34}">
				<div class="optContainer" id="ddCity${city.cityCode }" >
		
				    <label class="checked"><input type="checkbox" name="name"><b>충남전체</b></label>
					
				    <h5>지역</h5>
				    
				    <c:forEach items="${areaList }" var="area">
				    	<c:if test="${area.cityCode eq 34}">
					    	<label><input type="checkbox">${area.name }</label>
					    </c:if>
				    </c:forEach>
			    </div>
			</c:when>
			
			<c:when test="${city.cityCode eq 35}">
				<div class="optContainer" id="ddCity${city.cityCode }" >
		
				    <label class="checked"><input type="checkbox" name="name"><b>전북전체</b></label>
					
				    <h5>지역</h5>
				    
				    <c:forEach items="${areaList }" var="area">
				    	<c:if test="${area.cityCode eq 35}">
					    	<label><input type="checkbox">${area.name }</label>
					    </c:if>
				    </c:forEach>
			    </div>
			</c:when>
			
			<c:when test="${city.cityCode eq 36}">
				<div class="optContainer" id="ddCity${city.cityCode }" >
		
				    <label class="checked"><input type="checkbox" name="name"><b>전남전체</b></label>
					
				    <h5>지역</h5>
				    
				    <c:forEach items="${areaList }" var="area">
				    	<c:if test="${area.cityCode eq 36}">
					    	<label><input type="checkbox">${area.name }</label>
					    </c:if>
				    </c:forEach>
			    </div>
			</c:when>
			
			<c:when test="${city.cityCode eq 37}">
				<div class="optContainer" id="ddCity${city.cityCode }" >
		
				    <label class="checked"><input type="checkbox" name="name"><b>경북전체</b></label>
					
				    <h5>지역</h5>
				    
				    <c:forEach items="${areaList }" var="area">
				    	<c:if test="${area.cityCode eq 37}">
					    	<label><input type="checkbox">${area.name }</label>
					    </c:if>
				    </c:forEach>
			    </div>
			</c:when>
			
			<c:when test="${city.cityCode eq 38}">
				<div class="optContainer" id="ddCity${city.cityCode }" >
		
				    <label class="checked"><input type="checkbox" name="name"><b>경남전체</b></label>
					
				    <h5>지역</h5>
				    
				    <c:forEach items="${areaList }" var="area">
				    	<c:if test="${area.cityCode eq 38}">
					    	<label><input type="checkbox">${area.name }</label>
					    </c:if>
				    </c:forEach>
			    </div>
			</c:when>
			
			<c:when test="${city.cityCode eq 39}">
				<div class="optContainer" id="ddCity${city.cityCode }" >
			
				    <label class="checked"><input type="checkbox" name="name"><b>제주전체</b></label>
					
				    <h5>지역</h5>
				    
				    <c:forEach items="${areaList }" var="area">
				    	<c:if test="${area.cityCode eq 39}">
					    	<label><input type="checkbox">${area.name }</label>
					    </c:if>
				    </c:forEach>
			    </div>
			</c:when>
			
			
		</c:choose>
	</c:forEach>
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