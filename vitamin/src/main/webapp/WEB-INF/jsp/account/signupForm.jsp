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
		<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
		<%-- <script src="${pageContext.request.contextPath}/js/daum-map-api/daum-address-api.js"></script> --%>
		<script>
			function idOverlapCheck(formType) {
				var _chk;
				
				$.ajax({
					url: "${pageContext.request.contextPath}/account/idOverlapChk.do",
					dataType: "json",
					data: {id: $(formType).val()},
					success: function(chk) {
						var $idInput = $(formType)[0];
						
						setIdOverlapChk(chk);
						
						if(chk == true) {
							createLabel($idInput, '이미 등록된 아이디 입니다.', {'color': 'red'});
						} else {
							createLabel($idInput, '사용 가능한 아이디 입니다.', {'color': 'blue'});
						}
					}
				});
			};
			
			
		</script>
		<script src="${pageContext.request.contextPath}/js/pattern/pattern.js"></script>
		<script src="${pageContext.request.contextPath}/js/signupForm.js"></script>
		<style>
			.horizontal_table .table > tbody > tr:last-child > th, .horizontal_table .table > tbody > tr:last-child > td {
			    border-bottom: 1px solid #c1bcbc;
			    border-left: 1px solid #c1bcbc;
			    border-right: 1px solid #c1bcbc;
			}
			.horizontal_table .table > tbody > tr > th {
			    padding: 10px 15px;
			    background-color: #e5e7e9;
			   	font-weight: 400;
			    border-right: 1px solid #c1bcbc;
			    border-left: 1px solid #c1bcbc;
			}
			.table>tbody>tr>td, .table>tbody>tr>th, .table>tfoot>tr>td, .table>tfoot>tr>th, .table>thead>tr>td, .table>thead>tr>th {
			    padding: 8px;
			    line-height: 1.42857143;
			    vertical-align: top;
			    border-top: 1px solid #c1bcbc;
			    border-right: 1px solid #c1bcbc;
			    border-left: 1px solid #c1bcbc;
			}
			#myModal table.table li {
			    float: left;
			    list-style: none;
			}
			@media (min-width: 992px) {
				.modal-lg {
				  width: 900px;
				}
			}
			@media (min-width: 768px) {
				.modal-xl {
					width: 90%;
					max-width:1200px;
				}
			}
		</style>
	</head>
<body>
	<noscript style="
	position: fixed;
	top: 0; left: 0;right: 0; bottom: 0;
    background: white;
    color: black; font-weight: bolder; font-size: 10vh;
    text-align: center; line-height: 60vh;
    z-index: 9999;">
	<p>스크립트 켜라</p>
	</noscript>
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
												<input type="text" name="member.name" id="private-input-name" class="form-control" placeholder="이름">
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
													<input name="address.postCode" type="text" class="form-control" placeholder="우편번호" readonly="readonly">
													<span class="input-group-btn">
														<button class="btn btn-secondary" type="button" onclick="sample6_execDaumPostcode()" style="padding-top: 10%; padding-bottom: 10%;">우편번호 찾기</button>
													</span>
												</div>
											</div>
											<div class="form-group">
												<input name="address.address1" type="text" class="form-control" placeholder="주소" readonly="readonly">
											</div>
											<div class="form-group">
												<input name="address.address2" type="text" class="form-control" placeholder="상세주소">
												<input type="text" name="address.sigunguCode" class="hide" />
											</div>
											<div class="form-group">
												<div class="row">
													<div class="col-sm-6 col-sm-offset-3">
														<input type="button" id="private-signup" class="form-control btn submit" value="회원가입">
													</div>
												</div>
											</div>
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
												<div class="row">
													<div class="col-md-12">
														<div class="form-group col-md-5" style="padding: 0px; margin: 0px;">
															<input class="form-control" name="email1" id="company-input-email1" type="text" placeholder="이메일"/>
														</div>
														<div class="form-group col-md-1" style="top: 10px">@</div>
														<div class="form-group col-md-6" style="padding: 0px; margin: 0px;">
															<input class="form-control" name="email2" id="company-input-email2" type="text" placeholder="도메인 주소" />
														</div>
													</div>
												</div>
											</div>
											<div class="form-group">
												<input type="text" name="company.companyName" id="company-input-companyName" class="form-control" placeholder="기업 이름">
											</div>
											<div class="form-group">
												<input type="text" name="company.bossName" id="company-input-bossName" class="form-control" placeholder="대표자 이름">
											</div>
											<div class="form-group">
												<input type="text" name="company.licenseNumber" id="company-input-licenseNumber" class="form-control bfh-phone" data-format="ddd-dd-ddddd" maxlength="12" placeholder="사업자 등록번호">
											</div>
											<div class="form-group">
												<select class="selectpicker" name="company.companyType">
													<optgroup label="기업 형태를 선택해주세요.">
														<option value="대기업">대기업</option>
														<option value="중견기업">중견기업</option>
														<option value="강소기업">강소기업</option>
														<option value="중소기업">중소기업</option>
													</optgroup>
												</select>
											</div>
											<div class="form-group">
												<input type="text" name="company.employeeCount" id="company-input-employeeCount" class="form-control" placeholder="사원수">
											</div>
											<div class="form-group">
												<input type="date" name="company.buildupDate" id="company-input-buildupDate" max="<fmt:formatDate value='${todayDate}' pattern='yyyy-MM-dd' />" class="form-control">
											</div>
											<div class="form-group">
												<select class="selectpicker" name="company.businessNo">
													<optgroup label="직종을 선택해주세요.">
														<c:forEach var="bus" items="${busType}">
															<option value="${bus.businessNo}">${bus.businessContent }</option>
														</c:forEach>
													</optgroup>
												</select>
											</div>
											<div class="form-group">
												<input type="text" name="company.businessContent" id="company-input-businessContent" class="form-control" placeholder="사업 내용">
											</div>
											<div class="form-group">
												<input type="text" name="company.telNumber" id="company-input-phoneNumber" class="form-control bfh-phone" maxlength="19" data-format="+82 (ddd) dddd-dddd">
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
												<input type="text" name="address.sigunguCode" class="hide" id="sample6_sigunguCode"/>
											</div>
											
											<div class="form-group">
												<div class="row">
													<div class="col-sm-6 col-sm-offset-3">
														<input type="button" id="company-signup" class="form-control btn submit" value="회원가입">
													</div>
												</div>
											</div>
										</form>
										<div class="modal fade" id="myModal" role="dialog">
											<div class="modal-dialog modal-xl">
												<div class="modal-content">
													<div class="modal-header">
														<button type="button" class="close" data-dismiss="modal">&times;</button>
														<h4 class="modal-title">직종</h4>
													</div>
													<div class="modal-footer">
														<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-6">
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