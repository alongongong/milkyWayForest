<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/milkyWayForest/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="/milkyWayForest/css/payment.css">
<form id="paymentForm">
	<legend>주문/결제</legend>
	<div id="paymentProductDiv"><!-- 구매상품정보 -->
		<table id="paymentProductTable" class="table">
			<tr>
				<th colspan="2">상품정보</th>
				<th>옵션</th>
				<th>상품금액</th>
				<th>수량</th>
				<th>총금액</th>
				<th>예상적립금</th>
			</tr>
		</table> <!-- paymentProductTable -->
	</div> <!-- paymentProductDiv -->
	
	<div id="paymentBody">
		<div id="leftDiv">
			<div id="paymentOrderer">
				asdadasd
			</div> <!-- paymentOrderer -->
		</div> <!-- leftDiv -->
		<div id="rightDiv">
			<div id="paymentStickyDiv">
				총 상품금액<span id="totalProductPrice"></span><br>
				총 할인금액<span id="totalSalePrice"></span><br>
				총 결제금액<span id="totalPayPrice"></span><br>				
			</div> <!-- paymentStickyDiv -->
		</div> <!-- rightDiv -->
	</div> <!-- paymentBody -->
</form>