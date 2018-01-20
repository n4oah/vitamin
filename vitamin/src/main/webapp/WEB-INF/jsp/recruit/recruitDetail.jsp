<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>채용공고 상세</title>
		<%@ include file="/WEB-INF/jsp/include/basic.jsp"%>
		<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-glyphicons.css" rel="stylesheet">
		 
		<script src="https://use.fontawesome.com/942e94bfdb.js"></script>
		<link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/basic.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/recruitDetail.css">
		<!-- <link rel="stylesheet" href="../css/mCalendar.css">
      	<script src="../js/mCalendar.js"></script> -->
      	
      	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c8a57785909f4fa93e71b789edfa01d6&libraries=services,clusterer,drawing"></script>
      	<!-- <script type="text/javascript">
      		var path = '${pageContext.request.contextPath}';
      		var pwd = '${sessionScope.user2.pwd }';
      		var id = '${sessionScope.user2.id }';
      		var no = '${sessionScope.user.accountNo }';
      		var mno = '${sessionScope.user.memberNo }';
      	</script> -->
		<style>
/* 접수기간 달력 */
.calendar {
  border: 0.1rem solid #dbdbdb;
  border-radius: 2px;
  display: block;
  min-width: 28rem;
  text-align: center;
}
.calendar .calendar-nav {
  -webkit-align-items: center;
  align-items: center;
  background: #00d1b2;
  color: white;
  border-top-left-radius: 2px;
  border-top-right-radius: 2px;
  display: flex;
  display: -ms-flexbox;
  display: -webkit-flex;
  -ms-flex-align: center;
  -webkit-box-align: center;
  -ms-flex-align: center;
  align-items: center;
  -webkit-box-pack: justify;
  -ms-flex-pack: justify;
  justify-content: space-between;
  font-size: 1.5rem;
  padding: 0.5rem;
}
.calendar .calendar-nav .calendar-nav-left, .calendar .calendar-nav .calendar-nav-right {
  -ms-flex-preferred-size: auto;
  flex-basis: auto;
  -webkit-box-flex: 0;
  -ms-flex-positive: 0;
  flex-grow: 0;
  -ms-flex-negative: 0;
  flex-shrink: 0;
}
.calendar .calendar-nav .calendar-nav-left .button, .calendar .calendar-nav .calendar-nav-right .button {
  text-decoration: none;
  color: white;
}
.calendar .calendar-nav .calendar-nav-left .button:hover, .calendar .calendar-nav .calendar-nav-right .button:hover {
  background: transparent;
  color: #dbdbdb;
}
.calendar .calendar-nav .calendar-nav-left {
  -webkit-box-align: center;
  -ms-flex-align: center;
  align-items: center;
  -webkit-box-pack: start;
  -ms-flex-pack: start;
  justify-content: flex-start;
}
.calendar .calendar-nav .calendar-nav-right {
  -webkit-box-align: center;
  -ms-flex-align: center;
  align-items: center;
  -webkit-box-pack: end;
  -ms-flex-pack: end;
  justify-content: flex-end;
}
.calendar .calendar-header, .calendar .calendar-body {
  display: flex;
  display: -ms-flexbox;
  display: -webkit-flex;
  -ms-flex-pack: center;
  -webkit-flex-wrap: wrap;
  -ms-flex-wrap: wrap;
  flex-wrap: wrap;
  -webkit-justify-content: center;
  justify-content: center;
  padding: 0.2rem 0;
}
.calendar .calendar-header .calendar-date, .calendar .calendar-body .calendar-date {
  -webkit-flex: 0 0 14.28%;
  -ms-flex: 0 0 14.28%;
  flex: 0 0 14.28%;
  max-width: 14.28%;
}
.calendar .calendar-header {
  background: #00b89c;
  color: white;
  font-size: 1rem;
}
.calendar .calendar-body {
  color: #7a7a7a;
}
.calendar .calendar-date {
  border: 0;
  padding: 0.4rem;
}
.calendar .calendar-date .date-item {
  -webkit-appearance: none;
  -moz-appearance: none;
  appearance: none;
  background: transparent;
  border: 0.1rem solid transparent;
  border-radius: 100%;
  color: #4a4a4a;
  cursor: pointer;
  height: 2.8rem;
  line-height: 2rem;
  outline: none;
  padding: 0.3rem;
  position: relative;
  text-align: center;
  text-decoration: none;
  transition: all 0.2s ease;
  vertical-align: middle;
  white-space: nowrap;
  width: 2.8rem;
}
.calendar .calendar-date .date-item.is-today {
  border-color: #00d1b2;
  color: #00d1b2;
}
.calendar .calendar-date .date-item:focus {
  background: #dbdbdb;
  border-color: #dbdbdb;
  color: white;
  text-decoration: none;
}
.calendar .calendar-date .date-item:hover {
  background: #dbdbdb;
  border-color: #dbdbdb;
  color: #7a7a7a;
  text-decoration: none;
}
.calendar .calendar-date .date-item.is-active {
  background: #00d1b2;
  border-color: #00d1b2;
  color: #fff;
}
.calendar .calendar-date.is-disabled .date-item, .calendar .calendar-date.is-disabled .calendar-event {
  cursor: default;
  opacity: 0.25;
  pointer-events: none;
}
.calendar .calendar-range {
  position: relative;
}
.calendar .calendar-range::before {
  background: #d1fff8;
  content: "";
  height: 2.8rem;
  left: 0;
  position: absolute;
  right: 0;
  top: 50%;
  -webkit-transform: translateY(-50%);
  -ms-transform: translateY(-50%);
  transform: translateY(-50%);
}
.calendar .calendar-range.range-start::before {
  left: 50%;
}
.calendar .calendar-range.range-end::before {
  right: 50%;
}
.calendar .calendar-range .date-item {
  color: #00d1b2;
}
.calendar.is-calendar-large .calendar-body {
  padding: 0;
}
.calendar.is-calendar-large .calendar-body .calendar-date {
  border-bottom: 0.1rem solid #dbdbdb;
  border-right: 0.1rem solid #dbdbdb;
  display: flex;
  display: -ms-flexbox;
  display: -webkit-flex;
  -webkit-flex-direction: column;
  -ms-flex-direction: column;
  flex-direction: column;
  height: 11rem;
  padding: 0;
}
.calendar.is-calendar-large .calendar-body .calendar-date:nth-child(7n) {
  border-right: 0;
}
.calendar.is-calendar-large .calendar-body .calendar-date:nth-last-child(-n+7) {
  border-bottom: 0;
}
.calendar.is-calendar-large .date-item {
  -webkit-align-self: flex-end;
  align-self: flex-end;
  -ms-flex-item-align: end;
  height: 2.8rem;
  margin-right: 0.5rem;
  margin-top: 0.5rem;
}
.calendar.is-calendar-large .calendar-range::before {
  top: 1.9rem;
}
.calendar.is-calendar-large .calendar-range.range-start::before {
  left: auto;
  width: 1.9rem;
}
.calendar.is-calendar-large .calendar-range.range-end::before {
  right: 1.9rem;
}
.calendar.is-calendar-large .calendar-events {
  -webkit-flex-grow: 1;
  flex-grow: 1;
  -ms-flex-positive: 1;
  line-height: 1;
  overflow-y: auto;
  padding: 0.5rem;
}
.calendar.is-calendar-large .calendar-event {
  background-color: #3273dc;
  border-radius: 2px;
  color: white;
  display: block;
  font-size: 1rem;
  margin: 0.2rem auto;
  overflow: hidden;
  padding: 0.3rem 0.4rem;
  text-align: left;
  text-overflow: ellipsis;
  vertical-align: baseline;
  white-space: nowrap;
}
.calendar.is-calendar-large .calendar-event.is-white {
  background-color: white;
  color: #0a0a0a;
}
.calendar.is-calendar-large .calendar-event.is-black {
  background-color: #0a0a0a;
  color: white;
}
.calendar.is-calendar-large .calendar-event.is-light {
  background-color: whitesmoke;
  color: #363636;
}
.calendar.is-calendar-large .calendar-event.is-dark {
  background-color: #363636;
  color: whitesmoke;
}
.calendar.is-calendar-large .calendar-event.is-primary {
  background-color: #00d1b2;
  color: #fff;
}
.calendar.is-calendar-large .calendar-event.is-info {
  background-color: #3273dc;
  color: #fff;
}
.calendar.is-calendar-large .calendar-event.is-success {
  background-color: #23d160;
  color: #fff;
}
.calendar.is-calendar-large .calendar-event.is-warning {
  background-color: #ffdd57;
  color: rgba(0, 0, 0, 0.7);
}
.calendar.is-calendar-large .calendar-event.is-danger {
  background-color: #ff3860;
  color: #fff;
}
.calendar_wrapper {
	display: flex;
}
.mc {
	flex: 1 1;
	margin: 2%;
}		
		</style>
	</head>
	<link rel="stylesheet" href="../css/mCalendar.css">
    <script src="../js/mCalendar.js"></script>
