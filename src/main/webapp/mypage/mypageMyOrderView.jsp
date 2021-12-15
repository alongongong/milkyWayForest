<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" href="/milkyWayForest/css/mypage.css">

<form id="myOrderView">
<div id="h1Div"><h1 style="font-size: 35px;">마이페이지</h1></div>
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
	<input type="hidden" id="id" name="id" value="${id }">
	
	<div id="myOrderView-wrapper" class="item">
		<div id="myOrderView1">
			<div id="buttonWrap">
				<input type="button" id="reorderBtn" class="btn" value="재주문">
				<input type="button" id="orderCancleBtn" class="btn" value="주문취소">
				<input type="button" id="orderExchangeBtn" class="btn" value="교환신청">
				<input type="button" id="orderReturnBtn" class="btn" value="반품신청">
			</div>
			<div class="navbar navbar-light">
				<span class="mb-0">주문 상세정보</span>			
			</div>
			<div>
				<table class="table">
					<tr>
						<th>주문일자</th>
						<td id="payDate"></td>
						<th>주문번호</th>
						<td id="paymentCode"></td>
					</tr>
				</table>
			</div>
			<div>
				<table class="table border-bottom" id="productInfoTable">
					<tr>
						<th scope="col">상품번호</th>
						<th scope="col">상품사진</th>
						<th scope="col" width="200px;">상품이름</th>
						<th scope="col">상품금액(수량)</th>
						<th scope="col">배송비</th>
						<th scope="col">진행상태</th>
					</tr>
				</table>
			</div>
			<div id="orderChangeDiv">
				<div class="navbar navbar-light">
					<span id="orderChangeTitle" class="mb-0"></span>			
				</div>
				<table class="table border-bottom">
					<tr>
						<th id="orderChangeReason" width="200px;"></th>
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
			<div class="navbar navbar-light">
				<span class="mb-0">주문/결제 금액 정보</span>			
			</div>
			
			<div id="paymentTotal">
				<table class="table border-bottom">
					<tr>
						<th width="200px;">총 상품금액</th>
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
			<div class="navbar navbar-light">
				<span class="mb-0">배송지 정보</span>			
			</div>
			<div>
				<table class="table border-bottom">
					<tr>
						<th width="200px;">수령인</th>
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

<form id="cartInsertList">
	<table id="cartInsertListTable" >
	</table>
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
				var payQty=0;
				var payPrice=0;
				var payRate=0;
				var shipPay=0;
				
				var totalProductPrice=0;
				var totalSalePrice=0;
				var totalPayPrice=0;

				$.each(data.paymentList, function(index, items) {
					if(items.deliveryInfo=='입금대기중' || items.deliveryInfo=='결제완료' || items.deliveryInfo=='배송준비중' || items.deliveryInfo=='배송중'){
						$('#orderCancleBtn').show();
	
					}else if(items.deliveryInfo=='배송완료'){
						$('#orderExchangeBtn').show();
						$('#orderReturnBtn').show();
					}
					
					$('#myOrderView1 #payDate').html(items.payDate);
					$('#myOrderView1 #paymentCode').html(items.paymentCode);
					
					$('<tr>').append($('<td>',{
						text: items.productCode
					})).append($('<td>',{}).append($('<img>',{
						id: 'productImageName'+index,
						src: '/milkyWayForest/productImage/'+items.productImageName,
						width: '100px',
						heigiht: '100px'
					}))).append($('<td>',{
						text: items.productName
					})).append($('<td>',{
						text: items.payPrice+' ('+items.payQty+'개)'
					})).append($('<td>',{
						text: items.shipPay
					})).append($('<td>',{
						text: items.deliveryInfo
					})).appendTo($('#productInfoTable'));
					
					payQty = items.payQty*1;
					payPrice = items.payPrice*1;
					payRate = items.payRate*1;
					shipPay = items.shipPay*1;
					
					totalProductPrice += payQty*payPrice;
					totalSalePrice += payQty*payPrice*payRate/100;
					totalPayPrice += payQty*payPrice*(1-payRate/100);
					
					$('#myOrderView2 #totalProductPrice').html(totalProductPrice);
					$('#myOrderView2 #totalSalePrice').html(totalSalePrice);
					$('#myOrderView2 #shipPay').html(items.shipPay);
					$('#myOrderView2 #savedMoney').html(items.newSavedMoney);

					var payShipTel = items.payShipTel1+"-"+items.payShipTel2+"-"+items.payShipTel3;
					var payShipAddr = items.payShipAddr1+" "+items.payShipAddr2
					
					$('#myOrderView3 #payShipReceiver').html(items.payShipReceiver);
					$('#myOrderView3 #payShipTel').html(payShipTel);
					$('#myOrderView3 #payShipZipcode').html(items.payShipReceiver);
					$('#myOrderView3 #payShipAddr').html(payShipAddr);
					$('#myOrderView3 #shipMemo').html(items.shipMemo);
				});
				
				totalPayPrice += shipPay;
				$('#myOrderView2 #totalPayPrice').html(totalPayPrice);
				
				$('#productInfoTable').rowspan(4);
				$('#productInfoTable').rowspan(5);

				//재주문 정보 저장
				$.each(data.paymentList, function(index, items) {
					$('<tr>').append($('<td>').append($('<input>',{
						type: 'hidden',
						name: 'productCode',
						value: items.productCode
						
					})).append($('<input>',{
						type: 'hidden',
						name: 'cartOption',
						value: items.productOption
						
					})).append($('<input>',{
						type: 'hidden',
						name: 'cartQty',
						value: items.payQty
						
					}))).appendTo($('#cartInsertListTable'));
				});

			}//if	

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

$('#myOrderView1').on('click','#reorderBtn',function(){
	$.ajax({
		url: '/milkyWayForest/cart/cartInsertList',
		type: 'post',
		data: $('#cartInsertList').serialize(),
		
		success : function() {
			if(confirm("장바구니로 이동하시겠습니까?")){
				location.href= "/milkyWayForest/cart";
			}
		},

		error: function(err) {
			console.log(err);
		
		} 
	});
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

$.fn.colspan = function(rowIdx) {
	return this.each(function(){
		
		var that;
		$('tr', this).filter(":eq("+rowIdx+")").each(function(row) {
			$(this).find('th').filter(':visible').each(function(col) {
				if ($(this).html() == $(that).html()) {
					colspan = $(that).attr("colSpan") || 1;
					colspan = Number(colspan)+1;
					
					$(that).attr("colSpan",colspan);
					$(this).hide(); // .remove();
				} else {
					that = this;
				}
				
				// set the that if not already set
				that = (that == null) ? this : that;
				
			});
		});
	});
};
$.fn.rowspan = function(colIdx, isStats) {       
	return this.each(function(){      
		var that;     
		$('tr', this).each(function(row) {      
			$('td:eq('+colIdx+')', this).filter(':visible').each(function(col) {
				
				if ($(this).html() == $(that).html()
					&& (!isStats 
							|| isStats && $(this).prev().html() == $(that).prev().html()
							)
					) {            
					rowspan = $(that).attr("rowspan") || 1;
					rowspan = Number(rowspan)+1;

					$(that).attr("rowspan",rowspan);
					
					// do your action for the colspan cell here            
					$(this).hide();
					
					//$(this).remove(); 
					// do your action for the old cell here
					
				} else {            
					that = this;         
				}          
				
				// set the that if not already set
				that = (that == null) ? this : that;      
			});     
		});    
	});  
}; 
</script>