<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>원두/차</title>
<link rel="stylesheet" type="text/css" href="/milkyWayForest/css/shopping.css">
</head>

<body>
<form id="beanNTeaForm" name="beanNTeaForm">


<h1> 원두 / 차 </h1>

	<div id="beanNTeaNav">
		<div>
			<a href=""><img src="/milkyWayForest/image/icon_home.png" alt="홈"></a> > 
			<a href="">Menu</a> > 
			<a href="">원두/차</a>
			
		</div>
	</div>

	<div id ="beanNTeaMenu">
	<div id ="beanNTeaMenuSubject">원두 / 차</div>
	<br>
		<ul>
            <li>
				<a href="#">원두</a>&nbsp; &nbsp;
         	    <a href="#">차</a>&nbsp; &nbsp;
			</li>
		</ul>
	</div>


<br><br><br>

<div id="beanMenuDiv">원두</div>
<div id="menuImgDiv1">
<!-- 에이작스로 목록불러오기 -->
</div>

<br><br><br>

<div id="teaMenuDiv">차</div>
<div id="menuImgDiv2">
<!-- 에이작스로 목록불러오기 -->
</div>
<br><br><br>

</form>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function(){
	$.ajax({
		url: '/milkyWayForest/shopping/getBeanNTeaList',  
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

$(function(){
	$.ajax({
		url: '/milkyWayForest/shopping/getBeanNTeaList2',  
		type: 'post',
		dataType: 'json',
		success : function(data) {
		//	alert(JSON.stringify(data));
	
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
				.appendTo($('#menuImgDiv2'));
				
				
				$('.imgClick').click(function(){
					$.ajax({
						url:'/milkyWayForest/shopping/clickImg',
						type: 'post',
						data: 'productCode='+items.productCode,
					   dataType: 'text',
				
						success: function(data) {
							alert:("성공");
							
							location.href="/milkyWayForest/shopping/shoppingDetail?productCode="+$('#productCode').val();
						},
						error: function(err){ 
							console.log(err);
						}
						
					});
				});
				
				
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