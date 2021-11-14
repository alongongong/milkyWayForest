<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/milkyWayForest/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="/milkyWayForest/css/cart.css">
<form id="cartForm">
	<legend>장바구니</legend>
	<br>
	<div id="cartBody">
		<div id="cartTableDiv">
			<ul id="cartNotice">
				<li>장바구니 상품은 최대 30일간 저장됩니다.</li>
				<li>가격, 옵션 등 정보가 변경된 경우 주문이 불가할 수 있습니다.</li>
			</ul>
			<br>
			<table id="cartTable" class="table">
				<tr>
					<th width="25"><input type="checkbox" class="cartProductCheck"></th>
					<th>상품정보</th>
					<th>옵션</th>
					<th>상품금액</th>
					<th>배송비</th>
				</tr>
			</table>
			<input type="button" id="cartAllDeleteBtn" class="btn btn-outline-secondary" value="전체상품 삭제">
			<input type="button" id="cartSelectDeleteBtn" class="btn btn-outline-secondary" value="선택상품 삭제">
			<input type="button" id="cartSelectOrderBtn" class="btn btn-outline-success" value="선택상품 주문">
		</div>
		<div id="cartTotalDiv">
			<div id="cartOrderDetail">
				상품금액, 할인예상금액, 배송비
			</div>
			<div id="cartOrderTotal">
				결제예상금액
			</div>
			<input type="button" id="cartAllOrderBtn" class="btn btn-danger" value="주문하기">
			<input type="button" id="shoppingBtn" class="btn btn-outline-secondary" value="계속 쇼핑하기"><br>
		</div>
	</div>
</form>