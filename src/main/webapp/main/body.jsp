<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<html>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" href="/milkyWayForest/css/body.css">
<link rel="stylesheet" type="text/css" href="/milkyWayForest/css/jquery.fullPage.css">
<body>
	
	<!-- 전체영역 -->
	<div id="fullPage">

	<!-- FullPage -->
	<div id="fullpage">
		<section class="section">
			<div class="slide">
				<img src="/milkyWayForest/image/mainpic1.jpg" alt="mainpic1.jpg" 
				style="width: 100%; height: 100%;  top: 0;">
			</div>
			<div class="slide">
				<img src="/milkyWayForest/image/imageSlide.jpg" alt="imageSlide.jpg" 
				style="width: 100%; height: 100%;  top: 0;">
			</div>
		</section>
		
		<section class="section">
			<img src="/milkyWayForest/image/imageSlide.jpg" alt="imageSlide.jpg" 
			style="width: 100%; height: 100%;  top: 0;">
		</section>
		
		<section class="section">
			<img src="/milkyWayForest/image/main_alist_pc.jpg" alt="main_alist_pc.jpg" 
			style="width: 100%; height: 100%;  top: 0;">
		</section>
		
		<section class="section fp-auto-height">
			<jsp:include page="/main/footer.jsp"/>
		</section>
	</div>
		
</div>

	<!-- 맨위로 버튼 -->
	<div>
		<a href="#fullpage"></a>
	</div>

	
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="/milkyWayForest/js/jquery.fullPage.js"></script>
<script src="/milkyWayForest/js/body.js"></script>
<script type="text/javascript">
</script>
</body>
</html>