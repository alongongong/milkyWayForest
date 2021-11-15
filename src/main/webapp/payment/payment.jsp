<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/milkyWayForest/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="/milkyWayForest/css/payment.css">
<form id="paymentForm">
	<legend>주문/결제</legend>
	<br>
	<div id="paymentContainer">
		<div id="paymentProductDiv" class="item"><!-- 구매상품정보 -->
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
		
		<div id="paymentOrderer" class="item">
			<p>주문자정보</p>
			<table id="ordererTable" class="table">
				<tr>
					<th>이름</th>
					<td><input type="text" id="name">
				</tr>
				<tr>
					<th>이메일</th>
					<td><input type="text" id="email1"> @ 
						<input type="text" id="email2">
				</tr>
				<tr>
					<th>연락처</th>
					<td>
						<select id="tel1">
							<option value="010">010</option>
							<option value="011">011</option>
							<option value="016">016</option>
							<option value="017">017</option>
							<option value="018">018</option>
							<option value="019">019</option>
						</select> - 
						<input type="text" id="tel2"> - 
						<input type="text" id="tel3">
					</td>
				</tr>
				<tr>
					<th colspan="2">입력된 정보가 정확한 정보인지 확인해 주세요.</th>
				</tr>
			</table>
		</div> <!-- paymentOrderer -->
		<div id="paymentShip" class="item">
			<p>배송지정보</p>
			<table id="paymentShipTable" class="table">
				<tr>
					<td colspan="2">
						<select id="shipSelect">
							<option> ajax로 불러오기</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>배송지명</th>
					<td>
						<input type="text" id="payShipNickname">
					</td>
				</tr>
				<tr>
					<th>수령인</th>
					<td>
						<input type="text" id="payShipReceiver">
					</td>
				</tr>
				<tr>
					<th>수령인 번호</th>
					<td>
						<select id="payShipTel1">
							<option value="010">010</option>
							<option value="011">011</option>
							<option value="016">016</option>
							<option value="017">017</option>
							<option value="018">018</option>
							<option value="019">019</option>
						</select> - 
						<input type="text" id="payShipTel2"> - 
						<input type="text" id="payShipTel3">
					</td>
				</tr>
				<tr>
					<th>수령지 주소</th>
					<td>
						<input type="text" id="payShipZipcode" readonly>
						<input type="button" class="btn btn-outline-secondary" id="payShipZipcodeBtn" value="우편번호 검색"><br>
						<input type="text" id="payShipAddr1" readonly><br>
						<input type="text" id="payShipAddr2">
					</td>
				</tr>
			</table>
		</div> <!-- paymentShip -->
		<div id="paymentSaleSelect" class="item">
			적립금/쿠폰
			<table id="paymentSaleSelectTable" class="table">
				<tr>
					<th>적립금</th>
					<td>
						<input type="text" id="paymentSavedMoney">
					</td>
				</tr>
				<tr>
					<th>할인쿠폰</th>
					<td>
						<input type="text" id="paymentCoupon">
					</td>
				</tr>
			</table>
		</div> <!-- paymentSaleSelect -->
		<div id="paymentMethod" class="item">
			결제정보
			<ul class="table">
				<li>
					<input type="radio" id="paymentMethodCheck" value="무통장입금">
					<label for="paymentMethodCheck">무통장입금</label>
				</li>
				<li>
					<input type="radio" id="paymentMethodCheck" value="신용카드">
					<label for="paymentMethodCheck">신용카드</label>
				</li>
				<li>
					<input type="radio" id="paymentMethodCheck" value="실시간 계좌이체">
					<label for="paymentMethodCheck">실시간 계좌이체</label>
				</li>
				<li>
					<input type="radio" id="paymentMethodCheck" value="카카오페이">
					<label for="paymentMethodCheck">카카오페이</label>
				</li>
			</ul>
		</div> <!-- paymentMethod -->
		<div id="paymentStickDiv" class="item">
			<div id="paymentTotal">
				총 상품금액<span id="totalProductPrice"></span><br>
				총 할인금액<span id="totalSalePrice"></span><br>
				배송비<span id="shipPay"></span><br>
				<p>총 결제금액<span id="totalPayPrice"></span></p>
				
				<input type="button" id="paymentOrderBtn" class="btn btn-danger" value="주문하기">
				<input type="button" id="paymentCancelBtn" class="btn btn-outline-secondary" value="취소">
			</div> <!-- paymentTotal -->
			<div id="paymentDiv"></div> <!-- 유효성검사 -->
		</div> <!-- paymentStickyDiv -->

	</div> <!-- paymentContainer -->
</form>