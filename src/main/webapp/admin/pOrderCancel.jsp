<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/milkyWayForest/css/admin.css">
<form id="pOrderCancelForm">
<div class="card" id="pOrderCancelDiv">
  <div class="card-header">
    <h4 class="card-title"> 취소, 교환, 반품 관리</h4>
	<div id="stockSearch">
		
	</div>
  </div>
  <div class="card-body">
    <div class="table-responsive">
      <table class="table" id="pOrderCancelTable">
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
		url: '/milkyWayForest/admin/getOrderCancel',
		type: 'post',
		success: function(data) {
			$.each(data, function(index, items){
				$('<tr>').append($('<td>',{
					text: items.paymentCode,
					align: 'center'
				})).append($('<td>',{
					text: items.productName
				})).append($('<td>',{
					text: items.payQty,
					align: 'center'
				})).append($('<td>',{
					text: items.deliveryInfo,
					align: 'center'
				})).append($('<td>').append($('<input>',{
					type: 'button',
					value: '',
					align: 'center'
				}))).appendTo($('#pOrderCancelTable tbody'));
			});
		},
		error: function(err) {
			console.log(err);
		}
	});
});
</script>