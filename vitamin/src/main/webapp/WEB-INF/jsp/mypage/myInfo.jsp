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
<script src='${pageContext.request.contextPath}/js/myInfo.js'></script>
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
					<div class="content-wrapper">
				        <div class="page-header">
				            <h3 class="reviews">잡동사니</h3>
				            <div class="logout">
				                <p>
		                            <a href="#" class="btn btn-outlined btn-theme" data-wow-delay="0.7s" data-toggle="modal" data-target="#largeModal">쪽지쓰기</a>
		                            
									<div class="modal fade" id="largeModal" tabindex="-1" role="dialog" aria-labelledby="largeModal" aria-hidden="true">
									    <div class="modal-dialog modal-lg">
									        <div class="modal-content">
									            <div class="modal-header">
									                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
									                <h4 class="modal-title" id="myModalLabel">쪽지</h4>
									            </div>
									            <div class="modal-body">
									                <form role="form">
									                    <h3 style="text-align: center; font-weight: bold;">쪽지 쓰기</h3>
									    				<div class="form-group">
															<input type="text" class="form-control" id="name" name="name" placeholder="상대방 아이디" required>
														</div>
														<div class="form-group">
															<input type="text" class="form-control" id="subject" name="subject" placeholder="제목" required>
														</div>
									                    <div class="form-group">
									                    <textarea class="form-control" type="textarea" id="message" placeholder="보낼 쪽지 내용" maxlength="500" rows="7"></textarea>
									                        <span class="help-block">
									                        <p id="characterLeft" class="help-block "></p></span>                    
									                    </div>
												        <!-- <button type="button" id="submit" name="submit" class="btn btn-primary pull-right">Submit Form</button> -->
											        </form>
									            </div>
									            <div class="modal-footer">
									                <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
									                <button type="button" class="btn btn-primary">쪽지 보내기</button>
									            </div>
									        </div>
									    </div>
									</div>
		                        </p>
				            </div>
				        </div>
				        <div class="comment-tabs">
						    <ul class="nav nav-tabs" role="tablist">
						        <li class="active">
						            <a href="#letter-recv" role="tab" data-toggle="tab">
						                <h4 class="reviews text-capitalize">받은 쪽지함</h4>
						            </a>
						        </li>
						        <li>
						            <a href="#letter-send" role="tab" data-toggle="tab">
						                <h4 class="reviews text-capitalize">보낸 쪽지함</h4>
						            </a>
						        </li>
						        <li>
						            <a href="#diary" role="tab" data-toggle="tab">
						                <h4 class="reviews text-capitalize">일정표</h4>
						            </a>
						        </li>
						        <li>
						            <a href="#account-setting" role="tab" data-toggle="tab">
						                <h4 class="reviews text-capitalize">내정보</h4>
						            </a>
						        </li>
						    </ul>
						    <div class="tab-content">
						        <div class="tab-pane active" id="letter-recv">
						            <ul class="media-list">
						                <li class="media">
						                    <a class="pull-left" href="#">
						                        <img class="media-object img-circle" src="https://s3.amazonaws.com/uifaces/faces/twitter/dancounsell/128.jpg" alt="profile">
						                    </a>
						                    <div class="media-body">
						                        <div class="well well-lg">
						                            <h4 class="media-heading text-uppercase reviews">Marco </h4>
						                            <ul class="media-date text-uppercase reviews list-inline">
						                                <li class="dd">22</li>
						                                <li class="mm">09</li>
						                                <li class="aaaa">2014</li>
						                            </ul>
						                            <p class="media-title">
						                                Great snippet! Thanks for sharing.
						                            </p>
						                            <a class="btn btn-info btn-circle text-uppercase" href="#">
						                                <span class="glyphicon glyphicon-ok"></span> 확인</a>
						                            <a class="btn btn-warning btn-circle text-uppercase" href="#">
						                                <span class="glyphicon glyphicon-share-alt"></span> 답장</a>
						                        </div>
						                    </div>
						                </li>
						            </ul>
						        </div>
						        <div class="tab-pane" id="letter-send">
						            <ul class="media-list">
						                <li class="media">
						                    <a class="pull-left" href="#">
						                        <img class="media-object img-circle" src="https://s3.amazonaws.com/uifaces/faces/twitter/dancounsell/128.jpg" alt="profile">
						                    </a>
						                    <div class="media-body">
						                        <div class="well well-lg">
						                            <h4 class="media-heading text-uppercase reviews">Marco </h4>
						                            <ul class="media-date text-uppercase reviews list-inline">
						                                <li class="dd">22</li>
						                                <li class="mm">09</li>
						                                <li class="aaaa">2014</li>
						                            </ul>
						                            <p class="media-title">
						                                Great snippet! Thanks for sharing.
						                            </p>
						                            <a class="btn btn-info btn-circle text-uppercase" href="#">
						                                <span class="glyphicon glyphicon-ok"></span> 확인</a>
						                            <a class="btn btn-warning btn-circle text-uppercase" href="#">
						                                <span class="glyphicon glyphicon-share-alt"></span> 답장</a>
						                        </div>
						                    </div>
						                </li>
						            </ul>
						        </div>
						        <div class="tab-pane" id="diary">
						        
						        </div>
						        <div class="tab-pane" id="account-setting">
						            <form action="#" method="post" class="form-horizontal" id="accountSetForm" role="form">
						                <div class="form-group">
						                    <label for="avatar" class="col-sm-2 control-label">Avatar</label>
						                    <div class="col-sm-10">
						                        <div class="custom-input-file">
						                            <label class="uploadPhoto">
						                                Edit
						                                <input type="file" class="change-avatar" name="avatar" id="avatar">
						                            </label>
						                        </div>
						                    </div>
						                </div>
						                <div class="form-group">
						                    <label for="name" class="col-sm-2 control-label">Name</label>
						                    <div class="col-sm-10">
						                        <input type="text" class="form-control" name="name" id="name" placeholder="Vilma palma">
						                    </div>
						                </div>
						                <div class="form-group">
						                    <label for="nickName" class="col-sm-2 control-label">Nick name</label>
						                    <div class="col-sm-10">
						                        <input type="text" class="form-control" name="nickName" id="nickName" placeholder="Vilma">
						                    </div>
						                </div>
						                <div class="form-group">
						                    <label for="email" class="col-sm-2 control-label">Email</label>
						                    <div class="col-sm-10">
						                        <input type="email" class="form-control" name="email" id="email" placeholder="vilma@mail.com">
						                    </div>
						                </div>
						                <div class="form-group">
						                    <label for="newPassword" class="col-sm-2 control-label">New password</label>
						                    <div class="col-sm-10">
						                        <input type="password" class="form-control" name="newPassword" id="newPassword">
						                    </div>
						                </div>
						                <div class="form-group">
						                    <label for="confirmPassword" class="col-sm-2 control-label">Confirm password</label>
						                    <div class="col-sm-10">
						                        <input type="password" class="form-control" name="confirmPassword" id="confirmPassword">
						                    </div>
						                </div>
						                <div class="form-group">
						                    <div class="col-sm-offset-2 col-sm-10">
						                        <button class="btn btn-primary btn-circle text-uppercase" type="submit" id="submit">Save changes</button>
						                    </div>
						                </div>
						            </form>
						        </div>
						    </div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>
	<%@ include file="/WEB-INF/jsp/include/footer.jsp"%>
</body>
</html>