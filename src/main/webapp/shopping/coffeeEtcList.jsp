<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커피용품</title>
<link rel="stylesheet" type="text/css" href="/milkyWayForest/css/shopping.css">
</head>
<body>
<form id="coffeeEtcListForm" name="coffeeEtcListForm">
	<section id="content_box">
		<h1>커피용품 전체상품</h1>
		
		<div id="coffeeEtcListNav">
		<div>
			<a href=""><img src="/milkyWayForest/image/icon_home.png" alt="홈"></a> > 
			<a href="">Menu</a> > 
			<a href="">상품</a> > 
			<a href="">커피용품</a>
		</div>
		</div>
		
		
			<div class="productGroup">
				<div>
				<select>
					<option>상세분류</option>
					<option>신규출시된 메뉴</option>
					<option>시즌 한정상품</option>
					<option>판매완료된 상품</option>
				</select>
				</div>
			</div>	
		
			<div id="coffeeEtcMenuDiv">커피용품</div>
			<!-- 상품배열 -->
				<div id="menuImgDiv1">
					<!-- 에이작스로 목록불러오기 -->
				</div>
		
	</section>
</form>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function(){
	$.ajax({
		url: '/milkyWayForest/shopping/getCoffeeEtcList',  
		type: 'post',
		dataType: 'json',
		success : function(data) {
	
		// alert(JSON.stringify(data));

			$.each(data, function(index,items) {
				$('<div>') .append($('<div>', {
					width: '70%',
					height: '300px',
					style : 'margin: 10px;',
					position: 'relative'
					
				}).append($('<img>', {
					src: "/milkyWayForest/productImage/"+items.productImageName,
					position: 'absolute',
					width: '100%',
					height: '100%',
					class: 'imgClick'
					
				})).append($('<input>', { 
					type: 'hidden',
					id: 'productCode',
					value: items.productCode
					
				})))
				.append($('<div>',{
					width: '50%',
					align: 'center',
					style : 'padding-bottom: 10px; margin: 5px; color: black; border-bottom: 1px solid gainsboro; font-size: 15px;',
					text : items.productName 
				}))
				.append($('<div>',{
					width: '50%',
					align: 'center',
					style : 'margin: 5px; color: #555555; font-size: 15px; font-weight:bold;',
					text : items.productUnit.toLocaleString()+" 원"
				}))
				.appendTo($('#menuImgDiv1'));
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