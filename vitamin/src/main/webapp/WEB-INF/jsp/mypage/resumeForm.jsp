<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>이력서 등록</title>
<%@ include file="/WEB-INF/jsp/include/basic.jsp"%>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/basic.css">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- <link rel="stylesheet" href="/resources/demos/style.css"> -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/resume.css">
<!-- <link rel="stylesheet"
	href="path/to/font-awesome/css/font-awesome.min.css"> -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- <script src="https://use.fontawesome.com/942e94bfdb.js"></script> -->
<%-- <script src="${pageContext.request.contextPath}/js/resumeInfo.js"></script> --%>
<script src="${pageContext.request.contextPath}/js/resumeForm.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript"
    src="//dapi.kakao.com/v2/maps/sdk.js?appkey=316e409a59e29fd51e1dcbf1e4769f1c&libraries=services"></script>

<style type="text/css">

.float-control{
	width:220px;
}

.ui-autocomplete {
    max-height: 100px;
    overflow-y: auto;
    /* prevent horizontal scrollbar */
    overflow-x: hidden;
  }
	.horizontal_table .table > tbody > tr:last-child > th, .horizontal_table .table > tbody > tr:last-child > td {
	    border-bottom: 1px solid #c1bcbc;
	    border-left: 1px solid #c1bcbc;
	    border-right: 1px solid #c1bcbc;
	}
	.horizontal_table .table > tbody > tr > th {
	    /*width: 140px;*/
	    padding: 10px 15px;
	    background-color: #e5e7e9;
	   	font-weight: 400;
	    border-right: 1px solid #c1bcbc;
	    border-left: 1px solid #c1bcbc;
	}
	.table>tbody>tr>td, .table>tbody>tr>th, .table>tfoot>tr>td, .table>tfoot>tr>th, .table>thead>tr>td, .table>thead>tr>th {
	    padding: 8px;
	    line-height: 1.42857143;
	    vertical-align: top;
	    border-top: 1px solid #c1bcbc;
	    border-right: 1px solid #c1bcbc;
	    border-left: 1px solid #c1bcbc;
	}
	#myModal table.table li {
	    float: left;
	    list-style: none;
	}
	@media (min-width: 992px) {
		.modal-lg {
		  width: 900px;
		}
	}
	@media (min-width: 768px) {
		.modal-xl {
			width: 90%;
			max-width:1200px;
		}
	}
