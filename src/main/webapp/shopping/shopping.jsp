<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="/milkyWayForest/css/shopping.css">
<form id="shoppingForm" name="shoppingForm">
	<h1>쇼핑</h1>
	<div class="Menubar">
		<a href="/milkyWayForest/"><img src="/milkyWayForest/image/icon_home.png" alt="홈"></a> > 
		<a href="/milkyWayForest/shopping">Shopping</a>  
	</div>

	<div id ="shoppingMenu">
		
		<div id="shoppingMenuSubject">쇼핑</div>
		
		<ul>
            <li>
			 	<span id="menu2"><a href="/milkyWayForest/shopping/beanNTea">원두 / 차 </a> &nbsp; &nbsp; &nbsp;</span>
				<a href="/milkyWayForest/shopping/beanList">원두</a>&nbsp; &nbsp;
				<a href="/milkyWayForest/shopping/teaList">차</a>
			</li>
			
			<li>
				<span id="menu2" style="padding-right: 42px;"><a href="/milkyWayForest/shopping/product">상품 </a> &nbsp; &nbsp;</span>
				<a href="/milkyWayForest/shopping/mugList"> 머그</a>&nbsp; &nbsp;
				<a href="/milkyWayForest/shopping/glassList"> 글라스</a>&nbsp; &nbsp;
				<a href="/milkyWayForest/shopping/plasticTumblrList"> 플라스틱 텀블러</a>&nbsp; &nbsp;
				<a href="/milkyWayForest/shopping/stainlessTumblrList"> 스테인리스 텀블러</a>&nbsp; &nbsp;
				<a href="/milkyWayForest/shopping/thermosList"> 보온병</a>&nbsp; &nbsp;
				<a href="/milkyWayForest/shopping/coffeeEtcList"> 커피용품</a>
			</li>
		</ul>
	</div>


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
		
			 //alert(JSON.stringify(data));

			$.each(data, function(index,items) {
				$('<div>') .append($('<div>', {
					width: '70%',
					height: '300px',
					style : 'margin: 10px; cursor:pointer; overflow:hidden',
					position: 'relative'
					
				}).append($('<img>', {
					src: "/milkyWayForest/productImage/"+items.productImageName,
					position: 'absolute',
					width: '100%',
					height: '100%',
					id: 'imgClick'+items.productCode,
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
				
				 $('#imgClick'+items.productCode).click(function(){
					 location.href="/milkyWayForest/shopping/shoppingDetail?productCode="+items.productCode
					/* $.ajax({
						url:'/milkyWayForest/shopping/clickImg',
						type: 'post',
						data: 'productCode='+items.productCode,
					    dataType: 'text',
						success: function(data) {
							//alert("성공");
							location.href="/milkyWayForest/shopping/shoppingDetail?productCode="+items.productCode
						},
						error: function(err){ 
							console.log(err);
						}	
					}); */
				});  
			});//each	
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
					width: '70%',
					height: '300px',
					style : 'margin: 10px; cursor:pointer; overflow:hidden',
					position: 'relative'
					
				}).append($('<img>', {
					src: "/milkyWayForest/productImage/"+items.productImageName,
					position: 'absolute',
					width: '100%',
					height: '100%',
					id: 'imgClick'+items.productCode,
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
			
				$('.imgClick'+items.productCode).click(function(){
					$.ajax({
						url:'/milkyWayForest/shopping/clickImg',
						type: 'post',
						data: 'productCode='+items.productCode,
					    dataType: 'text',
						success: function(data) {
							//alert("성공");
							location.href="/milkyWayForest/shopping/shoppingDetail?productCode="+items.productCode
						},
						error: function(err){ 
							console.log(err);
						}
					});
				}); 
			});//each	
		},
		error: function(err) {
			console.log(err);
		}
	});	
});
</script>