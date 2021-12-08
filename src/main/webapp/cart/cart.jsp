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
			
			<%-- <input type ="hidden" name="id" id="id" value="${id}"> --%>
			<input type="hidden" name="id" value="yun">
			
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
			<input type="submit" id="cartSelectDeleteBtn" class="btn btn-outline-secondary" value="선택상품 삭제">
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
			//alert("떠라."); 
			console.log(JSON.stringify(data)); 
			 
			 $.each(data, function(index,items){
				 $('<tr>').append($('<th>',{ 
					 width: 25 
				})
				.append($('<input>', {
					type:'checkbox',
					name: 'check',
					class: 'check',
					value: items.cartCode
					
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
			$('#plus'+index).click(function(){  //인덱스를 안걸면 전체품목이 플러스가 되어버려서!
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
		
	});//cartSelect_ajax(장바구니로 오면 바로 데이터 뿌리기)
	
		//전체선택,해제
		$('.cartProductCheck').click(function(){
			if($('.cartProductCheck').prop("checked")) {  //체
				$('.check').prop("checked",true);
				
			}else{
				$('.check').prop("checked", false);
				
			}	
		}); 
		
		//전체상품 삭제
		$('#cartAllDeleteBtn').click(function(){		
		 	$.ajax({
		 		url: '/milkyWayForest/cart/cartAllDelete',
		 		type: 'post',
				data: 'id=yun',
				success: function() {
					if(confirm("전체삭제 하시겠습니까?")==true){
						location.href= "/milkyWayForest/cart";
						
					}else {
						return;
					}
				 	
					
				},
				
				error:function(err){
					console.log(err);
				}	
			});	 
		});	

		//선택되면 클래스를 바꿔라 애드클래스 리무브 클래스  클래스명이 추가되거나 지워지는것. 
		//만약 체크안되어있었으면 기본적으로 체크가 안되어 있으면 클래스이름을unCheck 라고 주고
		//체크되는순간 check 라고 클래스명을 바꿔라 라고 이걸 이프문 굳이 안걸어도 될듯
		
		/* $('input ').addClass$('<input>','.check');
		$().removeClass(''); */
		

		//$('input:checkbox:checked').addClass$('.check');
		
		//$('input:checkbox:not(:checked)').addClass$('.unCheck');
			
		//서브밋으로 넘겨라
		 	
			
		
		
		
		
		
		//선택삭제
		$('#cartForm').submit(function(){  //폼.서브밋
			var count =$('.check:checked').length;
				alert(count);
			
			if(count==0)
				alert('삭제 할 항목을 선택하세요');
			else { 
				if(confirm('정말 삭제하시겠습니까?') ==true) {
					 $.ajax({
						url: '/milkyWayForest/cart/cartSelectDelete',
						type: 'post',
						data: $('#cartForm').serialize(),  //체크박스에서는 특징이 선택한애들만 네임값을 넘겨준다.()대신이렇게 하려면 서브밋을 걸어야 한다 버튼은 안됨(서브밋의 특징!!)
						success: function() {
							alert("삭제 성공")
						//	location.href= "/milkyWayForest/cart";
						},
						error:function(err){
							console.log(err);
						}	
						
						
					});	  
					}else {
						return;
					}
				
				  }
				});
			
			
});//큰 function


</script>
