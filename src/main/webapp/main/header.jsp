<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<link rel="stylesheet" href="/milkyWayForest/css/header.css"> <!-- PC전용 -->
					   <!-- 모바일, 태블릿에서도 가능한 반응형 웹 크기 960(모바일) -->
<link rel="stylesheet" href="/milkyWayForest/css/header_mobile.css" media="all and (max-width:767px)"> <!--960 이하 모바일-->														 
</head>
<body>
<div id="Allheader">
	<header>
		<!--				header전체메뉴				--> 		
		<!--				header 하단메뉴				-->
		<div>
			<h1><a href="/milkyWayForest/admin"><img src="/milkyWayForest/image/milkyWayForestLogo2.png" alt="logo"></a></h1>
		
			<nav>
				<ul class="menu">
					<li><a href="">NOTICE</a></li>
					<li><a href="/milkyWayForest/menuInfo">MENU</a></li>
					<li><a href="/milkyWayForest/shopping">SHOPPING</a></li>
					<li><a href="/milkyWayForest/findStore">STORE</a></li>
					<li><a href="/milkyWayForest/info/componyInfo">EUNHASOOP</a></li>
				</ul>
			</nav>
		 	<!--				header 상단메뉴				-->
				<ul class="spot">
					<c:if test="${memId == null }">
						<li><a href="/milkyWayForest/write/memberAgree"><i class="xi-user"></i><span>Sign In</span></a></li>
						<li><a href="/milkyWayForest/login/loginForm">Login</a></li>					
					</c:if>
					
					<c:if test="${memId != null }">
						<li><a href="/milkyWayForest/mypage/mypageMain">My Page</a></li>
						<li><a href="/milkyWayForest/login/logout">Logout</a></li>
						<li><a href="/milkyWayForest/cart">cart</a></li>
					</c:if>

					<!-- <li><a href="">Customer Service &amp; Ideas</a></li> -->
					<li><a href=""></i></a></li>
					<!-- <li><a href="#a">search</a></li> -->
				</ul>
			<!-- 모바일버전시, 전체메뉴 아이콘 -->
			<a href="#a" class="total xi-bars"></a>
			</div>
	</header>
</div>
</body> 
</html>