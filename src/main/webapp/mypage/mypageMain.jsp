<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" href="/milkyWayForest/css/mypage.css">

<form id="mypageMain">
<div id="main-wrapper" class="container">
	<div id="main-nav" class="item">
		<jsp:include page="mypageNav.jsp"/>
	</div>

	<div id="myInfoBox-wrapper" class="item card" style="height: 200px;">
		<div class="row no-gutters">
			<div id="myInfoPhoto" class="col-md-4">
				<img src="/milkyWayForest/image/welcome.PNG" class="card-img rounded float-left" style="width:100px; height:100px;" alt="회원등급이미지">
			</div>
			
			<div id="myInfoDescript" class="col-md-8">
				<div class="card-body">
					<h5 class="card-title">한눈에 내 정보 보기</h5>
					<p class="card-text">저희 은하숲을 이용해주셔서 감사합니다.<br>
						<strong>${memId }ㅇㅇㅇ</strong>님은
						<strong>${gradeName }ㅇㅇㅇ</strong>등급입니다.
					</p>
				</div>
			</div>
		</div>
	</div><!-- 내 정보 -->

	<div id="myBenefit-wrapper" class="item">
		<ul class="list-group">
			<li class="list-group-item list-group-item-action">
				<span>사용가능한 쿠폰
					<a href="#">0</a>장
				</span>
			</li>
			<li class="list-group-item list-group-item-action">
				<span>사용가능한 적립금
					<a href="#">0</a>원
				</span>
			</li>
			<li class="list-group-item list-group-item-action">
				<span>총 주문 횟수
					<a href="#">0</a>회
				</span>
			</li>
			<li class="list-group-item list-group-item-action">
				<span>총 주문 금액
					<a href="#">0</a>원
				</span>
			</li>
		</ul>
	</div>
	
	<div id="myShipment-wrapper" class="item">
		<div id="myShipment-title" class="navbar navbar-light bg-light">
			<span class="navbar-brand mb-0 h1">나의 주문처리 현황 (최근 3개월 기준)</span>
		</div>
		
		<div id="myShipment-state">
			<table class="table table-bordered">
				<thead>
					<tr>
						<td scope="col">입금대기중</td>
						<td scope="col">결제완료</td>
						<td scope="col">배송준비중</td>
						<td scope="col">배송중</td>
						<td scope="col">배송완료</td>
					</tr>
				</thead>
			</table>
		</div>
	</div><!-- 나의 주문처리 현황 -->
	
	<div id="myPayment-wrapper" class="item">
		<div id="myPayment-title" class="navbar navbar-light bg-light">
			<span class="navbar-brand mb-0 h1">배송상품 주문정보 (6개월 내 최근 3건)</span>
		</div>
		
		<div id="myPayment-state">
			<table class="table table-bordered">
				<thead>
					<tr>
						<td scope="col">주문번호</td>
						<td scope="col">이미지</td>
						<td scope="col">상품정보</td>
						<td scope="col">수량</td>
						<td scope="col">상품금액</td>
						<td scope="col">배송비</td>
						<td scope="col">주문처리상태</td>
						<td scope="col">취소/교환/반품</td>
					</tr>
				</thead>
			</table>
		</div>
	</div><!-- 배송상품 주문정보 -->
	
</div><!-- main-wrapper -->
</form>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>