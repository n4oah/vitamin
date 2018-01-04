<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta http-equiv="content-script-type" content="text/javascript">
		<title>Insert title here</title>
		<%@ include file="/WEB-INF/jsp/include/basic.jsp"%>
		<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-glyphicons.css" rel="stylesheet">
		 
		<script src="https://use.fontawesome.com/942e94bfdb.js"></script>
		<link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/peoplesSearch.css">
		<script src="${pageContext.request.contextPath}/js/waitMe.js"></script>
		<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/waitMe.css">
		
		<!-- include the jQuery and jQuery UI scripts -->
		<script src="https://code.jquery.com/ui/1.11.1/jquery-ui.js"></script>
		                
		<!-- plus a jQuery UI theme, here I use "flick" -->
		<link rel="stylesheet" href="https://code.jquery.com/ui/1.10.4/themes/flick/jquery-ui.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery-ui-slider-pips.css">
		<script src="${pageContext.request.contextPath}/js/jquery-ui-slider-pips.js"></script>
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
								<span class="showSelect btn-secondary" data-target="#ddCity${city.cityCode}" id="ddCityBtn" data-no="${city.cityCode}">${city.subName}</span>
							</c:forEach>
						</div>
					</div>
					
					<div class="detail_wrapper">
						<div class="career">
							<Strong class="career_title">경력</Strong>
							<div class="career_slider slider"></div>
						</div>
						
						<div class="education">
							<Strong class="education_title">학력</Strong>
							<label class="btn active">
						          <input type="checkbox" class="bootCheck allCheck"><i class="fa fa-square-o fa-2x"></i><i class="fa fa-check-square-o fa-2x"></i> <span> 전체 선택</span>
					        </label>
							<c:forEach items="${schList }" var="sch">
								<label class="btn active">
						          <input type="checkbox" name="schoolLevel" class="bootCheck" value="${sch.level }"><i class="fa fa-square-o fa-2x"></i><i class="fa fa-check-square-o fa-2x"></i> <span> ${sch.graduateState}</span>
						        </label>
					        </c:forEach>
						</div>
						
						
						<div class="age">
							<Strong class="age_title">나이</Strong>
							
							<span class="dropdown " >
								 <span class="select">
	        						 <span>전체</span>
				         			 <i class="fa fa-chevron-down"></i>
				        		</span>
				        		
				        			<ul class="dropdown-menu">
				        				<li>전체</li>
				          				<c:forEach begin="20" end="60" var="i">
				          				<li>${i }세 이상</li>
				          				</c:forEach>
				        			</ul>
							</span>
							
							<span class="river">
								<Strong>~</Strong>
							</span>
							
							<span class="dropdown">
								 <span class="select">
	        						 <span>전체</span>
				         			 <i class="fa fa-chevron-down"></i>
				        		</span>
				        		
				        			<ul class="dropdown-menu">
				        				<li>전체</li>
				          				<c:forEach begin="20" end="60" var="i">
				          				<li>${i }세 이하</li>
				          				</c:forEach>
				        			</ul>
							</span>
							
							<span class="col-md-offset-3">
								<Strong class="salary_title">성별 </Strong>
						
								<label><input type="radio" value="1" name="gender"> 남자</label>
								<label><input type="radio" value="2" name="gender"> 여자</label>
								<label><input type="radio" value="3" name="gender"> 성별무관</label>
							</span>
						</div>
						
						
						<div class="search_button">
							<input type="button" value="검색">
						</div>
					</div>

					<div class="wrapper preload">
						<section class="grid-unit top-left">
							<div class="careerList">
								<div>
									최소 경력:
									<font class="careerStart"></font>
									<span class="remove" data-name="cs">X</span>
								</div>
								
								<div>
									최고 경력:
									<font class="careerEnd"></font>
									<span class="remove" data-name="ce">X</span>
								</div>
							</div>
							<div class="sphere"></div>
							<span class="icon fa fa-black-tie"></span> <span class="label">Career</span>
						</section>
						
						
						<section class="grid-unit top-right">
							<div class="schList">
							</div>
							<div class="sphere"></div>
							<span class="icon fa fa-graduation-cap"></span> <span class="label">School</span>
						</section>
						
						
						<section class="grid-unit bottom-left">
							<div class="addrList">
							</div>
							<div class="sphere"></div>
							<span class="icon fa fa-globe"></span> <span class="label">Address</span>
						</section>
						
						
						<section class="grid-unit bottom-right">
							<div class="sphere"></div>
							<span class="icon fa fa-id-card"></span> <span class="label">Gallery</span>
						</section>
					</div>
					<!-- end wrapper -->
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
						        <th class="col-md-1">접수일·마감일</th>
						        <th align="center" class="col-md-1">즉시지원</th>
					    	</tr>
				   		 </thead>
				   		 
				   		 
				   		<c:forEach items="${recruitList }" var="rlist">
					    	<tbody>
								<tr class="outstand_point point_line">
	           						<td>
	           							<img src="https://i.imgur.com/Z4wlC9v.png" class="star">
	           							<!-- 즐겨 찾기 한 회사면 class가 star_checked -->
	        						</td>
	        						
	        						<td class="company_nm">
	        							<a class="str_tit" onclick="s_trackApply(this, 'area_recruit', 'general');" title="(주)회사명" href="/zf_user/jobs/view?rec_idx=32503885"><span>(주)회사명</span></a>                         
	        							<div class="icon"></div>
	    							</td>
	    							
	    							<td class="notification_info">
		        						<div class="job_tit">
									        <span class="prd_icon_02"></span>            
									        <a class="str_tit" id="rec_link_32503885" onclick="s_trackApply(this, 'area_recruit', 'general');" 
									           title="${rlist.title }" href="/zf_user/jobs/view?rec_idx=32503885&amp;adsCategoryItem=effect_bold,icon&amp;" onmousedown="Saramin.clickAds(32503885, 'ads_category=highlight_effect&amp;ads_item=effect_bold,icon')">
									        
									        <span>${rlist.title }</span></a>             
									        
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
													고등학교 졸업 이상						        	
									        	</c:when>
									        	
									        	<c:when test="${rlist.schoolLevel eq 2 }">
													대학교 졸업 이상						        	
									        	</c:when>
									        	
									        	<c:when test="${rlist.schoolLevel eq 3 }">
													대학원 석사 졸업 이상						        	
									        	</c:when>
									        	
									        	<c:when test="${rlist.schoolLevel eq 4 }">
													대학원 박사 졸업 이상						        	
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
		$(document).ajaxStart(function () {waitEffect();})
		.ajaxStop(function () {$("body").waitMe("hide");});

		function waitEffect() {
			$("body").waitMe({
				effect : "bounce",
				text : "Wait",
				bg : "rgba(0, 0, 0, 0.5)",
				color : "white"
			});
		}
		
		var careerStart;
		var careerEnd;
				    
	    $(".career_slider").slider({ 
	        min: 0, 
	        max: 20, 
	        range: true,
	        values: [0, 20] 
	    }).slider("pips", {
	        rest: "label",
	        suffix: "년",
	        labels: {"first": "신입", "last": "20년<font class='up_arrow'>↑</font>"}
	    }).slider("float", {
	    	suffix: "년",
	    	labels: {"first": "신입", "last": "20년<font class='up_arrow'>↑</font>"}
	    }).on("slidechange", function (e, ui) {
	    	careerStart = ui.values[0];
	    	careerEnd = ui.values[1];
	    	
	    	if (ui.value == ui.values[0])
	    		$(".careerStart").text(ui.values[0] == "0" ? "신입" : ui.values[0]+"년");
	    	if (ui.value == ui.values[1])
	    		$(".careerEnd").text(ui.values[1] == "20" ? ui.values[1]+"년 이상" : ui.values[1]+"년");
	    });
	    
	    var chk = true;
	    
	    $(".dropdown-menu > li").click(function () {
	    	parseInt($(this).text())
	    	if(bool && end != -1 && start != -1) {
				chk = false;
				if ($.inArray(this, efg.find('span.dropdown:eq(0) > .dropdown-menu li')) > -1) efg.find(".startDefault").trigger("click")
				else efg.find(".endDefault").trigger("click");
				alert(str+" 확인해주세요.");
				
				chk = true;
			}
	    })
		
		var path = "${pageContext.request.contextPath}";
		$(function() {
			let anim = $('.showSelect').css('transition');
			
			let length = $('.showSelect').length;
			let ss = $('.city_wrapper > span.showSelect');
			ss.css('transition', 'none');
			ss.width((ss.parent().width() / length) - 24 - 2);
	
			//ss.css('transition', anim);
		});
		
		$(".career_none, .education_none").toggle(function () {
			$(this).attr("checked", $(this).is(":checked"));
			$(this).parent().parent().siblings().not("strong").css("pointer-events", "none");
		}, function () {
			$(this).attr("checked", $(this).is(":checked"));
			$(this).parent().parent().siblings().not("strong").css("pointer-events", "");
		});
	
		$(".showSelect").click(function () {
			var no = $(this).attr("data-no");
			if ($("#ddCity"+no).length <= 0) {
				$.ajax({
					type: "post",
					data: "no="+no,
					url: path+"/search/areaList.do",
					success: function (city) {
						city = JSON.parse(city);
						
						var div = $("<div>").addClass("optContainer").attr("id", "ddCity"+city.cityCode).css("display", "block")
					    .append($("<label>")
					    	.append($("<input>").addClass("checked").attr("type", "checkbox"))
					    	.append($("<b>").text(city.subName+"전체")))
				    	.append($("<h5>").text("지역"));
						
						city.areaList.forEach(function (area) {
					    	div.append($("<label>").addClass("area")
					    			.append($("<input>").attr("type", "checkbox").val(area.areaCode))
					    			.append($("<b>").text(area.name)));
					    });
					    
					    $(".search_wrapper > .row").after(div);
					}
				});
			}

			$("#ddCity"+no).toggle();
			$(".optContainer:not("+"#ddCity"+no+")").hide();
		});
		
		$(".search_wrapper").on("click", ":checkbox", function () {
			var value = $(this).val();
			
			if (!$(this).prop("checked")) {
				$(this).parent().parent().find(".checked").prop({"checked": false});
				
				$("[data-civa='"+value+"'], [data-civa='"+value+"'] + span").remove();
			} else {
				$("<font>").attr("data-civa", value).text($(this).next().text()).appendTo(".addrList");
				$("<span>").addClass("removeAddr").text("X").appendTo(".addrList");
				
				if ($(this).parent().parent().find(".area > input:checked").length ==
				$(this).parent().parent().find(".area > input").length)
					$(".checked").prop({"checked": true});
			}
		});
		
		$(".search_wrapper").on("click", ".checked", function () {
			var chk = $(this).prop("checked");
			$(this).parent().parent().find(":checkbox").prop({"checked": chk});
			if (chk) {
				$(this).parent().parent().find(":checkbox").parent().addClass("checked");
			} else {
				$(this).parent().parent().find(":checkbox").parent().removeClass("checked");
			}
		});
		
		$(".bootCheck").click(function () {
			if (!$(this).prop("checked")) $(this).parent().siblings().find(".allCheck").prop({"checked": false});
			else {
				if ($(this).parent().parent().find("input:checked").length -
				$(this).parent().parent().find("input").length == -1)
					$(".allCheck").prop({"checked": true});
			}
		});
		
		$(".bootCheck:not(.allCheck)").on("change", function () {
			if ($(this).is(":checked")) {
				$("<font>").addClass("sch").text($(this).parent().find("span").text()).attr("data-civa", $(this).val()).appendTo(".schList");
				$("<span>").addClass("removeSch").text("X").appendTo(".schList");				
			} else {
				var civa = $("font.sch[data-civa='"+$(this).val()+"']");
				civa.next().remove();
				civa.remove();
			}
		});
		
		$(".schList, .addrList").on("click", ".removeSch, .removeAddr", function (e) {
			/* $(this).prev().remove();
			$(this).remove(); */
			$("[value='"+$(this).prev().attr("data-civa")+"']").trigger("click");
		});	
		
		$(".allCheck").click(function () {
			var chk = $(this).prop("checked");
			$(this).parent().parent().find("[type=checkbox]").prop({"checked": chk});
			if (chk) {
				$(".bootCheck:not(.allCheck)").each(function (i, e) {
					var input = $(e);
					
					if ($("font.sch[data-civa='"+input.val()+"']").length <= 0) {
						$("<font>").addClass("sch").text(input.parent().find("span").text()).attr("data-civa", input.val()).appendTo(".schList");
						$("<span>").addClass("removeSch").text("X").appendTo(".schList");						
					}
					
				});
			} else {
				$(".bootCheck:not(.allCheck)").each(function (i, e) {
					var civa = $("font.sch[data-civa='"+$(this).val()+"']");
					civa.next().remove();
					civa.remove();
				})
			}
		});
		
		$(".remove").click(function (e) {
			switch ($(this).attr("data-name")) {
				case "cs" :
					//$("span.ui-slider-label:eq(0)").trigger("click");
					$(".career_slider").slider({ 
				        values: [0, careerEnd] 
			    	});
					break;
				case "ce" :
					$(".career_slider").slider({ 
				        values: [careerStart, 20] 
			    	});
			}
			
			$(this).prev().text("");
		});	
		
		$('span.dropdown').click(function () {
			if (chk) {
				$(this).attr('tabindex', 1).focus();
		        $(this).toggleClass('active');
		        $(this).find('.dropdown-menu').slideToggle(300);
			} else $(this).removeClass('active');
		    });
		    $('span.dropdown').focusout(function () {
		        $(this).removeClass('active');
		        $(this).find('.dropdown-menu').slideUp(300);
		    });
		    $('span.dropdown .dropdown-menu li').click(function () {
		        $(this).parents('span.dropdown').find('span > span').text($(this).text());
		        $(this).parents('span.dropdown').find('input').attr('value', $(this).attr('id'));
		    });
	</script>
</body>
</html>