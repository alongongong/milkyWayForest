<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/milkyWayForest/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="/milkyWayForest/css/cart.css">
<form id="cartForm">
	<legend>장바구니</legend>
	<br>
	<div id="cartBody">
		<div id="cartTableDiv">
			<ul id="cartNotice">
				<li>장바구니 상품은 최대 30일간 저장됩니다.</li>
				<li>가격, 옵션 등 정보가 변경된 경우 주문이 불가할 수 있습니다.</li>
			</ul>
			<br>
			
			<input type ="hidden" name="id" id="id" value="${id}">
			
			<table id="cartTable" class="table">
				<tr>
					<th width="25"><input type="checkbox" class="cartProductCheck"></th>
					<th>상품정보</th>
					<th>구매수량</th>
					<th>옵션</th>
					<th>상품금액</th>
					<th>배송비</th>
				</tr>
			</table>
			<input type="button" id="cartAllDeleteBtn" class="btn btn-outline-secondary" value="전체상품 삭제">
			<input type="button" id="cartSelectDeleteBtn" class="btn btn-outline-secondary" value="선택상품 삭제">
			<input type="button" id="cartSelectOrderBtn" class="btn btn-outline-success" value="선택상품 주문">
		</div>
		<div id="cartTotalDiv">
			<div id="cartOrderDetail">
				상품금액, 할인예상금액, 배송비
			</div>
			<div id="cartOrderTotal">
				결제예상금액
			</div>
			<input type="button" id="cartAllOrderBtn" class="btn btn-danger" value="주문하기">
			<input type="button" id="shoppingBtn" class="btn btn-outline-secondary" value="계속 쇼핑하기"><br>
		</div>
	</div>
</form>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function(){
	$.ajax({
		url: '/milkyWayForest/cart/cartSelect',
		type: 'post',
		data: 'id=yun',
		dataType: 'json',
		success: function(data) {
			alert("떠라."); 
			console.log(JSON.stringify(data)); 
			 
			 $.each(data, function(index,items){
				 $('<tr>').append($('<th>',{ 
					 width: 25 
				})
				.append($('<input>', {
					type:'checkbox'
				
				}))).append($('<th>' , {
					text: items.productName 
				
				})).append($('<th>' 
				
					
					).append($('<div>' , {
						class: 'length',
						style: 'position: relative; border: 1px solid  #ccc; width: 70px; height: 32px;'
						
					}) .append($('<input>', {
					
						type: 'text',
						value: items.cartQty,
						style: 'text-align:center; width: 47px; height: 29px; border: none; border-right:1px solid #c6c6c6;',
						id:'qty'+index
						
						})).append($('<a>', {
							id:'plus'+index
							
						})).append($('<a>' , {
							id:'minus'+index
						
				})))).append($('<th>', {
					text: items.cartOption
					
				})).append($('<th>', {
					id: 'total'+index,
					text: (items.productUnit*items.cartQty).toLocaleString()+" 원" 
					
				})).append($('<th>', {
					text: "2500원"
				
				}))
				.appendTo($('#cartTable')); 
			
				 //수량디비(에이작스를 새로 만들기) 카트코드랑 상품수량 가져가서 수정해줘라
			$('#plus'+index).click(function(){
				$('#qty'+index).val(parseInt($('#qty'+index).val())+1); 
				$('#total'+index).text(((items.productUnit)*parseInt($('#qty'+index).val())).toLocaleString()+" 원");
				$.ajax({
			 		url: '/milkyWayForest/cart/cartQty',
			 		type: 'post',
					data:  'cartCode='+items.cartCode+'&cartQty='+$('#qty'+index).val(),  //주소  'cartCode=${cartCode}' 이러면 문자열로 넘어가버림
						 
					success: function() {
						//alert("해보쟈");
						
						
						
					},
					
					error:function(err){
						console.log(err);
					}
			 		
			 	}); 
				 
			});	
				 
			$('#minus'+index).click(function(){
				
				$('#qty'+index).val(parseInt($('#qty'+index).val())-1);
				if($('#qty'+index).val() < 1) {
					$('#qty'+index).val(1);
				}
				$('#total'+index).text(((items.productUnit)*parseInt($('#qty'+index).val())).toLocaleString()+" 원");
				
				$.ajax({
			 		url: '/milkyWayForest/cart/cartQty',
			 		type: 'post',
					data:  'cartCode='+items.cartCode+'&cartQty='+$('#qty'+index).val(),  //주소  'cartCode=${cartCode}' 이러면 문자열로 넘어가버림
						 
					success: function() {
						//alert("해보쟈");
						
						
						
					},
					
					error:function(err){
						console.log(err);
					}
			 		
			 	}); 
				 
			});	 
			
			
			
				 
			});//each
			
		},
		
		error:function(err){
			console.log(err);
		}
		
	});
	
	//전체상품삭제 
	
	
});


</script>
