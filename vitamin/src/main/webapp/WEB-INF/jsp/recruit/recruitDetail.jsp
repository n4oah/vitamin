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
			        <h3>CON-C</h3>
			        <h3 class="line_break">CON-C 채용공고 샘플</h3>
			        <p class="tags">
			          <span>SAMPLE,&nbsp;안내용</span>
			        </p> 
			        <!--/.tags -->
			      </div> 
			      <!--/.col-xs-12.col-md-9.col-lg-9 -->
			      <div class="col-xs-12 col-md-4 col-lg-3">
			        <div class="top_right_wrap">
			          <p>접수기간 ~<span>2017.11.30</span> </p>
			          <a href="#" class="disabled_btn apply_btn">지원 기간 만료</a>
			        </div>  <!--/.top_right_wrap -->
			      </div> <!--/.col-xs-12.col-md-3-->
			    </div>
			 </div>
			    <div class="edit_content">
				    <div class="horizontal_table table_wrap">
						<h4 class="table_title">주요 업무</h4>
						
						<table class="table">
							<tbody>
								<tr>
									<th>주요 업무</th>
									<td>SAMPLE&nbsp;</td>
								</tr>
							</tbody>
						</table>
						<!--/.table-->
					</div>
			     </div>
			     
			     <div class="btn_panel">
				    <a href="#" class="disabled_btn apply_btn">지원 기간 만료</a>
				  </div>
				  
				  <div>
				    <a href="/enterprise/276/recruit" class="pull-right default_btn btn">목록</a>
				  </div>
				     
		</section>
	</div>
	<%@ include file="/WEB-INF/jsp/include/footer.jsp" %>
</body>
</html>