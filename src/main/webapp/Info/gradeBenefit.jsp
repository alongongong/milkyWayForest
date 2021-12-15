<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" href="/milkyWayForest/css/grade.css">
</head> 

<style type="text/css">
.bg-white {
	padding-top : 50px;
}
</style>
<body>

<form id="gradeBenefitForm" name="gradeBenefitForm">
	<div id="container">
		
		<div class="grade_text1">
				<div class="grade-top-text"><h1>등급 및 혜택</h1></div>
					
			<div id="top_text">
				<div>
					<a href="/milkyWayForest/"><img src="/milkyWayForest/image/icon_home.png" alt="홈"></a> > 
					<a href="/milkyWayForest/info/gradeBenefitInfo">EunhaSoop Rewards</a> > 
					<a href="/milkyWayForest/info/gradeBenefitInfo">은하숲 리워드</a> >
					<a href="/milkyWayForest/info/gradeBenefitInfo" style="font-weight:bold;">등급 및 혜택</a>
				</div>
			</div>
		</div>
	
	<div class="grade_pic1">
		<img src="/milkyWayForest/image/benefit.png" alt="benefit" width="100%" >
	</div>
	
	<h3 class="grade_text2"><strong>회원 등급별 혜택</strong></h3>
	
	<div class="second_block">
	
		<div class="one">
			<img src="/milkyWayForest/image/welcome.png" alt="welcome" width="100%">
			<pre class="welcome_text" 
			style="margin-bottom: 12px; font-size: 18px; 
			color: #666; line-height: 2; padding-left: 13px;">
			</pre>
		</div>
		<div class="two">
			<img src="/milkyWayForest/image/green.PNG" alt="welcome" width="100%">
			<pre class="green_text" 
			style="margin-bottom: 12px; font-size: 18px; 
			color: #666; line-height: 2; padding-left: 13px;">
			</pre>
		</div>
		<div class="three">
			<img src="/milkyWayForest/image/gold.PNG" alt="welcome" width="100%">
			<pre class="gold_text" 
			style="margin-bottom: 12px; font-size: 18px; 
			color: #666; line-height: 2; padding-left: 13px;" >
			</pre>
		</div>
	</div>
	
	<ul class="info1_text">		
		<li class="list">My DT Pass 서비스 이용 : 차량번호를 사전에 등록하시면, DT 매장에서 주문 후 결제 단계 없이 상품을 빠르게 수령하실 수 있습니다.</li>
		<li class="list">Welcome Level이 바로 적용됩니다. Welcome Level이 되신 후, 적립금 1000원을 받으실 수 있어요!</li>
		<li class="list">영수증 쿠폰을 e-쿠폰으로 발행 받거나 모바일 APP/WEB에 등록하여 사용하실 수 있습니다.</li>
		<li class="list">Green / Gold Level은 해당 등급조건을 충족한 다음 날부터 적용됩니다.</li>
		<li class="list">별★의 유효기간은 일년입니다.</li>
		<li class="list">쿠폰 및 그린/골드 대상 회원 전용 이벤트는 프로모션 운영에 따라 변경될 수 있습니다.</li>
	</ul>
