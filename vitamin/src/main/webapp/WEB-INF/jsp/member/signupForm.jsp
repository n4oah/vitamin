<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>회원가입</title>
		<%@ include file="/WEB-INF/jsp/include/basic.jsp"%>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/basic.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/signupForm.css">
		<script src="${pageContext.request.contextPath}/js/signupForm.js"></script>
	</head>
<body>
	<%@ include file="/WEB-INF/jsp/include/header.jsp" %>
	<div id="wrapper" style="margin-top: 0px;">
		<section class="container">
			<div class="row title-box">
				<div class="col-md-12">
					<div class="col-md-6">
						<h3 class="title">회원가입</h3>
						<div class="panel panel-login">
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
										<form id="private-form" action="https://phpoll.com/login/process" method="post" role="form" style="display: block;">
											<div class="form-group">
												<input type="text" name="username" id="username" tabindex="1" class="form-control" placeholder="Username" value="">
											</div>
											<div class="form-group">
												<input type="password" name="password" id="password" tabindex="2" class="form-control" placeholder="Password">
											</div>
											<div class="form-group text-center">
												<input type="checkbox" tabindex="3" class="" name="remember" id="remember">
												<label for="remember"> Remember Me</label>
											</div>
											<div class="form-group">
												<div class="row">
													<div class="col-sm-6 col-sm-offset-3">
														<input type="submit" name="login-submit" id="login-submit" tabindex="4" class="form-control btn btn-login" value="Log In">
													</div>
												</div>
											</div>
										</form>
										<form id="company-form" action="https://phpoll.com/register/process" method="post" role="form" style="display: none;">
											<div class="form-group">
												<input type="text" name="username" id="username" tabindex="1" class="form-control" placeholder="Username" value="">
											</div>
											<div class="form-group">
												<input type="email" name="email" id="email" tabindex="1" class="form-control" placeholder="Email Address" value="">
											</div>
											<div class="form-group">
												<input type="password" name="password" id="password" tabindex="2" class="form-control" placeholder="Password">
											</div>
											<div class="form-group">
												<input type="password" name="confirm-password" id="confirm-password" tabindex="2" class="form-control" placeholder="Confirm Password">
											</div>
											<div class="form-group">
												<div class="row">
													<div class="col-sm-6 col-sm-offset-3">
														<input type="submit" name="register-submit" id="register-submit" tabindex="4" class="form-control btn btn-register" value="Register Now">
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
						<h3 class="title">약관동의</h3>
						<div class="scrollbar panel">
							<span>
								aa
								af
								f
							</span>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
			</div>
		</section>
	</div>
	<%@ include file="/WEB-INF/jsp/include/footer.jsp" %>
</body>
</html>