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
		
		<style>
		    /* Remove the navbar's default margin-bottom and rounded borders */ 
		    .navbar {
		      margin-bottom: 0;
		      border-radius: 0;
		    }
		    
		    /* Add a gray background color and some padding to the footer */
		    footer {
		      background-color: #f2f2f2;
		      padding: 25px;
		    }
		    
		  .carousel-inner img {
		      width: 100%; /* Set width to 100% */
		      margin: auto;
		      min-height:200px;
		  }
		  
		  .carousel-inner item {
		  	width: 100%;
		  	height: 100%;
		  }
		  
		  .carousel-inner item img {
		  	background-size: 100 100;
		  }
		  
		  div.col-sm-4 > img.profile-image.company-logo {
			width: 100%;
			height: 200px;
			}
		
		  /* Hide the carousel text when the screen is less than 600 pixels wide */
		  @media (max-width: 600px) {
		    .carousel-caption {
		      display: none; 
		    }
		  }
	  </style>
	</head>
<body>
	<%@ include file="/WEB-INF/jsp/include/header.jsp" %>

	<div id="myCarousel" class="carousel slide" data-ride="carousel">
	    <!-- Indicators -->
	    <ol class="carousel-indicators">
	        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
	        <li data-target="#myCarousel" data-slide-to="1"></li>
	    </ol>
		
	    <!-- Wrapper for slides -->
	    <div class="carousel-inner" role="listbox" style="height: 100%; width: 100%;">
	        <div class="item active">
	            <img src="${pageContext.request.contextPath}/image/main/logo1.jpg" alt="Image">
	        </div>
	
	        <div class="item">
	            <img src="${pageContext.request.contextPath}/image/main/logo2.png" alt="Image">
	            <!-- <div class="carousel-caption">
	                <h3>More Sell $</h3>
	                <p>Lorem ipsum...</p>
	            </div> -->
	        </div>
	    </div>
	
	    <!-- Left and right controls -->
	    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
	        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
	        <span class="sr-only">Previous</span>
	    </a>
	    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
	        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
	        <span class="sr-only">Next</span>
	    </a>
	</div>
	
	<div class="container text-center">
	    <h3>채용정보</h3>
	    <br>
	    <div class="row">
	    	<c:forEach var="recruit" items="${recruitList}">
	    		<a href="${pageContext.request.contextPath}/recruit/recruitDetail.do?no=${recruit.recruitNo}">
			        <div class="col-sm-4">
			            <img class="profile-image company-logo" attr="${recruit.companyNo}" alt="Image">
			            <p>${recruit.title}</p>
			        </div>
		        </a>
	        </c:forEach>
	    </div>
	</div>
	<%@ include file="/WEB-INF/jsp/include/footer.jsp" %>
</body>
</html>