<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>회원가입</title>
		<%@ include file="/WEB-INF/jsp/include/basic.jsp"%>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/basic.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/signupForm.css">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		<script src="${pageContext.request.contextPath}/js/signupForm.js"></script>
		<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
		<script src="${pageContext.request.contextPath}/js/daum-map-api/daum-address-api.js"></script>
		<script>
			$(function() {
				$('#private-input-id').blur(function() {
					$.ajax({
						url: "${pageContext.request.contextPath}/account/idOverlapChk.do",
						dataType: "json",
						data: {id: $('#private-input-id').val()},
						success: function(chk) {
							var $idInput = $('#private-input-id')[0];
							
							console.log(idOverlapChk);
							idOverlapChk = chk;
							
							if(chk == true) {
								createLabel($idInput, '이미 등록된 아이디 입니다.', {'color': 'red'});
							} else {
								createLabel($idInput, '사용 가능한 아이디 입니다.', {'color': 'blue'});
							}
						}
					});
				});
			});
		</script>
	</head>
<body>
	<%@ include file="/WEB-INF/jsp/include/header.jsp" %>
	
	<c:set var="actionUrl" value="${pageContext.request.contextPath}/account/signup.do" />
	
	<div id="wrapper" style="margin-top: 0px;">
		<section class="container">
			<div class="row title-box">
				<div class="col-md-12">
					<div class="col-md-6">
						<h3 class="title">회원가입</h3>
						<div class="panel panel-signup">
							<div class="panel-heading">
								<div class="row">
									<div class="col-md-6">
										<button class="sign-cha-btn active" id="private-form-link">개인회원</button>
									</div>
									<div class="col-md-6">
										<button id="company-form-link" class="sign-cha-btn">기업회원</button>
									</div>
								</div>
								<hr>
							</div>
							<div class="panel-body">
								<div class="row">
									<div class="col-md-12">
										<form id="private-form" class="sign-form" action="${actionUrl}?memberType=1" method="post" role="form" style="display: block;">
											<div class="form-group">
												<input type="text" name="id" id="private-input-id" class="form-control" placeholder="아이디">
											</div>
											<div class="form-group">
												<input type="password" name="pwd" id="private-input-pwd" class="form-control" placeholder="비밀번호">
											</div>
											<div class="form-group">
												<input type="password" id="private-input-pwd_chk" class="form-control" placeholder="비밀번호 확인">
											</div>
											<div class="form-group">
												<input type="text" name="name" id="private-input-name" class="form-control" placeholder="이름">
											</div>
											<div class="form-group">
												<select class="selectpicker" name="member.gender">
													<optgroup label="성별을 선택해주세요.">
														<option value="m" class="fa fa-mars">남성</option>
														<option value="w" class="fa fa-venus">여성</option>
													</optgroup>
												</select>
											</div>
											<div class="form-group">
												<div class="row">
													<div class="col-md-12">
														<div class="form-group col-md-5" style="padding: 0px; margin: 0px;">
															<input class="form-control" name="email1" id="private-input-email1" type="text" placeholder="이메일"/>
														</div>
														<div class="form-group col-md-1" style="top: 10px">@</div>
														<div class="form-group col-md-6" style="padding: 0px; margin: 0px;">
															<input class="form-control" name="email2" id="private-input-email2" type="text" placeholder="도메인 주소" />
														</div>
													</div>
												</div>
											</div>
											<div class="form-group">
												<input type="text" name="member.phoneNumber" id="private-input-phoneNumber" class="form-control bfh-phone" maxlength="19" data-format="+82 (ddd) dddd-dddd">
											</div>
											<div class="form-group">
						                        <input type="date" name="member.birthDate" id="birthDate" max="<fmt:formatDate value='${todayDate}' pattern='yyyy-MM-dd' />" class="form-control">
											</div>
											<div class="form-group">
												<div class="input-group">
													<input name="address.postCode" type="text" class="form-control" id="sample6_postcode" placeholder="우편번호" readonly="readonly">
													<span class="input-group-btn">
														<button class="btn btn-secondary" type="button" onclick="sample6_execDaumPostcode()" style="padding-top: 10%; padding-bottom: 10%;">우편번호 찾기</button>
													</span>
												</div>
											</div>
											<div class="form-group">
												<input name="address.address1" type="text" class="form-control" id="sample6_address" placeholder="주소" readonly="readonly">
											</div>
											<div class="form-group">
												<input name="address.address2" type="text" class="form-control" id="sample6_address2" placeholder="상세주소">
											</div>
											<div class="form-group">
												<div class="row">
													<div class="col-sm-6 col-sm-offset-3">
														<input type="button" id="private-signup" class="form-control btn submit" value="회원가입">
													</div>
												</div>
											</div>
											<input type="text" name="address.sigunguCode" class="hide" id="sample6_sigunguCode"/>
										</form>
										<form id="company-form" class="sign-form" action="${actionUrl}?memberType=2" method="post" role="form" style="display: none;">
											<div class="form-group">
													<input type="text" name="id" id="company-input-id" class="form-control" placeholder="아이디">
											</div>
											<div class="form-group">
												<input type="password" name="pwd" id="company-input-pwd" class="form-control" placeholder="비밀번호">
											</div>
											<div class="form-group">
												<input type="password" id="company-input-pwd_chk" class="form-control" placeholder="비밀번호 확인">
											</div>
											<div class="form-group">
												<input type="text" name="company.companyName" id="company-input-companyName" class="form-control" placeholder="기업 이름">
											</div>
											<div class="form-group">
												<input type="text" name="company.licenseNumber" id="company-input-licenseNumber" class="form-control bfh-phone" data-format="ddd-dd-ddddd" maxlength="12" placeholder="사업자 등록번호">
											</div>
											<div class="form-group">
												<input type="text" name="company.employeeCount" id="company-input-employeeCount" class="form-control" placeholder="사원수">
											</div>
											<div class="form-group">
												<div class="row">
													<div class="col-sm-6 col-sm-offset-3">
														<input type="button" id="private-signup" class="form-control btn submit" value="회원가입">
													</div>
												</div>
											</div>
										</form>
										
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<!-- termsList -->
						<h3 class="title">약관동의</h3>
						<c:forEach var="terms" items="${termsList}">
							<div class="scrollbar scrollbar-white">
							    <div class="force-overflow">
							    	${fn:replace(terms.content, newLine, "<br/>")}
							    </div>
							</div>
							<div class="form-check">
								<label class="form-check-label">
									<input class="form-check-input terms-check" type="checkbox" value="terms">
									${terms.title}
								</label>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</section>
	</div>
	<%@ include file="/WEB-INF/jsp/include/footer.jsp" %>
</body>
</html>