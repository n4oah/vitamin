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
						<input type="text" class="form-control" >
					</div>
			 	</div>
			 </div>
			 
			 <div class="detail_wrapper form-group">
						<div class="career">
							<span class="ex_label col-md-1">경력</span>
								<span><label><input type="checkbox" value = "1" name="careerState" class="newcomer">신입</label></span>
								<span><label><input type="checkbox" value = "-1" name="careerState" class="career_level">경력</label></span>
					
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
								
								<span>
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
					        				<c:if test="${sl.level.toString() ne '0'}">
					          					<li id="${sl.level}">${sl.graduateState} 이상</li>
					          				</c:if>
					          			</c:forEach>
				        			</ul>
							</span>
							
							<span>
								<input type="checkbox" value = "-1" class="education_none"> 학력무관						
							</span>
							
						</div>
						
						<div class="salary">
							<span class="ex_label col-md-1">연봉</span>
							
							<span class="dropdown">
								 <span class="select">
								 	<input type="hidden" name="year_pay_start" value="-1">
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
							
							<span>
								<span class="ex_label abcd">~</span>
							</span>
							
							<span class="dropdown">
								 <span class="select">
								 	<input type="hidden" name="year_pay_end" value="-1">
	        						<span>전체</span>
				         			<i class="fa fa-chevron-down"></i>
				        		</span>
				        		
				        		<input type="hidden" name="year_salary">
				        			<ul class="dropdown-menu">
				        				<li id="-1" class="endDefault">전체</li>
				          				<c:forEach begin="14" end="90" var="i" step="2">
				          				<li id="${i }">${i }00만원 이하</li>
				          				</c:forEach>
				        			</ul>
							</span>
							
							<span>
								<input type="checkbox" value = 2 class="education_none"> 회사내규에 따름					
							</span>
						</div>
						
						<div class="age">
							<span class="ex_label col-md-1">나이</span>
							
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
								<label class="salary_title">성별 </label>
						
								<input type="radio" value="1" name="gender"> 남자
								<input type="radio" value="2" name="gender"> 여자
								<input type="radio" value="3" name="gender"> 성별무관
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
									<td><input type="text" class="form-control" ></td>
								</tr>
								
								<tr>
									<th>근무형태</th>
									<td>
										<div class="career_state">
											<span class="dropdown" >
												 <span class="select">
					        						 <span>정규직</span>
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
										</div>
									</td>
								</tr>
								
								<tr>
									<th>모집인원</th>
									<td>
										<div class="career_state">
											<span class="dropdown" >
												 <span class="select">
					        						 <span>0명</span>
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
										</div>
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
										<input type="date" name="dateofbirth" id="dateofbirth">
										<strong> ~ </strong> 
										<input type="date" name="dateofbirth" id="dateofbirth">
									</td>
								</tr>
								
								<tr>
									<th>접수양식</th>
									<td>
										<span class="dropdown">
												 <span class="select">
					        						 <span>비타민 이력서 양식</span>
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
											
											<span>
												<label for="file" class="file_label">첨부파일</label>
  												<input type="file" name="file" id="file" style="display:none;"/>	
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
										  <input type="checkbox" id="weekday-mon" class="weekday" />
										  <label for="weekday-mon">월</label>
										  <input type="checkbox" id="weekday-tue" class="weekday" />
										  <label for="weekday-tue">화</label>
										  <input type="checkbox" id="weekday-wed" class="weekday" />
										  <label for="weekday-wed">수</label>
										  <input type="checkbox" id="weekday-thu" class="weekday" />
										  <label for="weekday-thu">목</label>
										  <input type="checkbox" id="weekday-fri" class="weekday" />
										  <label for="weekday-fri">금</label>
										  <input type="checkbox" id="weekday-sat" class="weekday" />
										  <label for="weekday-sat">토</label>
										  <input type="checkbox" id="weekday-sun" class="weekday" />
										  <label for="weekday-sun">일</label>
										</div>
									</td>
								</tr>
								<tr>
									<th>복리후생</th>
									<td>
										<div>
											<input type="text" placeholder="제목" id="dateofbirth" style="width:17.6%;">
											<strong>:</strong>
											<input type="text" placeholder="내용" id="dateofbirth" style="width:80%; margin-left:10px" >
										</div>
										<div>
											<button id="add">추가</button>
										</div>
										
										
									</td>
								</tr>
							</tbody>
						</table>
						<!--/.table-->
					</div>
					
					
					<div class="horizontal_table table_wrap">
						<h4 class="table_title">문의처</h4>
						<table class="table">
							<tbody>
								<tr>
									<th>담당자</th>
									<td>
										<input type="text" class="form-control">
									</td>
								</tr>
								
								<tr>
									<th>전화 및 FAX 전화</th>
									<td>
										<input type="text" class="form-control" >
									</td>
								</tr>
								
								<tr>
									<th>회사주소</th>
									<td>
										<div class="form-inline">
											<div style="margin-bottom:10px">
												<input type="text" id="sample6_postcode" placeholder="우편번호" class="form-control">
												<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
											</div>
											<div>
												<input type="text" id="sample6_address" class="form-control" placeholder="주소 " style="width:50%;">
												<input type="text" id="sample6_address2"  class="form-control" placeholder="상세주소">
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
				    <a href="#" class="disabled_btn apply_btn">등록</a>
				  </div>
				  
				  <div>
				    <a href="#" class="pull-right default_btn btn">목록</a>
				  </div>
				</div>
		</section>
	</div>
	
