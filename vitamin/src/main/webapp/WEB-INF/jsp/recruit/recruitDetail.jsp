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
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/recruitDetail.css">
		<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-glyphicons.css" rel="stylesheet">
		 
		<script src="https://use.fontawesome.com/942e94bfdb.js"></script>
		<link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/basic.css">
	</head>
<body>
	<%@ include file="/WEB-INF/jsp/include/header.jsp" %>
	<div id="wrapper" style="margin-top: 0px;">
		<section class="container" style="margin-bottom: 100px;">
			<div class="top">
				<div class="row">
			      <div class="col-xs-12 col-md-8 col-lg-9">
			        <h3 class="recruit_title">${recruit.title }</h3>
			        <h3>로고</h3>
			      </div> 
			      <div class="col-xs-12 col-md-4 col-lg-3">
			        <div class="top_right_wrap">
			          <p>접수기간 ~<span>${recruit.recruitDateEnd }</span> </p>
			          <a href="#" class="disabled_btn apply_btn">지원</a>
			        </div>  <!--/.top_right_wrap -->
			      </div> <!--/.col-xs-12.col-md-3-->
			    </div>
			 </div>
			    <div class="edit_content">
				    <div class="horizontal_table table_wrap">
						<h4 class="table_title">모집 요강</h4>
						
						<table class="table">
							<tbody>
								<tr>
									<th>주요업무</th>
									
									<td class="assigned_task">
										${recruit.assignedTask }
									</td>
								</tr>
							
								<tr>
									<th>근무형태</th>
									
									<td class="form_service">
										${recruit.formServiceName }
									</td>
								</tr>
								
								<tr>
									<th>모집인원</th>
									
									<td class="recruit_count">
										${recruit.recruitCount }
									</td>
								</tr>
								
							</tbody>
						</table>
						<!--/.table-->
					</div>
					
					<div class="horizontal_table table_wrap">
						<h4 class="table_title">지원 자격</h4>
						
						<table class="table">
							<tbody>
								<tr>
									<th>경력</th>
									<td class="career_state">
										<c:choose>
								    		<c:when test="${recruit.careerState eq 1 and recruit.careerStart ne -1}">
								    			신입 · 경력
								    		</c:when>
								    		<c:when test="${recruit.careerState eq 1 }">
								    			신입
								    		</c:when>
								    		<c:when test="${recruit.careerStart ne -1 }">
								    			경력
								    		</c:when>
								    		<c:otherwise>
								    			경력무관
								    		</c:otherwise>
									    </c:choose>
									</td>
								</tr>
								
								<tr>
									<th>학력</th>
									
									<td class="school_level">
										<c:choose>
									        	<c:when test="${recruit.schoolLevel eq 1 }">
													고등학교 졸업						        	
									        	</c:when>
									        	
									        	<c:when test="${recruit.schoolLevel eq 2 }">
													대학교 졸업					        	
									        	</c:when>
									        	
									        	<c:when test="${recruit.schoolLevel eq 3 }">
													대학원 석사 졸업					        	
									        	</c:when>
									        	
									        	<c:when test="${recruit.schoolLevel eq 4 }">
													대학원 박사 졸업					        	
									        	</c:when>
									        	
									        	<c:otherwise>
									        		학력무관
									        	</c:otherwise>
										</c:choose>
									</td>
								</tr>
								
								<tr>
									<th>연봉</th>
									
									
									<td class="year_salary">
										<c:choose>
											<c:when test="${recruit.yearPayStart ne -1 or recruit.yearPayEnd ne -1}">
												<c:choose>
													<c:when test="${recruit.yearPayStart ne -1 and recruit.yearPayEnd eq -1}">
															${recruit.yearPayStart }00만원 이상											
													</c:when>
													
													<c:when test="${recruit.yearPayStart eq -1 and recruit.yearPayEnd ne -1}">
															${recruit.yearPayEnd }00만원 이하											
													</c:when>
													
													<c:when test="${recruit.yearPayStart ne -1 and recruit.yearPayEnd ne -1}">
															${recruit.yearPayStart }00만원	~	${recruit.yearPayEnd }00만원	 											
													</c:when>
													
													
												</c:choose>
											</c:when>
											
											<c:otherwise>
												회사 내규에 따름
											</c:otherwise>
											
										</c:choose>
									</td>
								</tr>
								
								<tr>
									<th>나이</th>
									
									
									<td class="age">
										<c:choose>
											<c:when test="${recruit.ageCountStart ne -1 or recruit.ageCountEnd ne -1}">
												<c:choose>
													<c:when test="${recruit.ageCountStart ne -1 and recruit.ageCountEnd eq -1}">
															${recruit.yearPayStart }살 이상											
													</c:when>
													
													<c:when test="${recruit.ageCountStart eq -1 and recruit.ageCountEnd ne -1}">
															${recruit.yearPayEnd }살 이하											
													</c:when>
													
													<c:when test="${recruit.ageCountStart ne -1 and recruit.ageCountEnd ne -1}">
															${recruit.yearPayStart }살	~	${recruit.yearPayEnd }살	 										
													</c:when>
													
													
												</c:choose>
											</c:when>
											
											<c:otherwise>
												나이무관
											</c:otherwise>
											
										</c:choose>
									
									</td>
								</tr>
								
								<tr>
									<th>성별</th>
									
									<td class="gender">
										<c:choose>
											<c:when test="${gender eq 1 }">
												남자
											</c:when>
											<c:when test="${gender eq 2 }">
												여자
											</c:when>
											
											<c:otherwise>
												성별무관
											</c:otherwise>
										</c:choose>
									</td>
								</tr>
							</tbody>
						</table>
						<!--/.table-->
					</div>
					
					<div class="horizontal_table table_wrap">
						<h4 class="table_title">접수기간 및 양식</h4>
						
						<table class="table">
							<tbody>
								<tr>
									<th>접수기간</th>
									<td>
										<span class="recruit_date_start">
											${recruit.recruitDateStart }
										</span>
										
										<strong> ~ </strong>
										
										<span class="recruit_date_end">
											${recruit.recruitDateEnd }
										</span>
									</td>
								</tr>
								
								<tr>
									<th>접수양식</th>
									<td class="recruit_form">
										<c:choose>
											<c:when test="${recruit.recruitForm eq 1}">
												비타민 이력서 양식
											</c:when>
											
											<c:when test="${recruit.recruitForm eq 2 }">
												회사 이력서 양식
											</c:when>
										</c:choose>
									</td>
								</tr>
							</tbody>
						</table>
						<!--/.table-->
					</div>
					
					<div class="horizontal_table table_wrap">
						<h4 class="table_title">근무 환경</h4>
						
						<table class="table">
							<tbody>
								<tr>
									<th>근무요일</th>
									
									<td class="day_of_week">
										${recruit.dayOfWeek }
									
									</td>
								</tr>
								
								<tr>
									<th>복리후생</th>
									
									
									<td class="welfare">
										
									</td>
								</tr>
							</tbody>
						</table>
						<!--/.table-->
					</div>
					
					<div class="horizontal_table table_wrap">
						<h4 class="table_title">문의처</h4>
						
						<table class="table">
							<tbody>
								<tr>
									<th>담당자</th>
									
									<td>
										${recruit.master }
									</td>
								</tr>
								
								<tr>
									<th>전화 및 FAX 전화</th>
									<td>
										${recruit.phoneNumber }
									</td>
								</tr>
								
								<tr>
									<th>회사주소</th>
									<td>
										${recruit.address }
									</td>
								</tr>
							</tbody>
						</table>
						<!--/.table-->
					</div>
			     </div>
			     
			     <div class="btn_panel">
				    <a href="#" class="disabled_btn apply_btn">지원</a>
				  </div>
				  
				  <div>
				    <a href="/enterprise/276/recruit" class="pull-right default_btn btn">목록</a>
				  </div>
				     
		</section>
	</div>
	<%@ include file="/WEB-INF/jsp/include/footer.jsp" %>
</body>
</html>