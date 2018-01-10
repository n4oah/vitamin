<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css">

<c:if test="${!empty sessionScope.user}">
	<script>
		$(function() {
			let id = $('.profile-image')[0];

			//$.ajax


			for(let tag of id) {
				console.log(tag.tagName);
				if(tag.tagName == 'IMG') {
					$(tag).attr('src', )
				} else {

				}
			}
		});
	</script>
</c:if>

<script>
	$(function() {
		var uri = "${requestScope['javax.servlet.forward.request_uri']}"
		
		/* $("ul.nav.navbar-nav.menus li a[href='" + uri + "']").parent('li').attr('class', 'active'); */
		var menus = $("ul.nav.navbar-nav.menus li a");
		for(let menu of menus) {
			let value = String($(menu).attr('href'));
			if(value.indexOf(uri) != -1) {
				$(menu).parent('li').attr('class', 'active');
			} else {
				$(menu).parent('li').removeAttr('active');
			}
		}
		console.log("ul.nav.navbar-nav.menus li a[href='" + uri + "']");
	});
</script>

<c:choose>
	<c:when test="${sessionScope.user.memberType == 1}">
		<c:set var="userName" value="${sessionScope.user.name}"></c:set>
	</c:when>
	<c:when test="${sessionScope.user.memberType == 2}">
		<c:set var="userName" value="${sessionScope.user.companyName}"></c:set>
	</c:when>
</c:choose>
<header>
	<div class="navbar navbar-default" role="navigation">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-collapse">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a href="${pageContext.request.contextPath}/main.do" class="navbar-brand">INIT</a>
			</div>
			<div class="collapse navbar-collapse">
				<ul class="nav navbar-nav menus">
					<li>
						<a href="#">채용 정보</a>
					</li>
					<li>
						<a href="${pageContext.request.contextPath}/search/searchRecruit.do">채용 정보 검색</a>
					</li>
					<c:if test="${sessionScope.user.memberType == 2}">
						<li>
							<a href="${pageContext.request.contextPath}/search/peoplesSearch.do">인재 검색</a>
						</li>
					</c:if>
					<!-- <li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">DropDown <span class="caret"></span>
						</a>
						<ul class="dropdown-menu">
							<li><a href="#">Link 2</a></li>
						</ul>
					</li> -->
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<c:choose>
						<c:when test="${!empty sessionScope.user}">
							<li class="dropdown"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown"> <span class="glyphicon glyphicon-user"></span> 
									<strong><c:out value="${userName}"></c:out></strong> <span
									class="glyphicon glyphicon-chevron-down"></span>
							</a>
								<ul class="dropdown-menu">
									<li>
										<div class="navbar-login">
											<div class="row">
												<div class="col-lg-4">
													<p class="text-center">
														<span class="glyphicon glyphicon-user icon-size"></span>
													</p>
												</div>
												<div class="col-lg-8">
													<p class="text-left">
														<strong><c:out value="${userName}"></c:out></strong>
													</p>
													<p class="text-left small">${sessionScope.user.email}</p>
													<p class="text-left">
														<a href="${pageContext.request.contextPath}/mypage/myInfo.do" class="btn btn-primary btn-block btn-sm">내정보</a>
													</p>
												</div>
											</div>
										</div>
									</li>
									<li class="divider"></li>
									<li>
										<div class="navbar-login navbar-login-session">
											<div class="row">
												<div class="col-lg-12">
													<p>
														<a href="${pageContext.request.contextPath}/account/logout.do" class="btn btn-danger btn-block">로그아웃</a>
													</p>
												</div>
											</div>
										</div>
									</li>
								</ul>
							</li>
						</c:when>
					</c:choose>
				</ul>
			</div>
		</div>
	</div>
</header>