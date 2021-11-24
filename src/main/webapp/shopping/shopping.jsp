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
<div id="div">

</div>

<br><br><br>

<div id="productMenuDiv">상품</div>
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
			 alert(JSON.stringify(data));
			
			/*  $.each(data, function(index,items) {
				 $('<div/>' /*  {} */
					.append($('<ul>', {} /* .append($('<li>' {}).append($('<img>'{}))) */
					.append($('<li>',{
						width: 100,
						align: 'center',
						text :  items.productname,
						list-style: 'none'
				 })).append($('<li>',{
					 	width: 100,
						align: 'center',
						text :  items.productUnit,
						list-style: 'none'
				 })) ))); */
				 
				 
				 
				 /* $('<div/>').append($('<li>', {
					align : 'center',
					list-style: 'none'
				
				}).append($('<img/>', {})) */
					
				 /* width: 100,
					align: 'center',
					text :  items.productname
				
				}).append($('<td/>' {
					width: 100,
					align: 'center',
					text :  items.productUnit
					
				})).appendTo($('#beanNTeaMenuDiv')) */
				
			} 
		},
		error: function(err) {
			console.log(err);
		}
	});	
});
</script>

</body>
</html>