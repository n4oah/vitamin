<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>이력서 리스트</title>
		<%@ include file="/WEB-INF/jsp/include/basic.jsp"%>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/basic.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/resume.css">
		<script src="${pageContext.request.contextPath}/js/resumeList.js"></script>
	</head>
<body>
	<%@ include file="/WEB-INF/jsp/include/header.jsp" %>
	<div id="wrapper" style="margin-top: 0px;">
		<section class="container">
			<div class="horizontal_table table_wrap">
				<h4 class="table_title">이력서 리스트</h4>
				<input style="float: right" type="button" class="btn-primary"  id="regResume" value="이력서등록">
				<table class="table">
					<tbody>
				      <tr>
				        <th>이력서제목</th>
				        <th>공개여부</th>
				        <th>등록날짜</th>
				      </tr>
				      <c:forEach var="resume" items="${rlist}">
				       <tr>
				        <td><a href="#" onclick="openResume(${reusme.resumeNo})" class="resumeTitle">${resume.resumeTitle}</a></td>
				        <td>
				       		<input name="openstate" type="checkbox" <c:if test="${resume.openState eq 1}">checked="checked"</c:if>>
				        </td>
				        <td><fmt:formatDate value="${resume.regDate}" pattern="yyyy-MM-dd hh:mm:ss"/></td>
				      </tr>
				      </c:forEach>
				    </tbody>
				</table>
			</div>
		</section>
		
	</div>
	<%@ include file="/WEB-INF/jsp/include/footer.jsp" %>
	<script>
	$(document).ready(function(){
		$("#regResume").click(function(){
			location.href="${pageContext.request.contextPath}/mypage/resumeForm.do";
		});
		
		
		function openResume(resumeNo){
			window.open(
					"${pageContext.request.contextPath}/mypage/resumeInfo.do?resumeNo="+resumeNo,"","width=500, height=800"	  
				);
		}
			
		});
		
	</script>
</body>
</html>