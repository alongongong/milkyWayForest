<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품</title>
<link rel="stylesheet" type="text/css" href="/milkyWayForest/css/shopping.css">
</head>

<body>
<form id="productForm" name="productForm">
	<h1>상품</h1>
	<div id="productNav">
		<div>
			<a href="/milkyWayForest/"><img src="/milkyWayForest/image/icon_home.png" alt="홈"></a> > 
			<a href="/milkyWayForest/shopping">Shopping</a> > 
			<a href="/milkyWayForest/shopping/product">상품</a>	
		</div>
	</div>

	<div id="productMenu">
		<div id ="productMenuSubject">상품</div>
	    <ul>
             <li>
	             <a href="/milkyWayForest/shopping/mugList">머그 </a>&nbsp; &nbsp;
	             <a href="/milkyWayForest/shopping/glassList">글라스</a> &nbsp; &nbsp;
	             <a href="/milkyWayForest/shopping/plasticTumblrList">플라스틱 텀블러</a> &nbsp; &nbsp;
	             <a href="/milkyWayForest/shopping/stainlessTumblrList">스테인리스 텀블러</a> &nbsp; &nbsp;
	             <a href="/milkyWayForest/shopping/thermosList">보온병</a> &nbsp; &nbsp;
	             <a href="/milkyWayForest/shopping/coffeeEtcList">커피용품</a>&nbsp; &nbsp;
             </li>
             
		</ul>
	</div>


<div id="mugMenuDiv">머그</div>
<div id="menuImgDiv1">
<!-- 에이작스로 목록불러오기 -->
</div>
<br><br><br>

<div id="glassMenuDiv">글라스</div>
<div id="menuImgDiv2">
<!-- 에이작스로 목록불러오기 -->
</div>
<br><br><br>

<div id="plasticMenuDiv">플라스틱 텀블러</div>
<div id="menuImgDiv3">
<!-- 에이작스로 목록불러오기 -->
</div>
<br><br><br>

<div id="stainlessMenuDiv">스테인리스 텀블러</div>
<div id="menuImgDiv4">
<!-- 에이작스로 목록불러오기 -->
</div>
<br><br><br>

<div id="thermosMenuDiv">보온병</div>
<div id="menuImgDiv5">
<!-- 에이작스로 목록불러오기 -->
</div>
<br><br><br>

<div id="coffeEtcMenuDiv">커피용품</div>
<div id="menuImgDiv6">
<!-- 에이작스로 목록불러오기 -->
</div>
<br><br><br>

</form>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function(){
	$.ajax({
		url: '/milkyWayForest/shopping/getProductList',  
		type: 'post',
		dataType: 'json',
		success : function(data) {
	
		// alert(JSON.stringify(data));

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
				
				//function
				$('#imgClick'+items.productCode).click(function(){
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

$(function(){
	$.ajax({
		url: '/milkyWayForest/shopping/getProductList2',  
		type: 'post',
		dataType: 'json',
		success : function(data) {
		//	alert(JSON.stringify(data));
	
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
				
				//function
				$('#imgClick'+items.productCode).click(function(){
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

$(function(){
	$.ajax({
		url: '/milkyWayForest/shopping/getProductList3',  
		type: 'post',
		dataType: 'json',
		success : function(data) {
		//	alert(JSON.stringify(data));
	
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
				.appendTo($('#menuImgDiv3'));
				
				//function
				$('#imgClick'+items.productCode).click(function(){
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

$(function(){
	$.ajax({
		url: '/milkyWayForest/shopping/getProductList4',  
		type: 'post',
		dataType: 'json',
		success : function(data) {
		//	alert(JSON.stringify(data));
	
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
				.appendTo($('#menuImgDiv4'));
				
				//function
				$('#imgClick'+items.productCode).click(function(){
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

$(function(){
	$.ajax({
		url: '/milkyWayForest/shopping/getProductList5',  
		type: 'post',
		dataType: 'json',
		success : function(data) {
		//	alert(JSON.stringify(data));
	
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
				.appendTo($('#menuImgDiv5'));
				
				//function
				$('#imgClick'+items.productCode).click(function(){
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

$(function(){
	$.ajax({
		url: '/milkyWayForest/shopping/getProductList6',  
		type: 'post',
		dataType: 'json',
		success : function(data) {
		//	alert(JSON.stringify(data));
	
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
				.appendTo($('#menuImgDiv6'));
				
				//function
				$('#imgClick'+items.productCode).click(function(){
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


</body>
</html>