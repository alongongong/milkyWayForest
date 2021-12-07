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
					<input type="radio" id="paymentMethodCheck1" name="paymentMethodCheck" value="무통장입금">
					<label for="paymentMethodCheck1">무통장입금</label>
				</li>
				<li>
					<input type="radio" id="paymentMethodCheck2" name="paymentMethodCheck" value="신용카드">
					<label for="paymentMethodCheck2">신용카드</label>
				</li>
				<li>
					<input type="radio" id="paymentMethodCheck3" name="paymentMethodCheck" value="실시간 계좌이체">
					<label for="paymentMethodCheck3">실시간 계좌이체</label>
				</li>
				<li>
					<input type="radio" id="paymentMethodCheck4" name="paymentMethodCheck" value="카카오페이">
					<label for="paymentMethodCheck4">카카오페이</label>
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
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>
//카카오페이 M은하숲11! https://smujihoon.tistory.com/103
$('#paymentForm #paymentOrderBtn').click(function(){
	if($('input:radio').eq(3).is(':checked')){
		alert('sss');
		
		/* var amount = $('#paymentForm #totalPayPrice').val();
		var email = $('#paymentForm #email1').val()+'@'+$('#paymentForm #email2').val();
		var name = $('#paymentForm #name').val();
		var tel = $('#paymentForm #tel1').val()+'-'+$('#paymentForm #tel2').val()+'-'+$('#paymentForm #tel3').val();
		var addr = $('#paymentForm #payShipAddr1').val()+' '+$('#paymentForm #payShipAddr2').val();
		var postcode = $('#paymentForm #payShipZipcode').val(); */

		
	    var IMP = window.IMP; // 생략가능
	    IMP.init('imp48332369'); //가맹점 식별코드
	    var msg;
	    
	    IMP.request_pay({
	        pg : 'kakaopay',
	        pay_method : 'card',
	        merchant_uid : 'merchant_' + new Date().getTime(),
	        name : '은하숲 결제',
	        amount : 100,
	        buyer_email : 'gildong@gmail.com',
	        buyer_name : '홍길동',
        	buyer_tel : '010-1234-5678',
            buyer_addr : '서울특별시 강남구 삼성동',
	        buyer_postcode : '12345'
	    }, function(rsp) { //callback
	        if ( rsp.success ) { // 결제 성공 시: 결제 승인 또는 가상계좌 발급에 성공한 경우
	            //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
	            jQuery.ajax({
	                url: "/milkyWayForest/payment/payComplete", //cross-domain error가 발생하지 않도록 주의해주세요
	                type: 'POST',
	                data: {
	                    imp_uid : rsp.imp_uid,
	                    merchant_uid: rsp.merchant_uid
	                    //기타 필요한 데이터가 있으면 추가 전달
	                }
	            }).done(function(data) {
	                //[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
	                if ( everythings_fine ) {
	                    msg = '결제가 완료되었습니다.';
	                    msg += '\n고유ID : ' + rsp.imp_uid;
	                    msg += '\n상점 거래ID : ' + rsp.merchant_uid;
	                    msg += '\결제 금액 : ' + rsp.paid_amount;
	                    msg += '카드 승인번호 : ' + rsp.apply_num;
	                    
	                    alert(msg);
	                } else {
	                    //[3] 아직 제대로 결제가 되지 않았습니다.
	                    //[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
	                }
	            });//ajax
	            //성공시 이동할 페이지
	            location.href='/milkyWayForest/payment/paySuccess?msg='+msg;
	        } else { //결제 실패시
	            msg = '결제에 실패하였습니다.';
	            msg += '에러내용 : ' + rsp.error_msg;
	            //실패시 이동할 페이지
	            location.href="/milkyWayForest/payment/payFail";
	            alert(msg);
	        }
	    });
	}
});
</script>