<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/header.css">

<header>
	<nav class="navbar navbar-default navbar-trans">
		<nav class="navbar navbar-top">
			<div class="container">
				<ul class="nav navbar-nav pull-left">
					<li><a href="#"><span class="glyphicon glyphicon glyphicon-bold text-white"></span></a></li>
					<li><a href="#"><span class="glyphicon glyphicon-globe text-white"></span></a></li>
					<li><a href="#"><span class="glyphicon glyphicon-pushpin text-white"></span></a></li>
				</ul>
				<ul class="nav navbar-nav pull-right account" style="padding: 9px;">
					<li><input type="text" name="id" placeholder="아이디를 입력해주세요." /></li>
					<li><input type="password" name="pwd" placeholder="비밀번호를 입력해주세요." /></li>
					<li>
						<a href="#" class="btn btn-sm btn-success">
							<span class="glyphicon glyphicon-user"></span> Sign In
						</a>
					</li>
					<li>
						<a href="#" class="btn btn-sm btn-primary">
							<span class="glyphicon glyphicon-certificate"></span> Register
						</a>
					</li>
				</ul>
			</div>
		</nav>
		<nav class="navbar navbar-down">
			<div class="container">
				<div class="flex-container">
					<div class="navbar-header flex-item">
						<div class="navbar-brand" href="#">Geek Connect</div>
					</div>
					<ul class="nav navbar-nav flex-item hidden-xs">
						<li><a href="#">Home</a></li>
						<li><a href="#">About</a></li>
						<li><a href="#">Forum</a></li>
						<li><a href="#">Contact</a></li>
						<li><a href="#">FAQ</a></li>
					</ul>
					<ul class="nav navbar-nav flex-item hidden-xs pull-right">
						<li><a href="#" class=""></a></li>
					</ul>
				</div>
			</div>
		</nav>
	</nav>
</header>