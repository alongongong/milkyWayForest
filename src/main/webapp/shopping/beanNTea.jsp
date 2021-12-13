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
			<a href="/milkyWayForest/"><img src="/milkyWayForest/image/icon_home.png" alt="홈"></a> > 
			<a href="/milkyWayForest/shopping">Shopping</a> > 
			<a href="/milkyWayForest/shopping/beanNTea">원두/차</a>
			
		</div>
	</div>

	<div id ="beanNTeaMenu">
		<div id ="beanNTeaMenuSubject">원두 / 차</div>
		<ul>
            <li>
				<a href="/milkyWayForest/shopping/beanList">원두</a>&nbsp; &nbsp;
         	    <a href="/milkyWayForest/shopping/teaList">차</a>&nbsp; &nbsp;
			</li>
		</ul>
	</div>

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
		url: '/milkyWayForest/shopping/getBeanNTeaList2',  
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
					id: 'imgClick'+items.productCode,  //문자열로 결합이 된다.사과딸기처럼  /이미지+프로덕트코드가 결합   String str = "사과";  >> str+"딸기"
					class: 'imgClick'					//imgClickT001 이렇게 결합이 된다.  
														//+items.productImageName 으로 class명에 붙여버리면 imgClickT001.png 가 되어버림. 그래서 +items.productCode 로 해준것.
											// 우리는 지금 productCode 하나로 상세페이지를 왔다갔다 할꺼다. 그래서 아래 클릭 이벤트 걸때 클래스의 프로덕트코드에 해당하는 걸 눌렀을때 라는 표시로 
											// class: 'imgClick'+items.productCode  클래스 속성을 길게 써준것.
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
				
				
				/* alert창을 눌렀을때 
				사진이 여러개가 뜨지 않게 하려고 
				$('.imgClick'+items.productCode).click(function(){ });	
				이렇게 바꿔주고 class 명도 
				class: 'imgClick'+items.productCode  이렇게 길게  바꿔줬다 */
				
				
				$('#imgClick'+items.productCode).click(function(){  // 여기에 +프로덕트코드를 써주지 않으면 사진을 있는대로 카테고리에 해당하는걸 다 불러버리기 때문에 프로덕트코드를 써주는것.
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