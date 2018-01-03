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
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/recruitWrite.css">
		<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-glyphicons.css" rel="stylesheet">
		 
		<script src="https://use.fontawesome.com/942e94bfdb.js"></script>
		<script src="../js/simpledateformat.js"></script>
		<link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/basic.css">
	</head>
<body>
	<%@ include file="/WEB-INF/jsp/include/header.jsp" %>
<form class="form-horizontal" method="post" enctype="multipart/form-data">
	<div id="wrapper" style="margin-top: 0px;">
		<section class="container" style="margin-bottom: 100px;">
		<div class="row">
			<div class="top">
			    <div class="top_title">
			        <h2>채용공고 글쓰기</h2>
			    </div>
			 </div>
			 
			 <div class="edit_title">
			 	<div class="write_title  form-group">
					<span class="ex_label col-md-1 title">제목</span>
					<div class="col-md-10">
						<input type="text" class="form-control" name="title"  value="테스트제목">
					</div>
			 	</div>
			 </div>
			 
			 <div class="detail_wrapper form-group">
						<div class="career">
							<span class="ex_label col-md-1">경력</span>
								<span><label><input type="checkbox" value = "1" name="careerState" class="newcomer" checked>신입</label></span>
								<span><label><input type="checkbox" name="careerState" class="career_level">경력</label></span>
					
							<span class="career_period" style="display:none">
								<span class="dropdown">
									 <span class="select">
									 	<input type="hidden" name="careerStart" value="-1">
		        						 <span>기간 시작</span>
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
		        						<span>기간 종료</span>
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
							
							<span class="dropdown">
								 <span class="select">
								 	<input type="hidden" name="schoolLevel" value="-1">
	        						<span>전체</span>
				         			<i class="fa fa-chevron-down"></i>
				        		</span>
				        		
				        		<ul class="dropdown-menu">
				        			<li id="-1">전체</li>
					        			<c:forEach var="sl" items="${schoolLevelList }">
					        				<c:if test="${sl.level ne 0}">
					          					<li id="${sl.level}">${sl.graduateState} 이상</li>
					          				</c:if>
					          			</c:forEach>
				        			</ul>
							</span>
							
							<span>
								<label><input type="checkbox" value = "-1" class="education_none"> 학력무관</label>						
							</span>
							
						</div>
						
						<div class="salary">
							<span class="ex_label col-md-1">연봉</span>
							
							<span class="dropdown">
								 <span class="select">
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
								 <span class="select">
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
							
							<span>
								<label><input type="checkbox" class="salary_none"> 회사내규에 따름</label>
							</span>
						</div>
						
						<div class="age">
							<span class="ex_label col-md-1">나이</span>
							
							<span class="dropdown">
								 <span class="select">
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
								 <span class="select">
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
							
							<span>
								<label><input type="checkbox" class="age_none"> 나이무관</label>
							</span>
							
							
							<span class="gender">
								<label class="gender_title">성별 </label>
						
								<label><input type="radio" value="1" name="gender"> 남자</label>
								<label><input type="radio" value="2" name="gender"> 여자</label>
								<label><input type="radio" value="-1" name="gender" checked> 성별무관</label>
							</span>
							
						</div>
						
					</div>
				
			 
			    <div class="edit_content">
				    <div class="horizontal_table table_wrap">
						<h4 class="table_title">모집 요강</h4>
						
						<table class="table">
							<tbody>
								<tr>
									<th>주요업무</th>
									<td><input type="text" name="assignedTask" class="form-control" value="주요업무"></td>
								</tr>
								
								<tr>
									<th>근무형태</th>
									<td>
										<div class="career_state">
											<span class="dropdown" >
												 <span class="select">
												 	<input type="hidden" name="formService" value="-1">
					        						<span>전체</span>
								         			<i class="fa fa-chevron-down"></i>
								        		</span>
								        		
							        			<ul class="dropdown-menu">
							        				<li id="-1">전체</li>
							        				
							          				<c:forEach var="fsl" items="${formServiceList}">
							          					<li id="${fsl.formServiceType}">${fsl.formServiceName}</li>
							          				</c:forEach>
							        			</ul>
											</span>
										</div>
									</td>
								</tr>
								
								<tr>
									<th>모집인원</th>
									<td>
										<input type="text" value="3" maxlength="3" name="recruitCount" class="form-control" style="width:5%; display:inline; margin-right:0.5%;">
										<strong>명</strong>
									</td>
								</tr> 
							</tbody>
						</table>
						<!--/.table-->
					</div>
					
					<div class="horizontal_table table_wrap">
						<h4 class="table_title">접수기간 및 양식</h4>
						<table class="table">
							<tbody>
								<tr>
									<th>접수기간</th>
									<td>
										<input type="date" name="recruitDateStart" class="dateofbirth">
										<strong> ~ </strong>
										<input type="date" name="recruitDateEnd" class="dateofbirth">
									
										<input type="hidden" name="recruitingState" value="1">									
									</td>
								</tr>
								
								<tr>
									<th>접수양식</th>
									<td>
										<span class="dropdown" style="margin-right:1%">
												<span class="select">
												 	<input type="hidden" name="recruitForm" value="1">
					        					 	<span>비타민 이력서 양식</span>
								         		 	<i class="fa fa-chevron-down"></i>
								        		</span>
								        		
							        			<ul class="dropdown-menu recruit_form">
							        				<li id="1">비타민 이력서 양식</li>
							        				<li id="2">회사 이력서 양식</li>
							        			</ul>
											</span>
											
											<span class="attach_file" style="display:none;">
												<label for="file" class="file_label">첨부파일</label>
  												<input type="file" name="attachFile" id="file" style="display:none;" accept=".html, .pdf, .xls, .xlsx, .doxc, .hwp, .zip"/>	
											
											</span>
									</td>
								</tr>
							</tbody>
						</table>
						<!--/.table-->
					</div>
					
					<div class="horizontal_table table_wrap">
						<h4 class="table_title">근무 환경</h4>
						
						<table class="table">
							<tbody>
								<tr>
									<th>근무요일</th>
									<td>
										<div class="weekDays-selector">
											  <input type="checkbox" id="weekday-mon" class="weekday" value="0"/>
											  <label for="weekday-mon">월</label>
											  <input type="checkbox" id="weekday-tue" class="weekday" value="0"/>
											  <label for="weekday-tue">화</label>
											  <input type="checkbox" id="weekday-wed" class="weekday" value="0"/>
											  <label for="weekday-wed">수</label>
											  <input type="checkbox" id="weekday-thu" class="weekday" value="0"/>
											  <label for="weekday-thu">목</label>
											  <input type="checkbox" id="weekday-fri" class="weekday" value="0"/>
											  <label for="weekday-fri">금</label>
											  <input type="checkbox" id="weekday-sat" class="weekday" value="0"/>
											  <label for="weekday-sat">토</label>
											  <input type="checkbox" id="weekday-sun" class="weekday" value="0"/>
											  <label for="weekday-sun">일</label>
											  
											  <input type="hidden" class="dayOfWeek" name="dayOfWeek" value="0000000"/>
										</div>
									</td>
								</tr>
								<tr>
									<th>복리후생</th>
									<td>
										<div class="welfare">
											<div class="welfare_content">
												<input type="text" value="복리제목" name="welfareTitleList" placeholder="제목" class="dateofbirth" style="width:17.6%; margin-bottom:1%">
												<strong>:</strong>
												<input type="text" value="복리내용" name="welfareContentList" placeholder="내용" class="dateofbirth" style="width:80%; margin-left:10px" >
											</div>
										</div>
										
										<div>
											<button type="button" class="welfare_add">추가</button>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
						<!--/.table-->
					</div>
					
					
					<div class="horizontal_table table_wrap">
						<h4 class="table_title">문의처</h4>
						<table class="table company">
							<tbody>
								<tr>
									<th>담당자</th>
									<td>
										<input type="text" value="담당자이름" name="master">
									</td>
								</tr>
								
								<tr>
									<th>전화번호</th>
									<td>
										<!-- <input type="text" name="phoneNumber" maxlength="13" placeholder="ex)010-1111-1111" style="width:50%; margin-right:1%">
										 -->
										 <input type="text" name="phoneNumber" class="form-control bfh-phone" maxlength="19" data-format="+82 (ddd) dddd-dddd" style="width:30%; margin-right:1%; float:left;">
											<input type="checkbox" id="check">
											<label for="check" class="loadcheck" id="loadcheck">
											  <span class="entypo-cancel">&#10008;</span>
											  <span class="load"></span>
											  <span class="load"></span>
											  <span class="load"></span>
											  <span class="load"></span>
											  <span class="load"></span>
											  <span class="entypo-check">&#10004;</span>
											</label>
									</td>
								</tr>
								
								<tr>
									<th>회사주소</th>
									<td>
										<div class="companyAddress">
											<div style="margin-bottom:10px">
												<input type="text" name="postCode" id="sample6_postcode" placeholder="우편번호" readonly="readonly">
												<button type="button" onclick="sample6_execDaumPostcode()" style="height: 34px;">주소 찾기</button>
											</div>
											<div>
												<input type="text" name="address1" id="sample6_address" placeholder="주소 " style="width:50%;" readonly="readonly">
												<input type="text" name="address2" id="sample6_address2"  value="상세주소" placeholder="상세주소">
												<input type="text" name="sigunguCode" id="sample6_sigunguCode" style="display: none;"/>
											</div>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
						<!--/.table-->
					</div>
			     </div>
			     <div class="btn_panel">
			     	<button class="disabled_btn apply_btn">등록</button>
				  </div>
				  
				  <div>
				    <a href="#" class="pull-right default_btn btn">목록</a>
				  </div>
				</div>
		</section>
	</div>
	
