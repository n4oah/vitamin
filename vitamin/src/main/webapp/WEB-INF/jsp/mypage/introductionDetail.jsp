<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>이력서 정보</title>
<%@ include file="/WEB-INF/jsp/include/basic.jsp"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/basic.css">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- <link rel="stylesheet" href="/resources/demos/style.css"> -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/resume.css">
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-glyphicons.css">
<!-- <link rel="stylesheet"
	href="path/to/font-awesome/css/font-awesome.min.css"> -->
<script src="https://use.fontawesome.com/942e94bfdb.js"></script>
<script src="${pageContext.request.contextPath}/js/resumeInfo.js"></script>
<style type="text/css">

	.infocontainer{
		width:80%;
	}
</style>
</head>
<body>
	<%-- <%@ include file="/WEB-INF/jsp/include/header.jsp"%> --%>
	<form class="form-horizontal" action="${pageContext.request.contextPath}/mypage/introductionSave.do?memberNo=${user.memberNo}" method="post">
		<div id="wrapper" style="margin-top: 0px;">
			<section class="container infocontainer" style="margin-bottom: 100px;">
				<div class="row">
					<div class="top">
						<div class="top_title">
							<h2>자기소개서 작성</h2>
						</div>
					</div>
					<div class="horizontal_table table_wrap">
						<h4 class="table_title">자기소개서 제목</h4>
						<p></p>
						<!-- <input type="text" class="form-control" name="introductionTitle" placeholder="자기소개서 제목을 입력해주세요"> -->
					</div>

					<div class="edit_content">
						<div class="introduction">
							<div class="horizontal_table table_wrap">
								<h4 class="table_title">자기소개서 작성</h4>
								<br>
								<table class="table">
									<tbody>
										<tr>
											<th>
											<div class="center">
												<table>
													<tbody>
														<tr>
															<td>
																<span>자기소개</span>
																<input type="hidden" class="self" name="introductionCateTemp" value="자기소개"/>
															</td>
														</tr>
													</tbody>
												</table>
											</div>
											</th>
											<td>
												<textarea class="textarea-control col-md-12" name="introductionContentTemp" rows="10" cols="80%"
												readonly="readonly"></textarea>
											</td>
										</tr>
										<tr>
											<td colspan="2" class="semi-space"></td>
										</tr>
									</tbody>
							    </table>
							    <table class="table">
									<tbody>
										<tr>
											<th>
											<div class="center">
												<table>
													<tbody>
														<tr>
															<td>
																<span>성격의 장단점</span>
																<input type="hidden" class="personality"name="introductionCateTemp" value="성격의 장단점"/>
															</td>
														</tr>
														<tr>
															<td>
																<input type="button" class="btn-success btn-sm personality" id="secondself" value="변경"/>
															</td>
														</tr>
													</tbody>
												</table>
												</div>
											</th>
											<td>
											<textarea class="textarea-control col-md-12" name="introductionContentTemp" rows="10" cols="80%"
											readonly="readonly"></textarea>
											</td>
										</tr>
										<tr>
											<td colspan="2" class="semi-space"></td>
										</tr>
									</tbody>
							    </table>
							    <table class="table">
									<tbody>
										<tr>
											<th>
											<div class="center">
												<table>
													<tbody>
														<tr>
															<td>
																<span>지원동기 및 입사후 포부</span>
																<input type="hidden" class="ambition"name="introductionCateTemp" value="지원동기 및 입사후 포부"/>
															</td>
														</tr>
														<tr>
															<td>
																<input type="button" class="btn-success btn-sm ambition" id="throdself" value="변경"/>
															</td>
														</tr>
													</tbody>
												</table>
												</div>
											</th>
											<td>
												<textarea class="textarea-control col-md-12" name="introductionContentTemp" rows="10" cols="80%"
												readonly="readonly"></textarea>
											</td>
										</tr>
										<tr>
											<td colspan="2" class="semi-space"></td>
										</tr>
									</tbody>
							    </table>
							    <table class="table">
									<tbody>
										<tr>
											<th>
											<div class="center">
												<table>
													<tbody>
														<tr>
															<td>
																<span>직무관련경험</span>
																<input type="hidden" class="experience" name="introductionCateTemp" value="직무관련경험"/>
															</td>
														</tr>
														<tr>
															<td>
																<input type="button" class="btn-success btn-sm experience" id="forthself" value="변경"/>
															</td>
														</tr>
													</tbody>
												</table>
												</div>
											</th>
											<td>
											<textarea class="textarea-control col-md-12" name="introductionContentTemp" rows="10" cols="80%"
											readonly="readonly"></textarea>
											</td>
										</tr>
										<tr>
											<td colspan="2" class="semi-space"></td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="btn_panel">
								<input type="button" class="btn-info btn-lg" value="미리보기"style="float: center"/>
								<button style="float: center" class="btn-warning btn-lg">작성완료</button>
							</div>
						</div>
					</div>
				</div>
			</section>
		</div>
	</form>
	<%-- <%@ include file="/WEB-INF/jsp/include/footer.jsp"%> --%>
<script>
	
</script>
</body>
</html>