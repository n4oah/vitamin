<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
	<script src="${pageContext.request.contextPath}/js/pattern/pattern.js"></script>
	<script src='${pageContext.request.contextPath}/js/myInfo.js'></script>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script src="${pageContext.request.contextPath}/js/daum-map-api/daum-address-api.js"></script>
	<style>
		.recruit-data-row a:hover {
			cursor: pointer;
		}
	</style>
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
									<img src="${pageContext.request.contextPath}/image/mypage/init_mypage3.jpg" />
								</div>
								<div class="item">
									<img src="${pageContext.request.contextPath}/image/mypage/init_mypage2.jpg" />
								</div>
								<div class="item">
									<img src="${pageContext.request.contextPath}/image/mypage/init_mypage1.jpg" />
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
							
							<span class="aa profile-image" attr="${sessionScope.user.accountNo}"></span>
							<span class="site-name" style="color: white;"><b><c:out value="${userName}"></c:out></b></span>
							<span class="site-description" style="color: white;"><c:out value="${memberType}"></c:out></span>
						</div>
						<div class="collapse navbar-collapse" id="mainNav">
							<ul class="nav main-menu navbar-nav">
								<c:if test="${user.memberType == 1}">
									<li><a href="${pageContext.request.contextPath}/mypage/resumeList.do">이력서 목록</a></li>
									<li><a href="${pageContext.request.contextPath}/mypage/introductionList.do">자기소개서 목록</a></li>
									<li><a href="${pageContext.request.contextPath}/cards/cards.do">트롤로</a></li>
									<li><a href="${pageContext.request.contextPath}/search/calendar.do">나의 일정</a></li>
								</c:if>
								<c:if test="${user.memberType == 2}">
									<li><a href="${pageContext.request.contextPath}/company/detail.do"><i class="fa fa-home"></i> HOME</a></li>
						       		<li><a href="${pageContext.request.contextPath}/recruitApply/recruitResumeList.do">지원 이력서 목록</a></li>
						        </c:if>
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
		                            <!-- id="letter-mdodal" -->
									<div class="modal fade" id="largeModal" tabindex="-1" role="dialog" aria-labelledby="largeModal" aria-hidden="true">
									    <div class="modal-dialog modal-lg">
									        <div class="modal-content">
									            <div class="modal-header">
									                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
									                <h4 class="modal-title" id="myModalLabel">쪽지</h4>
									            </div>
									            <div class="modal-body">
									                <form id="letter-form" role="form" method="post" action="${pageContext.request.contextPath}/letter/send.do">
									                    <h3 style="text-align: center; font-weight: bold;">쪽지 쓰기</h3>
									    				<div class="form-group">
															<input type="text" class="form-control" id="id" name="id" placeholder="상대방 아이디">
														</div>
														<div class="form-group">
															<input type="text" class="form-control" id="title" name="title" placeholder="제목">
														</div>
									                    <div class="form-group">
									                    <textarea class="form-control" type="textarea" id="content" name="content" placeholder="보낼 쪽지 내용" maxlength="500" rows="7"></textarea>
								                        <span class="help-block">
								                        <p id="characterLeft" class="help-block "></p></span>                    
									                    </div>
												        <!-- <button type="button" id="submit" name="submit" class="btn btn-primary pull-right">Submit Form</button> -->
											        </form>
									            </div>
									            <div class="modal-footer">
									                <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
									                <button type="button" id="letter-submit" class="btn btn-primary">쪽지 보내기</button>
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
						        <c:if test="${sessionScope.user.memberType == 1}">
						        <li>
						            <a href="#myRecurit" role="tab" data-toggle="tab">
						                <h4 class="reviews text-capitalize">내가 지원한 공고</h4>
						            </a>
						        </li>
						        <li>
						            <a href="#favoriteCompany" role="tab" data-toggle="tab">
						                <h4 class="reviews text-capitalize">즐겨찾기 기업</h4>
						            </a>
						        </li>
						        </c:if>
						        <li>
						            <a href="#account-setting" role="tab" data-toggle="tab">
						                <h4 class="reviews text-capitalize">내정보</h4>
						            </a>
						        </li>
						    </ul>
						    <div class="tab-content">
						        <div class="tab-pane active" id="letter-recv">
						            <ul class="media-list">
						            </ul>
						        </div>
						        <div class="tab-pane" id="letter-send">
						            <ul class="media-list">
						            </ul>
						        </div>
						        <div class="modal fade" id="letter-read-modal" tabindex="-2" role="dialog" aria-labelledby="letter-read-modal" aria-hidden="true">
								    <div class="modal-dialog modal-lg">
								        <div class="modal-content">
								            <div class="modal-header">
								                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
								                <h4 class="modal-title" id="myModalLabel">쪽지</h4>
								            </div>
								            <div class="modal-body">
								                <form id="letter-form-read" role="form" method="post" action="${pageContext.request.contextPath}/letter/send.do">
								                    <h3 name="title" style="text-align: center; font-weight: bold;"></h3>
								    				<div class="form-group">
														<input type="text" class="form-control" name="id" readonly="readonly">
													</div>
								    				<div class="form-group">
														<input type="text" class="form-control" name="name" readonly="readonly">
													</div>
								                    <div class="form-group">
														<textarea class="form-control" type="textarea" name="content" rows="7" readonly="readonly"></textarea>                 
								                    </div>
										        </form>
								            </div>
								            <div class="modal-footer">
								                <button type="button" class="btn btn-default" data-dismiss="modal">확인</button>
								                <button type="button" class="btn btn-primary show-letter-reply">답장</button>
								            </div>
								        </div>
								    </div>
								</div>
						        <div class="tab-pane" id="myRecurit">
									<div class="panel panel-default panel-table">
										<div class="panel-heading">
											<div class="row">
												<div class="col col-xs-6">
													<h3 class="panel-title">지원한 이력서 </h3>
												</div>
											</div>
										</div>
										<div class="panel-body">
											<table id="recruit-list-table" class="table table-striped table-bordered table-list">
												<thead>
													<tr>
														<th class="col-md-1"><span class="glyphicon glyphicon-wrench" aria-hidden="true"></span>
														</th>
														<th class="col-md-2">공고</th>
														<th class="col-md-2">이력서</th>
														<th class="col-md-2">자기소개서</th>
													</tr>
												</thead>
												<tbody>
													<!-- <tr id="recruit-data" class="recruit-data-row">
														<td>
															<select class="selectpicker show-tick recruit-state">
															</select>			                                 
														</td>
														<td><a class="recruit-title"></a></td>
														<td><a class="resume-name"></a></td>
														<td><a class="introduction-name"></a></td>
													</tr>
												</tbody> -->
											</table>
										</div>
										<div class="panel-footer">
											<div class="row">
											</div>
										</div>
									</div>
						        </div>
						        <div class="tab-pane" id="favoriteCompany">
						        
						        </div>
						        <div class="tab-pane" id="account-setting">
						            <form action="${pageContext.request.contextPath}/mypage/myInfoModify.do" method="post" enctype="multipart/form-data" class="form-horizontal" id="myInfoModify" role="form">
						                <div class="form-group">
						                	<c:choose>
						                		<c:when test="${sessionScope.user.memberType == 1}">
													<c:set var="profileImgName" value="프로필 사진"></c:set>
													<c:set var="addressTitleName" value="우편 번호"></c:set>
						                		</c:when>
						                		<c:when test="${sessionScope.user.memberType == 2}">
													<c:set var="profileImgName" value="회사 로고"></c:set>
													<c:set var="addressTitleName" value="회사 주소"></c:set>
						                		</c:when>
						                	</c:choose>
						                	<c:set var="user" value="${sessionScope.user}"></c:set>
						                    <label for="avatar" class="col-sm-2 control-label"><c:out value="${profileImgName}"></c:out></label>
						                    <div class="col-sm-10">
						                        <div class="custom-input-file profile-image" attr="${sessionScope.user.accountNo}">
						                            <label class="uploadPhoto">
						                                Edit
														<input type="file" class="change-profile-img" name="profileImg" id="profileImg" accept="image/png, image/jpeg, image/gif, image/jpg">
														<c:if test="${user.memberType == 2}">
															<input type="text" style="display:none;" value="${user.logoNo}" name="company.logoNo">
														</c:if>
						                            </label>
						                        </div>
						                    </div>
						                </div>
						                <div class="form-group">
						                    <label for="id" class="col-sm-2 control-label">아이디</label>
						                    <div class="col-sm-10">
						                        <input type="text" class="form-control" id="id" value="${user.id}" readonly="readonly">
						                    </div>
						                </div>
						                <div class="form-group">
						                    <label for="pwd" class="col-sm-2 control-label">비밀번호</label>
						                    <div class="col-sm-10">
						                        <input type="password" class="form-control" name="pwd" id="pwd">
						                    </div>
										</div>
										<c:if test="${user.memberType == 1}">
											<div class="form-group">
												<label for="name" class="col-sm-2 control-label">이름</label>
												<div class="col-sm-10">
													<input type="text" class="form-control" name="member.name" id="name" placeholder="이름을 입력해주세요." value="${user.name}">
												</div>
											</div>
											<div class="form-group">
												<label for="name" class="col-sm-2 control-label">성별</label>
												<div class="col-sm-10">
													<input type="text" class="form-control" id="gender" value="${user.genderName}" readonly="readonly">
												</div>
											</div>
											<div class="form-group">
												<label for="name" class="col-sm-2 control-label">나이</label>
												<div class="col-sm-10">
													<input type="text" class="form-control" id="age" value="${user.age}세" readonly="readonly">
												</div>
											</div>
										</c:if>
						                <div class="form-group">
						                    <label for="nickName" class="col-sm-2 control-label">이메일</label>
						                    <div class="col-sm-10">
												<input type="text" class="form-control" name="email" id="email" value="${user.email}" readonly="readonly">
											</div>
										</div>
										<div class="form-group">
											<label for="sample6_postcode" class="col-sm-2 control-label"><c:out value="${addressTitleName}"></c:out></label>
											<div class="col-sm-8">
												<input name="address.postCode" value="${address.postCode}" type="text" class="form-control" id="sample6_postcode" placeholder="우편번호" readonly="readonly">
												
											</div>
											<div class="col-sm-2">
												<span class="input-group-btn">
													<button class="btn btn-secondary" type="button" onclick="sample6_execDaumPostcode()" style="">우편번호 찾기</button>
												</span>
											</div>
										</div>
										<div class="form-group">
											<label for="sample6_address" class="col-sm-2 control-label">주소</label>
											<div class="col-sm-10">
												<input name="address.address1" type="text" class="form-control" value="${address.addressMain}" id="sample6_address" placeholder="주소" readonly="readonly">
											</div>
										</div>
										<div class="form-group">
											<label for="sample6_address2" class="col-sm-2 control-label">상세주소</label>
											<div class="col-sm-10">
												<input name="address.address2" type="text" class="form-control" value="${address.addressSub}" id="sample6_address2" placeholder="상세주소">
												<input type="text" name="address.sigunguCode" class="hide" id="sample6_sigunguCode" value="${address.areaCode}"/>
											</div>
										</div>
										<c:choose>
											<c:when test="${user.memberType == 1}">
												<div class="form-group">
													<label for="phoneNumber" class="col-sm-2 control-label">휴대전화</label>
													<div class="col-sm-10">
														<input type="text" class="form-control bfh-phone" value="${user.phoneNumber}" name="member.phoneNumber" id="phoneNumber" maxlength="19" data-format="+82 (ddd) dddd-dddd">
													</div>
												</div>
											</c:when>
											<c:when test="${user.memberType == 2}">
												<div class="form-group">
													<label for="companyName" class="col-sm-2 control-label">회사 이름</label>
													<div class="col-sm-10">
														<input type="text" class="form-control" value="${user.companyName}" readonly="readonly" id="company-input-companyName">
													</div>
												</div>
												<div class="form-group">
													<label for="licenseNumber" class="col-sm-2 control-label">사업자 등록번호</label>
													<div class="col-sm-10">
														<input type="text" class="form-control bfh-phone" data-format="ddd-dd-ddddd" maxlength="12" value="${user.licenseNumber}" placeholder="사업자 등록번호" readonly="readonly" id="company-input-licenseNumber">
													</div>
												</div>
												<div class="form-group">
													<label for="bossName" class="col-sm-2 control-label">대표자 이름</label>
													<div class="col-sm-10">
														<input type="text" class="form-control" name="company.bossName" value="${user.bossName}" placeholder="대표자 이름" id="company-input-bossName">
													</div>
												</div>
												<div class="form-group">
													<label for="telNumber" class="col-sm-2 control-label">대표 전화</label>
													<div class="col-sm-10">
														<input type="text" class="form-control bfh-phone" name="company.telNumber" value="${user.telNumber}" data-format="+82 (ddd) dddd-dddd" maxlength="19" placeholder="대표 전화" id="company-input-telNumber">
													</div>
												</div>
												<div class="form-group">
													<label for="companyType" class="col-sm-2 control-label">기업 형태</label>
													<div class="col-sm-10">
														<input type="text" class="form-control" readonly="readonly" placeholder="기업 형태" value="${user.companyType}" id="company-input-companyType" >
													</div>
												</div>
												<div class="form-group">
													<label for="employeeCount" class="col-sm-2 control-label">사원수</label>
													<div class="col-sm-10">
														<input type="text" class="form-control" name="company.employeeCount" placeholder="사원수" value="${user.employeeCount}" id="company-input-employeeCount" >
													</div>
												</div>
												<div class="form-group">
													<label for="homepage" class="col-sm-2 control-label">홈페이지</label>
													<div class="col-sm-10">
														<input type="text" class="form-control" name="company.homepage" placeholder="홈페이지 주소" value="${user.homepage}" id="company-input-homepage" >
													</div>
												</div>
												<div class="form-group">
													<label for="businessContent" class="col-sm-2 control-label">사업내용</label>
													<div class="col-sm-10">
														<input type="text" class="form-control" readonly="readonly" placeholder="사원수" value="${user.businessContent}" id="company-input-businessContent" >
													</div>
												</div>
											</c:when>
										</c:choose>
						                <div class="form-group">
						                    <div class="col-sm-offset-2 col-sm-10">
						                        <button class="btn btn-primary btn-circle text-uppercase" type="submit" id="submit">저장</button>
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

	<div class="modal fade" id="email-change-modal" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header" align="center">
					<img class="img-circle" id="img_logo" src="http://bootsnipp.com/img/logo.jpg">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
					</button>
				</div>
				
				<div id="div-forms">
					<form id="email-change-input" action="${pageContext.request.contextPath}/mypage/emailAuthSend.do" method="post">
						<div class="modal-body">
							<input id="changeEmail" name="changeEmail" class="form-control" type="text" placeholder="이메일을 입력해주세요." required>
						</div>
						<div class="modal-footer">
							<div>
								<button type="submit" class="btn btn-primary btn-lg btn-block">인증번호 요청</button>
							</div>
						</div>
					</form>

					<form id="email-change-auth" action="${pageContext.request.contextPath}/mypage/emailAuth.do" style="display:none;">
						<div class="modal-body">
							<input id="authToken" name="authToken" class="form-control" type="text" placeholder="인증번호를 입력해주세요" required>
						</div>
						<div class="modal-footer">
							<div>
								<button type="submit" class="btn btn-primary btn-lg btn-block">확인</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog modal-lg">
			<!-- Modal content-->
			<div class="modal-content">
				<!--      <div class="modal-header">
			  <button type="button" class="close" data-dismiss="modal">&times;</button>
			  <h4 class="modal-title">이력서</h4>
			</div> -->
				<div class="modal-body">
	
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="/WEB-INF/jsp/include/footer.jsp"%>
</body>
</html>