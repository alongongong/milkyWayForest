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
			
			<%--  <input type ="hidden" name="id" id="id" value="${memid}">  --%>
			<!-- <input type="hidden" name="id"  id="id" value="yun"> -->
			
			<table id="cartTable" class="table">
				<tr>
					<th width="25"><input type="checkbox" class="cartProductCheck"></th>
					<th>상품정보</th>
					<th>구매수량</th>
					<th>옵션</th>
					<th>상품금액</th>
					
				</tr>
			</table>
			<input type="button" id="cartAllDeleteBtn" class="btn btn-outline-secondary" value="전체상품 삭제">
			<input type="submit" id="cartSelectDeleteBtn" class="btn btn-outline-secondary" value="선택상품 삭제">
			<input type="button" id="cartSelectOrderBtn" class="btn btn-outline-success" value="선택상품 주문">
		</div>
		<div id="cartTotalDiv" class="cartTotal">
			<div id="cartOrderDetail">
				<!-- 상품금액, 할인예상금액, 배송비 -->
				총 상품금액 <span id="totalProductPrice"></span><br>
				총 할인금액 <span id="totalSalePrice"></span><br>
				배송비 <span id="shipPay"></span>
					<input type="hidden" id="shipPay1" name="shipPay"><br>
				<!-- 배송비<span id="shipPay"></span> -->
			</div> <!-- cartOrderDetail -->
			<div id="cartOrderTotal"> 
			
				<p>결제예상금액<span id="totalPayPrice"></span></p>
			
			</div>
				<input type="button" id="cartAllOrderBtn" class="btn btn-danger" value="주문하기">
				<input type="button" id="shoppingBtn" class="btn btn-outline-secondary" value="계속 쇼핑하기"><br>
			
		</div> <!-- cartTotalDiv -->
	</div>
</form>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function(){
	$.ajax({
		url: '/milkyWayForest/cart/cartSelect',
		type: 'post',
		
		dataType: 'json',
		success: function(data) {
			//alert("떠라."); 
			console.log(JSON.stringify(data)); 
			
			var totalPrice = 0;
			var totalSalePrice = 0;
			var allPrice = 0;
			var shipPay = 0;
			 
			 $.each(data, function(index,items){
				 $('<tr>').append($('<th>',{ 
					 width: 25,
					 class: 'checkboxGroup'
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
				 
			});	//plus
				 
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
				 
			});	//minus 
			
			
			//스티키 안에 채우기(위에 var 로 0 줌)
		/* 	var totalProductPrice = items.productUnit*items.cartQty*(1-itmes.productRate/100);  //itmes.productRate 가 안먹는듯
				totalPrice += items.productUnit*items.cartQty;
				totalSalePrice += items.productUnit*items.cartQty*items.productRate;  //itmes.productRate 가 안먹는듯
				allPrice += totalProductPrice;

			var shipPay = 0;

			$('#totalProductPrice').text(totalPrice.toLocaleString()+'원');
			$('#totalSalePrice').text(totalSalePrice.toLocaleString()+'원');
			if((totalPrice-totalSalePrice) >= 50000) {
				$('#shipPay').text('0원');
			} else {
				$('#shipPay').text('2,500원')
				shipPay += 2500;
			}

			allPrice += shipPay;
			$('#shipPay1').val(shipPay);
			$('#newSavedMoney').val(savedMoney);
			$('#totalPayPrice').text(allPrice.toLocaleString()+'원'); */

				 
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
	
		//선택해제시 맨위 체크박스 체크 해제
		$(document).on('click', '.check', function(){  //on은 나중에 들어오는 체크박스 때문에 그래서 온으로 써주는것.
			//alert("11");
			
			if(!$('.check').is(':checked'))  //체크박스가 선택해제인지 알아보는게 is, ! 부정하는것. 폴스가 오면 이프문이 거짓으로 인식하니까 그래서 느낌표로 바꾼것.
				$('.cartProductCheck').prop('checked',false); 
			// 이프문에 조건은 트루가 되어야 수행을 하는데
			// 내가 체크박스를 체크해제 하면 조건이 false 가 되어버리는데 그러면 그 폴스가 된게 참이되어야만 if문 아래에 있는
			//$('.cartProductCheck').prop('checked',false);  문장을 수행할수 있음
			//그래서 이프문을 위와같이 참으로 만들고 그런 다음 .cartProductCheck 에 체크드를 해제하라 라는 문장이 완성됨
		}); 
		
		
		//전체상품 삭제
		$('#cartAllDeleteBtn').click(function(){		
		 	$.ajax({
		 		url: '/milkyWayForest/cart/cartAllDelete',
		 		type: 'post',
				
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
						data: $('#cartForm').serialize(),  //체크박스에서는 특징이 선택한애들만 네임값을 넘겨준다.대신이렇게 하려면 서브밋을 걸어야 한다 버튼은 안됨(서브밋의 특징!!)
						success: function() {
							alert("삭제 성공")
							console.log(JSON.stringify(data)); 
							
							
							
						
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
		
		//계속쇼핑하기 버튼
		$('#cartForm #shoppingBtn').click(function(){
			location.href='/milkyWayForest/';
			
		});	
		
		
		// 구매하기 버튼 눌렀을 때
	/* 	$('#cartForm #cartAllOrderBtn').click(function(){
		
			if(${memId == null}) {
				alert('로그인 해주세요');
				location.href='/milkyWayForest/login/loginForm';
			} else {
				$.ajax({
					url: '/milkyWayForest/payment/cartInsert',
					type: 'post',
					data: $('#cartForm').serialize(),
					success: function(data) {
						alert(data);
						location.href='/milkyWayForest/payment?cartCode='+data;
					},
					error: function(err) {
						console.log(err);
					}
					
				});
			}
		});
 */
		
			
});//큰 function


</script>
