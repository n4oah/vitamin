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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/basic.css">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/resume.css">
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-glyphicons.css">
<link rel="stylesheet"
	href="path/to/font-awesome/css/font-awesome.min.css">
<script src="https://use.fontawesome.com/942e94bfdb.js"></script>
<script src="${pageContext.request.contextPath}/js/resumeInfo.js"></script>

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

					<div class="horizontal_table table_wrap">
						<h4 class="table_title">이력서제목</h4>
						
								<p>${resumeInfo.resumeTitle}</p>
					</div>

					<div class="edit_content">
					<div class="base_info">
						<div class="horizontal_table table_wrap">
							<h4 class="table_title">기본정보</h4>
							<br>
							<table class="table">
								<tbody>
									<tr>
										<th>이름</th>
										<td><input type="text" class="float-control"
											style="width: 20%" placeholder="이름을 입력해주세요" value="${account.name}"readonly="readonly"></td>
									</tr>
									<tr>
										<th>생년월일</th>
										<td><input type="text" class="float-control" id="birth"
											style="width: 20%" placeholder="생년월일" readonly="readonly"></td>
									</tr>
									<tr>
										<th>주소</th>
										<td>
											<input type="text" class="float-control" id="postcode"
												style="width: 20%" placeholder="우편번호" readonly="readonly"> 
											<input type="text" class="float-control" id="address1"
												style="width: 80%" placeholder="주소" <%-- value="${account.address}" --%>readonly="readonly">
										</td>
									</tr>
									<tr>
										<th>휴대전화</th>
										<td><input type="text" class="float-control"
											maxlength="3" style="width: 60px" readonly="readonly"> <span>-</span> <input
											type="text" class="float-control" maxlength="4"
											style="width: 60px" readonly="readonly"> <span>-</span> <input
											type="text" class="float-control" maxlength="4"
											style="width: 60px" readonly="readonly"></td>
									</tr>
									<tr>
										<th>이메일</th>
										<td>
											<input class="float-control" name="email1"
												id="signup_email1" type="text" placeholder="이메일"
												style="width: 23%" readonly="readonly"/> 
											<span>@</span> 
											<input class="float-control" name="email2" id="signup_email2"
												type="text" placeholder="도메인 주소" style="width: 55%" readonly="readonly"/>
										</td>
									</tr>
									<tr>
										<th>성별</th>
										<td>
											<input class="float-control" type="text" readonly="readonly" style="width:20%">
										<!-- 
											<select class="selectpicker">
													<option class="fa">성별</option>
													<option value="m" class="fa fa-mars">남성</option>
													<option value="w" class="fa fa-venus">여성</option>
											</select>
										 -->
										</td>
									</tr>
									<tr>
										<th>구직상태</th>
										<td>
											<select class="selectpicker" id="jobState">
													<option class="fa">${jobState}</option>
											</select>
										</td>
									</tr>
									<tr>
										<th>결혼여부</th>
										<td>
											<select class="selectpicker" id="marryState">
													<option class="fa">${marryState}</option>
											</select>
										</td>
									</tr>
									<tr>
										<th>보훈대상</th>
										<td>
											<select class="selectpicker" id="bohonState">
													<option class="fa">${bohoonState}</option>
											</select>
										</td>
									</tr>
									<tr>
										<th>고용지원금대상</th>
										<td>
											<select class="selectpicker" id="supportState">
													<option class="fa">${supportState}</option>
											</select>
										</td>
									</tr>
									<tr>
										<th>병역대상</th>
										<td>
											<select class="selectpicker" id="armyServiceState" style="width: 10%">
													<option class="fa">${armyState}</option>
											</select>
											<c:if test="${armyState eq '면제'}">
												<span>면제사유</span>
												<input type="text" class="float-control" id="armyServiceReason" style="width:60%" 
												value="${armyService.armyServiceReason}">
											</c:if>
										</td>
									</tr>
								</tbody>
							</table>
							<!--/.table-->
							
						</div>
						</div>
						

						<div class="horizontal_table table_wrap">
							<div>
								<h4 class="table_title">학력사항</h4>
								<span style="float: right">대학교이상</span> 
								<input type="checkbox" id="ch_schoolevel1" style="float: right"> 
								<span style="float: right">고등학교&nbsp</span> 
								<input type="checkbox" id="ch_schoolevel2" style="float: right"> 
								<span style="float: right">고등학교 미만 졸업/중퇴인 경우 선택&nbsp</span> 
								<input type="checkbox" id="ch_schoolevel3" style="float: right">
							</div>
							
							<div class="highschool">
								<table class="table">
									<tbody>
										<tr>
											<th>재학기간</th>
											<td>
												<input type="text" class="float-control"
													id="highenter" placeholder="입학" readonly="readonly">
												<strong> ~ </strong> 
												<input type="text" class="float-control" id="highgraduate" placeholder="졸업"
													readonly="readonly">
											</td>
										</tr>
										<tr>
											<th>학교명</th>
											<td>
												<input type="text" class="float-control" id="highname" placeholder="학교이름">
											</td>
										</tr>
										<tr>
											<th>전공</th>
											<td>
												<input type="text" class="float-control" placeholder="전공">
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
							<br>
							<div class="university">
								<table class="table">
									<tbody>
										<tr>
											<th>재학기간</th>
											<td>
												<input type="text" class="float-control" id="univenter" placeholder="입학" readonly="readonly">
												<strong> ~ </strong> 
												<input type="text" class="float-control" id="univgraduate" placeholder="졸업"
													readonly="readonly">
											</td>
										</tr>
										<tr>
											<th>학교명</th>
											<td>
												<input type="text" class="float-control" id="univname" placeholder="학교이름">
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
												<input type="text" class="float-control" id="myscore" maxlength="3" style="width: 50px"> <span>/</span>
												<select class="float-control" id="basescore">
													<option>기준점수</option>
												</select>
											</td>
										</tr>
									</tbody>
								</table>
								<!--/.table-->
							</div>

						</div>
						<div class="career">
							<div class="horizontal_table table_wrap">
								<h4 class="table_title">경력사항</h4>
								<br>
								<table class="table">
									<tbody>
										<tr>
											<th rowspan="2">경력사항</th>
											<td><input type="radio" name="career" id="newcomer"
												value="1">신입 <input type="radio" name="career"
												id="employe" value="2">경력</td>
										</tr>
										<tr>
											<td>
												<div>
													<input type="checkbox" id="repitation_removal">
													중복기간 빼기&nbsp <input type="checkbox" id="direct_input">
													직접입력
												</div> <input type="text" maxlength="2" class="float-control"
												id="emyear" style="width: 50px"> <span>년</span> <input
												type="text" maxlength="2" class="float-control" id="emmonth"
												style="width: 50px"> <span>개월</span>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
							<!-- <div>
								<input type="radio" name="career" id="detail_career_st">
								<span> 기간별 상세경력 + 경력기술서</span> <input type="radio" name="career"
									id="detail"> <span> 기간별 상세경력</span> <input type="radio"
									name="career" id="career_st"> <span> 경력기술서</span>
							</div> -->
							<div class="horizontal_table table_wrap">
								<table class="table">
									<tbody>
										<tr>
											<th>근무기간</th>
											<td><select class="float-control">
													<option class="fa" value="">근무여부</option>
													<option class="fa" value="0">퇴사</option>
													<option class="fa" value="1">재직중</option>
											</select> <input class="float-control" type="text" id="work_start"
												style="width: 100px" placeholder="입사일"> <span>~</span>
												<input class="float-control" type="text" id="work_end"
												style="width: 100px" placeholder="퇴사일"></td>
										</tr>
										<tr>
											<th>회사명</th>
											<td><input class="float-control" type="text"
												style="width: 80%"></td>
										</tr>
										<tr>
											<th>근무부서</th>
											<td><input class="float-control" type="text"
												style="width: 80%"></td>
										</tr>
										<tr>
											<th>근무지역</th>
											<td><select class="float-control">
													<option class="fa" value="">지역선택</option>
													<option class="fa" value="11">서울</option>
													<option class="fa" value="21">부산</option>
													<option class="fa" value="22">대구</option>
													<option class="fa" value="23">인천</option>
													<option class="fa" value="24">광주</option>
													<option class="fa" value="25">대전</option>
													<option class="fa" value="26">울산</option>
													<option class="fa" value="29">세종</option>
													<option class="fa" value="31">경기</option>
													<option class="fa" value="32">강원</option>
													<option class="fa" value="33">충북</option>
													<option class="fa" value="34">충남</option>
													<option class="fa" value="35">전북</option>
													<option class="fa" value="36">전남</option>
													<option class="fa" value="37">경북</option>
													<option class="fa" value="38">경남</option>
													<option class="fa" value="39">제주</option>
											</select></td>
										</tr>
										<tr>
											<th>직급(직책)</th>
											<td><input class="float-control" type="text"
												id="position" style="width: 60%"> <input
												class="float-control" type="text" id="career_year"
												style="width: 10%"> <span>년차</span></td>
										</tr>
										<tr>
											<th>연봉</th>
											<td><input class="float-control" type="text" id="salary"
												style="width: 100px"> <input class="float-control"
												type="text" style="width: 60px" value="만원"
												readonly="readonly"></td>
										</tr>
										<tr>
											<th>직종</th>
											<td><input class="float-control" type="text"
												id="work_type" style="width: 100px"></td>
										</tr>
										<tr>
											<th>담당업무</th>
											<td style="padding:0px"><textarea class="textarea-control" rows="10"
													cols="80%"></textarea></td>
										</tr>
										<tr>
											<th>퇴사사유</th>
											<td><select class="float-control">
													<option class="fa" value="">퇴사사유</option>
													<option class="fa" value="1">업직종 전환</option>
													<option class="fa" value="2">근무조건</option>
													<option class="fa" value="3">경영악화</option>
													<option class="fa" value="4">계약만료</option>
													<option class="fa" value="5">출산/육아</option>
													<option class="fa" value="6">학업</option>
													<option class="fa" value="7">유학</option>
													<option class="fa" value="8">개인사정</option>
											</select> <input type="text" class="float-control" readonly="readonly">
												<input type="checkbox"> <span class="res-cmt">직접입력</span>
											</td>
										</tr>
									</tbody>
								</table>
								<div>
									<b>근무기간 총 합계는?</b> <span>근무기간 나오기</span>
								</div>
								<br>
								<table class="table">
									<tbody>
										<tr>
											<th>경력기술서</th>
											<td style="padding:0px" ><textarea class="textarea-control" rows="10"
													cols="80%"></textarea></td>
										</tr>
									</tbody>
								</table>
								
							</div>
						</div>
						<div class="certification">
							<div class="horizontal_table table_wrap">
								<h4 class="table_title">자격증/어학/수상내역</h4>
								<br>
								<table class="table">
									<tbody>
										<tr>
											<th>항목선택</th>
											<td><select class="selectpicker">
													<option class="fa" value="">항목선택</option>
													<option class="fa" value="1">자격증/면허증</option>
													<option class="fa" value="2">어학자격증</option>
													<option class="fa" value="3">수상내역/공모전</option>
											</select></td>
										</tr>
										<tr>
											<th>자격증/면허증</th>
											<td><input type="text" class="float-control"
												placeholder="1개의 입력란에 하나의 자격증만 입력해주세요" style="width: 50%">
											</td>
										</tr>
										<tr>
											<th>발행처</th>
											<td><input type="text" class="float-control"
												style="width: 50%"></td>
										</tr>
										<tr>
											<th>합격구분</th>
											<td><select class="selectpicker">
													<option class="fa" value="">합격구분</option>
													<option class="fa" value="0">1차합격</option>
													<option class="fa" value="1">2차합격</option>
													<option class="fa" value="2">필기합격</option>
													<option class="fa" value="3">실기합격</option>
													<option class="fa" value="4">최종합격</option>
											</select></td>
										</tr>
									</tbody>
								</table>
								
							</div>
						</div>

						<div class="hope_work_condition">
							<div class="horizontal_table table_wrap">
								<h4 class="table_title">희망근무 조건</h4>
								<table class=table>
									<tbody>
										<tr>
											<th>근무형태</th>
											<td><select class="selectpicker">
													<option class="fa" value="">근무형태</option>
													<option class="fa" value="0">정규직</option>
													<option class="fa" value="1">교육생</option>
													<option class="fa" value="2">별정직</option>
													<option class="fa" value="3">파트</option>
													<option class="fa" value="4">전임</option>
													<option class="fa" value="5">계약직</option>
													<option class="fa" value="6">병역특례</option>
													<option class="fa" value="7">인턴직</option>
													<option class="fa" value="8">아르바이트</option>
													<option class="fa" value="9">파견직</option>
													<option class="fa" value="10">해외취업</option>
													<option class="fa" value="11">위촉직</option>
													<option class="fa" value="12">프리랜서</option>
											</select></td>
										</tr>
										<tr>
											<th>희망연봉</th>
											<td>
												<select class="selectpicker">
													<option class="fa">회사내규에 따름</option>
													<option class="fa">1800</option>
													<option class="fa">2000</option>
													<option class="fa">2200</option>
													<option class="fa">2400</option>
													<option class="fa">2600</option>
													<option class="fa">2800</option>
													<option class="fa">3000</option>
													<option class="fa">3200</option>
													<option class="fa">3400</option>
													<option class="fa">3600</option>
													<option class="fa">3800</option>
													<option class="fa">4000</option>
													<option class="fa">5000</option>
													<option class="fa">6000</option>
													<option class="fa">7000</option>
													<option class="fa">8000</option>
													<option class="fa">9000</option>
													<option class="fa">1억원</option>
													<option class="fa">1억원이상</option>
													<option class="fa">면접후 결정</option>
											</select>
											</td>
										</tr>
										<tr>
											<th>희망 근무지역</th>
											<td><select class="selectpicker">
													<option class="fa">서울</option>
											</select> <select class="selectpicker">
													<option class="fa">강남구</option>
											</select></td>
										</tr>
										<tr>
											<th>희망 직종</th>
											<td><input type="text" class="float-control"></td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					
					<div class="btn_panel">
						<a href="${pageContext.request.contextPath}/mypage/saveResumeInfo.do" class="disabled_btn apply_btn"  onclick="validation()">등록</a>
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
	
</script>
</body>
</html>