/* label{
	cursor:pointer;
} */
</style>
</head>
<body>
	<%@ include file="/WEB-INF/jsp/include/header.jsp"%>
	<!-- <form class="form-horizontal"> -->

		<div id="wrapper" style="margin-top: 0px;">
			<section class="container" style="margin-bottom: 100px;">
				<div class="row">
					<div class="top">
						<div class="top_title">
							<h2>이력서 작성</h2>
						</div>
					</div>
 					<form name="resumeForm"action="${pageContext.request.contextPath}/mypage/intermediateSave.do?memberNo=${user.memberNo}" method="post" class="form-horizontal">
					<div class="horizontal_table table_wrap">
						<h4 class="table_title">프로필</h4>
						<img class="profile-image" attr="${user.accountNo}" style="width:70px;height:70px" >
							<!-- <table class="table">
								<tbody>
									<tr>
										<td class="col-md-2"></td>
									</tr>
								</tbody>
							</table> -->
								
					</div>
					
					<div class="horizontal_table table_wrap">
						<h4 class="table_title">이력서제목</h4>
								<input type="text" class="form-control" name="resumeTitle" id="resumeTitle"
									placeholder="이력서 제목을 입력하세요">
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
											style="width: 20%" value="${user.name}"placeholder="이름을 입력해주세요" readonly="readonly"></td>
									</tr>
									<tr>
										<th>생년월일</th>
										<td><input type="text" class="float-control" id="birthDate"
											style="width: 20%" value="<fmt:formatDate value="${user.birthDate}" pattern="yyyy-MM-dd" />"placeholder="생년월일" readonly="readonly"></td>
									</tr>
									<tr>
										<th>주소</th>
										<td><input type="text" class="float-control" id="postcode"
											style="width: 20%" value="${address.postCode}"placeholder="우편번호"
											onclick="sample6_execDaumPostcode()" readonly="readonly"> 
											<input type="text" class="float-control" id="address"
											style="width: 80%" value="${address.address }" placeholder="주소" readonly="readonly">
											
											<!-- <input type="text" class="float-control" id="address2"
											style="width: 80%" placeholder="상세주소"> --></td>
									</tr>
									<tr>
										<th>휴대전화</th>
										<td>
											<input type="text" class="float-control"  value="${user.phoneNumber}" style="width: 80%"> 
											<!-- <span>-</span> <input
											type="text" class="float-control" maxlength="4"
											style="width: 60px"> <span>-</span> <input
											type="text" class="float-control" maxlength="4"
											style="width: 60px"> -->
										</td>
									</tr>
									<tr>
										<th>이메일</th>
										<td><input class="float-control"
											id="signup_email1" type="text" value="${user.email}" placeholder="이메일"
											style="width: 80%" readonly="readonly"/> <!-- <span>@</span> <input
											class="float-control" name="email2" id="signup_email2"
											type="text" placeholder="도메인 주소" style="width: 55%" readonly="readonly"/> -->
											</td>
									</tr>
									<tr>
										<th>성별</th>
										<td>
											<input class="float-control" type="text" readonly="readonly"  value="${user.genderName}"style="width:20%">
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
											<select class="float-control" id="jobState" name="jobState">
													<option value="" class="fa">구직상태 선택</option>
													<option value="0" class="fa">구직준비중(재학생)</option>
													<option value="1" class="fa">구직중</option>
													<option value="2" class="fa">재직중</option>
											</select>
										</td>
									</tr>
									<tr>
										<th>결혼여부</th>
										<td><select class="float-control" id="marryState" name="marryState">
												<option value="" class="fa">결혼여부 선택</option>
												<option value="0" class="fa">미혼</option>
												<option value="1" class="fa">기혼</option>
										</select></td>
									</tr>
									<tr>
										<th>보훈대상</th>
										<td><select class="float-control" id="bohonState" name="bohoonState">
												<option value="" class="fa">보훈대상 선택</option>
												<option value="0" class="fa">비대상</option>
												<option value="1" class="fa">대상</option>
										</select></td>
									</tr>
									<tr>
										<th>고용지원금대상</th>
										<td><select class="float-control" id="supportState" name="supportState">
												<option value="" class="fa">고용지원금대상 선택</option>
												<option value="0" class="fa">비대상</option>
												<option value="1" class="fa">대상</option>
												<option value="2" class="fa">재직중</option>
										</select></td>
									</tr>
									<tr>
										<th>병역대상</th>
										<td>
											<select class="float-control" id="armyServiceState" name="armyServiceState">
													<option value="" class="fa">병역대상 선택</option>
													<option value="0" class="fa">비대상</option>
													<option value="1" class="fa">군필</option>
													<option value="2" class="fa">미필</option>
													<option value="3" class="fa">면제</option>
													<option value="4" class="fa">복무중</option>
											</select>
												<span>면제사유</span>
												<input type="text" class="float-control" id="armyServiceReason" name="armyServiceReason" disabled="disabled" style="width:60%">
										</td>
									</tr>
								</tbody>
							</table>
							<!--/.table-->
							<!-- <div>
								<button style="float: right" class="intermediate_save btn-primary">중간저장</button>
							</div> -->
