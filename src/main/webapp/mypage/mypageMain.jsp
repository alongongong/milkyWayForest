<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" href="/milkyWayForest/css/mypage.css">

<form id="mypageMain">
<div id="main-wrapper" class="container">
	<div id="main-sideNav" class="item">
		<jsp:include page="mypageSideNav.jsp"/>
	</div>

	<div id="main-topNav" class="item">
		<jsp:include page="mypageTopNav.jsp"/>	
	</div>
	<%----------------- 디폴트 설정 -----------------%>
	
	<div id="myShipment-wrapper" class="item">
		<div id="myShipment-title" class="navbar navbar-light alert-info">
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
		<div id="myPayment-title" class="navbar navbar-light alert-info">
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