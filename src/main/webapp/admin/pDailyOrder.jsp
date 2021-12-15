<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/milkyWayForest/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="/milkyWayForest/css/admin.css">
<form id="pDailyOrderForm">
<div class="card" id="pDailyOrderFDiv">
  <div class="card-header">
    <h4 class="card-title"> 일자별 주문 내역 확인</h4>
	<div id="stockSearch">
		
	</div>
  </div>
  <div class="card-body">
    <div class="">
      <table class="table" id="pDailyOrderTable">
        <thead class=" text-primary">
          <th>주문번호</th>
          <th>상품명</th>
          <th>수량</th>
          <th>주문자</th>
          <th>배송현황</th>
          <th>주문일자</th>
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
		url: '/milkyWayForest/admin/getDailyOrder',
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
					text: items.id,
					align: 'center'
				})).append($('<td>',{
					text: items.deliveryInfo,
					align: 'center'
				})).append($('<td>',{
					text: items.payDate,
					align: 'center'
				})).appendTo($('#pDailyOrderTable tbody'));
			});
		},
		error: function(err) {
			console.log(err);
		}
	});
});
</script>