<!-- 					</form> -->
							
							
						</div>
						</div>
					
		
						
						<div class="horizontal_table table_wrap">
							<div>
								<h4 class="table_title">학력사항</h4>
									<span style="float: right">대학교이상</span>
									<!-- name="schoolLevelNo" value="2"  --> 
									<input type="radio"	id="ch_schoolevel2" name="schoolLevelNoTmp" value="2" style="float: right"> <span
									style="float: right">고등학교&nbsp</span> 
									<input type="radio" id="ch_schoolevel1" name="schoolLevelNoTmp" value="1" style="float: right"> <span
									style="float: right">고등학교 미만 졸업/중퇴인 경우 선택&nbsp</span> 
									<input type="radio" id="ch_schoolevel0" name="schoolLevelNoTmp" value="0" checked="checked"  style="float: right">
							</div>
							<div class="highschool">
								<table class="table">
									<tbody>
										<tr>
											<th>재학기간</th>
											<td>
												<input type="date" class="float-control highschool" name="schoolStartDate" id="highenter" readonly="readonly">
												<strong> ~ </strong>
												<input type="date" class="float-control highschool" name="schoolEndDate" id="highgraduate" readonly="readonly">
											</td>
										</tr>
										<tr>
											<th>학교명</th>
											<td>
											<input type="text" class="float-control highschool" name="schoolTitle" id="highname" placeholder="학교이름">
											</td>
										</tr>
										<tr>
											<th>전공</th>
											<td>
												<select class="float-control highschool" name="major">
													<option class="fa" value="">전공선택</option>
													<option class="fa" value="예체능">예체능</option>
													<option class="fa" value="문과계열">문과계열</option>
													<option class="fa" value="이과계열">이과계열</option>
													<option class="fa" value="실업계">실업계</option>
												</select>	
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
												<input type="date" class="float-control university" id="univenter" name="schoolStartDate" readonly="readonly">
												<strong> ~ </strong> 
												<input type="date" class="float-control university" id="univgraduate" name="schoolEndDate" readonly="readonly">
											</td>
										</tr>
										<tr>
											<th>학교명</th>
											<td>
												<input type="text" class="float-control university" name="schoolTitle" id="univname" placeholder="학교이름">
												<strong> -- </strong>
												<select class="float-control university" name="schoolLevelNoTmp">
													<option class="fa" value="2">대학교졸업</option>
													<option class="fa" value="3">대학원석사졸업</option>
													<option class="fa" value="4">대학원박사졸업</option>
												</select>
											</td>
										</tr>
										<tr>
											<th>전공</th>
											<td><input type="text" class="float-control university" name="major" id="major"
												placeholder="전공"></td>
										</tr>
										<tr>
											<th>학점</th>
											<td>
												<input type="text" class="float-control university" name="schoolScore" id="myscore" maxlength="3" style="width: 50px"> 
												<span>/</span>
												<select class="float-control university" name="schoolScoreStandard" id="basescore" style="width:10%">
													<option value="4.5">4.5</option>
													<option value="4.3">4.3</option>
													<option value="100">100</option>
												</select>
											</td>
										</tr>
									</tbody>
								</table>
								<!--/.table-->
								
							</div>
							<!-- <div>
								<button style="float: right" class="intermediate_save btn-primary">중간저장</button>
							</div> -->
						</div>
						
						
							<div class="horizontal_table table_wrap">
								<h4 class="table_title">경력사항</h4>
								<br>
								<table class="table">
									<tbody>
										<tr>
											<th rowspan="2">경력사항</th>
											<td>
												 <input type="radio" name="careerState" id="newcomer" checked="checked" value="1">신입 
												 <input type="radio" name="careerState" id="employe" value="2">경력
											</td>
										</tr>
										<tr>
											<td>
												<div>
													<!-- <input type="checkbox" id="repitation_removal" disabled="disabled">중복기간 빼기&nbsp --> 
													<input type="checkbox" id="direct_input" disabled="disabled">직접입력
													<input type="text" maxlength="2" class="float-control" name="careerYears" id="careerYears" style="width: 50px" disabled="disabled"> 
													<span>년</span> 
												</div>
												<!-- <input type="text" maxlength="2" class="float-control" id="emmonth" style="width: 50px" disabled="disabled"> 
												<span>개월</span> -->
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
							<div class="career">
							<div class="horizontal_table table_wrap careerStatement">
								<table class="table">
									<tbody>
										<tr>
											<th>근무기간</th>
											<td>
											<select class="float-control" id="prevCompanyWorking" name="prevCompanyWorking">
												<option class="fa" value="">근무여부</option>
												<option class="fa" value="0">퇴사</option>
												<option class="fa" value="1">재직중</option>
											</select> <input class="float-control prevCompanyStart" type="date" name="prevCompanyStart"
												style="width: 150px" placeholder="입사일"> 
												<span>~</span>
												<input class="float-control prevCompanyEnd" type="date" name="prevCompanyEnd"
												style="width: 150px" placeholder="퇴사일"></td>
										</tr>
										<tr>
											<th>회사명</th>
											<td><input class="float-control" type="text" name="prevCompanyName"
												style="width: 80%"></td>
										</tr>
										<tr>
											<th>근무부서</th>
											<td><input class="float-control" type="text" name="prevCompanyDepartment"
												style="width: 80%"></td>
										</tr>
										<tr>
											<th>근무지역</th>
											<td><select class="float-control" name="prevCompanyArea">
													<option value="">지역선택</option>
													<c:forEach var="city" items="${clist}">
														<option class="fa" value="${city.cityCode}">${city.subName}</option>
													</c:forEach>
											</select></td>
										</tr>
										<tr>
											<th>직급(직책)</th>
											<td><input class="float-control" type="text"
												id="position" name="prevCompanyPosition"style="width: 60%"> 
												<input class="float-control" type="text" name="prevCompanyYears" id="career_year"
												style="width: 10%"> <span>년차</span></td>
										</tr>
										<tr>
											<th>연봉</th>
											<td><input class="float-control" maxlength="5" type="text" id="prevCompanySalary" name="prevCompanySalary"
												style="width: 100px"> <span>만원<span><!-- <input class="float-control"
												type="text" style="width: 60px" value="만원"
												readonly="readonly"> --></td>
										</tr>
										<tr>
											<th>직종</th>
											<td><input class="float-control" type="text" name="prevCompanyType"
												id="work_type" style="width: 100px"></td>
										</tr>
										<tr>
											<th>담당업무</th>
											<td style="padding:0px"><textarea class="textarea-control" name="prevCompanyCharge" rows="10"
													cols="80%"></textarea></td>
										</tr>
										<tr>
											<th>퇴사사유</th>
											<td><select class="float-control prevComanyReason" name="prevCompanyReason" >
													<option class="fa" value="퇴사사유">퇴사사유</option>
													<option class="fa" value="업직종 전환">업직종 전환</option>
													<option class="fa" value="근무조건">근무조건</option>
													<option class="fa" value="경영악화">경영악화</option>
													<option class="fa" value="계약만료">계약만료</option>
													<option class="fa" value="출산/육아">출산/육아</option>
													<option class="fa" value="학업">학업</option>
													<option class="fa" value="유학">유학</option>
													<option class="fa" value="개인사정">개인사정</option>
													<option class="fa" value="직접입력">직접입력</option>
											</select> <input type="text" class="float-control inputprevCompanyReason" name="prevCompanyReason" disabled="disabled" style="width:50%">
											</td>
										</tr>
									</tbody>
								</table>
								<br>
								<table class="table">
									<tbody>
										<tr>
											<th>경력기술서</th>
											<td style="padding:0px" >
												<textarea class="textarea-control prevCompanyCareerDescribe" name="prevCompanyCareerDescribe" rows="10"
													cols="80%"></textarea>
											</td>
										</tr>
									</tbody>
								</table>
								</div>
						</div>
							<div class="horizontal_table table_wrap">
								<h4 class="table_title">자격증</h4>
								<br>
								<div class="certification">
								<table class="table">
									<tbody>
										<tr>
											<th>항목선택</th>
											<td>
											<input type="text" class="float-control" name="certificationCate" value="자격증" readonly="readonly">
											<!-- 
											<select class="float-control" name="certificationCate">
													<option class="fa" value="">항목선택</option>
													<option class="fa" value="0">자격증</option>
													<option class="fa" value="1">어학자격증</option>
													<option class="fa" value="2">수상내역/공모전</option>
											</select>
													 -->
											</td>
										</tr>
										<tr>
											<th>자격증</th>
											<td>
												<input type="text" class="float-control certificationTitle" name="certificationTitle"style="width: 50%">
											
											</td>
										</tr>
										<tr>
											<th>발행처</th>
											<td>
												<input type="text" class="float-control licensingDepartment" name="certificationOffice" style="width: 50%">
											</td>
										</tr>
										<tr>
											<th>합격구분</th>
											<td><select class="float-control" name="certificationDivision">
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
								<!-- <div>
									<button style="float: right" class="intermediate_save btn-primary">중간저장</button>
								</div> -->
							</div>
							<div class="addCertification">
							</div>
							<div class="deleteCertication">
								<input type="button" style="float: right" class="add btn-danger btn-xs" value="추가"/>
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
												<select class="float-control" name="hopeWork">
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
												</select>
											</td>
										</tr>
										<tr>
											<th>희망연봉</th>
											<td>
												<select class="float-control" name="hopeSalary">
													<option class="fa">회사내규에 따름</option>
													<c:forEach var="i" begin="1800" end="4000" step="200">
														<option class="fa" value="${i}">${i}</option>
													</c:forEach>
													<c:forEach var="i" begin="5000" end="9000" step="1000">
														<option class="fa" value="${i}">${i}</option>
													</c:forEach>
													<option class="fa" value="1억원이상">1억원이상</option>
													<option class="fa" value="면접후 결정">면접후 결정</option>
											</select>
											</td>
										</tr>
										<tr>
											<th>희망 근무지역</th>
											<td>
												<select class="float-control" name="cityCode" id="hope_city">
													<option value="">지역선택</option>
													<c:forEach var="city" items="${clist}">
														<option class="fa" value="${city.cityCode}">${city.subName}</option>
													</c:forEach>
												</select>
												<select class="float-control" name="areaCode" id="hope_area">
												</select>
											</td>
										</tr>
										<tr>
											<th>희망 직종</th>
											<td>
												<input type="text" id="hope_bussiness" class="float-control" readonly="readonly" style="width:80%">
												<input type="text" name="businessNo" id="hope_bussiness_no" style="display:none;" readonly="readonly">
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						
					</div>
					
					<div class="btn_panel">
						<input type="button" style="float: right" class="intermediate_save btn-primary" onclick="validation()" value="저장"/>
					</div> 
					
					
				</form>
				</div>
			</section>
		</div>

  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-xl">

      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">직종</h4>
        </div>
        <div class="modal-body">
        <div class="horizontal_table table_wrap">
          <table class="table">
          	<tbody>
         		<c:forEach var="b" items="${bt}" varStatus="loop">
         			<c:if test="${b.businessOrder eq 0}">
         			<c:if test="${loop.first == false}">
         			</div>
         			</td>
         			</tr>
         			</c:if>
         			<tr>
         			<th>${b.businessContent}</th>
         			<td>
         			<div>
         			</c:if>
         			<c:if test="${b.businessOrder ne 0}">
         			<ul>
	         			<li class="col-md-2">
		         			<label>
		         				<input type="checkbox" id="${b.businessContent}" class="selectedBusiness" name="selectedBusiness" attr="${b.businessContent}" value="${b.businessNo}"/>
		         				<span class="content">${b.businessContent}</span>
		         			</label>
	         			</li>
         			</ul>
         			</c:if>
	          	</c:forEach>
         		</div>
	          	</td>
         		</tr>
         		
          	</tbody>
          </table>
        </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
  


	<!-- </form> -->
	<%@ include file="/WEB-INF/jsp/include/footer.jsp"%>
