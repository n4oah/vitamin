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
		<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-glyphicons.css" rel="stylesheet">
		 
		<script src="https://use.fontawesome.com/942e94bfdb.js"></script>
		<link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
	</head>
<body>
	<%@ include file="/WEB-INF/jsp/include/header.jsp" %>
	<div id="wrapper" style="margin-top: 0px;">
		<section class="container">
			<div class="row">
				<div class="search_wrapper">
					<div class="row" style="margin: 0px">
						<div class="city_wrapper">
							<c:forEach items="${cityList }" var="city">
								<span class="showSelect btn-secondary" style="float:left;" data-target="#ddCity${city.cityCode}" id="ddCityBtn">${city.subName}</span>
							</c:forEach>
						</div>
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
								<span><input type="checkbox" name="careerState" value = 0>신입</span>
								<span><input type="checkbox" name="careerState" value = 1>경력</span>
					
							<span class="dropdown">
								 <span class="select">
								 	<input type="hidden" name="careerStart">
	        						<span>기간 시작</span>
				         			<i class="fa fa-chevron-down"></i>
				        		</span>
				        		
				        		<input type="hidden">
				        			<ul class="dropdown-menu">
				        			<li>기간 시작</li>
				        			<c:forEach begin="1" end="20" var="i">
				          				<li id="${i}">${i }년 이상</li>
				          			</c:forEach>
				        			</ul>
							</span>
							
							<span>
								<Strong>~</Strong>
							</span>
							
							<span class="dropdown">
								 <span class="select">
								 	<input type="hidden" name="careerEnd">
	        						<span>기간 종료</span>
				         			<i class="fa fa-chevron-down"></i>
				        		</span>
				        		
				        		<input type="hidden">
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
				          				<li id="${i }">${i }년 이하</li>
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
				        		
				        		<input type="hidden" name="year_salary">
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
						
						<div class="age">
							<Strong class="age_title">나이</Strong>
							
							<span class="dropdown " >
								 <span class="select">
	        						 <span>전체</span>
				         			 <i class="fa fa-chevron-down"></i>
				        		</span>
				        		
				        		<input type="hidden" name="age_count">
				        			<ul class="dropdown-menu">
				        				<li>전체</li>
				          				<c:forEach begin="1" end="20" var="i">
				          				<li>${i }년 이하</li>
				          				</c:forEach>
				        			</ul>
							</span>
							
							<span class="col-md-offset-3">
								<Strong class="salary_title">성별 </Strong>
						
								<input type="radio" value="1" name="gender"> 남자
								<input type="radio" value="2" name="gender"> 여자
								<input type="radio" value="3" name="gender"> 성별무관
							</span>
						</div>
						
						
						<div class="search_button">
							<input type="button" value="검색">
						</div>
					</div>
				</div>
				
				<div class="recruit_list">
					<table class="recruit_table table" >
						<colgroup>
							<col width="34px">       
							<col width="18%">
							<col width="*">
							<col width="9%">
							<col width="10%">
							<col width="12%">
							<col width="7.6%">
				    	</colgroup>
						
						<thead>
					    	<tr>
					          <!--  <th scope="col" class="check_list">
					           <label class="sri_check" for="chk_all">
					           <input type="checkbox" name="check_all" id="check_all" value="" class="inp_check" data-pass-onload-refresh="y">
					           <span class="txt_check blank"></span></label></th> -->
				                <th class="col-md-1"></th>
				                <th class="col-md-2">기업명</th>
						        <th class="col-md-4">제목</th>
						        <th class="col-md-1">지원자격</th>
						        <th class="col-md-1">근무조건</th>
						        <th class="col-md-1">마감일·등록일</th>
						        <th align="center" class="col-md-1">즉시지원</th>
					    	</tr>
				   		 </thead>
				   		 
				   		 
				   		<c:forEach begin="1" end="10" var="i">
					    	<tbody>
								<tr class="outstand_point point_line">
	           						<td>
	           							<img src="https://i.imgur.com/Z4wlC9v.png" class="star">
	           							<!-- 즐겨 찾기 한 회사면 class가 star_checked -->
	        						</td>
	        						
	        						<td class="company_nm">
	        							<a class="str_tit" onclick="s_trackApply(this, 'area_recruit', 'general');" title="(주)에즈금융서비스" href="/zf_user/jobs/view?rec_idx=32503885"><span>(주)에즈금융서비스</span></a>                         
	        							<div class="icon"></div>
	    							</td>
	    							
	    							<td class="notification_info">
		        						<div class="job_tit">
									        <span class="prd_icon_02"></span>            
									        <a class="str_tit" id="rec_link_32503885" onclick="s_trackApply(this, 'area_recruit', 'general');" title="2017 AZ금융서비스 하반기 신입사원(FC) 채용" href="/zf_user/jobs/view?rec_idx=32503885&amp;adsCategoryItem=effect_bold,icon&amp;" onmousedown="Saramin.clickAds(32503885, 'ads_category=highlight_effect&amp;ads_item=effect_bold,icon')"><span>2017 AZ금융서비스 하반기 신입사원(FC) 채용</span></a>             
									        
		        						</div>
		        						
		        						<p class="job_sector">
		            					<span>일반영업</span><span>금융·보험영업</span> 외        </p>
	                    			</td>
								    
								    <td class="recruit_condition">
								        <p class="career">신입 · 경력</p>
								        <p class="education">학력무관</p>
								    </td>
								    
								    <td class="company_info">
	                    				<p class="employment_type">계약직 · 위촉직</p>
	                            		<p class="work_place">서울전체</p>
	                    			</td>
	    							<td class="support_info">
	       								<p class="deadlines">~ 12/21(목)
	       									<span class="reg_date">(19일 전 등록)</span>
	       								</p>
	    							</td>
	    							
	    							<td class="support_submit">
	    								<p class="support_type">
	        								<button class="sri_btn_xs" title="클릭하면 입사지원할 수 있는 창이 뜹니다." onclick="try{quickApplyForm('32503885','','t_category=area_recruit&amp;t_content=general', ''); return false;} catch (e) {}; return false;" onmousedown="try{n_trackEvent('apply','list','quick_apply');}catch(e){}">
	        									<span class="sri_btn_immediately">즉시지원</span>
	        								</button>
	        							</p>   
	    							</td>
								</tr>    
							</tbody>
						
						</c:forEach>
					</table>
				</div>
			</div>
			
			<div class="center-block">
				<ul class="pagination">
				  <li><a href="#">1</a></li>
				  <li><a href="#">2</a></li>
				  <li><a href="#">3</a></li>
				  <li><a href="#">4</a></li>
				  <li><a href="#">5</a></li>
				</ul>
			</div>
			
		</section>
	</div>
	<%@ include file="/WEB-INF/jsp/include/footer.jsp" %>
	
	
	<script>
		$(function() {
			let anim = $('.showSelect').css('transition');
			
			let length = $('.showSelect').length;
			let ss = $('.city_wrapper > span.showSelect');
			ss.css('transition', 'none');
			console.log(typeof(ss.parent().width()));
			console.log(typeof(length));
			
			console.log(ss.parent().width() / length);
			ss.width((ss.parent().width() / length) - 24 - 2);
	
			//ss.css('transition', anim);
		});
	
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
		        $(this).parents('span.dropdown').find('span > span').text($(this).text());
		        $(this).parents('span.dropdown').find('input').attr('value', $(this).attr('id'));
		    });
		/*End Dropdown Menu*/

		/* $('.dropdown-menu li').click(function () {
		  var input = '<strong>' + $(this).parents('span.dropdown').find('input').val() + '</strong>',
		      msg = '<span class="msg">Hidden input value: ';
		  $('.msg').html(msg + input + '</span>');
		});  */
		
		let star = document.querySelector('.star');

		var proto = Object.create(HTMLElement.prototype);

		proto.createdCallback = function() {
		  this.innerHTML = '★';
		  
		  this.addEventListener('click', function() {
		  	if (this.hasAttribute('active')) {
		      this.removeAttribute('active');
		      this.removeAttribute('hover');
		    }
		    else {
		      this.setAttribute('active', '');
		    }
		  });
		  
		  this.addEventListener('mouseout', function() {
		    this.removeAttribute('hover');
		  });
		  
		  this.addEventListener('mouseover', function() {
		    if (!this.hasAttribute('active')) {
		      this.setAttribute('hover', '');
		    }
		  });
		};

		document.registerElement('favorite-star', {prototype: proto});
	</script>
</body>
</html>