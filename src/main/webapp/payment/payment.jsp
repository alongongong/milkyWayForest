<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
			<input type="hidden" id="newSavedMoney" name="newSavedMoney">
		</div> <!-- paymentProductDiv -->
		
		<div id="paymentOrderer" class="item">
			<p>주문자정보</p>
			<table id="ordererTable" class="table">
				<tr>
					<th>이름</th>
					<td><input type="text" id="name" name="name">
				</tr>
				<tr>
					<th>이메일</th>
					<td><input type="text" id="email1" name="email1"> @ 
						<input type="text" id="email2" name="email2">
				</tr>
				<tr>
					<th>연락처</th>
					<td>
						<select id="tel1" name="tel1">
							<option value="010">010</option>
							<option value="011">011</option>
							<option value="016">016</option>
							<option value="017">017</option>
							<option value="018">018</option>
							<option value="019">019</option>
						</select> - 
						<input type="text" id="tel2" name="tel2"> - 
						<input type="text" id="tel3" name="tel3">
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
							<option> ----배송지를 선택해주세요---- </option>
						</select>
					</td>
				</tr>
				<tr>
					<th>배송지명</th>
					<td>
						<input type="text" id="payShipNickname" name="payShipNickname">
					</td>
				</tr>
				<tr>
					<th>수령인</th>
					<td>
						<input type="text" id="payShipReceiver" name="payShipReceiver">
					</td>
				</tr>
				<tr>
					<th>수령인 번호</th>
					<td>
						<select id="payShipTel1" name="payShipTel1">
							<option value="010">010</option>
							<option value="011">011</option>
							<option value="016">016</option>
							<option value="017">017</option>
							<option value="018">018</option>
							<option value="019">019</option>
						</select> - 
						<input type="text" id="payShipTel2" name="payShipTel2"> - 
						<input type="text" id="payShipTel3" name="payShipTel3">
					</td>
				</tr>
				<tr>
					<th>수령지 주소</th>
					<td>
						<input type="text" id="payShipZipcode" name="payShipZipcode" readonly>
						<input type="button" class="btn btn-outline-secondary" id="payShipZipcodeBtn" value="우편번호 검색"><br>
						<input type="text" id="payShipAddr1" name="payShipAddr1" readonly><br>
						<input type="text" id="payShipAddr2" name="payShipAddr2">
					</td>
				</tr>
				<tr>
					<th>배송 메모</th>
					<td>
						<textarea cols="50" rows="5" name="deliveryInfo"></textarea>
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
						<input type="text" id="paymentSavedMoney" name="paymentSavedMoney" value="0">
						<div id="haveSavedMoneyDiv"> 보유 적립금 : 
							<span id="haveSavedMoney"></span> 원
						</div>
					</td>
				</tr>
				<tr>
					<th>할인쿠폰</th>
					<td>
						<select id="paymentCoupon" name="paymentCoupon">
							<option> ----쿠폰을 선택해주세요----</option>
						</select>
						<div id="haveCouponDiv"> 보유 쿠폰수 : 
							<span id="haveCoupon"></span> 장
						</div>
					</td>
				</tr>
			</table>
		</div> <!-- paymentSaleSelect -->
		<div id="paymentMethod" class="item">
			결제정보
			<ul class="table">
				<li>
					<input type="radio" id="paymentMethodCheck1" name="paymentMethod" value="무통장입금">
					<label for="paymentMethodCheck1">무통장입금</label>
				</li>
				<li>
					<input type="radio" id="paymentMethodCheck2" name="paymentMethod" value="신용카드">
					<label for="paymentMethodCheck2">신용카드</label>
				</li>
				<li>
					<input type="radio" id="paymentMethodCheck3" name="paymentMethod" value="실시간 계좌이체">
					<label for="paymentMethodCheck3">실시간 계좌이체</label>
				</li>
				<li>
					<input type="radio" id="paymentMethodCheck4" name="paymentMethod" value="카카오페이" checked>
					<label for="paymentMethodCheck4">카카오페이</label>
				</li>
			</ul>
		</div> <!-- paymentMethod -->
		<div id="paymentStickDiv" class="item">
			<div id="paymentTotal">
				총 상품금액<span id="totalProductPrice"></span><br>
				총 할인금액<span id="totalSalePrice"></span><br>
				배송비<span id="shipPay"></span>
					<input type="hidden" id="shipPay1" name="shipPay"><br>
				<p>총 결제금액<span id="totalPayPrice"></span></p>
				
				<input type="button" id="paymentOrderBtn" class="btn btn-danger" value="주문하기">
				<input type="button" id="paymentCancelBtn" class="btn btn-outline-secondary" value="취소">
				<div id="paymentDiv"></div> <!-- 유효성검사 -->
			</div> <!-- paymentTotal -->
		</div> <!-- paymentStickyDiv -->

	</div> <!-- paymentContainer -->
	
