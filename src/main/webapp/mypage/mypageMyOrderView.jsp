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
						<th>주문일자</th>
						<td id="payDate"></td>
						<th>주문번호</th>
						<td id="paymentCode"></td>
					</tr>
				</table>
			</div>
			<div>
				<table class="table table-bordered">
					<tr>
						<th scope="col">상품번호</th>
						<th scope="col">상품사진</th>
						<th scope="col">상품이름</th>
						<th scope="col">상품금액(수량)</th>
						<th scope="col">배송비</th>
						<th scope="col">진행상태</th>
					</tr>
					<tr>
						<td id="productCode"></td>
						<td><img id="productImageName"></td>
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
			<div id="orderChangeDiv">
				<div class="navbar navbar-light alert-info">
					<span id="orderChangeTitle" class="navbar-brand mb-0 h1"></span>			
				</div>
				<table class="table table-bordered">
					<tr>
						<th id="orderChangeReason"></th>
						<td id="reason"></td>
					</tr>
					<tr>
						<th>상세사유</th>
						<td id="detailReason"></td>
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
						<th>총 상품금액</th>
						<td id="totalProductPrice"></td>
					</tr>
					<tr>
						<th>총 할인금액</th>
						<td id="totalSalePrice"></td>
					</tr>
					<tr>
						<th>배송비</th>
						<td id="shipPay"></td>
					</tr>
					<tr>
						<th>총 결제금액</th>
						<td id="totalPayPrice"></td>
					</tr>
					<tr>
						<th>적립금</th>
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
						<th>수령인</th>
						<td id="payShipReceiver"></td>
					</tr>
					<tr>
						<th>연락처</th>
						<td id="payShipTel"></td>
					</tr>
					<tr>
						<th>배송지</th>
						<td>
							우편번호<span id="payShipZipcode"></span><br>
							주소<span id="payShipAddr"></span>
						</td>
					</tr>
					<tr>
						<th>배송메모</th>
						<td id="shipMemo"></td>
					</tr>
				</table>
			</div>
		</div>
		<div id="myOrderView4"></div>
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
			//alert(JSON.stringify(data));
			//console.log(JSON.stringify(data));
			if(data.paymentList != ''){
				$.each(data.paymentList, function(index, items) {
					if(items.deliveryInfo=='입금대기중' || items.deliveryInfo=='결제완료' || items.deliveryInfo=='배송준비중' || items.deliveryInfo=='배송중'){
						$('#orderCancleBtn').show();
	
					}else if(items.deliveryInfo=='배송완료'){
						$('#orderExchangeBtn').show();
						$('#orderReturnBtn').show();
					}
					
					$('#myOrderView1 #payDate').html(items.payDate);
					$('#myOrderView1 #paymentCode').html(items.paymentCode);
					$('#myOrderView1 #productCode').html(items.productCode);
					$('#myOrderView1 #productName').html(items.productName);
					$('#myOrderView1 #payPrice').html(items.payPrice);
					$('#myOrderView1 #payQty').html(items.payQty);
					$('#myOrderView1 #shipPay').html(items.shipPay);
					$('#myOrderView1 #deliveryInfo').html(items.deliveryInfo);
					
					var payQty = items.payQty*1;
					var payPrice = items.payPrice*1;
					var payRate = items.payRate*1;
					var shipPay = items.shipPay*1;
					
					var totalProductPrice = payQty*payPrice;
					var totalSalePrice = payQty*payPrice*payRate/100;
					var totalPayPrice = payQty*payPrice*(1-payRate/100) + shipPay;
					
					$('#myOrderView2 #totalProductPrice').html(totalProductPrice);
					$('#myOrderView2 #totalSalePrice').html(totalSalePrice);
					$('#myOrderView2 #shipPay').html(items.shipPay);
					$('#myOrderView2 #totalPayPrice').html(totalPayPrice);
					$('#myOrderView2 #savedMoney').html(items.newSavedMoney);
					
					var payShipTel = items.payShipTel1+"-"+items.payShipTel2+"-"+items.payShipTel3;
					var payShipAddr = items.payShipAddr1+" "+items.payShipAddr2
					
					$('#myOrderView3 #payShipReceiver').html(items.payShipReceiver);
					$('#myOrderView3 #payShipTel').html(payShipTel);
					$('#myOrderView3 #payShipZipcode').html(items.payShipReceiver);
					$('#myOrderView3 #payShipAddr').html(payShipAddr);
					$('#myOrderView3 #shipMemo').html(items.shipMemo);
					
				});

			}//if	

		},
		error: function(err){
			console.log(err);
		}
	});
	
	//사진
	$.ajax({
		url: '/milkyWayForest/mypage/getProductImageNameList',
		type: 'post',
		data: 'paymentCode='+$('#paymentCode').val(),
		success: function(data){
			//console.log(JSON.stringify(data));
			
			$.each(data, function(index, items) {
				if(index==0){
					$('#productImageName').attr('src', '/milkyWayForest/productImage/'+items.productImageName);
				}	
			});

		},
		error: function(err){
			console.log(err);
		}
	});
});

$(function(){
	//취소 교환 반품 사유
	$.ajax({
		url: '/milkyWayForest/mypage/getMyOrderCancelInfo',
		type: 'post',
		data: 'paymentCode='+$('#paymentCode').val(),
		success: function(data){
			//console.log(JSON.stringify(data));
			if(data.deliveryInfo != 'false'){
				if(data.deliveryInfo=='취소'){
					$('#orderChangeDiv').show();
					$('#orderChangeTitle').html('주문취소');
					$('#orderChangeReason').html('주문취소사유');
					$('#reason').html(data.reason);
					$('#detailReason').html(data.detailReason);
					
				}else if(data.deliveryInfo=='교환'){
					$('#orderChangeDiv').show();
					$('#orderChangeTitle').html('교환신청');
					$('#orderChangeReason').html('교환사유');
					$('#reason').html(data.reason);
					$('#detailReason').html(data.detailReason);
					
				}else if(data.deliveryInfo=='반품'){
					$('#orderChangeDiv').show();
					$('#orderChangeTitle').html('반품신청');
					$('#orderChangeReason').html('반품사유');
					$('#reason').html(data.reason);
					$('#detailReason').html(data.detailReason);
				}
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
	location.href='/milkyWayForest/mypage/myOrderCancel?paymentCode='+$('#paymentCode').val()+'&request=취소';
});
$('#myOrderView1 #orderExchangeBtn').click(function(){
	location.href='/milkyWayForest/mypage/myOrderCancel?paymentCode='+$('#paymentCode').val()+'&request=교환';
});
$('#myOrderView1 #orderReturnBtn').click(function(){
	location.href='/milkyWayForest/mypage/myOrderCancel?paymentCode='+$('#paymentCode').val()+'&request=반품';
});
</script>