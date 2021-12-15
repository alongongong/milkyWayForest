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
<div id="h1Div"><h1 style="font-size: 35px;">마이페이지</h1></div>
<div id="main-wrapper">
	<div id="main-sideNav" class="item">
		<jsp:include page="mypageSideNav.jsp"/>
	</div>

	<div id="main-topNav" class="item">
		<jsp:include page="mypageTopNav.jsp"/>	
	</div>
	<%----------------- 디폴트 설정 -----------------%>
	<div id="mypageShpMn-wrapper" class="item">
	<input type="hidden" id="id" value="${memId }">
		<div id="mypageShpMn-title" class="navbar navbar-light">
			<span class="mb-0">할인 쿠폰</span>
		</div>
	
		<table id="memberCouponTable" class="table border-bottom" style="width:820px;">
			<tr id="last">
				<th style="width:200px;text-align:center;">발 생 일</th>
				<th style="width:200px;text-align:center;">쿠 폰</th>
				<th style="width:600px;text-align:center;">쿠폰 혜택</th>
			</tr>
		</table>
	</div>
</div>

<script>
$(function(){
	$.ajax({
		url:'/milkyWayForest/mypage/getCouponList',
		type:'post',
		dataType:'json',
		success:function(data){
			console.log(JSON.stringify(data));
			$.each(data, function(index, items){
					$('<tr/>').append($('<td>',{
						align:'center',
						id:'birthDay1'
					})).append($('<td>',{
						align:'center',
						text:items.couponName
					})).append($('<td>',{
						align:'center',
						text:items.coupon
					})).appendTo($('#memberCouponTable'));
			});
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
			$('#birthDay1').html(data.writeDate);

		},
		error:function(err){
			console.log(err);
		}
	});
}); 
</script>
</form>