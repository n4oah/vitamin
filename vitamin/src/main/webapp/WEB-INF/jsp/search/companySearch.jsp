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
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/companySearch.css">
		<script src="https://use.fontawesome.com/ea0f14e7b5.js"></script>
	</head>
<body>
	<%@ include file="/WEB-INF/jsp/include/header.jsp" %>
	<div id="wrapper" style="margin-top: 0px;">
		<section class="container">
			<div class="row">
				<div class="search_wrapper">
					<div class="city_wrapper">
						<c:forEach items="${cityList }" var="city">
							<span class="showSelect btn-secondary" data-target="#ddCity${city.cityCode }" id="ddCityBtn">${city.subName }</span>
						</c:forEach>
					</div>
					
					<c:forEach items="${cityList }" var="city">
							<div class="optContainer" id="ddCity${city.cityCode }">
							    <label><input type="checkbox" class="checked"><b>${city.subName }전체</b></label>
								
							    <h5>지역</h5>
							    
							    <c:forEach items="${areaList }" var="area">
							    	<c:if test="${area.cityCode eq city.cityCode}">
								    	<label class="area"><input type="checkbox">${area.name }</label>
								    </c:if>
							    </c:forEach>
						    </div>
					</c:forEach>
					
					<div class="detail_wrapper">
						<div class="career">
							<Strong class="career_title">경력</Strong>
								<span><input type="checkbox" value = 0> 신입</span>
								<span><input type="checkbox" value = 1>경력</span>
				
							<span class="dropdown">
								 <span class="select">
	        						 <span>기간 시작</span>
				         			 <i class="fa fa-chevron-down"></i>
				        		</span>
				        		
				        		<input type="hidden" name="careerStart">
				        			<ul class="dropdown-menu">
				        			<li>기간 시작</li>
				        			<c:forEach begin="1" end="20" var="i">
				          				<li>${i }년 이상</li>
				          			</c:forEach>
				        			</ul>
							</span>
							
							<span>
								<Strong>~</Strong>
							</span>
							
							<span class="dropdown">
								 <span class="select">
	        						 <span>기간 종료</span>
				         			 <i class="fa fa-chevron-down"></i>
				        		</span>
				        		
				        		<input type="hidden" name="careerEnd">
				        			<ul class="dropdown-menu">
				        				<li>기간 종료</li>
				          				<c:forEach begin="1" end="20" var="i">
				          				<li>${i }년 이하</li>
				          				</c:forEach>
				        			</ul>
							</span>
							
							<span>
								<input type="checkbox" value = 2 class="career_none"> 경력무관						
							</span>
						</div>
						
						<div class="education">
							<Strong class="education_title">학력</Strong>
							
							<span class="dropdown">
								 <span class="select">
	        						 <span>전체</span>
				         			 <i class="fa fa-chevron-down"></i>
				        		</span>
				        		
				        		<input type="hidden" name="careerStart">
				        			<ul class="dropdown-menu">
				        			<li>전체</li>
				        			<c:forEach begin="1" end="20" var="i">
				          				<li>${i }년 이상</li>
				          			</c:forEach>
				        			</ul>
							</span>
							
							<span>
								<Strong>~</Strong>
							</span>
							
							<span class="dropdown">
								 <span class="select">
	        						 <span>전체</span>
				         			 <i class="fa fa-chevron-down"></i>
				        		</span>
				        		
				        		<input type="hidden" name="careerEnd">
				        			<ul class="dropdown-menu">
				        				<li>전체</li>
				          				<c:forEach begin="1" end="20" var="i">
				          				<li>${i }년 이하</li>
				          				</c:forEach>
				        			</ul>
							</span>
							
							<span>
								<input type="checkbox" value = 2 class="education_none"> 학력무관						
							</span>
							
						</div>
						
						<div class="salary">
							<Strong class="salary_title">연봉</Strong>
							
							<span class="dropdown">
								 <span class="select">
	        						 <span>전체</span>
				         			 <i class="fa fa-chevron-down"></i>
				        		</span>
				        		
				        		<input type="hidden" name="salaryAmount">
				        			<ul class="dropdown-menu">
				        				<li>전체</li>
				          				<c:forEach begin="1" end="20" var="i">
				          				<li>${i }년 이하</li>
				          				</c:forEach>
				        			</ul>
							</span>
							
							<span>
								<input type="checkbox" value = 2 class="education_none"> 회사내규에 따름 포함						
							</span>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>
	<%@ include file="/WEB-INF/jsp/include/footer.jsp" %>
	
	
	<script>
		$(":checkbox").on('click', function(){
			$(this).parent().toggleClass("checked");
			
			if (!$(this).prop("checked")) $(".checked").prop({"checked": false});
			else {
				if ($(this).parent().parent().find(".area > input:checked").length ==
				$(this).parent().parent().find(".area > input").length)
					$(".checked").prop({"checked": true});
			}
		});
		
		$(".career_none").on('click', function () {
			$(".career").css({"pointer-events": "none"});
			
		});
	
		$(".showSelect").click(function () {
			$(this).toggleClass("open").siblings("span").removeClass("open");
			$($(this).data("target")).fadeToggle("fast").siblings("div.optContainer").hide();
		});
		
		$(".checked").click(function () {
			var chk = $(this).prop("checked");
			$(this).parent().parent().find(":checkbox").prop({"checked": chk});
			if (chk) {
				$(this).parent().parent().find(":checkbox").parent().addClass("checked");
			} else {
				$(this).parent().parent().find(":checkbox").parent().removeClass("checked");
			}
		});
		
		
		/*Dropdown Menu*/
		$('span.dropdown').click(function () {
		        $(this).attr('tabindex', 1).focus();
		        $(this).toggleClass('active');
		        $(this).find('.dropdown-menu').slideToggle(300);
		    });
		    $('span.dropdown').focusout(function () {
		        $(this).removeClass('active');
		        $(this).find('.dropdown-menu').slideUp(300);
		    });
		    $('span.dropdown .dropdown-menu li').click(function () {
		        $(this).parents('span.dropdown').find('span').text($(this).text());
		        $(this).parents('span.dropdown').find('input').attr('value', $(this).attr('id'));
		    });
		/*End Dropdown Menu*/


		$('.dropdown-menu li').click(function () {
		  var input = '<strong>' + $(this).parents('span.dropdown').find('input').val() + '</strong>',
		      msg = '<span class="msg">Hidden input value: ';
		  $('.msg').html(msg + input + '</span>');
		}); 
	</script>
</body>
</html>