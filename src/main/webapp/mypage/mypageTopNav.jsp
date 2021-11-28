<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" href="/milkyWayForest/css/mypage.css">

<div id="topNav-wrapper" class="container">
	<div id="myInfoBox-wrapper" class="item card">
		<div class="row no-gutters">
			<div id="myInfoPhoto" class="col-md-4">
				<img src="/milkyWayForest/image/welcome.png" class="card-img rounded float-left" alt="회원등급이미지">
			</div>
			
			<div id="myInfoDescript" class="col-md-8">
				<div class="card-body">
					<h5 class="card-title">한눈에 내 정보 보기</h5>
					<p class="card-text">안녕하세요. 저희 은하숲을 이용해주셔서 감사합니다.<br>
						<strong>${memId }</strong>님은
						<strong>${gradeName }</strong>등급입니다.
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
</div>