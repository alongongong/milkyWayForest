<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" href="/milkyWayForest/css/mypage.css">

<form id="myOrderView">
<div id="main-wrapper">
	<div id="main-sideNav" class="item">
		<jsp:include page="mypageSideNav.jsp"/>
	</div>

	<div id="main-topNav" class="item">
		<jsp:include page="mypageTopNav.jsp"/>
	</div>
	<%----------------- 디폴트 설정 -----------------%>
	<input type="hidden" id="paymentCode" name="paymentCode" value="${paymentCode }">
	<input type="hidden" id="pg" name="pg" value="${pg }">
	
	<div id="myOrderView-wrapper" class="item">
		<div id="myOrderView1">
			<div id="buttonWrap">
				<input type="button" id="reorderBtn" class="btn btn-info" value="재주문">
				<input type="button" id="orderCancleBtn" class="btn btn-info" value="주문취소">
				<input type="button" id="orderExchangeBtn" class="btn btn-info" value="교환신청">
				<input type="button" id="orderReturnBtn" class="btn btn-info" value="반품신청">
			</div>
			<div class="navbar navbar-light alert-info">
				<span class="navbar-brand mb-0 h1">주문 상세정보</span>			
			</div>
			<div>
				<table class="table table-bordered">
					<tr>
						<td>주문일자</td>
						<td id="payDate"></td>
						<td>주문번호</td>
						<td id="paymentCode"></td>
					</tr>
				</table>
			</div>
			<div>
				<table class="table table-bordered">
					<tr>
						<td scope="col">상품번호</td>
						<td scope="col">상품이름</td>
						<td scope="col">상품금액(수량)</td>
						<td scope="col">배송비</td>
						<td scope="col">진행상태</td>
					</tr>
					<tr>
						<td id="productCode"></td>
						<td id="productName"></td>
						<td>
							<span id="payPrice"></span>원<br>
							<span id="payQty"></span>개
						</td>
						<td id="shipPay"></td>
						<td id="deliveryInfo"></td>
					</tr>
				</table>
			</div>
		</div>
		
		<div id="myOrderView2">
			<div class="navbar navbar-light alert-info">
				<span class="navbar-brand mb-0 h1">주문/결제 금액 정보</span>			
			</div>
			
			<div id="paymentTotal">
				<table class="table table-bordered">
					<tr>
						<td>총 상품금액</td>
						<td id="totalProductPrice"></td>
					</tr>
					<tr>
						<td>총 할인금액</td>
						<td id="totalSalePrice"></td>
					</tr>
					<tr>
						<td>배송비</td>
						<td id="shipPay"></td>
					</tr>
					<tr>
						<td>총 결제금액</td>
						<td id="totalPayPrice"></td>
					</tr>
					<tr>
						<td>적립금</td>
						<td id="savedMoney"></td>
					</tr>
				</table>
			</div>
		</div>
		
		<div id="myOrderView3">
			<div class="navbar navbar-light alert-info">
				<span class="navbar-brand mb-0 h1">배송지 정보</span>			
			</div>
			<div>
				<table class="table table-bordered">
					<tr>
						<td>수령인</td>
						<td id="payShipReceiver"></td>
					</tr>
					<tr>
						<td>연락처</td>
						<td id="payShipTel"></td>
					</tr>
					<tr>
						<td>배송지</td>
						<td>
							우편번호<span id="payShipZipcode"></span><br>
							주소<span id="payShipAddr"></span>
						</td>
					</tr>
					<tr>
						<td>배송메모</td>
						<td id="shipMemo"></td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	
</div><!-- main-wrapper -->
</form>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(function(){
	//배송상품 주문정보
	$.ajax({
		url: '/milkyWayForest/mypage/getMyOrderInfo',
		type: 'post',
		data: 'paymentCode='+$('#paymentCode').val(),
		success: function(data){
			//console.log(JSON.stringify(data));
			if(data != ''){
				if(data.deliveryInfo=='입금대기중' || data.deliveryInfo=='결제완료' || data.deliveryInfo=='배송준비중' || data.deliveryInfo=='배송중'){
					$('#orderCancleBtn').show();

				}else if(data.deliveryInfo=='배송완료'){
					$('#orderExchangeBtn').show();
					$('#orderReturnBtn').show();
				}

				$('#myOrderView1 #payDate').html(data.payDate);
				$('#myOrderView1 #paymentCode').html(data.paymentCode);
				$('#myOrderView1 #productCode').html(data.productCode);
				$('#myOrderView1 #productName').html(data.productName);
				$('#myOrderView1 #payPrice').html(data.payPrice);
				$('#myOrderView1 #payQty').html(data.payQty);
				$('#myOrderView1 #shipPay').html(data.shipPay);
				$('#myOrderView1 #deliveryInfo').html(data.deliveryInfo);
				
				var payQty = data.payQty*1;
				var payPrice = data.payPrice*1;
				var payRate = data.payRate*1;
				var shipPay = data.shipPay*1;
				
				var totalProductPrice = payQty*payPrice;
				var totalSalePrice = payQty*payPrice*payRate/100;
				var totalPayPrice = payQty*payPrice*(1-payRate/100) + shipPay;
				
				$('#myOrderView2 #totalProductPrice').html(totalProductPrice);
				$('#myOrderView2 #totalSalePrice').html(totalSalePrice);
				$('#myOrderView2 #shipPay').html(data.shipPay);
				$('#myOrderView2 #totalPayPrice').html(totalPayPrice);
				$('#myOrderView2 #savedMoney').html(data.newSavedMoney);
				
				var payShipTel = data.payShipTel1+"-"+data.payShipTel2+"-"+data.payShipTel3;
				var payShipAddr = data.payShipAddr1+" "+data.payShipAddr2
				
				$('#myOrderView3 #payShipReceiver').html(data.payShipReceiver);
				$('#myOrderView3 #payShipTel').html(payShipTel);
				$('#myOrderView3 #payShipZipcode').html(data.payShipReceiver);
				$('#myOrderView3 #payShipAddr').html(payShipAddr);
				$('#myOrderView3 #shipMemo').html(data.shipMemo);
			}	

		},
		error: function(err){
			console.log(err);
		}
	});
});

$('#myOrderView1 #reorderBtn').click(function(){
	location.href='/milkyWayForest/mypage/myreorder?paymentCode='+$('#paymentCode').val();
});
$('#myOrderView1 #orderCancleBtn').click(function(){
	location.href='/milkyWayForest/mypage/myOrderCancel?paymentCode='+$('#paymentCode').val();
});
$('#myOrderView1 #orderExchangeBtn').click(function(){
	location.href='/milkyWayForest/mypage/myOrderExchange?paymentCode='+$('#paymentCode').val();
});
$('#myOrderView1 #orderReturnBtn').click(function(){
	location.href='/milkyWayForest/mypage/myOrderReturn?paymentCode='+$('#paymentCode').val();
});
</script>