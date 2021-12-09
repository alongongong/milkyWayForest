<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" href="/milkyWayForest/css/mypage.css">

<div id="topNav-wrapper">
	<input type="hidden" id="id" value="${memId }">

	<div id="myInfoBox-wrapper" class="item card">
		<div class="row no-gutters">
			<div id="myInfoPhoto" class="col-md-4">
			</div>
			
			<div id="myInfoDescript" class="col-md-8">
				<div class="card-body">
					<h5 class="card-title">한눈에 내 정보 보기</h5>
					<p class="card-text">안녕하세요. 저희 은하숲을 이용해주셔서 감사합니다.<br>
						<strong>${memId }</strong>님은
						<strong id="memberGrade"></strong>등급입니다.
					</p>
				</div>
			</div>
		</div>
	</div><!-- 내 정보 -->

	<div id="myBenefit-wrapper" class="item">
		<ul class="list-group">
			<li class="list-group-item list-group-item-action">
				<span>사용가능한 쿠폰
					<a href="#" id="countCoupon"></a>장
				</span>
			</li>
			<li class="list-group-item list-group-item-action">
				<span>사용가능한 적립금
					<a href="#" id="savedMoney"></a>원
				</span>
			</li>
			<li class="list-group-item list-group-item-action">
				<span>총 주문 횟수
					<a href="#" id="countPayment"></a>회
				</span>
			</li>
			<li class="list-group-item list-group-item-action">
				<span>총 주문 금액
					<a href="#" id="paidTotal"></a>원
				</span>
			</li>
		</ul>
	</div>
</div>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
//회원정보 불러오기 
$(function(){
	$.ajax({
		url: '/milkyWayForest/mypage/getMypageMyInfo',
		type: 'post',
		data: {'id' : $('#id').val()},
		success: function(data){
			console.log(JSON.stringify(data));
			$('#memberGrade').html(data.memberGrade);	
			$('#myInfoPhoto').append($('<img>',{
				src: '/milkyWayForest/image/'+data.memberGrade+'.png',
				alt: data.memberGrade,
				class: 'card-img rounded float-left'
			}));
			
			var savedMoney = data.savedMoney.toLocaleString();
			$('#savedMoney').html(savedMoney);
		},
		error: function(err){
			console.log(err);
		}
	});
	
	$.ajax({
		url: '/milkyWayForest/mypage/getPaymentInfo',
		type: 'post',
		success: function(data){
			console.log(JSON.stringify(data));
			$('#countCoupon').html(data.countCoupon);
			$('#countPayment').html(data.countPayment);	
			
			var paidTotal;
			
			if(data.paymentList == ''){
				$('#paidTotal').html('0');
				
			}else{
				$.each(data.paymentList, function(index, items) {
					console.log(items.payPrice);
					var payQty = items.payQty*1;
					var payPrice = items.payPrice*1;
					var payRate = items.payRate*1;
					
					paidTotal = payQty*payPrice*(1-payRate/100);
				});
				
				paidTotal = paidTotal.toLocaleString();
				$('#paidTotal').html(paidTotal);
			}

			
		},
		error: function(err){
			console.log(err);
		}
	});

});
</script>