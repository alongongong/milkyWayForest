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
<link rel="stylesheet" href="/milkyWayForest/css/default.css">
<link rel="stylesheet" href="/milkyWayForest/css/header.css"> <!-- PC전용 -->
	<!-- 모바일, 태블릿에서도 가능한 반응형 웹 크기 960(모바일), 1120(태블릿) -->
<link rel="stylesheet" href="/milkyWayForest/css/header_tablet.css" media="all and (max-width:1023px)"> <!--1120 이하 태블릿-->
<link rel="stylesheet" href="/milkyWayForest/css/header_mobile.css" media="all and (max-width:767px)"> <!--960 이하 모바일-->														 
</head>
<body>
	<header>
		<!--				header전체메뉴				--> 		
		<!--				header 하단메뉴				-->
		<div>
			<h1><a href="#a"><img src="/milkyWayForest/image/milkyWayForestLogo.png" alt="logo"></a></h1>
			<nav>
				<ul class="menu">
					<li><a href="#a">EUNHASOOP</a></li>
					<li><a href="#a">MENU</a></li>
					<li><a href="#a">SHOPPING</a></li>
					<li><a href="#a">STORE</a></li>
					<li><a href="#a">WHAT's NEW</a></li>
				</ul>
			</nav>
		 	<!--				header 상단메뉴				-->
				<ul class="spot">
					<li><a href="#a"><i class="xi-user"></i><span>Sign In</span></a></li>
					<li><a href="#a">Login</a></li>
					<li><a href="#a">My Page</a></li>
					<li><a href="#a">Customer Service &amp; Ideas</a></li>
					<li><a href="#a"><span></span></i></a></li>
					<li><a href="#a">search</a></li>
				</ul>
			<!-- 모바일버전시, 전체메뉴 아이콘 -->
			<a href="#a" class="total xi-bars"></a>
			</div>
	</header>
</body> 
</html>