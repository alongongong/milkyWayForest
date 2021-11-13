<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<!--meta name="viewport", 반응형 웹-->
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<!-- 익스플로러 최신버전으로 작동 -->
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<!--"telephone=no" 전화번호가 링크로 걸리는것을 방지-->
	<meta name="format-detection" content="telephone=no">
	<!--xeicon.min.css = 돋보기 아이콘, 매장검색 아이콘-->
<link rel="stylesheet" href="http://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<link rel="stylesheet" href="css/default.css">
<link rel="stylesheet" href="css/index.css"> <!-- PC전용 -->
	<!-- 모바일, 태블릿에서도 가능한 반응형 웹 크기 960(모바일), 1120(태블릿) -->
<link rel="stylesheet" href="css/index_tablet.css" media="all and (max-width:1023px)"> <!--1120 이하 태블릿-->
<link rel="stylesheet" href="css/index_mobile.css" media="all and (max-width:767px)"> <!--960 이하 모바일-->														 
<title>CodingCafe</title>
</head>
<body>
	<header>
		<!-- 			   상,하단 메뉴				 --> 		
		<!-- class.menu=하단메뉴 ,  class.spot=상단메뉴  -->
		<div>
			<h1><a href="#a"><img src="image/logo6.png" alt="logo"></a></h1>
			<nav>
				<ul class="menu">
					<li><a href="#a">CODINGCAFE</a></li>
					<li><a href="#a">MENU</a></li>
					<li><a href="#a">SHOPPING</a></li>
					<li><a href="#a">STORE</a></li>
					<li><a href="#a">WHAT's NEW</a></li>
				</ul>
			</nav>
				<ul class="spot">
					<li><a href="#a"><i class="xi-user"></i><span>Sign In</span></a></li>
					<li><a href="#a">Login</a></li>
					<li><a href="#a">My Page</a></li>
					<li><a href="#a">Customer Service &amp; Ideas</a></li>
					<li><a href="#a"><i class="xi-maker"><span>Find a Store</span></i></a></li>
					<li><a href="#a">search</a></li>
				</ul>
				<a href="#a" class="total xi-bars"></a>
			</div>
	</header>
	<!-- 리워드 -->
	<main>
		<section class="rewards">
		<div>
			<h2><span><img src="image/rewardlogo.png" alt="reward logo"></h2></span>
			<div class="info">
				<span>코딩카페만의 <strong>특별한 혜택</strong>, MY 코딩카페 
				<strong>리워드</strong></span>
				<p>
				   코딩카페 회원이세요? 로그인을 통해 나만의 리워드를 확인해보세요.<br>
				   코딩카페 회원이 아니세요? 가입을 통해 리워드 혜택을 즐기세요.<br>
				</p>
				<a href="">회원가입</a>
				<a href="">로그인</a>
				<p>
				   회원가입 후,
				   코딩카페의 특별한 원두와 Tumblr를 구매하세요!<br>
				   코딩카페의 회원이 되시면, 10% 할인쿠폰을 드립니다!
				</p>
				<a href="">상품구매</a>
			</div>
		</div>
		</section>
		<div id="bodySection">
		<c:if test="${not empty display }">
			<jsp:include page="${display }" />
		</c:if>
		</div>
	</main>
</body>
</html>