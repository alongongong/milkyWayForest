<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" href="/milkyWayForest/css/mypage.css">

<form id="mypageMain">
<div id="h1Div"><h1 style="font-size: 35px;">마이페이지</h1></div>
<div id="main-wrapper">
	<div id="main-sideNav" class="item">
		<jsp:include page="mypageSideNav.jsp"/>
	</div>

	<div id="main-topNav" class="item">
		<jsp:include page="mypageTopNav.jsp"/>	
	</div>
	<%----------------- 디폴트 설정 -----------------%>
	
	<div id="myShipment-wrapper" class="item">
		<div id="myShipment-title" class="navbar navbar-light">
			<span class="mb-0">나의 주문처리 현황 (최근 3개월 기준)</span>
		</div>
		
		<div id="myShipment-state">
			<table class="table border-bottom">
				<thead>
					<tr align="center">
						<th scope="col">입금대기중</th>
						<th scope="col">결제완료</th>
						<th scope="col">배송준비중</th>
						<th scope="col">배송중</th>
						<th scope="col">배송완료</th>
					</tr>
				</thead>
				<tbody>
					<tr align="center">
						<td><a href="/milkyWayForest/mypage/mypageShipmentList?pg=1" id="countPending"></a></td>
						<td><a href="/milkyWayForest/mypage/mypageShipmentList?pg=1" id="countFinished"></a></td>
						<td><a href="/milkyWayForest/mypage/mypageShipmentList?pg=1" id="countProcessing"></a></td>
						<td><a href="/milkyWayForest/mypage/mypageShipmentList?pg=1" id="countShipping"></a></td>
						<td><a href="/milkyWayForest/mypage/mypageShipmentList?pg=1" id="countShipped"></a></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div><!-- 나의 주문처리 현황 -->
	
	<div id="myPayment-wrapper" class="item">
		<div id="myPayment-title" class="navbar navbar-light">
			<span class="mb-0">배송상품 주문정보 (최근 3건)</span>
		</div>
		
		<div id="myPayment-state">
			<table class="table border-bottom" id="myPaymentTable">
				<thead>
					<tr>
						<th scope="col" width="130px;">주문번호</th>
						<th scope="col">상품이름</th>
						<th scope="col">수량</th>
						<th scope="col">상품금액</th>
						<th scope="col">배송비</th>
						<th scope="col">주문처리상태</th>
					</tr>
				</thead>
			</table>
		</div>
	</div><!-- 배송상품 주문정보 -->
	
</div><!-- main-wrapper -->
</form>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(function(){
	//배송상품 주문정보
	$.ajax({
		url: '/milkyWayForest/mypage/getMainPaymentInfo',
		type: 'post',
		success: function(data){
			console.log(JSON.stringify(data));
			$('#countPending').html(data.countPending);
			$('#countFinished').html(data.countFinished);
			$('#countProcessing').html(data.countProcessing);
			$('#countShipping').html(data.countShipping);
			$('#countShipped').html(data.countShipped);

			if(data.paymentList == ''){
				$('<tr>').append($('<td>',{
					colSpan: '6',
					align: 'center',
					text: '주문정보가 존재하지 않습니다'
				})).appendTo($('#myPaymentTable'));
				
			}else{
				$.each(data.paymentList, function(index, items) {
					$('<tr>').append($('<td>',{
					}).append($('<a>',{
						id: 'paymentCode',
						text: items.paymentCode,
						class: 'orderSubject',
						href: '/milkyWayForest/mypage/MyOrderView?paymentCode='+items.paymentCode
						
					}))).append($('<td>',{
						id: 'productName',
						text: items.productName
						
					})).append($('<td>',{
						id: 'payQty',
						text: items.payQty.toLocaleString()
						
					})).append($('<td>',{
						id: 'payPrice',
						text: items.payPrice.toLocaleString()
						
					})).append($('<td>',{
						id: 'shipPay',
						text: items.shipPay.toLocaleString()
						
					})).append($('<td>',{
						id: 'deliveryInfo',
						text: items.deliveryInfo
						
					})).appendTo($('#myPaymentTable'));
					
				});
				
				$('#myPaymentTable').rowspan(0);

			}
		},
		error: function(err){
			console.log(err);
		}
	});
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