</form>
	<%@ include file="/WEB-INF/jsp/include/footer.jsp" %>
	
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=316e409a59e29fd51e1dcbf1e4769f1c&libraries=services"></script>

<script>
    function sample6_execDaumPostcode() {
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
				var sigungu = data.sigungu.split(" ");
				console.log("시/군/구", sigungu[sigungu.length - 1]);
			}
			}).open();
	}
    

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
    if($.inArray(ext, ['html','xlsx','docx','pptx','pdf','hwp','zip']) == -1) {
      $('#info').hide();
      $('.file_label').text('첨부파일');
      $('#file').val('');
      alert('허용되지 않는 확장자 입니다.');
    }
      
    });
    
    var chk = true;
    
    /*Dropdown Menu*/
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
	
	$('.career_level').click(function () {
		$(".career_period").toggle();
		$(".career_period").find('span.select > span:eq(0)').text('기간 시작');
		$(".career_period").find('span.select > span:eq(1)').text('기간 종료');
		$(".career_period").find("input[name='careerStart']").attr('value', '-1');
		$(".career_period").find("input[name='careerEnd']").attr('value', '-1');
	});
	
	
	function abcd(efg, str) {
		for (var i = 0; i <= 1; i++) {
			efg.find('span.dropdown:eq('+i+') > .dropdown-menu li').click(function () {
				var start = -1;
				var end = -1;
				
				
				if (str == "경력을") {
					start = parseInt(efg.find("input[name='careerStart']").val());
					end = parseInt(efg.find("input[name='careerEnd']").val());
				} else {
					start = parseInt(efg.find("input[name='year_pay_start']").val());
					end = parseInt(efg.find("input[name='year_pay_end']").val());					
				}
				
				var bool = start > end;

				if(bool && end != -1 && start != -1) {
					chk = false;
					if ($.inArray(this, efg.find('span.dropdown:eq(0) > .dropdown-menu li')) > -1) find(".startDefault").trigger("click")
					else efg.find(".endDefault").trigger("click");
					alert(str+" 확인해주세요.");
					
					chk = true;
				}
			});
		}
	}
	
	abcd($('.career_period'), "경력을");
	abcd($('.salary'), "연봉을");
	
	$('.career_none').click(function () {
		$(".career_period").hide();
		$(this).parent().parent().siblings().find("input").prop({"checked": false, "disabled": $(this).prop("checked")});
		
		$(".career_period").find('span.select > span:eq(0)').text('기간 시작');
		$(".career_period").find('span.select > span:eq(1)').text('기간 종료');
		$(".career_period").find("input[name='careerStart']").attr('value', '-1');
		$(".career_period").find("input[name='careerEnd']").attr('value', '-1');
	});
	
	$('.education_none').click(function () {
		$("div.education > span.dropdown").toggle();
		var select = $("div.education > span.dropdown > span.select");
		select.find("span").text('전체');
		select.find("input").attr('value', '-1');
	})
	
</script>
</body>
</html>
