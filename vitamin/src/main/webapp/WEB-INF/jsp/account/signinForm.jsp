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
		<title>로그인</title>
		<%@ include file="/WEB-INF/jsp/include/basic.jsp"%>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/basic.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/signinForm.css">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		<script src="${pageContext.request.contextPath}/js/signinForm.js"></script>
		<script src="${pageContext.request.contextPath}/js/common/googleLogin.js"></script>		
		<script>
			if('${errorMsg}') {
				swal("ERROR!", '${errorMsg}', "error");
			}
		</script>
	</head>
<body>
	<%@ include file="/WEB-INF/jsp/include/header.jsp" %>
	
	<div id="wrapper" style="margin-top: 0px;">
		<section class="container">
			<div class="row title-box">
				<div class="col-md-12" style="padding: 20px;">
					<div class="col-md-6">
						<div class="panel panel-signin">
							<div class="panel-heading">
								<div class="row">
									<div class="col-md-12">
										<button class="sign-cha-btn" id="private-form-link">로그인</button>
									</div>
								</div>
								<hr>
							</div>
							
							<div class="panel-body">
								<div class="row">
									<div class="col-md-12">
										<form id="signin-form" class="sign-form" action="${pageContext.request.contextPath}/account/signin.do" method="post" role="form" style="display: block;">
											<div class="form-group">
												<input type="text" name="id" id="signin_id" class="form-control" placeholder="아이디">
											</div>
											<div class="form-group">
												<input type="password" name="pwd" id="signin_id" class="form-control" placeholder="비밀번호">
											</div>
											<div class="form-group">
												<div class="form-check text-center">
													<label class="form-check-label">
														<input name="idSave" id="id-save" class="form-check-input terms-check" type="checkbox" value="1"> 아이디 저장
													</label>
													<label class="form-check-label">
														<input name="autoSignin" id="auto-signin" class="form-check-input terms-check" type="checkbox" value="1"> 자동 로그인
													</label>
												</div>
											</div>
											<div class="form-group">
												<div class="row">
													<div class="col-md-6 col-md-offset-3">
														<input type="button" id="signin-btn" class="form-control btn submit" value="로그인">
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
						<div class="form-group signup-btn-wrapper">
							<input type="button" class="btn btn-primary btn-lg col-md-12" src="${pageContext.request.contextPath}/account/signupForm.do" value="회원가입">
							<!-- <input type="button" class="btn btn-primary btn-lg col-md-12" value="네이버로 로그인"> -->
							<input type="button" class="btn btn-primary btn-lg col-md-12 google-login-btn" value="구글로 로그인">
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>
	<%@ include file="/WEB-INF/jsp/include/footer.jsp" %>
</body>
</html>