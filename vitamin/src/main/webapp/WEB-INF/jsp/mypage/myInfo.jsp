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
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/basic.css">
<link rel='stylesheet prefetch' href='http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css'>
<link rel='stylesheet' href='${pageContext.request.contextPath}/css/myInfo.css'>
</head>
<body>
	<c:set var="memberType" value="${sessionScope.user.memberTypeName}"></c:set>

	<%@ include file="/WEB-INF/jsp/include/header.jsp"%>
	<div id="wrapper" style="margin-top: 0px;">
		<section class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="slider">
						<div id="carousel-example-generic" class="carousel slide"
							data-ride="carousel">
							<div class="carousel-inner" role="listbox">
								<div class="item active">
									<img src="${pageContext.request.contextPath}/image/mypage/logos.png" />
								</div>
								<div class="item">
									<img src="http://placehold.it/1200x400/20BFA9/ffffff&text=CLEAN %26 SMART" />
								</div>
							</div>
							<a class="left carousel-control"
								href="#carousel-example-generic" role="button"
								data-slide="prev"> <span class="fa fa-angle-left"
								aria-hidden="true"></span> <span class="sr-only">Previous</span>
							</a> <a class="right carousel-control"
								href="#carousel-example-generic" role="button"
								data-slide="next"> <span class="fa fa-angle-right"
								aria-hidden="true"></span> <span class="sr-only">Next</span>
							</a>
						</div>
					</div>
					<nav class="navbar navbar-default">
						<div class="navbar-header">
							<button type="button" class="navbar-toggle collapsed"
								data-toggle="collapse" data-target="#mainNav">
								<span class="sr-only">Toggle navigation</span> <span
									class="icon-bar"></span> <span class="icon-bar"></span> <span
									class="icon-bar"></span>
							</button>
							
							<span class="aa glyphicon glyphicon-user icon-size"></span>
							<span class="site-name"><b><c:out value="${userName}"></c:out></b></span>
							<span class="site-description"><c:out value="${memberType}"></c:out></span>
						</div>
						<div class="collapse navbar-collapse" id="mainNav">
							<ul class="nav main-menu navbar-nav">
								<li><a href="#"><i class="fa fa-home"></i> HOME</a></li>
								<li><a href="${pageContext.request.contextPath}/mypage/resumeList.do">이력서 목록</a></li>
								<li><a href="${pageContext.request.contextPath}/">즐겨찾기 기업</a></li>
								<li><a href="${pageContext.request.contextPath}/">트롤로</a></li>
							</ul>
						</div>
					</nav>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					asfasfhfghdgdsfgdfhfghfg
				</div>
			</div>
		</section>
	</div>
	<%@ include file="/WEB-INF/jsp/include/footer.jsp"%>
</body>
</html>