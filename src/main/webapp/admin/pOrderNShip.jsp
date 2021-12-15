<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/milkyWayForest/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="/milkyWayForest/css/admin.css">
<form id="pOrderNShipForm">
<div class="card" id="pOrderNShipDiv">
  <div class="card-header">
    <h4 class="card-title"> 주문 확인 / 발송 관리</h4>
	<div id="stockSearch">
		
	</div>
  </div>
  <div class="card-body">
    <div class="">
      <table class="table" id="pOrderNShipTable">
        <thead class=" text-primary">
          <th>주문번호</th>
          <th>상품명</th>
          <th>수량</th>
          <th>배송현황</th>
          <th>버튼</th>
        </thead>
        <tbody>
        </tbody>
      </table>
      <br>
      <div id="boardPagingDiv"></div>
      <br><br>
    </div>
  </div>
</div>
</form>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function(){
	
	$.ajax({
		url: '/milkyWayForest/admin/getOrderNShip',
		type: 'post',
		success: function(data) {
			var paymentCode;
			var count = 0;
			$.each(data, function(index, items){
				if(paymentCode == items.paymentCode) {
					count++;
					paymentCode = items.paymentCode;
					
					$('#paymentCode'+(index-count)).attr('rowspan', count+1);
					$('#shipBtn'+(index-count)).attr('rowspan', count+1);

					$('<tr>').append($('<td>',{
						text: items.productName
					})).append($('<td>',{
						text: items.payQty,
						align: 'center'
					})).append($('<td>',{
						text: items.deliveryInfo,
						align: 'center'
					})).appendTo($('#pOrderNShipTable tbody'));
					
				} else {
					count = 0;
					paymentCode = items.paymentCode;
					$('<tr>').append($('<td>',{
						text: items.paymentCode,
						align: 'center',
						id: 'paymentCode'+index
					})).append($('<td>',{
						text: items.productName
					})).append($('<td>',{
						text: items.payQty,
						align: 'center'
					})).append($('<td>',{
						text: items.deliveryInfo,
						align: 'center'
					})).append($('<td>',{
						id: 'shipBtn'+index,
						align: 'center'
					})).appendTo($('#pOrderNShipTable tbody'));
					
				}
				
				if(items.deliveryInfo == '결제완료') {
					$('<input>', {
						class: 'btn shipPrepareBtn',
						type: 'button',
						value: '배송준비'
					}).appendTo($('#shipBtn'+index));
				} else if(items.deliveryInfo == '배송준비중') {
					$('<input>', {
						class: 'btn shipGoingBtn',
						type: 'button',
						value: '발송'
					}).appendTo($('#shipBtn'+index));
				} else if(items.deliveryInfo == '배송중') {
					$('<input>', {
						class: 'btn shipCompleteBtn',
						type: 'button',
						value: '배송완료'
					}).appendTo($('#shipBtn'+index));
				}
				
				
			});
			
			$('.shipPrepareBtn').click(function(){
				var paymentCode = $(this).parents('tr').find('td:eq(0)').text();
				var deliveryInfo = '배송준비중';
				$.ajax({
					url: '/milkyWayForest/admin/shipBtn',
					type: 'post',
					data: 'paymentCode='+paymentCode+'&deliveryInfo='+deliveryInfo,
					success: function(data) {
						location.href="/milkyWayForest/admin/orderNShip?dataNum=8";
					},
					error: function(err) {
						console.log(err);
					}
				});
			});
			
			$('.shipGoingBtn').click(function(){
				var paymentCode = $(this).parents('tr').find('td:eq(0)').text();
				var deliveryInfo = '배송중';
				$.ajax({
					url: '/milkyWayForest/admin/shipBtn',
					type: 'post',
					data: 'paymentCode='+paymentCode+'&deliveryInfo='+deliveryInfo,
					success: function(data) {
						location.href="/milkyWayForest/admin/orderNShip?dataNum=8";
					},
					error: function(err) {
						console.log(err);
					}
				});
			});
			
			$('.shipCompleteBtn').click(function(){
				var paymentCode = $(this).parents('tr').find('td:eq(0)').text();
				var deliveryInfo = '배송완료';
				$.ajax({
					url: '/milkyWayForest/admin/shipBtn',
					type: 'post',
					data: 'paymentCode='+paymentCode+'&deliveryInfo='+deliveryInfo,
					success: function(data) {
						location.href="/milkyWayForest/admin/orderNShip?dataNum=8";
					},
					error: function(err) {
						console.log(err);
					}
				});
			});
		},
		error: function(err) {
			console.log(err);
		}
	});
});
</script>