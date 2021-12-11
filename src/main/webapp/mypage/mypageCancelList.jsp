<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" href="/milkyWayForest/css/mypage.css">

<form id="mypageCancelList">
<div id="main-wrapper">
	<div id="main-sideNav" class="item">
		<jsp:include page="mypageSideNav.jsp"/>
	</div>

	<div id="main-topNav" class="item">
		<jsp:include page="mypageTopNav.jsp"/>	
	</div>
	<%----------------- 디폴트 설정 -----------------%>

	<div id="myPayment-wrapper" class="item">
		<div id="myPayment-title" class="navbar navbar-light alert-info">
			<span class="navbar-brand mb-0 h1">주문취소/교환/반품 내역</span>
		</div>
		
		<div id="myPayment-state">
			<table class="table table-bordered" id="myPaymentTable">
				<thead>
					<tr>
						<td scope="col">주문번호</td>
						<td scope="col">상품정보</td>
						<td scope="col">수량</td>
						<td scope="col">상품금액</td>
						<td scope="col">배송비</td>
						<td scope="col">주문처리상태</td>
					</tr>
				</thead>
				<tbody></tbody>
			</table>
			
			<div id="myOrderPagingDiv"></div>
		</div>
	</div><!-- 배송상품 주문정보 -->
	
</div><!-- main-wrapper -->
</form>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(function(){
	$('#myPaymentTable tbody').empty();
	
	//배송상품 주문정보
	$.ajax({
		url: '/milkyWayForest/mypage/getCancelList?pg='+${pg},
		type: 'post',
		success: function(data){
			console.log(JSON.stringify(data));
			if(data.paymentList == ''){
				$('<tr>').append($('<td>',{
					text: '주문정보가 존재하지 않습니다',
					colspan: '6',
					align: 'center'
				})).appendTo($('#myPaymentTable'));
				
			}else{
				$.each(data.paymentList, function(index, items) {
					
					if(items.deliveryInfo=='취소' || items.deliveryInfo=='교환' || items.deliveryInfo=='반품' || items.deliveryInfo=='환불'){
						$('<tr>').append($('<td>',{
						}).append($('<a>',{
							id: 'paymentCode',
							text: items.paymentCode,
							class: 'orderSubject',
							href: '/milkyWayForest/mypage/MyOrderView?paymentCode='+items.paymentCode
							
						}))).append($('<td>',{
							id: 'productName',
							text: items.productName
							
						})).append($('<td>',{
							id: 'payQty',
							text: items.payQty.toLocaleString()
							
						})).append($('<td>',{
							id: 'payPrice',
							text: items.payPrice.toLocaleString()
							
						})).append($('<td>',{
							id: 'shipPay',
							text: items.shipPay.toLocaleString()
							
						})).append($('<td>',{
							id: 'deliveryInfo',
							text: items.deliveryInfo
							
						})).appendTo($('#myPaymentTable tbody'));
					}

				});
				
			}//if
			
			$('#myOrderPagingDiv').html(data.boardPaging);

		},
		error: function(err){
			console.log(err);
		}
	});
});

function boardPaging(page){
	location.href="/milkyWayForest/mypage/mypageCancelList?pg="+page;
}
</script>