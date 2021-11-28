<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<link rel="stylesheet" href="/milkyWayForest/css/grade.css">
</head> 
<body>

<form id="gradeBenefitForm" name="gradeBenefitForm">
	<div id="container">
		
		<div class="grade_text1">
			<div class="grade-top-text"><h1>등급 및 혜택</h1></div>
			<ul class="smap"></ul> 
		</div>
	
	<div class="grade_pic1">
		<img src="/milkyWayForest/image/benefit.png" alt="benefit" width="100%" >
	</div>
	
	<h3 class="grade_text2"><strong>회원 등급별 혜택</strong></h3>
	
	<div class="second_block">
	
		<div class="one">
			<img src="/milkyWayForest/image/welcome.PNG" alt="welcome" width="100%">
			<p class="welcome_text">
			1
			</p>
		</div>
		<div class="two">
			<img src="/milkyWayForest/image/green.PNG" alt="welcome" width="100%">
			<p class="green_text">
			2
			</p>
		</div>
		<div class="three">
			<img src="/milkyWayForest/image/gold.PNG" alt="welcome" width="100%">
			<p class="gold_text">
			3
			</p>
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
				<ul class="note_list">
				
				<li class="card_flip_card_flip1" style="opacity: 1; position: relative; top:0px; left:0px; transform: perspective(520px); z-index: 5;">
				
					<li class="back_grade_card01" style="transform: rotateY(0deg); height:296px; 
					width:260px; transform-style:preserve-3d; position: absolute; 
					transition: all 2.5s ease-out 0s; backface-visibility: hidden;">
					<p class="icon_level">
						<span class="icon_level"></span>
							<img src="/milkyWayForest/image/list_01_bg.png" alt="list_01_bg">
							<img src="/milkyWayForest/image/icon_level_03.png" alt="icon_level">
							<p class="list_text01">별 12개 무료 음료 쿠폰</p>
						</span>
					</li>
					
					
					<div class="2">2</div>
					<div class="3">3</div>
					<div class="4">4</div>
					<div class="5">5</div>
					<div class="6">6</div>
					<div class="7">7</div>
					<div class="8">8</div>
					<div class="9">9</div>
					<div class="10">10</div>
					<div class="11">11</div>
					<div class="12">12</div>
					<div class="13">13</div>
					<div class="14">14</div>
				</ul>
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
			
			alert(JSON.stringify(data));
		
			$.each(data, function(index,items) {
				
				$('<div>',{
					width: 100,
					align: 'left',
					text : items.gradeBenefit,			  
			})
				.append($('<div>',{
				 	width: 100,
					align: 'left',
					text :  items.gradeBenefit,   		
			}))
				.append($('<div>',{
				 	width: 100,
					align: 'left',
					text :  items.gradeBenefit,				   		
			}))					
				.appendTo($('#div'));
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