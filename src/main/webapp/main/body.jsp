<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<html>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" href="/milkyWayForest/css/body.css">
<link rel="stylesheet" type="text/css" href="/milkyWayForest/css/jquery.fullPage.css">

<body>
<!-- <div id="wrapper"> -->
<!-- 	header css 수정하기 
	<div id="container" class="fullpage-wrapper" style="height: 100%; position: relavtive;
	touch-action: none; top: 0px;">
		<section class="main-section" data-anchor="visual" style="height: 938px;">
			<div class=fp-tableCell" style="938px;">
				<div class="swiper-container">
					<div class="swiper-wrapper" style="transform: translate 3d(-1360px, 0px, 0px);
						transition-duration: 0ms;">	
				
			
					</div>	
				</div>
			</div>
		</section>
	</div> -->
	
	<!-- 전체영역 -->
	<div id="fullPage">
	
	<!--  첫번째 메인사진 -->
	<!-- <div id="" style="overflow-y; width:100%; height:100%";>
	 	<img src="/milkyWayForest/image/mainpic1.jpg" alt="mainpic1.jpg" 
		style="width: 100%; height: 100%;  top: 0; position:absolute;">
	</div> -->
	
	<!--  슬라이드 -->
<!-- 	<div class="slider">
	    <input type="radio" name="slide" id="slide1" checked>
	    <input type="radio" name="slide" id="slide2">
	<ul id="imgholder" class="imgs" id="fullpage">
        <li><img src="/milkyWayForest/image/mainpic1.jpg" alt="mainpic1.jpg" 
		style="width: 100%; height: 100%;  top: 0; position:relative;">
		</li>
        <li><img src="/milkyWayForest/image/imageSlide.jpg" alt="imageSlide.jpg" 
		style="width: 100%; height: 100%;  top: 0; position:relative;">
        </li>  
	</ul> 
	<div class="bullets">
       	<label for="slide1">&nbsp;</label>
       	 <label for="slide2">&nbsp;</label>
	</div>	
	</div> -->
	
	<!-- FullPage -->
	<div id="fullpage">
		<section class="section">
			<img src="/milkyWayForest/image/mainpic1.jpg" alt="mainpic1.jpg" 
			style="width: 100%; height: 100%;  top: 0;">
		</section>
		
		<section class="section">
			<img src="/milkyWayForest/image/imageSlide.jpg" alt="imageSlide.jpg" 
			style="width: 100%; height: 100%;  top: 0;">
		</section>
	</div>
		
</div>

	<!-- UP버튼 -->
<!-- 	<div class="main-quick-container">
		<a href="#visual" data-menuanchor="visual" class="button button-move-top is active">
			<i class="ico-arrow-up"></i>
			<span class="sr-only">맨 위로 이동</span>
		</a>
	</div> -->
	
	
	<!-- 우측 스크롤 -->
<!--  	<div class = fullpage-nav">
		<span class="fullpage-nav-current">01</span>
		<span class="fullpage-nav-progress">
			<em class="fullpage-nav-progress-active" style="height: 16.6667%;">
			</em>
		</span>
		<span class=fullpage-nave-total>03</span>
	</div> -->
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="/milkyWayForest/js/jquery.fullPage.js"></script>
<script src="/milkyWayForest/js/body.js"></script>
<script type="text/javascript">
</script>
</body>
</html>