</form>
	<%@ include file="/WEB-INF/jsp/include/footer.jsp" %>
	
	<!-- <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script type="text/javascript"src="//dapi.kakao.com/v2/maps/sdk.js?appkey=316e409a59e29fd51e1dcbf1e4769f1c&libraries=services"></script> -->
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script src="${pageContext.request.contextPath}/js/daum-map-api/daum-address-api.js"></script>

<script>
	var path = '${pageContext.request.contextPath}';
    /* function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample6_address').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('sample6_address2').focus();
                
                var geocoder = new daum.maps.services.Geocoder();
				geocoder.addressSearch(data.roadAddress, function(result, status) {
					if (status === daum.maps.services.Status.OK) {
						var places = new daum.maps.services.Places();
						places.categorySearch('BUS', function(result) {
							console.log(result[0])
						}, {
							location: new daum.maps.LatLng(result[0].y, result[0].x)
						});
					}
				});
				console.log("시/도", data.sido);
				$('input[name="cityName"]').val(data.sido);
				
				var sigungu = data.sigungu.split(" ");
				console.log("시/군/구", sigungu[sigungu.length - 1]);
				$('input[name="areaName"]').val(sigungu[sigungu.length - 1]);
				$('input[name="postCode"]').val(data.zonecode);
				
				
			}
			}).open();
	} */
    

    $("[type=file]").on("change", function(){
    var file = this.files[0];
    var formdata = new FormData();
    formdata.append("file", file);
      $('#info').slideDown();
      if(file.name.length >= 30){
        $('#name span').empty().append(file.name.substr(0,30) + '..');
      }else {
        $('#name span').empty().append(file.name);
      }
      if(file.size >= 1073741824){
  			$('#size span').empty().append(Math.round(file.size/1073741824) + "GB");
  		}else if(file.size >= 1048576){
  			$('#size span').empty().append(Math.round(file.size/1048576) + "MB");
  		}else if(file.size >= 1024){
  			$('#size span').empty().append(Math.round(file.size/1024) + "KB");
  		}else {
  			$('#size span').empty().append(Math.round(file.size) + "B");
  		}
      $('#type span').empty().append (file.type);
    if(file.name.length >= 30){
      $('.file_label').text(file.name.substr(0,30) + '..');
    }else {
      $('.file_label').text(file.name);
    }
    
    var ext = $('#file').val().split('.').pop().toLowerCase();
    if($.inArray(ext, ['html','xls','xlsx','docx','pptx','pdf','hwp','zip']) == -1) {
      $('#info').hide();
      $('.file_label').text('첨부파일');
      $('#file').val('');
      alert('허용되지 않는 확장자 입니다.');
    }
      
    });
    
    var chk = true;
    
    /*Dropdown Menu*/
	$('span.dropdown').click(function (e) {
			if (chk) {
				$(this).attr('tabindex', 1).focus();
		        $(this).toggleClass('active');
		        $(this).find('.dropdown-menu').slideToggle(300);
			} else $(this).removeClass('active');
			//e.preventDefault();
	    });
	    $('span.dropdown').focusout(function () {
	        $(this).removeClass('active');
	        $(this).find('.dropdown-menu').slideUp(300);
	    });
	    $('span.dropdown .dropdown-menu li').click(function () {
	        $(this).parents('span.dropdown').find('span > span').text($(this).text());
	        $(this).parents('span.dropdown').find('input').attr('value', $(this).attr('id'));
	    });
	
	$('.career_level').click(function () {
		$(".career_period").toggle();
		$(".career_period").find('span.select > span:eq(0)').text('기간 시작');
		$(".career_period").find('span.select > span:eq(1)').text('기간 종료');
		$(".career_period").find("input[name='careerStart']").attr('value', '-1');
		$(".career_period").find("input[name='careerEnd']").attr('value', '-1');
	});
	
	
	function compare(efg, str) {
		efg.find('span.dropdown > .dropdown-menu li').click(function () {
			var start = -1;
			var end = -1;
			
			if (str == "경력을") {
				start = parseInt(efg.find("input[name='careerStart']").val());
				end = parseInt(efg.find("input[name='careerEnd']").val());
			} else if (str == "연봉을"){
				start = parseInt(efg.find("input[name='year_pay_start']").val());
				end = parseInt(efg.find("input[name='year_pay_end']").val());					
			} else if (str == "나이를") {
				start = parseInt(efg.find("input[name='age_count_start']").val());
				end = parseInt(efg.find("input[name='age_count_end']").val());
			}
			
			var bool = start > end;

			if(bool && end != -1 && start != -1) {
				chk = false;
				if ($.inArray(this, efg.find('span.dropdown:eq(0) > .dropdown-menu li')) > -1) efg.find(".startDefault").trigger("click")
				else efg.find(".endDefault").trigger("click");
				alert(str+" 확인해주세요.");
				
				chk = true;
			}
		});
	}
	
	compare($('.career_period'), "경력을");
	compare($('.salary'), "연봉을");
	compare($('.age'), "나이를");	
	
	$("input[type='date']").on("change", function () {
		var dateValueList = [$("input[name='recruitDateStart']").val(),
			$("input[name='recruitDateEnd']").val()];
		
		var startVal = "";
		var endVal = "";
		for (var i = 0; i < 2; i++) {
			dateValueList[i].split("-").forEach(function (data) {
				if(i == 0)
					startVal += data;
				else
					endVal += data;
			});
		}
		
		startVal = parseInt(startVal);
		endVal = parseInt(endVal);
		
		if(startVal > endVal && endVal && startVal) {
			$(this).removeAttr("value");
			alert("날짜를 확인해주세요.");
		}
	});
	
	$('.career_none').click(function () {
		$(".career_period").hide();
		
		$(this).parent().parent().siblings().find("input").prop({"checked": false, "disabled": $(this).prop("checked")});
		
		$(".career_period").find('span.select > span:eq(0)').text('기간 시작');
		$(".career_period").find('span.select > span:eq(1)').text('기간 종료');
		$(".career_period").find("input[name='careerStart']").attr('value', '-1');
		$(".career_period").find("input[name='careerEnd']").attr('value', '-1');
	});
	
	function none(str) {
		var div = $('div.'+str);
		
		$('.'+str+'_none').click(function () {
			div.find('span.dropdown, span.water').toggle();
			div.find('span.select > span').text('전체');
			div.find('span.select > input').val('-1');
		})
	}
	
	none('education');
	none('salary');
	none('age');
	
	$('input[name="recruitCount"]').keyup(function () {
		var reg1 = /^[0-9]+$/;
		var reg2 = /^[0-9]/g;
		
		if ($(this).val() != "" && !reg1.test($(this).val())) {
			if (reg2.test($(this).val())) $(this).val(parseInt($(this).val()));
			else $(this).removeAttr("value");
		}
	});
	
	var fileChk = false;
	
	$('ul.recruit_form > li').click(function () {
		var file = $("span.attach_file");
		if ($(this).attr("id") == "1") {
			file.hide();
			fileChk = false;
		} else {
			file.show();
			fileChk = true;
		}
	});
	
	var dayChk = function () {
		var mon, tue, wed, thu, fri, sat, sun;
		
		mon = $('input[id$="mon"]').val();
		tue = $('input[id$="tue"]').val();
		wed = $('input[id$="wed"]').val();
		thu = $('input[id$="thu"]').val();
		fri = $('input[id$="fri"]').val();
		sat = $('input[id$="sat"]').val();
		sun = $('input[id$="sun"]').val();
		
		var dayofweek = mon+tue+wed+thu+fri+sat+sun;
		
		$('input.dayOfWeek').attr('value',dayofweek);
	}
	
	$('div.weekDays-selector > label').click(function () {
		var inputId = $(this).attr('for');
		
		if(!$("input[id="+inputId+"]").is(':checked')) { 
			$("input[id="+inputId+"]").attr('value',"1");
		}
		else {
			$("input[id="+inputId+"]").attr('value',"0");
		}
		
		dayChk();
	})
	
	
	$('.welfare_add').click(function () {
		$('.welfare').append($(".welfare_content:first-child").clone().find("input").removeAttr("value").end());
	});
	
	$("input[name='phoneNumber']").keyup(function () {
		if(/^[+82]{3} [(0-9)]{5} [0-9]{4}-[0-9]{4}$/.test($(this).val())) {
			$("#check").prop("checked", "true");
		} else {
			$("#check").removeAttr("checked");
		}
		/* if ($("input[name='phoneNumber']").val().length < 19) {
			$("#check").removeAttr("checked");
		} else {
			$("#check").prop("checked", "true");
		} */
		/* if (!regExp.test($("input[name='phoneNumber']").val())) {
			$("#check").removeAttr("checked");
		} else {
			$("#check").prop("checked", "true");
		} */
	});
	
	$("form").on("submit", function () {
		$(this).attr("action", path+"/recruit/recruitWrite.do");
		$(this).attr("method", "post");
		
		/* if (!regExp.test($("input[name='phoneNumber']").val())) {
			 alert("잘못된 휴대폰 번호입니다. 숫자, - 를 포함한 숫자만 입력하세요.");
		     return false;
		} */
		// console.log($("input[type='file']").val());
		
		if (fileChk && !$("input[type='file']").val()) {
			alert("이력서 파일을 넣어 주세요.");
			return false;
		}
		
		if ($("input[name='phoneNumber']").val().length != 19) {
			alert("전화번호를 입력해주세요.");
			return false;
		}
		
		//$("input[name='address']").val($("input#sample6_address").val().trim()+" "+$("input#sample6_address2").val().trim());
		var inputList = $("input:not([name='id'], [name='pwd'], [name='welfareTitleList'], [name='welfareContentList'], [name='attachFile'], #sample6_sigunguCode)");
		
		for (var i = 0; i < inputList.length; i++) {
			var data = $(inputList[i]);
			if (!data.val() || data.val() == "") {
				alert("빈 칸이 있습니다.");
				console.log(i);
				console.log(data);
				
				return false;
			}
		}
		
		return true;
	})

	
</script>
</body>
</html>
