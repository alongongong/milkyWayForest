<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>플라스틱 텀블러</title>
<link rel="stylesheet" type="text/css" href="/milkyWayForest/css/shopping.css">
</head>
<body>
<form id="plasticTumblrListForm" name="plasticTumblrListForm">
	<section id="content_box">
		<h1>플라스틱 텀블러 전체상품</h1>
		
		<div id="plasticTumblrListNav">
		<div>
			<a href=""><img src="/milkyWayForest/image/icon_home.png" alt="홈"></a> > 
			<a href="">Menu</a> > 
			<a href="">상품</a> > 
			<a href="">플라스틱 텀블러</a>
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
		
			<div id="plasticTumblrMenuDiv">플라스틱 텀블러</div>
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
		url: '/milkyWayForest/shopping/getPlasticTumblrList',  
		type: 'post',
		dataType: 'json',
		success : function(data) {
	
		// alert(JSON.stringify(data));

			$.each(data, function(index,items) {
				$('<div>') .append($('<div>', {
					width: '300px',
					height: '300px',
					position: 'relative'
					
				}).append($('<img>', {
					src: "/milkyWayForest/productImage/"+items.productImageName,
					position: 'absolute',
					width: '100%',
					height: '100%'
					
				})))
				.append($('<div>',{
					width: '50%',
					align: 'center',
					
					text : items.productName 
				}))
				.append($('<div>',{
					width: '50%',
					text : items.productUnit
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