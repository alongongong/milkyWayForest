<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/milkyWayForest/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="/milkyWayForest/css/payment.css">
<style>
#paySuccess {
margin: 120px auto 80px auto;
}
#paySuccess #homeBtn,
#paySuccess #mypageBtn{
	width: 130px;
    height: 40px;
	background: #154520;
    color: white;
    padding: 7px 20px;
    font-size: 14px;
    font-weight: bold;
    box-shadow: none;
}
#paySuccess #paymentInfoDivWrap {
	width:100%;
	display:flex;
	flex-direction:column;
	align-items:center;
}
#paySuccess #paymentInfoDiv {
	padding-top: 60px;
	display: flex;
	flex-direction: column;
	align-items: center;
}
#paySuccess #paymentInfoDiv h2{
	font-size: 20px;
}
#paySuccess #paymentInfoDiv h3{
	font-size: 17px;
	text-align: center;
}
#paySuccess #paymentInfoDiv p{
	font-size: 15px;
	margin-top: 13px;
	text-align: center;
}
</style>

<form id="paySuccess">
	<div id="paymentInfoDivWrap">
		<div id="paymentInfoDiv">
			<h2>결제완료</h2>
			<h3>구매가 정상적으로 완료되었습니다.</h3>
			<p>주문번호<br><span id="paymentCode"></span></p>
			<p>적립금<br><span id="savedMoney"></span></p>
			<p>총 결제금액<br><span id="totalPayPrice"></span></p>
			
			<div id="buttonWrap">
				<input type="button" id="homeBtn" class="btn" value="메인화면으로">
				<input type="button" id="mypageBtn" class="btn" value="구매내역확인">
			</div>
		</div>
	</div>
</form>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(function(){
	$.ajax({
		url: '/milkyWayForest/payment/getPayInfo',
		type: 'post',
		data: 'paymentCode=${paymentCode}',
		success: function(data) {
			$('#paymentCode').text('${paymentCode}');
			$('#savedMoney').text(data.newSavedMoney.toLocaleString()+" 원");
			$('#totalPayPrice').text(data.payPrice.toLocaleString()+" 원");
		},
		error: function(err) {
			console.log(err);
		}
	});
});
$('#paySuccess #homeBtn').click(function(){
	location.href='/milkyWayForest/index.jsp';
});

$('#paySuccess #mypageBtn').click(function(){
	location.href='/milkyWayForest/mypage/mypageMain';
});
</script>