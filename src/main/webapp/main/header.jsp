<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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

<div id="Allheader">
	<header>
		<!--				header전체메뉴				--> 		
		<!--				header 하단메뉴				-->
		<div>
			<h1><a href="/milkyWayForest/admin"><img src="/milkyWayForest/image/milkyWayForestLogo2.png" alt="logo"></a></h1>
		
			<nav>
				<ul class="menu">
					<li><a href="javascript:void(0);" style="text-decoration: none; cursor: default;">NOTICE</a>
						<ul class="middleMenu">
							<li><a href="/milkyWayForest/notice/noticeBoard?pg=1">공지사항</a></li>
							<li><a href="/milkyWayForest/notice/eventBoard">이벤트</a></li>
							<li><a href="/milkyWayForest/notice/faqBoard?pg=1">자주 묻는 질문</a></li>
							<li><a href="/milkyWayForest/notice/qnaBoard?pg=1">문의 게시판</a></li>
						</ul>
					</li>
					<li><a href="/milkyWayForest/menuInfo">MENU</a>
						<ul class="middleMenu">
							<li><a href="/milkyWayForest/menuInfo/drinkInfo">음료</a>
								<ul class="smallMenu">
									<li><a href="/milkyWayForest/menuInfo/menuInfo?category=차&menuCode=T&pg=1">차</a></li>
									<li><a href="/milkyWayForest/menuInfo/menuInfo?category=커피&menuCode=C&pg=1">커피</a></li>
								</ul>
							</li>
							<li><a href="/milkyWayForest/menuInfo/foodInfo">푸드</a>
								<ul class="smallMenu">
									<li><a href="/milkyWayForest/menuInfo/menuInfo?category=케이크&menuCode=K&pg=1">케이크</a></li>
									<li><a href="/milkyWayForest/menuInfo/menuInfo?category=브레드&menuCode=B&pg=1">브레드</a></li>
									<li><a href="/milkyWayForest/menuInfo/menuInfo?category=샐러드&menuCode=D&pg=1">샐러드</a></li>
									<li><a href="/milkyWayForest/menuInfo/menuInfo?category=샌드위치&menuCode=S&pg=1">샌드위치</a></li>
								</ul>
							</li>
						</ul>
					</li>
					<li><a href="/milkyWayForest/shopping">SHOPPING</a>
						<ul class="middleMenu">
							<li><a href="/milkyWayForest/shopping/beanNTea">원두/차</a>
								<ul class="smallMenu">
									<li><a href="/milkyWayForest/shopping/beanList">원두</a></li>
									<li><a href="/milkyWayForest/shopping/teaList">차</a></li>
								</ul>
							</li>
							<li><a href="/milkyWayForest/shopping/product">상품</a>
								<ul class="smallMenu">
									<li><a href="/milkyWayForest/shopping/mugList">머그</a></li>
									<li><a href="/milkyWayForest/shopping/glassList">글라스</a></li>
									<li><a href="/milkyWayForest/shopping/plasticTumblrList">플라스틱 텀블러</a></li>
									<li><a href="/milkyWayForest/shopping/stainlessTumblrList">스테인리스 텀블러</a></li>
									<li><a href="/milkyWayForest/shopping/thermosList">보온병</a></li>
									<li><a href="/milkyWayForest/shopping/coffeeEtcList">커피 용품</a></li>
								</ul>
							</li>
						</ul>
					</li>
					<li><a href="/milkyWayForest/findStore">STORE</a></li>
					<li><a href="javascript:void(0);" style="text-decoration: none; cursor: default;">EUNHASOOP</a>
						<ul class="middleMenu">
							<li><a href="/milkyWayForest/info/componyInfo">은하숲 소개</a></li>
							<li><a href="/milkyWayForest/info/gradeBenefitInfo">등급 혜택 안내</a></li>
						</ul>
					</li>
				</ul>
			</nav>
		 	<!--				header 로그인메뉴				-->
				<ul class="spot">
					<c:if test="${memId == null }">
						<li><a href="/milkyWayForest/write/memberAgree"><i class="xi-user"></i><span>Sign Up</span></a></li>
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

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/milkyWayForest/js/header.js"></script>