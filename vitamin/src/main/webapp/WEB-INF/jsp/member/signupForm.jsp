<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		<script src="${pageContext.request.contextPath}/js/daum-map-api/daum-address-api.js"></script>
	</head>
<body>
	<%@ include file="/WEB-INF/jsp/include/header.jsp" %>
	
	<c:set var="actionUrl" value="${pageContext.request.contextPath}/member/signup.do" />
	<div id="wrapper" style="margin-top: 0px;">
		<section class="container">
			<div class="row title-box">
				<div class="col-md-12">
					<div class="col-md-6">
						<h3 class="title">회원가입</h3>
						<div class="panel panel-signup">
							<div class="panel-heading">
								<div class="row">
									<div class="col-xs-6">
										<a href="#" class="active" id="private-form-link">개인회원</a>
									</div>
									<div class="col-xs-6">
										<a href="#" id="company-form-link">기업회원</a>
									</div>
								</div>
								<hr>
							</div>
							<div class="panel-body">
								<div class="row">
									<div class="col-lg-12">
										<form id="private-form" action="${actionUrl}?memberType=1" method="post" role="form" style="display: block;">
											<div class="form-group">
												<input type="text" name="id" id="signup_id" class="form-control" placeholder="아이디">
											</div>
											<div class="form-group">
												<input type="password" name="pwd" id="signup_pwd" class="form-control" placeholder="비밀번호">
											</div>
											<div class="form-group">
												<input type="text" id="signup_pwd_chk" class="form-control" placeholder="비밀번호 확인">
											</div>
											<div class="form-group">
												<input type="text" name="name" id="signup_name" class="form-control" placeholder="이름">
											</div>
											<div class="form-group">
												<select class="selectpicker" name="gender">
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
															<input class="form-control" name="email1" id="signup_email1" type="text" placeholder="이메일"/>
														</div>
														<div class="form-group col-md-1" style="top: 10px">@</div>
														<div class="form-group col-md-6" style="padding: 0px; margin: 0px;">
															<input class="form-control" name="email2" id="signup_email2" type="text" placeholder="도메인 주소" />
														</div>
													</div>
												</div>
											</div>
											<div class="form-group">
												<input type="text" name="phoneNumber" id="signup_phoneNumber" class="form-control bfh-phone" data-format="+82 (ddd) dddd-dddd">
												<!-- <input type="tel" class="form-control" placeholder="휴대폰 번호"> -->
											</div>
											<%-- <div class="form-group">
												<select class="selectpicker" name="schoolLevel">
													<optgroup label="최종 학력을 선택해주세요.">
														<c:forEach var="i" items="${slList}">
															<option value="${i.schoolLevelNo}">${i.graduateState}</option>
														</c:forEach>
													</optgroup>
												</select>
											</div> --%>
											<div class="form-group">
						                        <input type="date" id="birthDate" max="<fmt:formatDate value='${todayDate}' pattern='yyyy-MM-dd' />" class="form-control">
											</div>
											<div class="form-group">
												<div class="input-group">
													<input name="postCode" type="text" class="form-control" id="sample6_postcode" placeholder="우편번호" readonly="readonly">
													<span class="input-group-btn">
														<button class="btn btn-secondary" type="button" onclick="sample6_execDaumPostcode()" style="padding-top: 10%; padding-bottom: 10%;">우편번호 찾기</button>
													</span>
												</div>
											</div>
											<div class="form-group">
												<input name="address1" type="text" class="form-control" id="sample6_address" placeholder="주소" readonly="readonly">
											</div>
											<div class="form-group">
												<input name="address2" type="text" class="form-control" id="sample6_address2" placeholder="상세주소">
											</div>
											<div class="form-group">
												<div class="row">
													<div class="col-sm-6 col-sm-offset-3">
														<input type="button" id="private-signup" class="form-control btn btn-login" value="회원가입">
													</div>
												</div>
											</div>
										</form>
										<form id="company-form" action="${actionUrl}?memberType=2" method="post" role="form" style="display: none;">
											
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<h3 class="title">약관동의</h3>
						<div class="scrollbar scrollbar-white">
						    <div class="force-overflow">
						    	<p>

								</p>
						    </div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>
	<%@ include file="/WEB-INF/jsp/include/footer.jsp" %>
</body>
</html>