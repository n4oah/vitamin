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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/resume2.css">
<script src="${pageContext.request.contextPath}/js/resumeInfo.js"></script>
<style type="text/css">

	.infocontainer{
		width:80%;
	}
</style>
</head>
<body>
	<%-- <%@ include file="/WEB-INF/jsp/include/header.jsp"%> --%>
	<form class="form-horizontal resumeInfo">

		<div id="wrapper" style="margin-top: 0px;">
			<section class="container infocontainer" style="margin-bottom: 100px;">
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
										<td>
										<p>${member.name}</p>
										<%-- <input type="text" class="float-control"
											style="width: 20%" placeholder="이름을 입력해주세요" value="${member.name}"readonly="readonly"> --%>
										</td>
									</tr>
									<tr>
										<th>생년월일</th>
										<td>
										<!-- <input type="text" class="float-control" id="birth"
											style="width: 20%" placeholder="생년월일" readonly="readonly"> -->
										<p><fmt:formatDate value="${member.birthDate}" pattern="yyyy-MM-dd"/></p>
										</td>
									</tr>
									<tr>
										<th>주소</th>
										<td>
										<p>${address.postCode}</p>
											<!-- <input type="text" class="float-control" id="postcode"
												style="width: 20%" placeholder="우편번호" readonly="readonly"> --> 
										<p>${address.address}</p>
											<%-- <input type="text" class="float-control" id="address1"
												style="width: 80%" placeholder="주소" value="${account.address}"readonly="readonly"> --%>
										</td>
									</tr>
									<tr>
										<th>휴대전화</th>
										<td>
										<p>${member.phoneNumber}</p>
										<!-- <input type="text" class="float-control"
											maxlength="3" style="width: 60px" readonly="readonly"> <span>-</span> <input
											type="text" class="float-control" maxlength="4"
											style="width: 60px" readonly="readonly"> <span>-</span> <input
											type="text" class="float-control" maxlength="4"
											style="width: 60px" readonly="readonly"> --></td>
									</tr>
									<tr>
										<th>이메일</th>
										<td>
											<p>${member.email}<p>
											<!-- <input class="float-control" name="email1"
												id="signup_email1" type="text" placeholder="이메일"
												style="width: 23%" readonly="readonly"/> 
											<span>@</span> 
											<input class="float-control" name="email2" id="signup_email2"
												type="text" placeholder="도메인 주소" style="width: 55%" readonly="readonly"/> -->
										</td>
									</tr>
									<tr>
										<th>성별</th>
										<td>
											<!-- <input class="float-control" type="text" readonly="readonly" style="width:20%"> -->
											<p>${member.gender}</p>
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
											<p>${jobState}</p>
											
										</td>
									</tr>
									<tr>
										<th>결혼여부</th>
										<td>
											<p>${marryState}</p>
										</td>
									</tr>
									<tr>
										<th>보훈대상</th>
										<td>
										<p>${bohoonState}</p>
											
										</td>
									</tr>
									<tr>
										<th>고용지원금대상</th>
										<td>
										<p>${supportState}</p>
											
										</td>
									</tr>
									<tr>
										<th>병역대상</th>
										<td>
										<p>${armyState}</p>
											<c:if test="${armyState eq '면제'}">
												<span>면제사유</span>
												<%-- <input type="text" class="float-control" id="armyServiceReason" style="width:60%" 
												value="${armyService.armyServiceReason}"> --%>
												<span>:&nbsp${armyService.armyServiceReason}</span>
											</c:if>
										</td>
									</tr>
								</tbody>
							</table>
							<!--/.table-->
							
						</div>
						</div>
						
						<c:if test="${school.schoolLevelNo ne '0'}">
						<div class="horizontal_table table_wrap">
							<div>
								<h4 class="table_title">학력사항</h4>
								<!-- <span style="float: right">대학교이상</span>
								<input type="checkbox" id="ch_schoolevel1" style="float: right"> 
								<span style="float: right">고등학교&nbsp</span> 
								<input type="checkbox" id="ch_schoolevel2" style="float: right"> 
								<span style="float: right">고등학교 미만 졸업/중퇴인 경우 선택&nbsp</span> 
								<input type="checkbox" id="ch_schoolevel3" style="float: right"> -->
							</div>
							
								<table class="table">
									<tbody>
										<tr>
											<th>재학기간</th>
											<td>
												<!-- <input type="text" class="float-control"
													id="highenter" placeholder="입학" readonly="readonly"> -->
												<span><fmt:formatDate value="${school.schoolStartDate}" pattern="yyyy-MM-dd"/></span>
												<strong style="width: auto;"> ~ </strong>
												<span><fmt:formatDate value="${school.schoolEndDate}" pattern="yyyy-MM-dd"/></span>
												<!-- input type="text" class="float-control" id="highgraduate" placeholder="졸업"
													readonly="readonly"> -->
											</td>
										</tr>
										<tr>
											<th>학교명</th>
											<td>
												<span>${school.schoolTitle}&nbsp</span>
												<span>${school.graduateState}</span>
												<!-- <input type="text" class="float-control" id="highname" placeholder="학교이름"> -->
											</td>
										</tr>
										<tr>
											<th>전공</th>
											<td>
												<p>${school.major}</p>
												<!-- <input type="text" class="float-control" placeholder="전공"> -->
											</td>
										</tr>
										<tr>
											<th>학점</th>
											<td>
											<c:choose>
												<c:when test="${school.schoolLevelNo ne '1'}">
													<span>${school.schoolScore}</span>
													<strong>/</strong>
													<span>${school.schoolScoreStandard}</span>
												</c:when>
												<c:otherwise>
													<span>-</span>
												</c:otherwise>
											</c:choose>
											
											</td>
										</tr>
									</tbody>
								</table>
								<!--/.table-->
							</div>
							</c:if>
							<br>

						</div>
						<c:if test="${resumeInfo.careerState ne 1}">
						
						
						<div class="career">
							<div class="horizontal_table table_wrap">
								<h4 class="table_title">경력사항</h4>
								<br>
								<table class="table">
									<tbody>
										<tr>
											<th rowspan="2">경력사항</th>
											<td>
											<!-- <input type="radio" name="career" id="newcomer" value="1"> -->
												<p>경력</p>
											<!-- <input type="radio" name="career" id="employe" value="2">경력 -->
											</td>
										</tr>
										<tr>
											<td>
												<div>
													<!-- <input type="checkbox" id="repitation_removal">
													중복기간 빼기&nbsp <input type="checkbox" id="direct_input">
													직접입력 -->
												</div> 
												
													<!-- <input type="text" maxlength="2" class="float-control" id="emyear" style="width: 50px"> --> 
													<span>${resumeInfo.careerYears}</span>
													<span>년</span> 
											
												<!-- <input
												type="text" maxlength="2" class="float-control" id="emmonth"
												style="width: 50px"> <span>개월</span> -->
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
							<c:if test="${resumeInfo.careerState eq '2'}">
							<div class="horizontal_table table_wrap">
								<table class="table">
									<tbody>
										<tr>
											<th>근무기간</th>
											<td>
												<p>${pCompany.prev}</p>
											<!-- <input class="float-control" type="text" id="work_start"
												style="width: 100px" placeholder="입사일"> --> 
												<span>
												<fmt:formatDate value="${pCompany.prevCompanyStart}" pattern="yyyy-MM-dd"/>
												</span>
												<span>~</span>
												<span>
												<fmt:formatDate value="${pCompany.prevCompanyEnd}" pattern="yyyy-MM-dd"/>
												</span>
												<!-- <input class="float-control" type="text" id="work_end"
												style="width: 100px" placeholder="퇴사일"> -->
												</td>
										</tr>
										<tr>
											<th>회사명</th>
											<td><!-- <input class="float-control" type="text"
												style="width: 80%"> -->
												<p>${pCompany.prevCompanyName}</p>
											</td>
										</tr>
										<tr>
											<th>근무부서</th>
											<td>
											<p>${pCompany.prevCompanyDepartment}</p>
											<!-- <input class="float-control" type="text"
												style="width: 80%"> -->
											</td>
										</tr>
										<tr>
											<th>근무지역</th>
											<td>
												<p>${pCompany.prevCompanyCity}</p>
											</td>
										</tr>
										<tr>
											<th>직급(직책)</th>
											<td><!-- <input class="float-control" type="text"
												id="position" style="width: 60%"> --> 
												<span>${pCompany.prevCompanyPosition}&nbsp</span>
												<!-- <input
												class="float-control" type="text" id="career_year"
												style="width: 10%">  -->
												<span>${pCompany.prevCompanyYears}</span>
												<span>년차</span></td>
										</tr>
										<tr>
											<th>연봉</th>
											<td><!-- <input class="float-control" type="text" id="salary"
												style="width: 100px"> <input class="float-control"
												type="text" style="width: 60px" value="만원"
												readonly="readonly"> -->
												<p>${pCompany.prevCompanySalary}만원</p></td>
										</tr>
										<tr>
											<th>직종</th>
											<td><!-- <input class="float-control" type="text"
												id="work_type" style="width: 100px"> -->
												<p>${pCompany.prevCompanyType}</p></td>
										</tr>
										<tr>
											<th>담당업무</th>
											<td style="padding:0px"><textarea class="textarea-control" rows="10"
													cols="80%" readonly="readonly">${pCompany.prevCompanyCharge}</textarea></td>
										</tr>
										<tr>
											<th>퇴사사유</th>
											<td>
												<p>${pCompany.prevCompanyReason}</p>
											</td>
										</tr>
									</tbody>
								</table>
								<!-- <div>
									<b>근무기간 총 합계는?</b> <span>근무기간 나오기</span>
								</div> -->
								<br>
								<table class="table">
									<tbody>
										<tr>
											<th>경력기술서</th>
											<td style="padding:0px" ><textarea class="textarea-control" rows="10" cols="80%" readonly="readonly">${pCompany.prevCompanyCareerDescribe}</textarea></td>
										</tr>
									</tbody>
								</table>
								
							</div>
							</c:if>
						</div>
						</c:if>
						<div class="certification">
							<div class="horizontal_table table_wrap">
								<h4 class="table_title">자격증</h4>
								<br>
								<table class="table">
									<tbody>
										
										<tr>
											<th>자격증</th>
											<td><!-- <input type="text" class="float-control"
												placeholder="1개의 입력란에 하나의 자격증만 입력해주세요" style="width: 50%"> -->
												<p>${certificate.certificationTitle}</p>
											</td>
										</tr>
										<tr>
											<th>발행처</th>
											<td><!-- <input type="text" class="float-control"
												style="width: 50%"> -->
												<p>${certificate.certificationOffice}</p>	
											</td>
										</tr>
										<tr>
											<th>합격구분</th>
											<td>
												<p>${certificate.division}</p>
											</td>
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
											<td>
												<p>${hope.hwork}</p>
											</td>
										</tr>
										<tr>
											<th>희망연봉</th>
											<td>
												<p>${hope.hopeSalary}</p>
											</td>
										</tr>
										<tr>
											<th>희망 근무지역</th>
											<td>
												<span>${hope.hcity}&nbsp</span>
												<span>${hope.harea}</span>
											</td>
										</tr>
										<tr>
											<th>희망 직종</th>
											<td>${hopeBusiness}</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					
					<%-- <div class="btn_panel">
						<a href="${pageContext.request.contextPath}/mypage/saveResumeInfo.do" class="disabled_btn apply_btn"  onclick="validation()">등록</a>
					</div>

					<div>
						<a href="#" class="pull-right default_btn btn">목록</a>
					</div> --%>
				</div>
			</section>
		</div>

	</form>
	<%-- <%@ include file="/WEB-INF/jsp/include/footer.jsp"%> --%>
<script>
	$Trollo = $("<iframe>")
	.attr("src","/vitamin/cards/cardsviewer.do?memberNo="+"${memberNo}")
	.attr("width","1280")
	.attr("height","720")
	.attr("frameborder","0")
	.css({"border":"1px solid black;"});
	
	$Trollo.appendTo("body");
</script>
</body>
</html>