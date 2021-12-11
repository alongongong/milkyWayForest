<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" href="/milkyWayForest/css/mypage.css">

<form id="myOrderCancel">
<div id="main-wrapper">
	<div id="main-sideNav" class="item">
		<jsp:include page="mypageSideNav.jsp"/>
	</div>

	<div id="main-topNav" class="item">
		<jsp:include page="mypageTopNav.jsp"/>	
	</div>
	<%----------------- 디폴트 설정 -----------------%>
	<input type="hidden" id="paymentCode" name="paymentCode" value="${paymentCode }">
	<input type="hidden" id="request" name="request" value="${request }">
	
	<div id="myOrderCancel-wrapper" class="item">
		<div id="myOrderView1">
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
	
		<table id="myOrderCancelTable" class="table">
			<tr>
				<td>취소/교환/반품 사유</td>
				<td>
					<select id="reason" name="reason">
						<option>사유 선택</option>
						<option value="구매의사취소">구매의사취소</option>
						<option value="색상 및 사이즈 변경">색상 및 사이즈 변경</option>
						<option value="다른 상품 잘못 주문">다른 상품 잘못 주문</option>
						<option value="서비스 및 상품 불만족">서비스 및 상품 불만족</option>
						<option value="배송 지연">배송 지연</option>
						<option value="배송 누락">배송 누락</option>
						<option value="상품 품절">상품 품절</option>
						<option value="상품 파손">상품 파손</option>
						<option value="상품 정보 상이">상품 정보 상이</option>
						<option value="오배송">오배송</option>
						<option value="색상 등이 다른 상품을 잘못 배송">색상 등이 다른 상품을 잘못 배송</option>
						<option value="입금기간 마감으로 인한 자동취소">입금기간 마감으로 인한 자동취소</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>상세사유</td>
				<td>
					<textarea id="detailReason" name="detailReason" rows="17"></textarea>
				</td>
			</tr>
			<tr>
				<td></td>
				<td></td>
			</tr>
		</table>
		<div id="myOrderCancelBtnDiv" align="center">
			<input type="button" value=" 제출 " id="myOrderCancelBtn" class="btn btn-warning">
			<input type="button" value=" 취소 " id="cancelBtn" onclick="history.back()" class="btn btn-outline-secondary">
		</div>
	</div>
	
</div><!-- main-wrapper -->
</form>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/milkyWayForest/js/mypage.js"></script>
<script>
$(function(){
	//배송상품 주문정보
	$.ajax({
		url: '/milkyWayForest/mypage/getMyOrderInfo?paymentCode='+$('#paymentCode').val(),
		type: 'post',
		success: function(data){
			console.log(JSON.stringify(data));
			if(data.paymentList != ''){
				$.each(data.paymentList, function(index, items) {
					$('#myOrderView1 #payDate').html(items.payDate);
					$('#myOrderView1 #paymentCode').html(items.paymentCode);
					$('#myOrderView1 #productCode').html(items.productCode);
					$('#myOrderView1 #productName').html(items.productName);
					$('#myOrderView1 #payPrice').html(items.payPrice);
					$('#myOrderView1 #payQty').html(items.payQty);
					$('#myOrderView1 #shipPay').html(items.shipPay);
					$('#myOrderView1 #deliveryInfo').html(items.deliveryInfo);
					
				});
				
			}	

		},
		error: function(err){
			console.log(err);
		}
	});
});

$('#myOrderCancel #myOrderCancelBtn').click(function(){
	if($('#request').val()=='취소'){
		$.ajax({
			url: '/milkyWayForest/mypage/updateMyOrderCancel',
			type: 'post',
			data: $('#myOrderCancel').serialize(),
			success: function(data) {
				alert('고객님의 요청이 접수되었습니다.');
				location.href='/milkyWayForest/mypage/mypageCancelList?pg=1';
			},
			error: function(err) {
				console.log(err);
			}
		});
		
	}else if($('#request').val()=='교환'){
		$.ajax({
			url: '/milkyWayForest/mypage/updateMyOrderExchange',
			type: 'post',
			data: $('#myOrderCancel').serialize(),
			success: function(data) {
				alert('고객님의 요청이 접수되었습니다.');
				location.href='/milkyWayForest/mypage/mypageCancelList?pg=1';
			},
			error: function(err) {
				console.log(err);
			}
		});
		
	}else if($('#request').val()=='반품'){
		$.ajax({
			url: '/milkyWayForest/mypage/updateMyOrderReturn',
			type: 'post',
			data: $('#myOrderCancel').serialize(),
			success: function(data) {
				alert('고객님의 요청이 접수되었습니다.');
				location.href='/milkyWayForest/mypage/mypageCancelList?pg=1';
			},
			error: function(err) {
				console.log(err);
			}
		});
		
	}

});
</script>
