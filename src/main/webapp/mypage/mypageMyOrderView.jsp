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
	<input type="hidden" id="paymentCode" name="paymentCode" value="${paymentCode }+''">
	<input type="hidden" id="pg" name="pg" value="${pg }">
	
	<div id="myOrderView-wrapper" class="item">
		<div id="myOrderView1">
			<div class="navbar navbar-light alert-info">
				<span class="navbar-brand mb-0 h1">주문 상세정보</span>			
			</div>
			<div>
				<span>주문일자 <strong id="payDate"></strong></span>
				<span>주문번호 <strong id="paymentCode"></strong></span>
			</div>
			<div>
				<table class="table">
					<tr>
						<td scope="col">상품주문번호</td>
						<td scope="col">상품정보</td>
						<td scope="col">상품금액(수량)</td>
						<td scope="col">배송비</td>
						<td scope="col">진행상태</td>
					</tr>
					<tr>
						<td id="productCode"></td>
						<td id="productName"></td>
						<td>
							<span id="payPrice"></span><br>
							<span id="payQty"></span>
						</td>
						<td id="shipPay"></td>
						<td id=""></td>
					</tr>
				</table>
			</div>
		</div>
		
		<div id="myOrderView2">
			<div class="navbar navbar-light alert-info">
				<span class="navbar-brand mb-0 h1">주문/결제 금액 정보</span>			
			</div>
			
			<div id="paymentTotal">
				<span>총 상품금액<strong id="totalProductPrice"></strong></span><br>
				<span>총 할인금액<strong id="totalSalePrice"></strong></span><br>
				<span>배송비<strong id="shipPay"></strong></span><br>
				<span>총 결제금액<strong id="totalPayPrice"></strong></span>
			</div>
		</div>
		
		<div id="myOrderView3">
			<div class="navbar navbar-light alert-info">
				<span class="navbar-brand mb-0 h1">배송지 정보</span>			
			</div>
			<div>
				<table class="table">
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
						<td id="deliveryInfo"></td>
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
		url: '/milkyWayForest/mypage/getMyOrderInfo?paymentCode='+$('#paymentCode').val(),
		type: 'post',
		success: function(data){
			console.log(JSON.stringify(data));
			if(data.paymentDTO != ''){
				$('#myOrderView1 #payDate').html(data.paymentDTO.payDate);
				$('#myOrderView1 #paymentCode').html(data.paymentDTO.paymentCode);
				$('#myOrderView1 #productCode').html(data.paymentDTO.productCode);
				$('#myOrderView1 #payPrice').html(data.paymentDTO.payDate);
				$('#myOrderView1 #payQty').html(data.paymentDTO.payQty);
				$('#myOrderView1 #shipPay').html(data.paymentDTO.shipPay);
				
				var payQty = data.paymentDTO.payQty*1;
				var payPrice = data.paymentDTO.payPrice*1;
				var payRate = data.paymentDTO.payRate*1;
				var salePrice = payQty*payPrice*(payRate/100);
				var paidTotal = payQty*payPrice*(1-payRate/100);
				
				$('#myOrderView2 #totalProductPrice').html(payQty*payPrice);
				$('#myOrderView2 #totalSalePrice').html(salePrice);
				$('#myOrderView2 #shipPay').html(data.paymentDTO.shipPay);
				$('#myOrderView2 #totalPayPrice').html(paidTotal);
				
				var payShipTel = data.paymentDTO.payShipTel1+"-"+data.paymentDTO.payShipTel2+"-"+data.paymentDTO.payShipTel3;
				var payShipAddr = data.paymentDTO.payShipAddr1+" "+data.paymentDTO.payShipAddr2
				
				$('#myOrderView3 #payShipReceiver').html(data.paymentDTO.payShipReceiver);
				$('#myOrderView3 #payShipTel').html(payShipTel);
				$('#myOrderView3 #payShipZipcode').html(data.paymentDTO.payShipReceiver);
				$('#myOrderView3 #payShipAddr').html(payShipAddr);
				$('#myOrderView3 #deliveryInfo').html(data.paymentDTO.deliveryInfo);
			}	

		},
		error: function(err){
			console.log(err);
		}
	});
});
</script>