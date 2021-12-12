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
		<section class="section" style="background-attachment: fixed;">
			<div class="slide">
				<img src="/milkyWayForest/image/mainpic1.jpg" alt="mainpic1.jpg" 
				style="width: 100%; height: 100%;  top: 0;">
			</div>
			<div class="slide">
				<img src="/milkyWayForest/image/mainImage3.jpg" alt="mainImage3.jpg" 
				style="width: 100%; height: 100%;  top: 0;">
			</div>
				<div class="slide">
				<img src="/milkyWayForest/image/imageSlide.jpg" alt="imageSlide.jpg" 
				style="width: 100%; height: 100%;  top: 0;">
			</div>
		</section>
		
		<section class="section">
			<div class="second_section_text">
			<h1>Pick Your Favorite</h1>
	
			<h2 style="text-align:left;  white-space:pre-line; word-break: break-all;">
			다양한 메뉴를 은하숲에서 즐겨보세요<br>
         	은하숲만의 특별함을 경험할수 있는 최상의 음료<br>
          	은하숲 커피와 완벽한 어울림을 자랑하는 푸드<br>
         	다양한 시도와 디자인으로 가치를 더하는 상품<br>
         	소중한 사람에게 은하숲 상품들로 마음을 전하세요<br>
         	</h2>
			</div>
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
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="/milkyWayForest/js/jquery.fullPage.js"></script>
<script src="/milkyWayForest/js/body.js"></script>
<script type="text/javascript">
</script>
</body>
</html>