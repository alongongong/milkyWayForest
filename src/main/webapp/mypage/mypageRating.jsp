<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" href="/milkyWayForest/css/mypage.css">

<style type="text/css">
#mypageMyinfo #contents{
	margin-bottom: 10px;
}


</style>
<form id="mypageShpMngListForm" name="mypageMyInfo">
<div id="h1Div"><h1 style="font-size: 35px;">마이페이지</h1></div>
<div id="main-wrapper">
	<div id="main-sideNav" class="item">
		<jsp:include page="mypageSideNav.jsp"/>
	</div>

	<div id="main-topNav" class="item">
		<jsp:include page="mypageTopNav.jsp"/>	
	</div>
	<%----------------- 디폴트 설정 -----------------%>
	<div class="customer_grade">
		<input type="hidden" id="id" value="${memId }">
    
    <div class="grade_box family_type" style="padding:56px 96px 55px;border:1px solid #e9e9e9;display:block; width:820px; margin-top: 60px;">
        <div class="grade_summury" style="min-height:64px; padding-bottom:20px; border-bottom:1px solid #e9e9e9; color:#999; font-size:16px; line-height:28px; letter-spacing:-1px;">
            <div id="sp_mytmall_grade ico_grade"></div>
            <div class="grade_inner">
                <p class="txt" style="display:inline-block;font-weight:bold; font-size:24px; line-height:36px; color: #000; vertical-align:middle;">${memId } 고객님은 <em class="txt_grade" style="color:#05cfb5;font-style:normal;"></em> 회원입니다.</p>
            </div>
        </div>
        <div class="grade_state">
            <div class="grade_state_top" style="text-align:center;position:relative;padding:24px 0 12px;line-height:28px;margin:0;display:block;">
                <strong class="tit"><span id="memberRating"style="color:#05cfb5;font-style:normal;"></span><span id="memberRating1"></span></strong>
            </div>
            <ul class="grade_state_info"style="border-bottom:1px solid #e9e9e9; font-size:0; list-style:none;margin:0;padding:0;display:block;margin-block-start:1em;margin-block-end:1em;margin-inline-start:0px;margin:inline-end:0px;text-align:center">
                <li style="margin:0; padding-bottom:24px;list-style:none; display:list-item;text-align:center;font-size:0;">
                    <div class="info">	
                        <strong class="txt_num" style="display:inline-block; font-size:16px; vertical-align:top;margin:0;padding:0;font-weight:bold;color:#333;line-height:28px;letter-spacing:-1px;list-style:none;text-align:center;"><span id="amount"></span><span class="skip"> 원 주문함  /&nbsp;&nbsp;</span></strong>
                        <span id="rmnngAmnt" style="display:inline-block; margin-left:8px; font-size:14px; vertical-align:top;margin:0;padding:0;color:#333;line-height:28px;letter-spacing:-1px;list-style:none;text-align:center;"></span>
                        <span class="purpose" style="position:relative;top:0;right:0;font-size:12px;color:#999;margin:0;padding-left:20px;line-height:28px;letter-spacing:-1px;list-style:none;text-align:center;"></span>
                    </div>
                    <div class="grade_state_bar" align="center">
                        <!-- <span class="grade_percent" style="width:50%;background:#05cfb5; position:absolute; top:0;left:0;height:6px;margin:0;padding:0;list-style:none;"></span> -->
                        <progress style="width:400px; height:30px;" id="targetAmount"></progress>
                    </div>
                </li>
            </ul>
        </div>
    </div>
    <div class="grade_benefit_info" style="padding:55px 96px; border:1px solid #e9e9e9; width:820px;border-top:0;display:block;">
        <h3 class="tit" style="font-size:18px; line-height:36px;padding:0;margin:0;display:block;margin-block-start:1em;margin-block-end:1em;margin-inline-start:0px;margin-inline-end:0px;font-weight:bold;">등급 혜택</h3>
        <pre id="contentTxt"></pre>
        
    </div>
</div>
</div>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
//회원정보 불러오기 
$(function(){
	var paidTotal=0;
	var remainingAmount = '70000'- paidTotal;
	var remainingAmount1 = '150000' - paidTotal;

	$.ajax({
		url: '/milkyWayForest/mypage/getPaymentInfo',
		type: 'post',
		success: function(data){
			console.log(JSON.stringify(data));
			
			if(data.paymentList == ''){
				$('#amount').html('0');
				
			}else{
				$.each(data.paymentList, function(index, items) {
					console.log(items.payPrice);
					var payQty = items.payQty*1;
					var payPrice = items.payPrice*1;
					var payRate = items.payRate*1;
					
					paidTotal += payQty*payPrice*(1-payRate/100);
				});
				
				//paidTotal = paidTotal.toLocaleString(); 세자리 , 찍어주는 거때문에 안됐나봐요
				$('#amount').html(paidTotal);
			}
			
			$.ajax({
				url: '/milkyWayForest/mypage/getMypageRating',
				type: 'post',
				data: {'id' : $('#id').val()},
				success: function(data){
					console.log(JSON.stringify(data));
					
					$('.txt_grade').html(data.memberGrade);	
					$('#contentTxt').html(data.gradeBenefit);
					
					if(data.memberGrade == 'welcome'){
						$('#memberRating1').html(' 등급 향상을 위한 목표 금액');
						$('#memberRating').html('green');
						$('.purpose').html('목표 7만원');
						document.getElementById('targetAmount').max = '70000';
						document.getElementById('targetAmount').value = paidTotal;
						$('#rmnngAmnt').html(remainingAmount+" 원 남음");
						
					}else if(data.memberGrade == 'green'){
						$('#memberRating1').html(' 등급 향상을 위한 목표 금액');
						$('#memberRating').html('gold');
						$('.purpose').html('목표 15만원');
						document.getElementById('targetAmount').max = '150000';
						document.getElementById('targetAmount').value = paidTotal;
						$('#rmnngAmnt').html(remainingAmount1+" 원 남음");
					}else if(data.memberGrade == 'gold'){
		/* 				$('#memberRating').html('gold');
						$('.purpose').html('목표 15만원'); */
						document.getElementById('targetAmount').max = '150000';
						document.getElementById('targetAmount').value = paidTotal;
						$('#rmnngAmnt').html(remainingAmount1+" 원");
					}

				},
				error: function(err){
					console.log(err);
				}
			});//getMypageRating
		},
		error: function(err){
			console.log(err);
		}
	});//getPaymentInfo
	
	
	
});
</script>
</form>