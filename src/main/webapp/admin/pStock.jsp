<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/milkyWayForest/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="/milkyWayForest/css/admin.css">
<div class="card" id="pStockDiv">
  <div class="card-header">
    <h4 class="card-title"> 상품 리스트</h4>
	<div id="stockSearch">
		
	</div>
  </div>
  <div class="card-body">
    <div class="">
      <table class="table" id="pStockTable">
        <thead class=" text-primary">
          <th>
            상품코드
          </th>
          <th>
            상품이름
          </th>
          <th>
          	입고수량
          </th>
          <th>
            출고수량
          </th>
          <th>
          	재고수량
          </th>
          <th width="130">수정/삭제</th>
        </thead>
        <tbody>
        </tbody>
      </table>
    </div>
  </div>
</div>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function(){
	$.ajax({
		url: '/milkyWayForest/admin/getStock',
		type: 'post',
		success: function(data){
			$.each(data, function(index, items){
				$('<tr>').append($('<td>',{
					text: items.productCode,
					id: 'productCode'+index
				})).append($('<td>',{
					text: items.productName
				})).append($('<td>').append($('<input>',{
					type: 'text',
					id: 'enterCount'+index,
					value: items.enterCount
				}))).append($('<td>',{
					text: items.sellCount
				})).append($('<td>',{
					text: items.enterCount - items.sellCount
				})).append($('<td>').append($('<input>',{
					type: 'button',
					value: '삭제',
					id: 'deleteBtn'+index,
					class: 'btn deleteBtn'
				})).append($('<input>',{
					type: 'button',
					value: '수정',
					id: 'updateBtn'+index,
					class: 'btn updateBtn'
				}))).appendTo($('#pStockTable'));
			
				$('#enterCount'+index).change(function(){
					$('#updateBtn'+index).show();
				});
				
				$('#updateBtn'+index).click(function(){
					$.ajax({
						url: '/milkyWayForest/admin/stockUpdate',
						type: 'post',
						data: {'productCode': $('#productCode'+index).text(),
								'enterCount': $('#enterCount'+index).val()},
						success: function(data) {
							alert('수정되었습니다.');
							location.href='/milkyWayForest/admin/stock?dataNum=12';
						},
						error: function(err) {
							console.log(err);
						}
					});
				});
				$('#deleteBtn'+index).click(function(){
					if(confirm('정말 삭제하시겠습니까?')) {
						$.ajax({
							url: '/milkyWayForest/admin/productDelete',
							type: 'post',
							data: 'productCode='+$('#productCode'+index).text(),
							success: function(data) {
								alert('삭제되었습니다.');
								location.href='/milkyWayForest/admin/stock?dataNum=12';
							},
							error: function(err) {
								console.log(err);
							}
						});
					}
				});
				
			});
		},
		error: function(err){
			console.log(err);
		}
	});
});
</script>