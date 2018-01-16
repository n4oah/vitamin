<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>이력서 지원 리스트</title>
		<%@ include file="/WEB-INF/jsp/include/basic.jsp"%>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/basic.css">
	</head>
<body>
	<%@ include file="/WEB-INF/jsp/include/header.jsp" %>
	<div id="wrapper" style="margin-top: 0px;">
		<section class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="panel panel-default panel-table">
		                <div class="panel-heading">
		                    <div class="row">
		                        <div class="col col-xs-6">
		                            <h3 class="panel-title">이력서 </h3>
		                        </div>
		                        <!-- <div class="col col-xs-6 text-right">
		                            <div class="pull-right">
		                                <div class="btn-group" data-toggle="buttons">
		                                    <label class="btn btn-success btn-filter active" data-target="completed">
		                                        <input type="radio" name="options" id="option1" autocomplete="off" checked>
		                                        Completed
		                                    </label>
		                                    <label class="btn btn-warning btn-filter" data-target="pending">
		                                        <input type="radio" name="options" id="option2" autocomplete="off"> Pending
		                                    </label>
		                                    <label class="btn btn-default btn-filter" data-target="all">
		                                        <input type="radio" name="options" id="option3" autocomplete="off"> All
		                                    </label>
		                                </div>
		                            </div>
		                        </div> -->
		                    </div>
		                </div>
		                <div class="panel-body">
		                    <table id="mytable" class="table table-striped table-bordered table-list">
		                        <thead>
			                        <tr>
			                            <th class="col-md-1"><span class="glyphicon glyphicon-wrench" aria-hidden="true"></span>
			                            </th>
			                            <th class="col-md-2">공고</th>
			                            <th class="col-md-1">아이디</th>
			                            <th class="col-md-2">이력서</th>
			                            <th class="col-md-2">자기소개서</th>
			                        </tr>
		                        </thead>
		                        <tbody>
		                        	<c:forEach var="recruitResume" items="${recruitResumeList}">
				                        <tr>
				                            <td align="center">
				                                <a class="btn btn-default"><span class="glyphicon glyphicon-pencil"
				                                                                 aria-hidden="true"></span></a>
				                                <a class="btn btn-danger"><span class="glyphicon glyphicon-trash"
				                                                                aria-hidden="true"></span></a>
				                            </td>
				                            <td>1</td>
				                            <td>John Doe</td>
				                            <td>johndoe@example.com</td>
				                            <td>johndoe@example.com</td>
				                        </tr>
			                        </c:forEach>
		                        </tbody>
		                    </table>
		
		                </div>
		                <div class="panel-footer">
		                    <div class="row">
		                        <!-- <div class="col col-xs-offset-3 col-xs-6">
		                            <nav aria-label="Page navigation" class="text-center">
		                                <ul class="pagination">
		                                    <li>
		                                        <a href="#" aria-label="Previous">
		                                            <span aria-hidden="true">«</span>
		                                        </a>
		                                    </li>
		                                    <li class="active"><a href="#">1</a></li>
		                                    <li><a href="#">2</a></li>
		                                    <li><a href="#">3</a></li>
		                                    <li><a href="#">4</a></li>
		                                    <li><a href="#">5</a></li>
		                                    <li>
		                                        <a href="#" aria-label="Next">
		                                            <span aria-hidden="true">»</span>
		                                        </a>
		                                    </li>
		                                </ul>
		                            </nav>
		                        </div> -->
		                        <!-- <div class="col col-xs-3">
		                            <div class="pull-right">
		                                <button type="button" class="btn btn-primary">
		                                    <span class="glyphicon glyphicon-plus"
		                                          aria-hidden="true"></span>
		                                    Add row
		                                </button>
		                            </div>
		                        </div> -->
		                    </div>
		                </div>
	                </div>
				</div>
			</div>
		</section>
	</div>
	<%@ include file="/WEB-INF/jsp/include/footer.jsp" %>
</body>
</html>