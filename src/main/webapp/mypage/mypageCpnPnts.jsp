<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" href="/milkyWayForest/css/mypage.css">

<style type="text/css">
#mypageMyinfo #contents{
	margin-bottom: 10px;
}
/* -------------------------------- */
</style>

<form id="mypageShpMngListForm" name="mypageMyInfo">
<div id="main-wrapper">
	<div id="main-sideNav" class="item">
		<jsp:include page="mypageSideNav.jsp"/>
	</div>

	<div id="main-topNav" class="item">
		<jsp:include page="mypageTopNav.jsp"/>	
	</div>
	<%----------------- 디폴트 설정 -----------------%>
	<div>
	<input type="hidden" id="id" value="${memId }">
		<table id="depositTable" class="table table-bordered" style="width:820px;">
			<thead>
				<tr>
					<th colspan="4" style="text-align:center;">적립금 적립 & 사용내역</th>
				</tr>
				<tr >
					<th style="width:200px;text-align:center;">발 생 일</th>
					<th style="width:200px;text-align:center;">주문 번호</th>
					<th style="width:200px;text-align:center;">적 립 금</th>
					<th style="width:200px;text-align:center;">사용 적립금</th>
				</tr>
			</thead>
			
			
			<tbody>
				<!-- <tr>
					<td id="birthDay" style="text-align:center;"></td>
					<td style="text-align:center;">신규 회원가입</td>
					<td style="text-align:center;">+ 1,000</td>
					<td id="rhwjdrkqt"style="text-align:center;"></td>
				</tr> -->
			</tbody>
		</table>
		<div id="result-div"></div>
		<div id="mypagePointPagingDiv" align="center"></div>
	</div>
</div>

<script>
$(function(){
	$.ajax({
		url:'/milkyWayForest/mypage/getPaymentSaveMoneyList?pg='+${pg},
		type:'post',
/* 		data:'pg=${pg}', */
		dataType:'json',
		success:function(data){
			console.log(JSON.stringify(data));
			$.each(data.list, function(index, items){
				if(items.paymentSavedMoney > 0) {
					$('<tr/>').append($('<td>',{
						align:'center',
						text:items.payDate
					})).append($('<td>',{
						align:'center',
						text:items.paymentCode
					})).append($('<td>',{
						align:'center',
						text:'+ '+(items.newSavedMoney.toLocaleString())
					})).append($('<td>',{
						align:'center',
						text:'- '+(items.paymentSavedMoney.toLocaleString())
					})).appendTo($('#depositTable tbody'));
				}else {
					$('<tr/>').append($('<td>',{
						align:'center',
						text:items.payDate
					})).append($('<td>',{
						align:'center',
						text:items.paymentCode
					})).append($('<td>',{
						align:'center',
						text:'+ '+(items.newSavedMoney.toLocaleString())
					})).append($('<td>',{
						align:'center',
						text:items.paymentSavedMoney.toLocaleString()
					})).appendTo($('#depositTable tbody'));
				}
				if(${pg}==data.totalP) {
					$('<tr/>').append($('<td>',{
						id: 'birthDay',
						align: 'center'
					})).append($('<td>',{
						text: '신규 회원가입',
						align: 'center'
					})).append($('<td>',{
						text: '+ 1,000',
						align: 'center'
					})).append($('<td>',{
						id: 'rhwjdrkqt',
						align: 'center'
					})).appendTo($('#depositTable tbody'));
				}
			});
			$('#mypagePointPagingDiv').html(data.mypageCpnpntsPaging);
		},
		error:function(err){
			console.log(err);
		}
	});

	$.ajax({
		url:'/milkyWayForest/mypage/getMemberdate',
		type:'post',
		data:{'id' : $('#id').val()},
		success:function(data){
			console.log(JSON.stringify(data));
			$('#birthDay').html(data.writeDate);
			$('#rhwjdrkqt').html('0');

		},
		error:function(err){
			console.log(err);
		}
	});
}); 
function boardPaging(page){
	location.href="/milkyWayForest/mypage/mypageCpnPnts?pg="+page;
}

</script>
</form>