<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/milkyWayForest/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="/milkyWayForest/css/admin.css">
<form id="pOrderCancelForm">
<div class="card" id="pOrderCancelDiv">
  <div class="card-header">
    <h4 class="card-title"> 취소, 교환, 반품 관리</h4>
	<div id="stockSearch">
		
	</div>
  </div>
  <div class="card-body">
    <div class="">
      <table class="table" id="pOrderCancelTable">
        <thead class=" text-primary">
          <th>주문번호</th>
          <th>상품명</th>
          <th>수량</th>
          <th>처리현황</th>
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
		url: '/milkyWayForest/admin/getOrderCancel',
		type: 'post',
		success: function(data) {
			var paymentCode;
			var count = 0;
			$.each(data, function(index, items){
				if(paymentCode == items.paymentCode) {
					count++;
					paymentCode = items.paymentCode;
					
					$('#paymentCode'+(index-count)).attr('rowspan', count+1);
					$('#cancelBtn'+(index-count)).attr('rowspan', count+1);

					$('<tr>').append($('<td>',{
						text: items.productName
					})).append($('<td>',{
						text: items.payQty,
						align: 'center'
					})).append($('<td>',{
						text: items.deliveryInfo,
						align: 'center'
					})).appendTo($('#pOrderCancelTable tbody'));
					
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
						align: 'center',
						id: 'cancelBtn'+index
					})).appendTo($('#pOrderCancelTable tbody'));
					
				}
				
				if(items.deliveryInfo == '취소') {
					$('<input>',{
						class: 'btn cancelBtn',
						type: 'button',
						value: '취소처리'
					}).appendTo($('#cancelBtn'+index));
				} else if(items.deliveryInfo == '교환') {
					$('<input>',{
						class: 'btn tradeBtn',
						type: 'button',
						value: '교환처리'
					}).appendTo($('#cancelBtn'+index));
				} else if(items.deliveryInfo == '반품') {
					$('<input>',{
						class: 'btn returnBtn',
						type: 'button',
						value: '반품처리'
					}).appendTo($('#cancelBtn'+index));					
				}
				
			});
			$('.cancelBtn').click(function(){
				var paymentCode = $(this).parents('tr').find('td:eq(0)').text();
				var deliveryInfo = '취소완료';
				$.ajax({
					url: '/milkyWayForest/admin/shipBtn',
					type: 'post',
					data: 'paymentCode='+paymentCode+'&deliveryInfo='+deliveryInfo,
					success: function(data) {
						location.href='/milkyWayForest/admin/orderCancel?dataNum=9';
					},
					error: function(err) {
						console.log(err);
					}
				});
			});
			
			$('.tradeBtn').click(function(){
				var paymentCode = $(this).parents('tr').find('td:eq(0)').text();
				var deliveryInfo = '교환완료';
				$.ajax({
					url: '/milkyWayForest/admin/shipBtn',
					type: 'post',
					data: 'paymentCode='+paymentCode+'&deliveryInfo='+deliveryInfo,
					success: function(data) {
						location.href='/milkyWayForest/admin/orderCancel?dataNum=9';
					},
					error: function(err) {
						console.log(err);
					}
				});
			});
			
			$('.returnBtn').click(function(){
				var paymentCode = $(this).parents('tr').find('td:eq(0)').text();
				var deliveryInfo = '반품완료';
				$.ajax({
					url: '/milkyWayForest/admin/shipBtn',
					type: 'post',
					data: 'paymentCode='+paymentCode+'&deliveryInfo='+deliveryInfo,
					success: function(data) {
						location.href='/milkyWayForest/admin/orderCancel?dataNum=9';
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