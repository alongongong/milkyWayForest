<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" href="/milkyWayForest/css/mypage.css">

<div id="sideNav-wrapper" class="alert alert-light" role="alert">
	<ul class="nav flex-column border">
	  <li class="nav-item sideNavTitle">
	    <a class="nav-link disabled text-dark" href="#" tabindex="-1" aria-disabled="true">나의 쇼핑 내역</a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link alert-link text-dark" href="/milkyWayForest/mypage/mypageOrderList?pg=1">전체 주문내역</a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link active alert-link text-dark" href="/milkyWayForest/mypage/mypageShipmentList?pg=1">주문/배송조회</a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link alert-link text-dark" href="/milkyWayForest/mypage/mypageCancelList?pg=1">주문취소/교환/반품내역</a>
	  </li>
	  
	  <li class="nav-item sideNavTitle">
	    <a class="nav-link disabled text-dark" href="#" tabindex="-1" aria-disabled="true">나의 혜택 관리</a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link alert-link text-dark" href="/milkyWayForest/mypage/mypageRating">등급/혜택</a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link alert-link text-dark" href="/milkyWayForest/mypage/mypageCpnPnts?pg=1">적립금</a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link alert-link text-dark" href="/milkyWayForest/mypage/mypageCoupon">쿠폰</a>
	  </li>

	  <li class="nav-item sideNavTitle">
	    <a class="nav-link disabled text-dark text-dark" href="#" tabindex="-1" aria-disabled="true">나의 관심 목록</a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link active alert-link text-dark" href="/milkyWayForest/mypage/wishList?pg=1">찜한 상품</a>
	  </li>
	  
	  <li class="nav-item sideNavTitle">
	    <a class="nav-link disabled text-dark" href="#" tabindex="-1" aria-disabled="true">회원정보</a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link active alert-link text-dark" href="/milkyWayForest/mypage/mypagePwdForm">회원정보 변경/탈퇴</a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link alert-link text-dark" href="/milkyWayForest/mypage/mypageShpMng">배송지 관리</a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link alert-link text-dark" href="/milkyWayForest/mypage/mypageMyPost?pg=1">게시글 관리</a>
	  </li>
	</ul>
</div>