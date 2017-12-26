<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/recruitWrite.css">
		<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-glyphicons.css">
		<link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
		<script src="https://use.fontawesome.com/942e94bfdb.js"></script>
		<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=316e409a59e29fd51e1dcbf1e4769f1c&libraries=services"></script>
		<style>
			p {
				font-family: verdana;
				font-size: 20px;
			}

			div {
				margin: 0;
				padding: 0;
				display: block;
			}			
			.float-control{
					display:float;
				    height: 34px;
    				padding: 6px 12px;
				    font-size: 14px;
				    line-height: 1.42857143;
				    color: #555;
				    background-color: #fff;
				    background-image: none;
				    border: 1px solid #ccc;
				    border-radius: 4px;
			}
 			.th{
				width: 15%;
			    padding: 10px 15px;
			    background-color: #e5e7e9;
			    font-weight: 400;
			    border-right: 1px solid #c1bcbc;
			    border-left: 1px solid #c1bcbc;
			}
		</style>
		
</head>
<body>
	<%@ include file="/WEB-INF/jsp/include/header.jsp"%>
		<form class="form-horizontal">
	
	<div id="wrapper" style="margin-top: 0px;">
		<section class="container" style="margin-bottom: 100px;">
		<div class="row">
			<div class="top">
			    <div class="top_title">
			        <h2>이력서 관리</h2>
			    </div>
			 </div>
			 
			 <div class="edit_title">
			 	<div class="write_title form-group">
					<label class="col-md-10 title">제목</label>
					<div class="col-md-10">
						<input type="text" class="form-control" name="re_title"
						placeholder="이력서 제목을 입력하세요">
					</div>
			 	</div>
			 </div>
			 
			 <div class="detail_wrapper form-group">
						<div class="career">
							<label class="col-md-1">경력</label>
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
								<label>~</label>
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
							<label class="col-md-1">학력</label>
							
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
								<label>~</label>
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
							<label class="col-md-1">연봉</label>
							
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
								<label>~</label>
							</span>
							
							<span class="dropdown">
								 <span class="select">
	        						 <span>전체</span>
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
								<input type="checkbox" value = 2 class="education_none"> 회사내규에 따름 포함						
							</span>
						</div>
						
						<div class="age">
							<label class="col-md-1">나이</label>
							
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
						<h4 class="table_title">기본정보</h4>
						<br>
						<table class="table">
							<tbody>
								<tr>
									<th>이름</th>
									<td><input type="text" class="form-control" style="width:20%" placeholder="이름을 입력해주세요"></td>
								</tr>
								<tr>
									<th>생년월일</th>
									<td ><input type="text" class="form-control" id="birth" style="width:20%" placeholder="생년월일" readonly="readonly"></td>
								</tr>
								<tr>
									<th>주소</th>
									<td>
										<input type="text" class="form-control" id="postcode" style="width:20%" placeholder="우편번호" readonly="readonly"
										onclick="sample6_execDaumPostcode()">
										<input type="text" class="form-control" id="address1" style="width:80%" placeholder="주소" readonly="readonly">
										<input type="text" class="form-control" id="address2" style="width:80%" placeholder="상세주소" >
										</td>
								</tr>
								<tr>
									<th>휴대전화</th>
									<td>
									<input type="text" class="float-control"  maxlength = "3" style="width:60px">
									<span>-</span>
									<input type="text" class="float-control"  maxlength = "4"style="width:60px">
									<span>-</span>
									<input type="text" class="float-control"  maxlength = "4"style="width:60px">
									</td>
									
								</tr>
								<tr>
									<th>전화번호</th>
									<td>
									<input type="text" class="float-control" maxlength = "3" style="width:60px">
									<span>-</span>
									<input type="text" class="float-control" maxlength = "4"style="width:60px">
									<span>-</span>
									<input type="text" class="float-control" maxlength = "4"style="width:60px">
									</td>
								</tr>
								<tr>
									<th>이메일</th>
									<td>
									<input class="float-control" name="email1" id="signup_email1"
										type="text" placeholder="이메일" style="width:23%"/>
									<span>@</span>
									<input class="float-control" name="email2" id="signup_email2"
										type="text" placeholder="도메인 주소" style="width:55%"/>
									</td>
								</tr>
								<tr>
									<th>성별</th>
									<td><select class="selectpicker">
										<option class="fa">성별</option>
										<option value="m" class="fa fa-mars">남성</option>
										<option value="w" class="fa fa-venus">여성</option>
									</select></td>
								</tr>
								<tr>
									<th>구직상태</th>
									<td><select class="selectpicker">
										<option class="fa">구직상태 선택</option>
										<option value="1" class="fa">구직준비중(재학생)</option>
										<option value="2" class="fa">구직중</option>
										<option value="3" class="fa">재직중</option>
									</select></td>
								</tr>
								<tr>
									<th>결혼여부</th>
									<td>
										<select class="selectpicker">
											<option class="fa">결혼 여부</option>
											<option value="1" class="fa">미혼</option>
											<option value="2" class="fa">기혼</option>
										</select>
									</td>
								</tr>
								<tr>
									<th>보훈대상</th>
									<td>
										<select class="selectpicker">
											<option class="fa">보훈대상</option>
											<option value="1" class="fa">대상</option>
											<option value="2" class="fa">비대상</option>
										</select>
									</td>
								</tr>
								<tr>
									<th>고용지원금 대상</th>
									<td>
										<select class="selectpicker">
											<option class="fa">고용지원금 대상</option>
											<option value="1" class="fa">대상</option>
											<option value="2" class="fa">비대상</option>
											<option value="2" class="fa">재직중</option>
										</select>
									</td>
								</tr>
								<tr>
									<th>병역대상</th>
									<td>
										<select class="selectpicker" style="width:10%">
											<option class="fa">병역대상</option>
											<option value="1" class="fa">비대상</option>
											<option value="2" class="fa">군필</option>
											<option value="2" class="fa">미필</option>
											<option value="2" class="fa">면제</option>
											<option value="2" class="fa">복무중</option>
										</select>
									</td>
								</tr>
							</tbody>
						</table>
						<!--/.table-->
					</div>
					
					<div class="horizontal_table table_wrap">
					<div>
						<h4 class="table_title">학력사항</h4>
							<span style="float: right">대학교이상</span>
							<input type="checkbox" id="ch_schoolevel" style="float: right">
							<span style="float: right">고등학교&nbsp</span>
							<input type="checkbox" id="ch_schoolevel" style="float: right">
							<span style="float: right">고등학교 미만 졸업/중퇴인 경우 선택&nbsp</span>
							<input type="checkbox" id="ch_schoolevel" style="float: right">
					</div>
						<div class= "highschool">
							<table class="table">
								<tbody>
									<tr>
										<th>재학기간</th>
										<td>
											<input type="text" class="float-control" id="highenter" placeholder="입학" readonly="readonly">
											<strong> ~ </strong> 
											<input type="text" class="float-control" id="highgraduate" placeholder="졸업" readonly="readonly">
										</td>
									</tr>
									<tr>
										<th>학교명</th>
										<td>
											<input type="text" class="float-control" id="schoolname" placeholder="학교이름">
										</td>
									</tr>
									<tr>
										<th>전공</th>
										<td>
											<input type="text" class="float-control" id="major" placeholder="전공">
										</td>
									</tr>
									<tr>
										<th>학점</th>
										<td>-</td>
									</tr>
								</tbody>
							</table>
						<!--/.table-->
						</div>
						<div class= "university">
							<table class="table">
								<tbody>
									<tr>
										<th>재학기간</th>
										<td>
											<input type="text" class="float-control" id="univenter" placeholder="입학" readonly="readonly">
											<strong> ~ </strong> 
											<input type="text" class="float-control" id="univgraduate" placeholder="졸업" readonly="readonly">
										</td>
									</tr>
									<tr>
										<th>학교명</th>
										<td>
											<input type="text" class="float-control" id="schoolname" placeholder="학교이름">
										</td>
									</tr>
									<tr>
										<th>전공</th>
										<td>
											<input type="text" class="float-control" id="major" placeholder="전공">
										</td>
									</tr>
									<tr>
										<th>학점</th>
										<td>
											<input type="text" class="float-control" id="myscore" maxlength="3" style="width:50px">
											<span>/</span>
											<select class="float-control" id="basescore">
												<option>기준점수</option>
											</select>
										</td>
									</tr>
								</tbody>
							</table>
						<!--/.table-->
						</div>
						<div >
						
						</div>
						
					</div>
					<div class="career">
					<div class="horizontal_table table_wrap">
						<h4 class="table_title">경력사항</h4>
						<table class="table">
							<tbody>
								<tr>
									<th rowspan="2">경력사항</th>
									<td>
										<input type="radio" name="career" id="newcomer" value="1">신입
										<input type="radio" name="career" id="employe" value="2">경력
									</td>
								</tr>
								<tr>
									<td>
										<div>
											<input type="checkbox" id="repitation_removal">
											중복기간 빼기&nbsp
											<input type="checkbox" id="direct_input">
											직접입력
										</div>
										<input type="text" maxlength="2" class="float-control" id="emyear" style="width:40px">
										<span>년</span>
										<input type="text" maxlength="2" class="float-control" id="emmonth" style="width:40px">
										<span>개월</span>
									</td>
								</tr>							
							</tbody>
						</table>
					</div>
					<div>
						<input type="radio" name="career" id="detail_career_st">
						<span> 기간별 상세경력 + 경력기술서</span>
						<input type="radio" name="career" id="detail">
						<span> 기간별 상세경력</span>
						<input type="radio" name="career" id="career_st">
						<span> 경력기술서</span>
					</div>
					<div class="horizontal_table table_wrap">
						<table class="table">
							<tbody>
								<tr>
									<th>근무기간</th>
									<td>
										<select class="float-control">
											<option class="fa" value="1">퇴사</option>
											<option class="fa" value="2" >재직중</option>
										</select>
										<input class="float-control" type="text" id="work_start" style="width:100px" placeholder="입사일">
										<span>~</span>
										<input class="float-control" type="text" id="work_end" style="width:100px" placeholder="퇴사일">
									</td>
								</tr>
								<tr>
									<th>회사명</th>
									<td>
										<input class="float-control" type="text" style="width:80%">
									</td>
								</tr>
								<tr>
									<th>근무부서</th>
									<td>
										<input class="float-control" type="text" style="width:80%">
									</td>
								</tr>
								<tr>
									<th>근무지역</th>
									<td>
										<select class="float-control">
											<option class="fa" value="1">서울</option>
											<option class="fa" value="2" >강원</option>
											<option class="fa" value="2" >경기</option>
											<option class="fa" value="2" >경상</option>
											<option class="fa" value="2" >전라</option>
										</select>
									</td>
								</tr>
								<tr>
									<th>직급(직책)</th>
									<td>
										<input class="float-control" type="text" id="position" style="width:60%">
										<input class="float-control" type="text" id="career_year" style="width:10%">
										<span>년차</span>
									</td>
								</tr>
								<tr>
									<th>연봉</th>
									<td>
										<input class="float-control" type="text" id="salary" style="width:100px">
										<input class="float-control" type="text" style="width:60px" value="만원" readonly="readonly">
										
									</td>
								</tr>
								<tr>
									<th>직종</th>
									<td>
										<select class="float-control">
											<option class="fa" value="1">퇴사</option>
											<option class="fa" value="2" >재직중</option>
										</select>
										<input class="float-control" type="text" id="work_start" style="width:100px">
										<span>~</span>
										<input class="float-control" type="text" id="work_end" style="width:100px">
									</td>
								</tr>
								<tr>
									<th>담당업무</th>
									<td>
										<select class="float-control">
											<option class="fa" value="1">퇴사</option>
											<option class="fa" value="2" >재직중</option>
										</select>
										<input class="float-control" type="text" id="work_start" style="width:100px">
										<span>~</span>
										<input class="float-control" type="text" id="work_end" style="width:100px">
									</td>
								</tr>
								<tr>
									<th>퇴사사유</th>
									<td>
										<select class="float-control">
											<option class="fa" value="1">퇴사</option>
											<option class="fa" value="2" >재직중</option>
										</select>
										<input class="float-control" type="text" id="work_start" style="width:100px">
										<span>~</span>
										<input class="float-control" type="text" id="work_end" style="width:100px">
									</td>
								</tr>
							</tbody>
						</table>
					</div>
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
												<input type="text" id="address" class="form-control" placeholder="주소 " style="width:50%;">
												<input type="text" id="detail_address"  class="form-control" placeholder="상세주소">
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
	<%@ include file="/WEB-INF/jsp/include/footer.jsp"%>
	<script>
			$( function() {
			    $( "#birth" ).datepicker({
			    	changeYear: true,
			    	yearRange:"1917:2017",
			    	changeMonth: true,
			    	monthNamesShort: ["1","2","3","4","5","6","7","8","9","10","11","12"],
			    	dayNamesMin: ['일','월','화','수','목','금','토'],
			    	dateFormat: "yy-mm-dd",
			    	maxDate:0,
			    	
			    	});
			    
			    $( "#highenter" ).datepicker({
			    	changeYear: true,
			    	yearRange:"1917:2017",
			    	changeMonth: true,
			    	monthNamesShort: ["1","2","3","4","5","6","7","8","9","10","11","12"],
			    	dayNamesMin: ['일','월','화','수','목','금','토'],
			    	dateFormat: "yy-mm-dd",
			    	maxDate:0
			    	});
			    
			    $( "#highgraduate" ).datepicker({
			    	changeYear: true,
			    	yearRange:"1917:2017",
			    	changeMonth: true,
			    	monthNamesShort: ["1","2","3","4","5","6","7","8","9","10","11","12"],
			    	dayNamesMin: ['일','월','화','수','목','금','토'],
			    	dateFormat: "yy-mm-dd",
			    	maxDate: 0
			    	});
			    
			    $("#military_start").datepicker({
			    	changeYear: true,
			    	yearRange:"1917:2017",
			    	changeMonth: true,
			    	monthNamesShort: ["1","2","3","4","5","6","7","8","9","10","11","12"],
			    	dayNamesMin: ['일','월','화','수','목','금','토'],
			    	dateFormat: "yy-mm-dd",
			    	maxDate: 0
			    	});
			    
			    $("#military_end").datepicker({
			    	changeYear: true,
			    	yearRange:"1917:2017",
			    	changeMonth: true,
			    	monthNamesShort: ["1","2","3","4","5","6","7","8","9","10","11","12"],
			    	dayNamesMin: ['일','월','화','수','목','금','토'],
			    	dateFormat: "yy-mm-dd",
			    	maxDate: 0
			    	});
			    
			    $("#univenter").datepicker({
			    	changeYear: true,
			    	yearRange:"1917:2017",
			    	changeMonth: true,
			    	monthNamesShort: ["1","2","3","4","5","6","7","8","9","10","11","12"],
			    	dayNamesMin: ['일','월','화','수','목','금','토'],
			    	dateFormat: "yy-mm-dd",
			    	maxDate: 0
			    	});
			    
			    $("#univgraduate").datepicker({
			    	changeYear: true,
			    	yearRange:"1917:2017",
			    	changeMonth: true,
			    	monthNamesShort: ["1","2","3","4","5","6","7","8","9","10","11","12"],
			    	dayNamesMin: ['일','월','화','수','목','금','토'],
			    	dateFormat: "yy-mm-dd",
			    	maxDate: 0
			    	});
			    
			    $("#work_start").datepicker({
			    	changeYear: true,
			    	yearRange:"1917:2017",
			    	changeMonth: true,
			    	monthNamesShort: ["1","2","3","4","5","6","7","8","9","10","11","12"],
			    	dayNamesMin: ['일','월','화','수','목','금','토'],
			    	dateFormat: "yy-mm-dd",
			    	maxDate: 0
			    	});
			    
			    $("#work_end").datepicker({
			    	changeYear: true,
			    	yearRange:"1917:2017",
			    	changeMonth: true,
			    	monthNamesShort: ["1","2","3","4","5","6","7","8","9","10","11","12"],
			    	dayNamesMin: ['일','월','화','수','목','금','토'],
			    	dateFormat: "yy-mm-dd",
			    	maxDate: 0
			    	});
			    
			    
			  } );
			
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
		                document.getElementById('postcode').value = data.zonecode; //5자리 새우편번호 사용
		                document.getElementById('address1').value = fullAddr;

		                // 커서를 상세주소 필드로 이동한다.
		                document.getElementById('address2').focus();
		                
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
		</script>
</body>
</html>