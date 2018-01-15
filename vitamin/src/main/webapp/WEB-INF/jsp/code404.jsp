<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

response.setStatus(HttpServletResponse.SC_OK);

%>
<html>
<head>
<title>404</title>
<%@ include file="/WEB-INF/jsp/include/basic.jsp"%>
<style type="text/css">
img {
    width: 100%;
}
</style>
</head>
<body>
<%@ include file="/WEB-INF/jsp/include/header.jsp" %>
<img src="https://issues.jboss.org/secure/attachment/12387931/404-page-04.png">
<%@ include file="/WEB-INF/jsp/include/footer.jsp" %>
</body>
</html>