</form>

<form id="cartCodeForm">
	<c:forEach var="code" items="${cartCode }">
		<input type="hidden" name="cartCode" value="${code}">
	</c:forEach>
</form>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>
$('#paymentForm #paymentOrderBtn').click(function(){
	$('#paymentDiv').empty();
	if(!$('#name').val() || !$('#email1').val() || !$('#email2').val() || !$('#tel1').val() || !$('#tel2').val() || !$('#tel3').val()) {
		$('#paymentDiv').text('주문자 정보를 입력해주세요.');
	} else if(!$('#payShipNickname').val() || !$('#payShipReceiver').val() || !$('#payShipTel1').val() || !$('#payShipTel2').val() || !$('#payShipTel3').val() || !$('#payShipZipcode').val() || !$('#payShipAddr1').val() || !$('#payShipAddr2').val()) {
		$('#paymentDiv').text('배송지 정보를 입력해주세요.');
	} else {
		
		$.ajax({
			url: '/milkyWayForest/payment/payment',
			type: 'post',
			data: $('#paymentForm').serialize(),
			success: function(data) {
				alert("성공");
			},
			error: function(err) {
				console.log(err);
			}
		});
		
		//카카오페이
		if($('input:radio').eq(3).is(':checked')){
			var totalPayPrice = $('#paymentForm #totalPayPrice').val();
			/* var email = $('#paymentForm #email1').val()+'@'+$('#paymentForm #email2').val();
			var name = $('#paymentForm #name').val();
			var tel = $('#paymentForm #tel1').val()+'-'+$('#paymentForm #tel2').val()+'-'+$('#paymentForm #tel3').val();
			var addr = $('#paymentForm #payShipAddr1').val()+' '+$('#paymentForm #payShipAddr2').val();
			var postcode = $('#paymentForm #payShipZipcode').val() */;

		    var IMP = window.IMP; // 생략가능
		    IMP.init('imp48332369'); //가맹점 식별코드
		    var msg;
		    
		    IMP.request_pay({
		        pg : 'kakaopay',
		        pay_method : 'card',
		        merchant_uid : 'merchant_' + new Date().getTime(),
		        name : '은하숲 상품 결제', //결제창에서 보여질 이름
		        amount : 100, //실제 결제되는 가격 totalPayPrice
		        /* buyer_email : email,
		        buyer_name : name,
	        	buyer_tel : tel,
	            buyer_addr : addr,
		        buyer_postcode : postcode */
		    }, function(rsp) {
				console.log(rsp);
		        
		        if ( rsp.success ) { //결제 성공시
		        	//DB
		        
	                msg = '결제가 완료되었습니다.';
	                msg += '\n고유ID : ' + rsp.imp_uid;
	                msg += '\n상점 거래ID : ' + rsp.merchant_uid;
	                msg += '\n결제 금액 : ' + rsp.paid_amount;
	                msg += '\n카드 승인번호 : ' + rsp.apply_num;

	                alert(msg);
	    	        location.href="/milkyWayForest/payment/paySuccess";

		        } else { //결제 실패시
		            msg = '결제에 실패하였습니다.';
		            msg += '\n에러내용 : ' + rsp.error_msg;
		            
		            alert(msg);
		        }

		    });
		}//카카오페이
	}
});

