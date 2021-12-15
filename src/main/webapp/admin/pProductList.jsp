<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/milkyWayForest/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="/milkyWayForest/css/admin.css">
<div class="card" id="pProductListDiv">
  <div class="card-header">
    <h4 class="card-title"> 상품 리스트</h4>
	<div id="productSearch">
		<ul id="updateInfo">
			<li>상품이름, 영어이름, 옵션, 상품가, 할인율을 입력하면 수정하기 버튼이 나타납니다.</li>
		</ul>
	</div>
  </div>
  <div class="card-body">
    <div class="">
      <table class="table" id="pProductListTable">
        <thead class=" text-primary">
          <th>
            상품코드
          </th>
          <th>
            상품이름
          </th>
          <th>
          	영어이름
          </th>
          <th>
            카테고리
          </th>
          <th>
          	옵션
          </th>
          <th>
            상품가
          </th>
          <th>
          	할인율(%)
          </th>
          <th>
          	찜하기
          </th>
          <th>수정/삭제</th>
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
		url: '/milkyWayForest/admin/getProductList',
		type: 'post',
		success: function(data) {
			$.each(data, function(index, items){
				$('<tr>').append($('<td>',{
					id: 'productCode'+index,
					text: items.productCode
				})).append($('<td>').append($('<input>',{
					id: 'productName'+index,
					value: items.productName
				}))).append($('<td>').append($('<input>',{
					id: 'productEngName'+index,
					value: items.productEngName
				}))).append($('<td>',{
					text: items.category
				})).append($('<td>').append($('<input>',{
					type: 'text',
					id: 'productOption'+index,
					value: items.productOption,
					size: '5'
				}))).append($('<td>').append($('<input>',{
					type: 'text',
					id: 'productUnit'+index,
					value: items.productUnit,
					size: '5'
				}))).append($('<td>').append($('<input>',{
					type: 'text',
					id: 'productRate'+index,
					value: items.productRate,
					size: '4'
				}))).append($('<td>',{
					text: items.wishCount,
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
				}))).appendTo($('#pProductListTable'));
	
				
				$('#pProductListTable tr:eq('+(index+1)+')').change(function(){
					$('#updateBtn'+index).show();
				});
				
				$('#updateBtn'+index).click(function(){
					$.ajax({
						url: '/milkyWayForest/admin/productUpdate',
						type: 'post',
						data: {'productCode': $('#productCode'+index).text(),
								'productName': $('#productName'+index).val(),
								'productEngName': $('#productEngName'+index).val(),
								'productOption': $('#productOption'+index).val(),
								'productUnit': $('#productUnit'+index).val(),
								'productRate': $('#productRate'+index).val()},
						success: function(data) {
							alert('수정되었습니다.');
							location.href='/milkyWayForest/admin/productList?dataNum=4';
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
								location.href='/milkyWayForest/admin/productList?dataNum=4';
							},
							error: function(err) {
								console.log(err);
							}
						});
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