</div>

	<div id="container2">
	<section class="info2">
		<article class="info2_inner" id="showcase">
			<div class="info2_center">
			<h3><strong>회원 등급별 상세 혜택 및 유의사항</strong></h3>
			
			<!-- 카드 -->
			<div id="cardList_wrap">
				<div id="cardList">
				
					<!--  버튼1 -->
					<div id="1" class="item bg-white" style="op">
						<div class="1_1pic" align="center" style="padding-top:2.5rem;">
							<img src="/milkyWayForest/image/list_01_bg.png" alt="list_01">
						</div>
						<div class="1_2pic" align="center">
							<img src="/milkyWayForest/image/icon_level_03.png" alt="list_01">
						</div>
						<p class="1_text" align="center" style="padding-top:1rem;">
							골드회원 적립금 5%
						</p>
						<div align="center" style="padding-top:1rem;">
							<!-- <button type="button" class="btn btn-outline-secondary" id="button1_open" data-toggle="modal" data-target="#modal1">자세히 보기</button> -->
						</div>
					</div>
	
					
					<div id="2" class="item bg-white">
						<div class="2_1pic" align="center" style="padding-top:3.5rem;">
							<img src="/milkyWayForest/image/list_02_bg.png" alt="list_01">
						</div>
						<div class="2_2pic" align="center" style="padding-top:.5rem;" >
							<img src="/milkyWayForest/image/icon_level_03.png" alt="list_01">
						</div>
						<p class="2_text" align="center" style="padding-top:.8rem;">
							Personalized Offer 쿠폰
						</p>
						<div align="center" style="padding-top:1rem;">
							<!-- <button type="button" class="btn btn-outline-secondary">자세히 보기</button> -->
						</div>
					</div>
					
					<div id="3" class="item bg-white">
						<div class="3_1pic" align="center" style="padding-top:1.9rem;">
							<img src="/milkyWayForest/image/list_03_gold_bg.png" alt="list_01">
						</div>
						<div class="3_2pic" align="center">
							<img src="/milkyWayForest/image/icon_level_03.png" alt="list_01">
						</div>
						<p class="3_text" align="center" style="padding-top:1rem;">
							골드회원만의 e-Gold Card 발급!
						</p>
						<div align="center" style="padding-top:1rem;">
							<!-- <button type="button" class="btn btn-outline-secondary">자세히 보기</button> -->
						</div>
					</div>
					
					<div id="4" class="item bg-white">
						<div class="4_1pic" align="center" style="padding-top:3rem;">
							<img src="/milkyWayForest/image/web_msr_icon_02.png" alt="list_01">
						</div>
						<div class="4_2pic" align="center">
							<img src="/milkyWayForest/image/icon_level_03.png" alt="list_01">
							<img src="/milkyWayForest/image/icon_level_02.png" alt="list_01">
						</div>
						<p class="4_text" align="center" style="padding-top:1rem;">
							Beverage BOGO 쿠폰
						</p>
						<div align="center" style="padding-top:1rem;">
							<!-- <button type="button" class="btn btn-outline-secondary">자세히 보기</button> -->
						</div>
					</div>
					
					<div id="5" class="item bg-white">
						<div class="5_1pic" align="center" style="padding-top:3rem;">
							<img src="/milkyWayForest/image/list_13_bg.png" alt="list_01">
						</div>
						<div class="5_2pic" align="center">
							<img src="/milkyWayForest/image/icon_level_03.png" alt="list_01">
							<img src="/milkyWayForest/image/icon_level_02.png" alt="list_01">
						</div>
						<p class="5_text" align="center" style="padding-top:1rem;">
							250g 원두 또는 12개입 VIA 구매 시,<br>
							카페 아메리카노(Hot/Iced) 쿠폰
						</p>
						<div align="center" style="padding-top:1rem;">
							<!-- <button type="button" class="btn btn-outline-secondary">자세히 보기</button> -->
						</div>
					</div>
					
					<div id="6" class="item bg-white">
						<div class="6_1pic" align="center" style="padding-top:2rem;">
							<img src="/milkyWayForest/image/list_06_bg.png" alt="list_01">
						</div>
						<div class="6_2pic" align="center" style="padding-top:.5rem;">
							<img src="/milkyWayForest/image/icon_level_03.png" alt="list_01">
							<img src="/milkyWayForest/image/icon_level_02.png" alt="list_01">
						</div>
						<p class="6_text" align="center" style="padding-top:1rem;">
							스타벅스 리저브™ 원두 구매 시,<br> 
							스타벅스 리저브™ 음료
						</p>
						<div align="center" style="padding-top:.5rem;">
							<!-- <button type="button" class="btn btn-outline-secondary">자세히 보기</button> -->
						</div>
					</div>
					
					<div id="7" class="item bg-white">
						<div class="7_1pic" align="center" style="padding-top:2rem;">
							<img src="/milkyWayForest/image/tevana_Icon.png" alt="list_01">
						</div>
						<div class="7_2pic" align="center" style="padding-top:.5rem;">
							<img src="/milkyWayForest/image/icon_level_03.png" alt="list_01">
							<img src="/milkyWayForest/image/icon_level_02.png" alt="list_01">
						</div>
						<p class="7_text" align="center" style="padding-top:1rem;">
							티바나 패키지 티 구매 시,<br>
							풀 리프 티(Hot/Iced) 쿠폰
						</p>
						<div align="center" style="padding-top:.5rem;">
							<!-- <button type="button" class="btn btn-outline-secondary">자세히 보기</button> -->
						</div>
					</div>
					
					<div id="8" class="item bg-white">
						<div class="8_1pic" align="center" style="padding-top:2rem;">
							<img src="/milkyWayForest/image/web_msr_icon_03.png" alt="list_01">
						</div>
						<div class="8_2pic" align="center" style="padding-top:.5rem;">
							<img src="/milkyWayForest/image/icon_level_03.png" alt="list_01">
							<img src="/milkyWayForest/image/icon_level_02.png" alt="list_01">
						</div>
						<p class="8_text" align="center" style="padding-top:2rem;">
							생일 쿠폰 발행
						</p>
						<div align="center" style="padding-top:.8rem;">
							<!-- <button type="button" class="btn btn-outline-secondary">자세히 보기</button> -->
						</div>
					</div>
					
					<div id="9" class="item bg-white">
						<div class="9_1pic" align="center" style="padding-top:2rem;">
							<img src="/milkyWayForest/image/web_msr_icon_01.png" alt="list_01">
						</div>
						<div class="9_2pic" align="center" style="padding-top:.5rem;">
							<img src="/milkyWayForest/image/icon_level_03.png" alt="list_01">
							<img src="/milkyWayForest/image/icon_level_02.png" alt="list_01">
						</div>
						<p class="9_text" align="center" style="padding-top:2rem;">
							웰컴 첫 구매 쿠폰 발행
						</p>
						<div align="center" style="padding-top:.8rem;">
						<!-- 	<button type="button" class="btn btn-outline-secondary">자세히 보기</button> -->
						</div>
					</div>
					
					<div id="10" class="item bg-white">
						<div class="10_1pic" align="center" style="padding-top:3.5rem;">
							<img src="/milkyWayForest/image/list_08_bg.png" alt="list_01">
						</div>
						<div class="10_2pic" align="center" style="padding-top:.5rem;">
							<img src="/milkyWayForest/image/icon_level_03.png" alt="list_01">
							<img src="/milkyWayForest/image/icon_level_02.png" alt="list_01">
						</div>
						<p class="10_text" align="center" style="padding-top:2rem;">
							분실 신고 시 잔액 보호
						</p>
						<div align="center" style="padding-top:.8rem;">
							<!-- <button type="button" class="btn btn-outline-secondary" 
							data-toggle="modal" data-target="#exampleModal">
								자세히 보기
							</button> -->
						</div>
					</div>
					
					<div id="11" class="item bg-white">
						<div class="11_1pic" align="center" style="padding-top:2.5rem;">
							<img src="/milkyWayForest/image/web_msr_icon_04.png" alt="list_01">
						</div>
						<div class="11_2pic" align="center" style="padding-top:1rem;">
							<img src="/milkyWayForest/image/icon_level_03.png" alt="list_01">
							<img src="/milkyWayForest/image/icon_level_02.png" alt="list_01">
						</div>
						<p class="11_text" align="center" style="padding-top:1.5rem;">
							스타벅스 카드로 구매 시,<br>
							Free Extra 1개 제공
						</p>
					</div>
					
					<div id="12" class="item bg-white">
						<div class="12_1pic" align="center" style="padding-top:2.5rem;">
							<img src="/milkyWayForest/image/list_10_bg.png" alt="list_01">
						</div>
						<div class="12_2pic" align="center" style="padding-top:1rem;">
							<img src="/milkyWayForest/image/icon_level_03.png" alt="list_01">
							<img src="/milkyWayForest/image/icon_level_02.png" alt="list_01">
						</div>
						<p class="12_text" align="center" style="padding-top:1.5rem;">
							기능 설정 후 스타벅스<br> 
							카드로 결제 시, 현금영수증<br> 
							자동 발행
						</p>
					</div>	
				</div>
				</div>
			</div>
		</article>
	</section>
	</div>
</form>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function(){
	$.ajax({
		url: '/milkyWayForest/info/getBenefit',  
		type: 'post',
		//dataType: 'json',
		success : function(data) {
			
			/* alert(JSON.stringify(data)); */
			$.each(data, function(index,items) {
				if(items.gradeName=='welcome'){
					$('.welcome_text').text(items.gradeBenefit)
				}else if(items.gradeName=='green'){
					$('.green_text').text(items.gradeBenefit)
				}else if(items.gradeName=='gold'){
					$('.gold_text').text(items.gradeBenefit)
				}
			});	
		},
		error: function(err) {
			console.log(err);
		}
	});	
});
</script>
</body> 
</html>