$(function(){
	
	$.ajax({
		url: '/milkyWayForest/payment/getPayment',
		type: 'post',
		data: $('#cartCodeForm').serialize(),
		success: function(data) {
			alert(JSON.stringify(data));
			
			var totalPrice = 0;
			var totalSalePrice = 0;
			var allPrice = 0;
			var savedMoney = 0;
			var memberGrade;
			
			$.each(data.memberList, function(index, items) {
				$('#name').val(items.name);
				$('#email1').val(items.email1);
				$('#email2').val(items.email2);
				$('#tel1').val(items.tel1);
				$('#tel2').val(items.tel2);
				$('#tel3').val(items.tel3);
				$('#haveSavedMoney').text(items.savedMoney.toLocaleString());
				memberGrade = items.memberGrade;
				if(items.coupon != null) {
					$('<option>',{
						text: items.couponName,
						value: items.couponName
					}).appendTo($('#paymentCoupon'));
				} else {
					$('#haveCoupon').text('0');
				}
				
				$('#paymentSavedMoney').change(function(){
					if($('#paymentSavedMoney').val() > items.savedMoney) {
						$('#paymentSavedMoney').val(items.savedMoney);
					}
				});
			});
			
			$.each(data.cartList, function(index, items) {
				var totalProductPrice = items.productUnit*items.cartQty*(1-items.productRate/100);
				totalPrice += items.productUnit*items.cartQty;
				totalSalePrice += items.productUnit*items.cartQty*items.productRate;
				allPrice += totalProductPrice;
				
				$('<tr>').append($('<td>',{
					text: items.productName,
					colspan: '2',
					style: 'padding-left: 30px;'
				}).append($('<input>',{
					type: 'hidden',
					name: 'productCode',
					value: items.productCode
				}))).append($('<td>',{
					text: items.cartOption,
					align: 'center'
				}).append($('<input>',{
					type: 'hidden',
					name: 'productOption',
					value: items.cartOption
				}))).append($('<td>',{
					text: items.productUnit.toLocaleString()+'원',
					align: 'center'
				}).append($('<input>',{
					type: 'hidden',
					name: 'payPrice',
					value: items.productUnit
				}))).append($('<td>',{
					text: items.cartQty+'개',
					align: 'center'
				}).append($('<input>',{
					type: 'hidden',
					name: 'payQty',
					value: items.cartQty
				})).append($('<input>',{
					type:'hidden',
					name: 'payRate',
					value: items.productRate
				}))).append($('<td>',{
					text: totalProductPrice.toLocaleString()+'원',
					align: 'center'
				})).append($('<td>',{
					id: 'productSavedMoney'+index,
					align: 'center'
				})).appendTo($('#paymentProductTable'));
				
				if(memberGrade == 'welcome') {
					savedMoney += totalProductPrice*0.01;
					$('#productSavedMoney'+index).text((totalProductPrice*0.01).toLocaleString() + '원 ');
				} else if(memberGrade == 'green') {
					savedMoney += totalProductPrice*0.03;
					$('#productSavedMoney'+index).text((totalProductPrice*0.03).toLocaleString() + '원 ');
				} else {
					savedMoney += totalProductPrice*0.05;
					$('#productSavedMoney'+index).text((totalProductPrice*0.05).toLocaleString() + '원 ');
				}
					
			});
			
			var shipPay = 0;
			
			$('#totalProductPrice').text(totalPrice.toLocaleString()+'원');
			$('#totalSalePrice').text(totalSalePrice.toLocaleString()+'원');
			if((totalPrice-totalSalePrice) >= 50000) {
				$('#shipPay').text('0원');
			} else {
				$('#shipPay').text('2,500원')
				shipPay += 2500;
			}
			
			allPrice += shipPay;
			$('#shipPay1').val(shipPay);
			$('#newSavedMoney').val(savedMoney);
			$('#totalPayPrice').text(allPrice.toLocaleString()+'원');
			
			
			$.each(data.shipList, function(index, items) {
				$('<option>',{
					text: items.shipNickname,
				}).appendTo($('#shipSelect'));
				
				$('#shipSelect').change(function(){
					if($('#shipSelect option:eq('+(index+1)+')').prop('selected')) {
						$('#payShipNickname').val(items.shipNickname);
						$('#payShipReceiver').val(items.shipReceiver);
						$('#payShipTel1').val(items.shipTel1);
						$('#payShipTel2').val(items.shipTel2);
						$('#payShipTel3').val(items.shipTel3);
						$('#payShipZipcode').val(items.shipZipcode);
						$('#payShipAddr1').val(items.shipAddr1);
						$('#payShipAddr2').val(items.shipAddr2);
					}
				});
			})
		},
		error: function(err) {
			console.log(err);
		}
	});
});
</script>