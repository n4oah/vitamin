<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>searchRecruit</title>
		<%@ include file="/WEB-INF/jsp/include/basic.jsp"%>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/searchRecruit.css">
		<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-glyphicons.css" rel="stylesheet">
		 
		<script src="https://use.fontawesome.com/942e94bfdb.js"></script>
		<link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
		<script src="../js/simpledateformat.js"></script>
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
							    <label>
							    <input type="checkbox" class="city_name" name="cityCode" value="${city.cityCode }" id="${city.cityCode }"><b>${city.subName }전체</b></label>
								
							    <h5>지역</h5>
							    
							    <c:forEach items="${areaList }" var="area">
							    	<c:if test="${area.cityCode eq city.cityCode}">
								    	<label class="area"><input type="checkbox" class="area_name" value="${area.areaCode }" name="areaCode" id="${area.areaCode }">${area.name }</label>
								    </c:if>
							    </c:forEach>
						    </div>
					</c:forEach>
					
					<div class="detail_wrapper">
						<div class="career">
							<span class="ex_label col-md-1">경력</span>
								<span><label><input type="checkbox" value = "1" name="careerState" class="newcomer" checked>신입</label></span>
								<span><label><input type="checkbox" name="careerOnly" value="1" class="career_level">경력</label></span> 
					
							<span class="career_period">
								<span class="dropdown">
									 <span class="select">
									 	<input type="hidden" name="careerStart" class="career_start" value="-1">
		        						 <span class="career_start_value">기간 시작</span>
					         			 <i class="fa fa-chevron-down"></i>
					        		</span>
					        		
					        		<ul class="dropdown-menu">
					        			<li id="-1" class="startDefault">기간 시작</li>
					        			<c:forEach begin="1" end="20" var="i">
					          				<li id="${i }">${i }년 이상</li>
					          			</c:forEach>
					        		</ul>
								</span>
								
								<span class="water">
									<span class="ex_label abcd">~</span>
								</span>
								
								<span class="dropdown">
				        			 <span class="select">
									 	<input type="hidden" name="careerEnd" value="-1">
		        						<span class="career_end_value">기간 종료</span>
					         			<i class="fa fa-chevron-down"></i>
					        		</span>
					        		
					        		<ul class="dropdown-menu">
					        			<li id="-1" class="endDefault">기간 종료</li>
					        			<c:forEach begin="1" end="20" var="i">
					          				<li id="${i }">${i }년 이하</li>
					          			</c:forEach>
					        		</ul>
								</span>
							</span>
							
							
							
							<span>
								<label><input type="checkbox" value ="-1" name="careerState" class="career_none"> 경력무관</label>						
							</span> 
						</div>
						
						<div class="education">
							<span class="ex_label col-md-1">학력</span>
							
							
							<span class="school_level">
								<span class="dropdown">
									 <span class="select school_level_start">
									 	<input type="hidden" name="schoolLevelStart" value="-1">
		        						<span>전체</span>
					         			<i class="fa fa-chevron-down"></i>
					        		</span>
					        		
					        		<ul class="dropdown-menu">
						        			<c:forEach var="sl" items="${schoolLevelList }">
						        				<c:choose>
						          				
						          				<c:when test="${sl.level eq -1 }">
						          					<li id="${sl.level}" class="startDefault">전체</li>
						          				</c:when>
						          				
						          				<c:when test="${sl.level ne 0 and sl.level ne -1}">
						          					<li id="${sl.level}">${sl.graduateState} 이상</li>
						          				</c:when>
						          				
						          				
						          				</c:choose>
						          			</c:forEach>
					        			</ul>
								</span>
								
								<span class="water">
										<span class="ex_label abcd">~</span>
								</span>
								
								
								<span class="dropdown">
									 <span class="select school_level_end">
									 	<input type="hidden" name="schoolLevelEnd" value="-1">
		        						<span>전체</span>
					         			<i class="fa fa-chevron-down"></i>
					        		</span>
					        		
					        		<ul class="dropdown-menu">
					        			<c:forEach var="sl" items="${schoolLevelList }">
					        				<c:choose>
					          				
						          				<c:when test="${sl.level eq -1 }">
						          					<li id="${sl.level}" class="endDefault">전체</li>
						          				</c:when>
						          				
						          				<c:when test="${sl.level ne 0 and sl.level ne -1}">
						          					<li id="${sl.level}">${sl.graduateState} 이하</li>
						          				</c:when>
					          				
						          			</c:choose>
						          		</c:forEach>
						          	</ul>
						          	
								</span>
							</span>
							
							<span>
								<label><input type="checkbox" value = "1" name="schoolLevelNone" class="school_level_none"> 학력무관</label>						
							</span>
						</div>
						
						
						
						<div class="salary">
							<span class="ex_label col-md-1">연봉</span>
							
							<span class="salary">
								<span class="dropdown">
									 <span class="select salary_start">
									 	<input type="hidden" name="yearPayStart" value="-1">
		        						<span>전체</span>
					         			<i class="fa fa-chevron-down"></i>
					        		</span>
					        		
				        			<ul class="dropdown-menu">
				        				<li id="-1" class="startDefault">전체</li>
				          				
				          				<c:forEach begin="14" end="90" var="i" step="2">
				          					<li id="${i }">${i }00만원 이상</li>
				          				</c:forEach>
	
				          				<li id="100">1억원 이상</li>
				        			</ul>
								</span>
								
								<span class="water">
									<span class="ex_label abcd">~</span>
								</span>
								
								<span class="dropdown">
									 <span class="select salary_end">
									 	<input type="hidden" name="yearPayEnd" value="-1">
		        						<span>전체</span>
					         			<i class="fa fa-chevron-down"></i>
					        		</span>
					        		
				        			<ul class="dropdown-menu">
				        				<li id="-1" class="endDefault">전체</li>
				          				<c:forEach begin="14" end="90" var="i" step="2">
				          				<li id="${i }">${i }00만원 이하</li>
				          				</c:forEach>
				        			</ul>
								</span>
							</span>
							
							<span>
								<label><input type="checkbox" name="yearPayNone" class="salary_none"> 연봉무관</label>
							</span>
						</div>
						
						<div class="age">
							<span class="ex_label col-md-1">나이</span>
							
							<span class="age">
								<span class="dropdown">
									 <span class="select age_start">
									 	<input type="hidden" name="ageCountStart" value="-1">
		        						<span>전체</span>
					         			<i class="fa fa-chevron-down"></i>
					        		</span>
					        		
				        			<ul class="dropdown-menu">
				        				<li id="-1" class="startDefault">전체</li>
				          				
				          				<c:set var="year" value="2000" />
					          				<c:forEach begin="18" end="70" var="i">
					          					<li id="${i }">
					          						${i }살(<c:out value="${year }" />년생) 이상
					          					</li>
					          					
					          					<c:set var="year" value="${year -1}" />
					          				</c:forEach>
				        			</ul>
								</span>
								
								<span class="water">
									<span class="ex_label abcd">~</span>
								</span>
								
								<span class="dropdown">
									 <span class="select age_end">
									 	<input type="hidden" name="ageCountEnd" value="-1">
		        						<span>전체</span>
					         			<i class="fa fa-chevron-down"></i>
					        		</span>
				        		
				        			<ul class="dropdown-menu">
				        				<li id="-1" class="endDefault">전체</li>
				          				
				          				<c:set var="year" value="2000" />
					          				<c:forEach begin="18" end="70" var="i">
					          					<li id="${i }">
					          						${i }살(<c:out value="${year }" />년생) 이하
					          					</li>
					          					
					          					<c:set var="year" value="${year -1}" />
					          				</c:forEach>
				        			</ul>
								</span>
							</span>
									
							<span>
								<label><input type="checkbox" name="ageNone" class="age_none"> 나이무관</label>
							</span>
							
							
							
							
						</div>
						
						<div>
							<span class="ex_label col-md-1">성별</span>
							
							<span class="gender">
								<label style="margin-top:0.55%"><input type="radio" value="1" name="gender"> 남자</label>
								<label><input type="radio" value="2" name="gender"> 여자</label>
								<label><input type="radio" value="-1" name="gender" checked> 성별무관</label>
							</span>
						</div>
						
						
						<div class="search_button">
							<input type="button" value="검색">
						</div>
					</div>
				</div>
				
			</form>
				
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
						        <th class="col-md-1">접수일·마감일</th>
						        <th align="center" class="col-md-1">즉시지원</th>
					    	</tr>
				   		 </thead>
				   		 
				   		 
				    	<tbody>
				   		<c:forEach items="${recruitList }" var="rlist">
								<tr class="outstand_point point_line">
	           						<td>
	           							<img src="https://i.imgur.com/Z4wlC9v.png" class="star">
	           							<!-- 즐겨 찾기 한 회사면 class가 star_checked -->
	        						</td>
	        						
	        						<td class="company_nm">
	        							<a class="str_tit" href="${pageContext.request.contextPath }/company/detail.do?no=${rlist.companyNo}">
	        								<span class="company_name">${rlist.company.companyName }</span></a>                         
	        							<div class="icon"></div>
	    							</td>
	    							
	    							<td class="notification_info">
		        						<div class="job_tit">
									        <span class="prd_icon_02"></span>            
									        
									        <a class="str_tit"
									           title="${rlist.title }" 
									           href="${pageContext.request.contextPath}/recruit/recruitDetail.do?no=${rlist.recruitNo}">
									        	
									        	<span>${rlist.title }</span>
									        
									        </a>             
									        
		        						</div>
		        						
		        						
		        						
		        						<p class="job_sector">
		            					<!-- <span>일반영업</span><span>금융·보험영업</span> 외  -->
		            						<span>${rlist.assignedTask }</span>
		            					      
		            					</p>
		            					
	                    			</td>
								    
								    <td class="recruit_condition">
								    	<p class="career">
									    	<c:choose>
									    		<c:when test="${rlist.careerState eq 1 and rlist.careerStart ne -1}">
									    			신입 · 경력
									    		</c:when>
									    		<c:when test="${rlist.careerState eq 1 }">
									    			신입
									    		</c:when>
									    		<c:when test="${rlist.careerStart ne -1 }">
									    			경력
									    		</c:when>
									    		<c:otherwise>
									    			경력 무관
									    		</c:otherwise>
									    	</c:choose>
								    	</p>
								    
								    
								    	<p class="education">
									        <c:choose>
									        	<c:when test="${rlist.schoolLevel eq 1 }">
													고등학교 졸업						        	
									        	</c:when>
									        	
									        	<c:when test="${rlist.schoolLevel eq 2 }">
													대학교 졸업					        	
									        	</c:when>
									        	
									        	<c:when test="${rlist.schoolLevel eq 3 }">
													대학원 석사 졸업					        	
									        	</c:when>
									        	
									        	<c:when test="${rlist.schoolLevel eq 4 }">
													대학원 박사 졸업					        	
									        	</c:when>
									        	
									        	<c:otherwise>
									        		학력무관
									        	</c:otherwise>
									        </c:choose>
								        </p>
								    </td>
								    
								    
								    
								    
								    <td class="company_info">
	                    				<p class="employment_type">
	                    					${rlist.formServiceName }
	                    				</p>
	                    				
	                    				
	                            		<p class="work_place">${rlist.subName} ${rlist.name }</p> 
	                    			</td>
	    							<td class="support_info" >
	       								<p class="recruit_date_start" style="padding-left:2px">
	       									<fmt:formatDate value="${rlist.recruitDateStart }" pattern="yyyy-MM-dd" />
	       								</p>
	       								
	       								<p class="recruit_date_end" style="padding-left:2px">
	       									<fmt:formatDate value="${rlist.recruitDateEnd }" pattern="yyyy-MM-dd" />
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
						
						</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			
			<div class="center-block">
			<c:if test="${pageResult.count != 0 }">
				<ul class="pagination">
					<li>
						<c:choose>
							<c:when test="${pageResult.prev}">
								<a href="${pageContext.request.contextPath }/search/searchRecruit.do?pageNo=${pageResult.beginPage - 1}">
									<span class="glyphicon glyphicon-chevron-left"></span>
								</a>
							</c:when>
								
							<c:otherwise>
								<a href="#1">
									<span class="glyphicon glyphicon-chevron-left"></span>
								</a>
							</c:otherwise>
						</c:choose>
					</li>
				 
				 
				  <c:forEach var="i" begin="${pageResult.beginPage }" end="${pageResult.endPage }" >
				  	<c:choose>
				  		<c:when test="${i eq pageResult.pageNo }">
				  			<li class="active"><a href="#${i }">${i }</a></li>
						</c:when>	
						<c:otherwise>
		    				<li><a href="?pageNo=${i }">${i}</a></li>
    					</c:otherwise>	  
				  	</c:choose>
				
				    </c:forEach>
				  
					<li>
						<c:choose>
							<c:when test="${pageResult.next}">
								<a href="${pageContext.request.contextPath }/search/searchRecruit.do?pageNo=${pageResult.endPage + 1}">
									<span class="glyphicon glyphicon-chevron-right"></span>
								</a>
							</c:when>
								
							<c:otherwise>
								<a href="#1">
									<span class="glyphicon glyphicon-chevron-right"></span>
								</a>
							</c:otherwise>
						</c:choose>
					</li>
				
				</ul>
				
			</c:if>
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
	
		$(".optContainer input.area_name").on('click', function(){
			$(this).parent().toggleClass("checked");
			
			if (!$(this).prop("checked")) {
				$(this).parent().parent()
					   .find('label:eq(0)')
					   .removeClass("checked")
					   .find('input').attr("checked", false);
				
				 
			}
			else {
				if ($(this).parent().parent().find("label.area > input:checked").length ==
				    $(this).parent().parent().find("label.area > input").length) {
				
					$(this).parent().parent().find('label:eq(0) > input').prop({"checked": true});
					
					$(this).parent().parent()
					   .find('label:eq(0)')
					   .addClass("checked");
				}
				
				else {
					$(this).parent().parent().find('label:eq(0) > input').prop({"checked": false});
				}
			
			}
			
		});
		
		
 		$(".optContainer .city_name").click(function () {
			var chk = $(this).prop("checked");
			$(this).parent().parent().find(":checkbox").prop({"checked": chk});
			if (chk) {
				$(this).parent().parent().find(":checkbox").parent().addClass("checked");
			} else {
				$(this).parent().parent().find(":checkbox").parent().removeClass("checked");
			}
		}); 
	
		$(".showSelect").click(function () {
			$(this).toggleClass("open").siblings("span").removeClass("open");
			$($(this).data("target")).fadeToggle("fast").siblings("div.optContainer").hide();
		});
		
		
		selectChk = true;
		/*Dropdown Menu*/
		$('span.dropdown').click(function () {
			
			if(selectChk == true) {
		        $(this).attr('tabindex', 1).focus();
		        $(this).toggleClass('active');
		        $(this).find('.dropdown-menu').slideToggle(300);
			}
		 });
	    $('span.dropdown').focusout(function () {
	    	if(selectChk == true) {
		        $(this).removeClass('active');
		        $(this).find('.dropdown-menu').slideUp(300);
	    	}
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
		
		function compare(efg, str) {
			efg.find('span.dropdown > ul.dropdown-menu li').click(function () {
				var start = -1;
				var end = -1;
				
				if (str == "경력을") {
					start = parseInt(efg.find("input[name='careerStart']").val());
					end = parseInt(efg.find("input[name='careerEnd']").val());
				} else if (str == "연봉을"){
					start = parseInt(efg.find("input[name='yearPayStart']").val());
					end = parseInt(efg.find("input[name='yearPayEnd']").val());					
				} else if (str == "나이를") {
					start = parseInt(efg.find("input[name='ageCountStart']").val());
					end = parseInt(efg.find("input[name='ageCountEnd']").val());
				} else if (str == "학력을") {
					start = parseInt(efg.find("input[name='schoolLevelStart']").val());
					end = parseInt(efg.find("input[name='schoolLevelEnd']").val());
				}
			
				
				var bool = start > end;

				if(bool && end != -1 && start != -1) {
					selectChk = false;
					if ($.inArray(this, efg.find('span.dropdown:eq(0) > .dropdown-menu li')) > -1) efg.find("li.startDefault").trigger("click")
					else efg.find("li.endDefault").trigger("click");
					alert(str+" 확인해주세요.");
					
					selectChk = true;
				}
			});
		}
		
		compare($('span.career_period'), "경력을");
		compare($('span.school_level'), "학력을");
		compare($('span.salary'), "연봉을");
		compare($('span.age'), "나이를");	

		document.registerElement('favorite-star', {prototype: proto});
	
		
		$('span.career_period > span.dropdown > ul.dropdown-menu > li').click(function (e) {
			console.log($(this));
			
			$('input[type="checkbox"].career_level').prop("checked",true);
			$('input[type="checkbox"].career_period').prop("checked",false);
			
			if($('input[type="checkbox"].career_level').is(".checked")) 
				$('.career_none').parents('label').prop("checked",false);
			
			//e.preventDefault();
		})
		
		$('input[type="checkbox"].career_level').click(function (e) {
			
			if($(this).is(':checked')) {
				$('input[type="checkbox"].career_none').prop("checked",false);
				$(".career_period").css({"cursor": "default"});
				$('span.career_period > span.dropdown').css({"pointer-events": "auto"});
			}
				
			//e.preventDefault();
		});
		$('input.newcomer').click(function (e) {
			
			if($(this).is(':checked')) {
				$('input[type="checkbox"].career_none').prop("checked",false);
			}
				
			//e.preventDefault();
		});
		
		
		
		$(".career_none").on('click', function (e) {
			console.log($(this).parents('label').is(":checked"));
			
			if($(this).is(":checked")) {
				$('input[type="checkbox"].career_level').prop("checked",false);
				$('input.newcomer').prop("checked",false);
				$('input.career_start').attr('value', "-1");
				$('span.career_start_value').text("기간 시작")
				
				$('input.career_end').attr('value', "-1");
				$('span.career_end_value').text("기간 종료");
				
				$(".career_period").css({"cursor": "no-drop"});
				$('span.career_period > span.dropdown').css({"pointer-events": "none"});
				
			}
			
			else {
				$(".career_period").css({"cursor": "default"});
				$('span.career_period > span.dropdown').css({"pointer-events": "auto"});
			}
			
			//e.preventDefault();
		});
		
		
		var reset = function (none,area,start, end) {
			none.click(function () {
				if ($(this).is(':checked')) {
					start.find('span').text("전체");
					start.find('input').attr("value", "-1");
					
					end.find('span').text("전체");
					end.find('input').attr("value", "-1");
					
					area.css({"cursor": "no-drop"});
					area.find('span.dropdown').css({"pointer-events": "none"});
				}
				
				else {
					area.css({"cursor": "default"});
					area.find('span.dropdown').css({"pointer-events": "auto"});
				}
			})
		} 
		
		reset($('input.school_level_none'),$('span.school_level') ,$('span.school_level_start'),  $('span.school_level_end'));
		reset($('input.salary_none'),$('span.salary') ,$('span.salary_start'),  $('span.salary_end'));
		reset($('input.age_none'),$('span.age') ,$('span.age_start'),  $('span.age_end'));
		
		var path = "${pageContext.request.contextPath}";
		
		
		$('input[type="button"]').one("click", searchFn);
		
		
		
		
		$(".pagination").on("click", ".pageButton", function (e) {
			console.log("sdfsdf", $(this).text());
			
			searchFn(e, $(this).text());
			
			
		});
			
		function searchFn(e, page) {
			var data = $("<form>").css("display", "none").appendTo("body").append($("input").clone()).serialize()+"&pageNo=";
			if (page) data += page;
			else data += 1;
						
			$.ajax({
				type:"post",
				data: data,
				url: path + "/search/searchWork.do",
				success: function (result) {
					result = JSON.parse(result);
					console.log("result", result);
					console.log(result.pageResult.beginPage);
					console.log(result.pageResult.endPage);
					
					$("form").remove();
					$(".recruit_table > tbody").empty();
					result.recruitList.forEach(function (recruit) {
						
						
						var tr = $("<tr>")
						tr.append($("<td>").append($("<img>").addClass("star").attr("src", "https://i.imgur.com/Z4wlC9v.png")));
						
						tr.append($("<td>").addClass("company_nm")
							.append($("<a>").addClass("str_tit company_name")
									.attr("title", recruit.company.companyName)
								.append($("<span>").text(recruit.company.companyName)))
							.append($("<div>").addClass("icon")));
						
						tr.append($("<td>").addClass("notification_info")
							.append($("<div>").addClass("job_tit")
								.append($("<a>").addClass("str_tit").attr({"title": recruit.title,
									"href": "${pageContext.request.contextPath}/recruit/recruitDetail.do?no=" + recruit.recruitNo})
									.append($("<span>").text(recruit.title)))
								.append($("<p>").addClass("job_sector")
									.append($("<span>").text(recruit.assignedTask)))));
						
						var career;
						if(recruit.careerState == 1 && recruit.careerStart != -1)
							career = "신입 · 경력 ";
						else if(recruit.careerState == 1)
							career = "신입";
						else if(recruit.careerStart != -1)
							career = "경력";
						
						tr.append($('<td>').addClass('recruit_condition')
							.append($('<p>').addClass('career').text(career))	
							.append($('<p>').addClass('education').text(recruit.graduateState)));
						
						tr.append($('<td>').addClass('company_info')
							.append($('<p>').addClass('employment_type').text(recruit.formServiceName))
							.append($('<p>').addClass('work_place').text(recruit.subName +" "+recruit.name)));
							
						var sdf = new simpleDateFormat("yyyy-MM-dd");
							
						tr.append($('<td>').addClass('support_info')
							.append($('<p>').addClass('recruit_date_start').css("padding-left", "2px").text(sdf.format(new Date(recruit.recruitDateStart))))
							.append($('<p>').addClass('recruit_date_end').css("padding-left", "2px").text(sdf.format(new Date(recruit.recruitDateEnd)))));
						
						tr.append($('<td>').addClass('support_submit').append($('<p>').addClass('support_type').append($('<button>').addClass('sri_btn_xs').attr('title',"클릭하면 입사지원 할 수 있는 창이 뜹니다.").append($('<span>').addClass('sri_btn_immediately').text('즉시지원')))));
							
							
						$("tbody").append(tr);
					}); 
					
					$("ul.pagination").empty();
					
					var beginPage = result.pageResult.beginPage;
					var endPage = result.pageResult.endPage;
					
					$('<li>').append($('<a>').append($('<span>').addClass("glyphicon glyphicon-chevron-left"))).appendTo($('ul.pagination')); 
					
					for(var i = beginPage; i<= endPage; i++) {		
						if(result.pageResult.pageNo == i)
							$('<li>').addClass("pageButton active").append($('<a>').attr("id",i).text(i)).appendTo($('ul.pagination'));
						else
							$('<li>').addClass("pageButton").append($('<a>').attr("id",i).text(i)).appendTo($('ul.pagination'));
					}
					
					$('<li>').append($('<a>').append($('<span>').addClass("glyphicon glyphicon-chevron-right"))).appendTo($('ul.pagination'));  
					
					if (!page) $('input[type="button"]').one("click", searchFn);
				
					
					/* for(var i = beginPage; i<= endPage; i++) {	
						if(result.pageResult.pageNo != i) {
							$('ul.pagination > li > a').eq(i).click(function() {
								
								searchFn();
							}) ;
						}
					}
					 */
					
					
					
				}
			});
		};	
		
	</script>
</body>
</html>