<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>자기소개서 정보</title>
<%@ include file="/WEB-INF/jsp/include/basic.jsp"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/basic.css">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/resume.css">
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-glyphicons.css">
<script src="https://use.fontawesome.com/942e94bfdb.js"></script>
<script src="${pageContext.request.contextPath}/js/resumeInfo.js"></script>
<style type="text/css">

	.infocontainer{
		width:80%;
	}
	.table>tbody>tr>td, .table>tbody>tr>th, .table>tfoot>tr>td, .table>tfoot>tr>th, .table>thead>tr>td, .table>thead>tr>th {
	    padding: 8px;
	    line-height: 1.42857143;
	    vertical-align: top;
	    border-top: 1px solid #c1bcbc;
	    border-right: 1px solid #c1bcbc;
	    border-left: 1px solid #c1bcbc;
	}
	.center{
		padding-left: 20px;
    	padding-right: 20px;
    	padding-top: 60px;
    	padding-bottom: 60px;
		text-align: center;
	}
	
	
	.semi-space{
		height: 30px ; 
		background-color: #e5e7e9;
	
	}
	
</style>
</head>
<body>
	 <%@ include file="/WEB-INF/jsp/include/header.jsp"%>
	<form class="form-horizontal" action="${pageContext.request.contextPath}/mypage/introductionSave.do?memberNo=">
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
						<input type="text" class="form-control" name="introductionTitle" placeholder="자기소개서 제목을 입력해주세요">
					</div>

					<div class="edit_content">
						<div class="introduction">
							<div class="horizontal_table table_wrap">
								<h4 class="table_title">자기소개서 작성</h4>
								<br>
								<span style="float: right;font-weight: bold">5분자동저장</span> 
								<input type="checkbox" onclick="save()" value="2" style="float: right"> 
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
																<input type="hidden" class="self"name="introductionCate" value="자기소개"/>
															</td>
														</tr>
														<tr>
															<td>
																<input type="button" class="btn-success btn-sm self" id="firstself" value="변경"/>
															</td>
														</tr>
													</tbody>
												</table>
											</div>
											</th>
											<td>
												<textarea class="textarea-control" name="introductionContent" rows="10" cols="80%"></textarea>
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
																<input type="hidden" class="personality"name="introductionCate" value="성격의 장단점"/>
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
											<textarea class="textarea-control" name="introductionContent" rows="10" cols="80%"></textarea>
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
																<input type="hidden" class="ambition"name="introductionCate" value="지원동기 및 입사후 포부"/>
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
												<textarea class="textarea-control" name="introductionContent" rows="10" cols="80%"></textarea>
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
																<input type="hidden" class="experience" name="introductionCate" value="직무관련경험"/>
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
											<textarea class="textarea-control" name="introductionContent" rows="10" cols="80%"></textarea>
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
	<%@ include file="/WEB-INF/jsp/include/footer.jsp"%>
<script>



/* function save() { 
	  var autoSave = new Object(); 
	  (function (obj) { 
	    obj.configuration = { 
	      interval: 300 // second(s) 
	    }; 
	    obj.bindTimer = function() { 
	      var textEle = document.querySelector('.textarea-control'); 
	      var textVal = textEle.value; 
	      var ref1, ref2, ref3; // Newer -> Older 

	      // Save to localStorage 
	      var encodedTextVal = btoa(textVal); 
	      ref1 = window.localStorage.getItem('textval-01'); 
	      ref2 = window.localStorage.getItem('textval-02'); 

	      if ((window.localStorage) && (encodedTextVal != ref1)){ 
	        window.localStorage.setItem('textval-01', encodedTextVal); 
	        window.localStorage.setItem('textval-02', ref1); 
	        window.localStorage.setItem('textval-03', ref2); 
	      } 
	      else if (!window.localStorage) { 
	        console.log('Error' + ': Your browser not support') 
	        return false; 
	      } 
	    }; 

	    obj.start = function() { 
	      obj.bindTimer(); 
	      setTimeout(function() { 
	        obj.start(); 
	      }, obj.configuration.interval * 1000); 
	    }; 
	    obj.start(); 
	  })(autoSave); 
	}  */
</script>
</body>
</html>