<body>
	<%@ include file="/WEB-INF/jsp/include/header.jsp" %>
	
	<div id="wrapper" style="margin-top: 0px;">
		<section class="container" style="margin-bottom: 100px;">
			<div class="top">
				<div class="row">
			      <div class="col-xs-12 col-md-8 col-lg-9">
			        <h3 class="recruit_title">${recruit.title }</h3>
			        <!-- <h3>로고</h3> -->
			      </div> 
			      <div class="col-xs-12 col-md-4 col-lg-3">
			        <div class="top_right_wrap">
			          <p>접수마감일 : <span>${recruit.recruitDateStringEnd }</span> </p>
			          <a href="#" class="disabled_btn apply_btn" attr="${recruit.recruitNo}">지원</a>
			        </div>  <!--/.top_right_wrap -->
			      </div> <!--/.col-xs-12.col-md-3-->
			    </div>
			 </div>
			    <div class="edit_content">
				    <div class="horizontal_table table_wrap">
						<h4 class="table_title">모집 요강</h4>
						
						<table class="table">
							<tbody>
								<tr>
									<th>주요업무</th>
									
									<td class="assigned_task">
										${recruit.assignedTask }
									</td>
								</tr>
							
								<tr>
									<th>근무형태</th>
									
									<td class="form_service">
										${recruit.formServiceName }
									</td>
								</tr>
								
								<tr>
									<th>모집인원</th>
									
									<td class="recruit_count">
										${recruit.recruitCount }
									</td>
								</tr>
								
							</tbody>
						</table>
						<!--/.table-->
					</div>
					
					<div class="horizontal_table table_wrap">
						<h4 class="table_title">지원 자격</h4>
						
						<table class="table">
							<tbody>
								<tr>
									<th>경력</th>
									<td class="career_state">
										<c:choose>
								    		<c:when test="${recruit.careerState eq 1 and recruit.careerStart ne -1}">
								    			신입 · 경력
								    		</c:when>
								    		<c:when test="${recruit.careerState eq 1 }">
								    			신입
								    		</c:when>
								    		<c:when test="${recruit.careerStart ne -1 }">
								    			경력
								    		</c:when>
								    		<c:otherwise>
								    			경력무관
								    		</c:otherwise>
									    </c:choose>
									</td>
								</tr>
								
								<tr>
									<th>학력</th>
									
									<td class="school_level">
										<c:choose>
									        	<c:when test="${recruit.schoolLevel eq 1 }">
													고등학교 졸업						        	
									        	</c:when>
									        	
									        	<c:when test="${recruit.schoolLevel eq 2 }">
													대학교 졸업					        	
									        	</c:when>
									        	
									        	<c:when test="${recruit.schoolLevel eq 3 }">
													대학원 석사 졸업					        	
									        	</c:when>
									        	
									        	<c:when test="${recruit.schoolLevel eq 4 }">
													대학원 박사 졸업					        	
									        	</c:when>
									        	
									        	<c:otherwise>
									        		학력무관
									        	</c:otherwise>
										</c:choose>
									</td>
								</tr>
								
								<tr>
									<th>연봉</th>
									
									
									<td class="year_salary">
										<c:choose>
											<c:when test="${recruit.yearPayStart ne -1 or recruit.yearPayEnd ne -1}">
												<c:choose>
													<c:when test="${recruit.yearPayStart ne -1 and recruit.yearPayEnd eq -1}">
															${recruit.yearPayStart }00만원 이상											
													</c:when>
													
													<c:when test="${recruit.yearPayStart eq -1 and recruit.yearPayEnd ne -1}">
															${recruit.yearPayEnd }00만원 이하											
													</c:when>
													
													<c:when test="${recruit.yearPayStart ne -1 and recruit.yearPayEnd ne -1}">
															${recruit.yearPayStart }00만원	~	${recruit.yearPayEnd }00만원	 											
													</c:when>
													
													
												</c:choose>
											</c:when>
											
											<c:otherwise>
												회사 내규에 따름
											</c:otherwise>
											
										</c:choose>
									</td>
								</tr>
								
								<tr>
									<th>나이</th>
									
									
									<td class="age">
										<c:choose>
											<c:when test="${recruit.ageCountStart ne -1 or recruit.ageCountEnd ne -1}">
												<c:choose>
													<c:when test="${recruit.ageCountStart ne -1 and recruit.ageCountEnd eq -1}">
															${recruit.yearPayStart }살 이상											
													</c:when>
													
													<c:when test="${recruit.ageCountStart eq -1 and recruit.ageCountEnd ne -1}">
															${recruit.yearPayEnd }살 이하											
													</c:when>
													
													<c:when test="${recruit.ageCountStart ne -1 and recruit.ageCountEnd ne -1}">
															${recruit.yearPayStart }살	~	${recruit.yearPayEnd }살	 										
													</c:when>
													
													
												</c:choose>
											</c:when>
											
											<c:otherwise>
												나이무관
											</c:otherwise>
											
										</c:choose>
									
									</td>
								</tr>
								
								<tr>
									<th>성별</th>
									
									<td class="gender">
										<c:choose>
											<c:when test="${gender eq 1 }">
												남자
											</c:when>
											<c:when test="${gender eq 2 }">
												여자
											</c:when>
											
											<c:otherwise>
												성별무관
											</c:otherwise>
										</c:choose>
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
										<span class="recruit_date_start">
											${recruit.recruitDateStringStart }
										</span>
										
										<strong> ~ </strong>
										
										<span class="recruit_date_end">
											${recruit.recruitDateStringEnd }
										</span>
									</td>
									
								</tr>
								
								<tr>
									<th>접수양식</th>
									<td class="recruit_form">
										<c:choose>
											<c:when test="${recruit.recruitForm eq 1}">
												<span>비타민 이력서 양식</span>
											</c:when>
											
											<c:when test="${recruit.recruitForm eq 2 }">
												<span>회사 이력서 양식 </span>
												
												<span class="attach_file">
													<label for="file"  class="file_label">${file.originalName }</label>
													<a id="file"  style="display:none;" href="${pageContext.request.contextPath }/${file.filePath }/${file.systemName }"></a>
												</span>
												
											</c:when>
											
										</c:choose>
									</td>
								</tr>
						
							</tbody>
						</table>
						
						<div class="calendar_wrapper">
							<!-- <div class="calendar"></div> -->
							<div class="mc"></div>
						</div>
						<!--/.table-->
					</div>
				
					
					
					<div class="horizontal_table table_wrap">
						<h4 class="table_title">근무 환경</h4>
						
						<table class="table">
							<tbody>
								<tr>
									<th>근무요일</th>
									
									<td class="day_of_week">
										${recruit.dayOfWeek }
									</td>
								</tr>
								
								<tr>
									<th>복리후생</th>
									
									
									<td class="welfare">
										<c:if test="${welfareList != null }">
											<c:forEach items="${welfareList }" var="wel">
											
											
											
										<%-- 	<div class="welfare">
												<div class="welfare_content">
													<input type="text" value="${wel.welfareTitle }"  readonly name="welfareTitleList"  class="dateofbirth" style="width:17.6%; margin-bottom:1%">
													<strong>:</strong>
													<input type="text" value="${wel.welfareContent }"  readonly name="welfareContentList"class="dateofbirth" style="width:80%; margin-left:10px">
												</div>
											</div> --%>
											
											
											<div>
												<span style="width: 6.5%; display: inline-block;">${wel.welfareTitle }</span> |
												 <span>${wel.welfareContent }</span>  
											
											</div>
											</c:forEach>
										</c:if>
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
										${recruit.master }
									</td>
								</tr>
								
								<tr>
									<th>전화 및 FAX 전화</th>
									<td>
										${recruit.phoneNumber }
									</td>
								</tr>
								
								<tr>
									<th>회사주소</th>
									<td class="address">
										${recruit.address }
									</td>
								</tr>
							</tbody>
						</table>
						<!--/.table-->
						
						<div id="map" style="width:100%;height:400px;"></div>
					</div>
					
			     </div>
			     
			     <div class="btn_panel">
				    <a href="#" class="disabled_btn apply_btn" attr="${recruit.recruitNo}">지원</a>
				  </div>
				  
				  <div>
				    <a href="${pageContext.request.contextPath}/search/searchRecruit.do" class="pull-right default_btn btn">목록</a>
				  </div>
				     
		</section>
	</div>
	
	<div class="modal fade" id="apply-modal" tabindex="-1" role="dialog" aria-labelledby="apply-modal" aria-hidden="true" style="display: none;">
		<div class="modal-dialog">
			<div class="apply-modal-container">
				<h1>공고 지원하기</h1><br/>
				<form id="apply-modal-form">
					<div class="form-group">
						<select class="selectpicker" name="resumeNo">
							<!-- <optgroup label="공개설정 된 이력서 한 개로만 지원할 수 있습니다." class="modal-resume-blank">
							</optgroup> -->
						</select>
					</div>
					<div class="form-group">
						<select class="selectpicker" name="introductionNo">
							<!-- <optgroup label="자기소개서를 선택해주세요." class="modal-introduction-blank">
							</optgroup> -->
						</select>
					</div>
					<input type="text" style="display: none;" name="recruitNo">
					<input type="submit" class="apply-modal-submit" value="지원하기">
				</form>
			</div>
		</div>
	</div>
										 
	
	<%@ include file="/WEB-INF/jsp/include/footer.jsp" %>
	
	
	<script src="${pageContext.request.contextPath}/js/recruit-detail.js"></script>		


	<script>
	$.mCalendar(".mc", "${recruit.recruitDateStringStart }", "${recruit.recruitDateStringEnd }");
		$('label.file_label').click(function () {
			console.log('asdgsadg');
			//$('a#file').on('click');
			document.getElementById('file').click();
		});
		
		var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
		var options = { //지도를 생성할 때 필요한 기본 옵션
			center: new daum.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
			level: 3 //지도의 레벨(확대, 축소 정도)
		};
		
		var map = new daum.maps.Map(container, options); //지도 생성 및 객체 리턴
		
		
		
		var geocoder = new daum.maps.services.Geocoder();
		
		var address = '${recruit.addressMain }';
		
		geocoder.addressSearch(address, function(result, status) {
		
			 // 정상적으로 검색이 완료됐으면 
		     if (status === daum.maps.services.Status.OK) {
	
		        var coords = new daum.maps.LatLng(result[0].y, result[0].x);
	
		        // 결과값으로 받은 위치를 마커로 표시합니다
		        var marker = new daum.maps.Marker({
		            map: map,
		            position: coords
		        });
	
		        // 인포윈도우로 장소에 대한 설명을 표시합니다
		        
		         
		        var infowindow = new daum.maps.InfoWindow({
		            content: '<div style="width:150px;text-align:center;padding:6px 0;">'+address+'</div>'
		        });
		        infowindow.open(map, marker);
	
		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        map.setCenter(coords);
		   	 } 
		});
		
	    map.setZoomable(false);    
		
		
	</script>
</body>
</html>