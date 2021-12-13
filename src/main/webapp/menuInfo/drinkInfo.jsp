<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="/milkyWayForest/css/menuInfo.css">

<form id="drinkInfoForm" name="drinkInfoForm">
	<h1>음료</h1>
		
			<div id="drinkInfoNav">
				<div>
					<a href="/milkyWayForest"><img src="/milkyWayForest/image/icon_home.png" alt="홈"></a> > 
					<a href="/milkyWayForest/menuInfo">Menu</a> > 
					<a href="">음료</a>
					
				</div>
			</div>
		
			<div id ="drinkInfoMenu">
				<div id ="drinkInfoMenuSubject">음료</div>
				<ul>
		            <li>
						<a href="/milkyWayForest/menuInfo/menuInfo?category=차&menuCode=T&pg=1">차</a>&nbsp; &nbsp;
		         	    <a href="/milkyWayForest/menuInfo/menuInfo?category=커피&menuCode=C&pg=1">커피</a>&nbsp; &nbsp;
					</li>
				</ul>
			</div>
		
		<div id="teaInfoMenuDiv">차</div>
		<div id="teaMenuDiv"></div>
		<br><br><br>
		
		<div id="coffeeInfoMenuDiv">커피</div>
		<div id="coffeeMenuDiv"></div>
		<br><br><br>
	
</form>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function(){
	$.ajax({
		url: '/milkyWayForest/menuInfo/getTea',
		type: 'post',
		success: function(data) {
			//alert(JSON.stringify(data));
			
			$.each(data, function(index, items) {
				
				$('<div>').append($('<a>',{
					href: '/milkyWayForest/menuInfo/menuDetail?category=음료&menuCode='+items.menuCode
				}).append($('<div>',{
					width: '70%',
					height: '300px',
					style: 'cursor: pointer; overflow:hidden;',
					position: 'relative'
				}).append($('<img>',{
					src: items.menuImg,
					position: 'absolute',
					width: '100%',
					height: '100%',
					class: 'imgClick'
				}).append($('<input>',{
					type: 'hidden',
					id: 'menuCode'+index,
					value: items.menuCode
				}))))).append($('<div>',{
					width: '50%',
					align: 'center',
					style : 'padding-bottom: 10px; margin-top: 15px; color: black; border-bottom: 1px solid gainsboro; font-size: 15px;',
					text: items.menuName
				})).append($('<div>',{
					text: items.menuEngName,
					align: 'center',
					style: 'margin: 5px 5px 40px 5px; color: #999; font-size: 9pt'
				})).appendTo($('#teaMenuDiv'));
			});
		},
		error: function(err) {
			console.log(err);
		}
	}); // 음료 온로드
	
	$.ajax({
		url: '/milkyWayForest/menuInfo/getCoffee',
		type: 'post',
		success: function(data) {
			//alert(JSON.stringify(data));
			$.each(data, function(index, items) {
				$('<div>').append($('<a>',{
					href: '/milkyWayForest/menuInfo/menuDetail?category=음료&menuCode='+items.menuCode
				}).append($('<div>',{
					width: '70%',
					height: '300px',
					style: 'cursor: pointer; overflow:hidden;',
					position: 'relative'
				}).append($('<img>',{
					src: items.menuImg,
					position: 'absolute',
					width: '100%',
					height: '100%',
					class: 'imgClick'
				}).append($('<input>',{
					type: 'hidden',
					id: 'menuCode'+index,
					value: items.menuCode
				}))))).append($('<div>',{
					width: '50%',
					align: 'center',
					style : 'padding-bottom: 10px; margin-top: 15px; color: black; border-bottom: 1px solid gainsboro; font-size: 15px;',
					text: items.menuName
				})).append($('<div>',{
					text: items.menuEngName,
					align: 'center',
					style: 'margin: 5px 5px 40px 5px; color: #999; font-size: 9pt'
				})).appendTo($('#coffeeMenuDiv'));
			});
		},
		error: function(err) {
			console.log(err);
		}
	});
})
</script>