<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style type="text/css">
#menuContainer {
	display: flex;
}
#menuContainer #mainNavMenu, #menuContainer #subNavMenu {
	width: 50%;
}
#menuContainer li:first-child {
	font-size: 15pt;
	font-weight: bold;
	margin : 5px;
}
#menuContainer li a {
	color: black;
	text-decoration: none;
}
</style>


			<div id="mainNavMenu">
				<ul id="companyInfo">
					<li><a href="/milkyWayForest/info/componyInfo">회사소개</a></li>
					
					<li><a href="/milkyWayForest/info/componyInfo">회사소개</a></li>
					<li><a href="/milkyWayForest/info/gradeBenefitInfo">등급 혜택 안내</a></li>
				</ul><!-- 회사소개 -->
			
				<ul id="menuInfo">
					<li><a href="/milkyWayForest/menuInfo">메뉴소개</a></li>
					
					<li><a href="/milkyWayForest/menuInfo/drinkInfo">음료</a></li>
					<li><a href="/milkyWayForest/menuInfo/teaInfo">차</a></li>
					<li><a href="/milkyWayForest/menuInfo/coffeeInfo">커피</a></li>
					
					<li><a href="/milkyWayForest/menuInfo/foodInfo">푸드</a></li>
					<li><a href="/milkyWayForest/menuInfo/cakeInfo">케익</a></li>
					<li><a href="/milkyWayForest/menuInfo/breadInfo">브레드</a></li>
					<li><a href="/milkyWayForest/menuInfo/saladInfo">샐러드</a></li>
					<li><a href="/milkyWayForest/menuInfo/sandwirchInfo">샌드위치</a></li>	
					
					<li><a href="/milkyWayForest/menuInfo/menuDetail">메뉴소개 상세 페이지</a></li>
				</ul><!-- 메뉴소개 -->
				
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
				
				<ul id="findStore">
					<li><a href="/milkyWayForest/findStore">매장찾기</a></li>
				</ul><!-- 매장찾기 -->
				
				<ul id="notice">
					<li><a href="/milkyWayForest/notice">공지사항</a></li>
					
					<li><a href="/milkyWayForest/notice/noticeBoard">공지사항</a></li>
					<li><a href="/milkyWayForest/notice/eventBoard">이벤트</a></li>
					<li><a href="/milkyWayForest/notice/faqBoard">자주 묻는 질문</a></li>
					<li><a href="/milkyWayForest/notice/qnaBoard?pg=1">문의 게시판</a></li>
					
					<li><a href="/milkyWayForest/notice/eventView">이벤트 글내용</a></li>
				</ul><!-- 공지사항 -->
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
				
				<ul id="myPage">
					<li><a href="/milkyWayForest/mypage">마이페이지</a></li>
					
					<li><a href="">주문/배송정보</a></li>
					<li><a href="">주문 내역</a></li>
					<li><a href="">주문 현황</a></li>
					
					<li><a href="">나의 활동</a></li>
					<li><a href="">등급/혜택</a></li>
					<li><a href="">적립금/쿠폰</a></li>
					<li><a href="">찜관리</a></li>
					<li><a href="">게시글 관리</a></li>
					
					<li><a href="">개인정보</a></li>
					<li><a href="">정보수정</a></li>
					<li><a href="">배송지 관리</a></li>
					<li><a href="">탈퇴</a></li>
				</ul><!-- 마이 페이지 -->
				
				<ul id="cart">
					<li><a href="">장바구니</a></li>
					<li><a href="">수량버튼</a></li>
					<li><a href="">선택주문</a></li>
					<li><a href="">선택삭제</a></li>
					<li><a href="">전체주문</a></li>
					<li><a href="">전체삭제</a></li>
				</ul><!-- 장바구니 -->
				
				<ul id="pay">
					<li><a href="">결제페이지</a></li>
					<li><a href="">결제진행중</a></li>
					<li><a href="">결제완료</a></li>
				</ul>
			</div>
		