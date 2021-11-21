<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>은하숲커피|EunhaSOOP Coffee</title>
</head>
<body>
<header>
	<jsp:include page="main/header.jsp"/>
</header>
	<div id="bodySection">
	     <c:if test="${not empty display }">
	         <jsp:include page="${display }" />
	     </c:if>
	</div>
</body>
<footer>
	<jsp:include page="main/footer.jsp" />
</footer>
</html>