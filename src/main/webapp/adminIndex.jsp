<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>은하숲 관리자 페이지</title>

<style type="text/css">
html, body {
	width: 100%;
	height: 100%;
	margin: 0;
	padding: 0;
}
ul, li, a, hr, p{
    margin: 0;
    padding: 0;
}
#container {
	display: flex;
	width: 85%;
	margin: 0 auto;
}
</style>

</head>
<body>
<div id="container">
	<div id="adminNav">
		<jsp:include page="nav/nav.jsp"></jsp:include>
	</div>
	
	<div id="adminSection">
		<jsp:include page="${display }"></jsp:include>
	</div>
</div>
</body>
</html>