<script>


$(document).ready(function(){
	 $('.highschool').hide();
	 $('.highschool').attr("disabled","disabled");
	 $('.university').hide();
	 $('.university').attr("disabled","disabled");
	 $('.careerStatement').hide();
	 
	 $('#ch_schoolevel3').click(function(){
		 $('.highschool').hide();
		 $('.university').hide();
	 });
	 
	 $('#ch_schoolevel2').click(function(){

		 $('.highschool').removeAttr("disabled","disabled");
		 $('.university').attr("disabled","disabled");
		 $('.university').hide();
		 $('.highschool').show();
	 });
	 
	 $('#ch_schoolevel1').click(function(){
		 $('.highschool').attr("disabled","disabled");
		 $('.university').removeAttr("disabled","disabled");
		 $('.highschool').hide();
		 $('.university').show();
		 
	 });
	 
	 
	 
	 $("#armyServiceState").on("change",function(){
		if($('#armyServiceState').val()=="3"){
			$('#armyServiceReason').removeAttr("disabled","disabled");
		}else{
			$('#armyServiceReason').attr("disabled","disabled");
		}
	 });
	 
	 
	 
	 
	 
	 $("#newcomer").click(function(){
		 
		 $('#repitation_removal').removeAttr("checked","checked");
		 $('#direct_input').removeAttr("checked","checked");
		 $('#repitation_removal').attr("disabled","disabled");
		 $('#direct_input').attr("disabled","disabled");
		 $('#careerYears').val("");
		 $('#emmonth').val("");
		 $('#careerYears').attr("disabled","disabled");
		 $('#emmonth').attr("disabled","disabled");
		 $('.careerStatement').hide();
		 
	 });
	 
	 $('#direct_input').click(function(){
			if($("#direct_input").prop('checked')==true){
				$('#careerYears').removeAttr("disabled","disabled");
				$('#emmonth').removeAttr("disabled","disabled");
				$('.prevCompanyStart').attr("disabled","disabled");
				$('.prevCompanyEnd').attr("disabled","disabled");
				$('.prevCompanyStart').val("");
				$('.prevCompanyEnd').val("");
			}else{
				$('#careerYears').attr("disabled","disabled");
				$('#emmonth').attr("disabled","disabled");
				$('.prevCompanyStart').removeAttr("disabled","disabled");
				$('.prevCompanyEnd').removeAttr("disabled","disabled");
			}
	 });
	 
	 $("#employe").click(function(){
		 $('#repitation_removal').removeAttr("disabled","disabled");
		 $('#direct_input').removeAttr("disabled","disabled");
		 $('.careerStatement').show();
	 });
	 
	 
	 $("#prevComanyReason").on("change",function(){
		  if($(".prevComanyReason").val()=="직접입력"){
			 $(".inputprevCompanyReason").removeAttr("disabled","disabled");
		 }else{
			 $(".inputprevCompanyReason").attr("disabled","disabled");
		 } 
	 });
	 
	 
	$("#hope_city").on("change",function(e){
		$.ajax({
			url:"${pageContext.request.contextPath}/mypage/areaSelect.do?cityCode="+$("#hope_city").val(),
			success:function(data){
				data = JSON.parse(data)
				var html="";
				for(var i = 0;i<data.length;i++){
					html += "<option value="+data[i].areaCode+">"+data[i].name+"</option>";
				}
				$("#hope_area").html(html);
			}
		});
	});
	
	
	 /* $( ".certificationTitle" ).autocomplete({
	        source : function( request, response ) {
	             $.ajax({
	                    type: 'post',
	                    url: "${pageContext.request.contextPath}/mypage/certificationSelect.do",
	                    dataType: "json",
	                    data: { "name" : request.term },
	                    success: function(data) {
	                    
	                        //서버에서 json 데이터 response 후 목록에 뿌려주기 위함
	                          response(
	                             $.map(data, function(item) {
	                                return {
	                                    label: item.name,
	                                    value: item.name,
	                                    no: item.licensingDepartmentNo
	                                }
	                            })
	                            )
	                    	}
	                    });
	               },
	        minLength: 2,
	        select: function( event, ui ) {
	             $.ajax({
	            	 url:"${pageContext.request.contextPath}/mypage/licensingDepartment.do?licensingDepartmentNo="+ui.item.no,
	            	 dataType:"json",
	            	 success: function(data){
	            		 $("#licensingDepartment").val(data.name);
	            	 }
	             });
	        }
	    }); */
	
	$( "#major" ).autocomplete({
        source : function( request, response ) {
             $.ajax({
                    type: 'post',
                    url: "${pageContext.request.contextPath}/mypage/majorSelect.do",
                    dataType: "json",
                    data: { "majorCategory" : request.term },
                    success: function(data) {
                    
                        //서버에서 json 데이터 response 후 목록에 뿌려주기 위함
                          response(
                             $.map(data, function(item) {
                                return {
                                    value: item.majorCategory,
                                    label:item.majorCategory,
                                    no: item.majorNo
                                }
                            })
                            )
                    	}
                    });
               },
        minLength: 2
    });
	
	
	
	
	 $('.prevCompanyEnd').change(function(){
		 
		 var workStart = new Date($(".prevCompanyStart").val());
		 var workEnd= new Date($(this).val());
		 var year= 1000*60*60*24*365;
		 var workTerm = (workEnd-workStart)/year;
		 var getYear = workEnd.getFullYear()-workStart.getFullYear();
		 var getMonth = workEnd.getMonth()-workStart.getMonth();
		 var getDate = workEnd.getDate()-workStart.getDate();
		 
		 var year= 1000*60*60*24*365;
		 var workTerm = (workEnd-workStart)/year;
		 if(!isNaN(workStart)){
			 if(getMonth =='0' && getDate=='0'){
				$('#careerYears').val(getYear);
			}else if(getMonth !='0' || getDate !='0'){
				getYear = getYear-1;
				$('#careerYears').val(getYear);
			}
		 }
		
	 });
	 
	$('.prevCompanyStart').change(function(){
		 
		 var workStart = new Date($(this).val());
		 var workEnd = new Date($(".prevCompanyEnd").val());
		 var getYear = workEnd.getFullYear()-workStart.getFullYear();
		 var getMonth = workEnd.getMonth()-workStart.getMonth();
		 var getDate = workEnd.getDate()-workStart.getDate();
		 
		 var year= 1000*60*60*24*365;
		 var workTerm = (workEnd-workStart)/year;
		 if(!isNaN(workEnd)){
			if(getMonth =='0' && getDate=='0'){
				$('#careerYears').val(getYear);
			}else if(getMonth !='0' || getDate !='0'){
				getYear = getYear-1;
				$('#careerYears').val(getYear);
			}
		 }
	
	 });
	
});

