<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" href="/milkyWayForest/css/body.css">
</head>
<div id="wrapper">
	<!--  header css 수정하기 -->
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
	</div>
	
	<!-- 전체영역 -->
	<div id="fullPage">
	<!--  첫번째 메인사진 -->
	<div id="" style="overflow-y; width:100%; height:100%";>
		<img src="/milkyWayForest/image/mainpic1.jpg" alt="mainpic1.jpg" 
		style="width:100%; height:110%; top: -120px; position: relative;">
	</div>

		<!-- 우측 스크롤 -->
		<div class = fullpage-nav">
			<span class="fullpage-nav-current">01</span>
			<span class="fullpage-nav-progress">
				<em class="fullpage-nav-progress-active" style="height: 16.6667%;">
				</em>
			</span>
			<span class=fullpage-nave-total>03</span>
		</div>
	
	</div>
</div>
</body> 
</html>