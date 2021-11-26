<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" href="/milkyWayForest/css/mypage.css">

<form id="mypageMain">
<div id="main-wrapper" class="container">
	<div id="main-nav" class="item">
		<div id="nav-wrapper" class="alert alert-light" role="alert">
			<ul class="nav flex-column">
			  <li class="nav-item">
			    <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">나의 쇼핑 내역</a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link active alert-link" href="#">주문/배송조회</a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link alert-link" href="#">전체 주문내역</a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link alert-link" href="#">주문취소/교환/반품내역</a>
			  </li>
			  
			  <li class="nav-item">
			    <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">나의 혜택 관리</a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link active alert-link" href="#">나의 활동</a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link alert-link" href="#">등급/혜택</a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link alert-link" href="#">적립금/쿠폰</a>
			  </li>
		
			  <li class="nav-item">
			    <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">나의 관심 목록</a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link active alert-link" href="#">찜한 상품</a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link alert-link" href="#">최근 본 상품</a>
			  </li>
		
			  <li class="nav-item">
			    <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">회원정보</a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link active alert-link" href="#">회원정보 변경/탈퇴</a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link alert-link" href="#">배송지 관리</a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link alert-link" href="#">게시글 관리</a>
			  </li>
			</ul>
		</div><!-- nav-wrapper -->
	</div><!-- main-nav -->
	
	<div id="main-component" class="item">
		<div id="myInfoBox-wrapper">
			<div id="myInfoPhoto">
				<img src="" alt="회원등급이미지">
			</div>
			
			<div id="myInfoDescript">
				<span>저희 은하숲을 이용해주셔서 감사합니다. 
					<strong>${memId }</strong>님은
					<strong>${gradeName }</strong>등급입니다.
				</span>
			</div>
		</div><!-- myInfoBox-wrapper -->

		<div id="myBenefit-wrapper">
			<ul>
				<li>
					<span>사용가능한 쿠폰</span>
					<a href="#">${count }</a>
				</li>
				<li>
					<span>사용가능한 적립금</span>
					<a href="#">${count }</a>
				</li>
				<li>
					<span>총 주문 횟수</span>
					<a href="#">${count }</a>
				</li>
				<li>
					<span>총 주문 금액</span>
					<a href="#">${count }</a>
				</li>
			</ul>
		</div><!-- myBenefit-wrapper -->
		
		<div id="myShipment-wrapper">
			<div id="myShipment-title">
				<span>나의 주문처리 현황 (최근 3개월 기준)</span>
			</div>
			
			<div id="myShipment-state">
				<ul>
					<li>
						<span>입금대기중</span>
						<a href="#">${count }</a>
					</li>
					<li>
						<span>결제완료</span>
						<a href="#">${count }</a>
					</li>
					<li>
						<span>배송준비중</span>
						<a href="#">${count }</a>
					</li>
					<li>
						<span>배송중</span>
						<a href="#">${count }</a>
					</li>
					<li>
						<span>배송완료</span>
						<a href="#">${count }</a>
					</li>
				</ul>
			</div>
		</div><!-- myShipment-wrapper -->
		
		
	</div><!-- main-component -->
</div><!-- main-wrapper -->
</form>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>