/* $('.add').live("click",function(){
	$('.addCertification').append($('.certification').html());
});
$('.add').one("click",function(){
	$('.deleteCertication').append($("<input>").prop({"type":"button", "class":"btn-danger delete btn-xs","value":"삭제"}).css("float","right"));
});
$('.delete').click(function(){
	$('')
}); */

$('.certificationTitle').live("click",function(){
	var $this = $(this);
	$( this ).autocomplete({
	    source : function( request, response ) {
	         $.ajax({
	                type: 'post',
	                url: "${pageContext.request.contextPath}/mypage/certificationSelect.do",
	                dataType: "json",
	                data: { "name" : request.term },
	                success: function(data) {
	                
	                    //서버에서 json 데이터 response 후 목록에 뿌려주기 위함
	                      response(
	                         $.map(data, function(item) {
	                            return {
	                                label: item.name,
	                                value: item.name,
	                                no: item.licensingDepartmentNo
	                            }
	                        })
	                        )
	                	}
	                });
	           },
	    minLength: 2,
	    select: function( event, ui ) {
	         $.ajax({
	        	 url:"${pageContext.request.contextPath}/mypage/licensingDepartment.do?licensingDepartmentNo="+ui.item.no,
	        	 dataType:"json",
	        	 success: function(data){
	        		 console.log(data.name);
	        		 console.log($this);
	        		 $this.parents("tr").next().find("input").val(data.name);
	        	 }
	         });
	    }
	});
});












</script>
</body>
</html>