<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style type="text/css">
#menuContainer {
	display: flex;

	
}
#menuContainer #mainNavMenu, #menuContainer #subNavMenu, #menuContainer #subNavMenu2  {
	width: 50%;
	

}
#menuContainer li:first-child {
	font-size: 15pt;
	font-weight: bold;
	margin : 5px;
	list-style: none;
	text-indent: -10px;
}

#menuContainer li {
	list-style: none;
	font-size: 10pt;
	color: #154520;
	opacity:1;
}

#menuContainer a:link { 

color: #154520; text-decoration: none; 

}

#menuContainer a:visited { 

color: #154520; text-decoration: none; 

}

#menuContainer a:hover { 
color: black; 
text-shadow:-1px 0 	#FFC81E, 0 1px 	#FFC81E, 1px 0 	#FFC81E,  0 -1px #FFC81E;

}

#menuContainer a:active { 

color: #154520; text-decoration: none; 

}



#menuContainer li a {
	color: 	#154520;
	text-decoration: none;
	
}



.card .card-body {
	background :url("/milkyWayForest/image/pBackPhoto3.jpg")
	no-repeat center;
	height: 100vh;
	
	
}


</style>
<div class="card">
	<div class="card-body">
		<div id="menuContainer">
			<div id="mainNavMenu">
				<ul id="main">
					<li><a href="/milkyWayForest/">메인페이지</a></li>
				</ul>
				<ul id="companyInfo">
					<li><a href="/milkyWayForest/info/componyInfo">회사소개</a></li>
					
					<li><a href="/milkyWayForest/info/componyInfo">회사소개</a></li>
					<li><a href="/milkyWayForest/info/gradeBenefitInfo">등급 혜택 안내</a></li>
				</ul><!-- 회사소개 -->
			
				<ul id="menuInfo">
					<li><a href="/milkyWayForest/menuInfo">메뉴소개</a></li>
					
					<li><a href="/milkyWayForest/menuInfo/drinkInfo">음료</a></li>
					<li><a href="/milkyWayForest/menuInfo/menuInfo?category=차&menuCode=T&pg=1">차</a></li>
					<li><a href="/milkyWayForest/menuInfo/menuInfo?category=커피&menuCode=C&pg=1">커피</a></li>
					
					<li><a href="/milkyWayForest/menuInfo/foodInfo">푸드</a></li>
					<li><a href="/milkyWayForest/menuInfo/menuInfo?category=케이크&menuCode=K&pg=1">케이크</a></li>
					<li><a href="/milkyWayForest/menuInfo/menuInfo?category=브레드&menuCode=B&pg=1">브레드</a></li>
					<li><a href="/milkyWayForest/menuInfo/menuInfo?category=샐러드&menuCode=D&pg=1">샐러드</a></li>
					<li><a href="/milkyWayForest/menuInfo/menuInfo?category=샌드위치&menuCode=S&pg=1">샌드위치</a></li>	
					
					<li><a href="/milkyWayForest/menuInfo/menuDetail">메뉴소개 상세 페이지</a></li>
				</ul><!-- 메뉴소개 -->
				
				
				
				<ul id="findStore">
					<li><a href="/milkyWayForest/findStore">매장찾기</a></li>
				</ul><!-- 매장찾기 -->
				
				<ul id="notice">
					<li><a href="/milkyWayForest/notice/noticeBoard?pg=1">공지사항</a></li>
					
					<li><a href="/milkyWayForest/notice/noticeBoard?pg=1">공지사항</a></li>
					<li><a href="/milkyWayForest/notice/eventBoard">이벤트</a></li>
					<li><a href="/milkyWayForest/notice/faqBoard?pg=1">자주 묻는 질문</a></li>
					<li><a href="/milkyWayForest/notice/qnaBoard?pg=1">문의 게시판</a></li>
					
					<li><a href="/milkyWayForest/notice/eventView?eventCode=001">이벤트 글내용</a></li>
				</ul><!-- 공지사항 -->
			
			
			</div>  <!-- mainNavMenu -->
			
			<!-- 서브 Nav2 -->
			<div id="subNavMenu2">
				<ul id="shopping">
					<li><a href="/milkyWayForest/shopping">쇼핑</a></li>
					
					<li><a href="/milkyWayForest/shopping/beanNTea">원두/차</a></li>
					<li><a href="/milkyWayForest/shopping/beanList">원두</a></li>
					<li><a href="/milkyWayForest/shopping/teaList">차</a></li>
					
					<li><a href="/milkyWayForest/shopping/product">상품</a></li>
					<li><a href="/milkyWayForest/shopping/mugList">머그</a></li>
					<li><a href="/milkyWayForest/shopping/glassList">글라스</a></li>
					<li><a href="/milkyWayForest/shopping/plasticTumblrList">플라스틱 텀블러</a></li>
					<li><a href="/milkyWayForest/shopping/stainlessTumblrList">스테인리스 텀블러</a></li>
					<li><a href="/milkyWayForest/shopping/thermosList">보온병</a></li>
					<li><a href="/milkyWayForest/shopping/coffeeEtcList">커피 용품</a></li>
					
					<li><a href="/milkyWayForest/shopping/shoppingDetail">쇼핑 상세 페이지</a></li>
				</ul><!-- 쇼핑 -->
				
				<ul id="myPage">
					<li><a href="/milkyWayForest/mypage/mypageMain">마이페이지</a></li>
					
					<li><a href="">주문/배송정보</a></li>
					<li><a href="">주문 내역</a></li>
					<li><a href="">주문 현황</a></li>
					
					<li><a href="">나의 활동</a></li>
					<li><a href="">등급/혜택</a></li>
					<li><a href="">적립금/쿠폰</a></li>
					<li><a href="">찜관리</a></li>
					<li><a href="/milkyWayForest/mypage/mypageMyPost?pg=1">게시글 관리</a></li>
					
					<li><a href="/milkyWayForest/mypage/mypageMyInfo">개인정보</a></li>
					<li><a href="/milkyWayForest/mypage/mypageMyInfoUpdate">정보수정</a></li>
					<li><a href="">배송지 관리</a></li>
					<li><a href="/milkyWayForest/mypage/mypageMyInfoDelete">탈퇴</a></li>
				</ul><!-- 마이 페이지 -->
				
			
			</div>
			
			
			<!-- 서브 Nav -->
			<div id="subNavMenu">
				<ul id="memberWrite">
					<li><a href="/milkyWayForest/write/memberWrite">회원가입</a></li>
					<li><a href="/milkyWayForest/write/memberAgree">약관동의</a></li>
					<li><a href="/milkyWayForest/write/writeIdCheck">아이디 중복체크</a></li>
					<li><a href="/milkyWayForest/write/writeEmailCheck">이메일 인증</a></li>
					<li><a href="/milkyWayForest/write/writeOk">회원가입 완료</a></li>
					<li><a href="">간편 회원 가입</a></li>
				</ul><!-- 회원가입 -->
				
				<ul id="memberLogin">
					<li><a href="/milkyWayForest/login/loginForm">로그인</a></li>
					<li><a href="/milkyWayForest/login/findId">아이디 찾기</a></li>
					<li><a href="/milkyWayForest/login/findPwd">비밀번호 찾기</a></li>
				</ul><!-- 로그인 -->
				
				
				
								
				<ul id="cart">
					<li><a href="/milkyWayForest/cart">장바구니</a></li>
					<li><a href="">수량버튼</a></li>
					<li><a href="">선택주문</a></li>
					<li><a href="">선택삭제</a></li>
					<li><a href="">전체주문</a></li>
					<li><a href="">전체삭제</a></li>
				</ul><!-- 장바구니 -->
				
				<ul id="pay">
					<li><a href="/milkyWayForest/payment">결제페이지</a></li>
					<li><a href="">결제진행중</a></li>
					<li><a href="">결제완료</a></li>
				</ul>
			</div> <!-- subNavMenu  -->
		</div> <!-- menuContainer  -->
	</div> <!-- card-body -->
</div> <!-- card -->