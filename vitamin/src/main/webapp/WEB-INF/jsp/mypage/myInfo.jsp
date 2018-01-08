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
	<%@ include file="/WEB-INF/jsp/include/header.jsp"%>
	<div id="wrapper" style="margin-top: 0px;">
		<section class="container">
			<div class="row">
				<div class="col-md-12">
					<header id="header">
						<div class="slider">
							<div id="carousel-example-generic" class="carousel slide"
								data-ride="carousel">
								<div class="carousel-inner" role="listbox">
									<div class="item active">
										<img src="http://placehold.it/1200x400/F34336/F34336&text=WORDPRESS THEME DEVELOPER">
									</div>
									<div class="item">
										<img src="http://placehold.it/1200x400/20BFA9/ffffff&text=CLEAN %26 SMART">
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
								<a class="navbar-brand" href="#"><img class="img-responsive"
									src="http://rolyart.ro/wp-content/uploads/2016/07/roland-maruntelu-freelancer-romania.jpg"></a>
								<span class="site-name"><b>Roland</b> Maruntelu</span> <span
									class="site-description">worpress theme developer</span>
							</div>
							<div class="collapse navbar-collapse" id="mainNav">
								<ul class="nav main-menu navbar-nav">
									<li><a href="#"><i class="fa fa-home"></i> HOME</a></li>
									<li><a href="#">Link</a></li>
									<li><a href="#">Link</a></li>
								</ul>

								<ul class="nav  navbar-nav navbar-right">
									<li><a href="#"><i class="fa fa-facebook"></i></a></li>
									<li><a href="#"><i class="fa fa-twitter"></i></a></li>
									<li><a href="#"><i class="fa fa-google-plus"></i></a></li>
								</ul>
							</div>
						</nav>
					</header>
				</div>
			</div>
		</section>
	</div>
	<%@ include file="/WEB-INF/jsp/include/footer.jsp"%>
</body>
</html>