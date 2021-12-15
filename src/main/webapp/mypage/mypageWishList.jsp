<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" href="/milkyWayForest/css/mypage.css">

<form id="mypageMain">
<div id="h1Div"><h1 style="font-size: 35px;">마이페이지</h1></div>
<div id="main-wrapper">
	<div id="main-sideNav" class="item">
		<jsp:include page="mypageSideNav.jsp"/>
	</div>

	<div id="main-topNav" class="item">
		<jsp:include page="mypageTopNav.jsp"/>	
	</div>
	<%----------------- 디폴트 설정 -----------------%>
	
	<div id="myWishList-wrapper" class="item">
		<div id="myWishList-title" class="navbar navbar-light">
			<span class="mb-0">찜한 상품</span>
		</div>
		
		<div id="myWishList-state">
			<input type="button" id="wishSelectDelete" class="btn" value="선택삭제">
			<input type="button" id="wishAllDelete" class="btn" value="전체삭제">
			<table id="myWishListTable" class="table border-bottom">
				<thead>
					<tr align="center">
						<th scope="col" width="50">
							<input type="checkbox" id="allCheck">
						</th>
						<th colspan="2" scope="col">상품이름</th>
						<th scope="col" width="120">옵션</th>
						<th scope="col" width="150">찜한 날짜</th>
					</tr>
				</thead>
				<tbody>
				</tbody>
			</table>
			<div id="boardPagingDiv"></div>
		</div>
	</div><!-- 나의 주문처리 현황 -->

</div><!-- main-wrapper -->
</form>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function(){
	$.ajax({
		url: '/milkyWayForest/mypage/getWishList?pg=1',
		type: 'post',
		success: function(data) {
			//alert(JSON.stringify(data));
			$.each(data.list, function(index, items){
				$('<tr>').append($('<td>',{
					align: 'center'
				}).append($('<input>',{
					type: 'checkbox',
					class: 'wishCheck',
					value: items.wishListCode,
					name: 'wishListCode'
				}))).append($('<td>',{
					style: 'width: 80px; height: 80px;'
				}).append($('<img>',{
					src: '/milkyWayForest/productImage/'+items.productImageName,
					style: 'width: 100%; height: 100%; marging: 3px 40px'
				}))).append($('<td>',{
				}).append($('<a>',{
					href: '/milkyWayForest/shopping/shoppingDetail?productCode='+items.productCode,
					text: items.productName,
					class: 'productName'
				}))).append($('<td>',{
					text: items.productOption,
					align: 'center'
				})).append($('<td>',{
					text: items.wishDate,
					align: 'center'
				})).appendTo($('#myWishListTable tbody'));
			});
			
			$('#boardPagingDiv').html(data.boardPaging);
		},
		error: function(err) {
			console.log(err);
		}
	});
	
	$('#allCheck').click(function(){
		if($('#allCheck').is(':checked')) {
			$('.wishCheck').prop('checked', true);
		} else {
			$('.wishCheck').prop('checked', false);
		}
	});
	
	$(document).on('click', '.wishCheck', function(){
		if($('.wishCheck:checked').length < $('.wishCheck').length)
			$('#allCheck').prop('checked', false);
		else $('#allCheck').prop('checked', true);
	});
	
	
	$('#wishSelectDelete').click(function(){
		if($('.wishCheck:checked').length == 0) {
			alert('선택된 상품이 없습니다.');
		} else {
			$.ajax({
				url: '/milkyWayForest/mypage/wishSelectDelete',
				type: 'post',
				data: $('#mypageMain').serialize(),
				success: function(data) {
					alert('삭제되었습니다.');
					$('.wishCheck:checked').parents('tr').empty();
				},
				error: function(err) {
					console.log(err);
				}
			});
			
		}
	});
	
	$('#wishAllDelete').click(function(){
		$.ajax({
			url: '/milkyWayForest/mypage/wishAllDelete',
			type: 'post',
			success: function(data) {
				alert('삭제되었습니다.');
				$('#myWishListTable tbody').empty();
			},
			error: function(err) {
				console.log(err);
			}
		});
	});
});
</script>