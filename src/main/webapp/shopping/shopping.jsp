<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쇼핑</title>
<link rel="stylesheet" type="text/css" href="/milkyWayForest/css/shopping.css">
</head>

<body>
<form id="shoppingForm" name="shoppingForm">

<h1> 쇼핑 </h1>

	<div id="shoppingNav">
		<div>
			<a href=""><img src="/milkyWayForest/image/icon_home.png" alt="홈"></a> > 
			<a href="">Menu</a>  
		</div>
	</div>

	<div id ="shoppingMenu">
	<div id ="shoppingMenuSubject"> 쇼핑 </div>
	<br>
		<ul>
            <li>
			 	<span id="menu2">
			 	원두 / 차  &nbsp; &nbsp; &nbsp;
			 	</span>
				<a href="#"> 원두</a>&nbsp; &nbsp;
				<a href="#"> 차</a>
			</li>
			<br>
			
			<li>
				<span id="menu2">
				상품  &nbsp; &nbsp;
				</span>
				<a href="#"> 머그</a>&nbsp; &nbsp;
				<a href="#"> 글라스</a>&nbsp; &nbsp;
				<a href="#"> 플라스틱 텀블러</a>&nbsp; &nbsp;
				<a href="#"> 스테인리스 텀블러</a>&nbsp; &nbsp;
				<a href="#"> 보온병</a>&nbsp; &nbsp;
				<a href="#"> 커피용품</a>
			</li>
		</ul>
	</div>

	<br><br><br>

<div id="beanNTeaMenuDiv">원두 / 차</div>
<div id="menuImgDiv1">

</div>

<br><br><br>

<div id="productMenuDiv">상품</div>
<div id="menuImgDiv2">

</div>
<br><br><br>

</form>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function(){
	$.ajax({
		url: '/milkyWayForest/shopping/getShoppingList',  
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

$(function(){
	$.ajax({
		url: '/milkyWayForest/shopping/getShoppingList2',  
		type: 'post',
		dataType: 'json',
		success : function(data) {
			//alert(JSON.stringify(data));
	
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
				.appendTo($('#menuImgDiv2'));
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