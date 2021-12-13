<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet" type="text/css" href="/milkyWayForest/css/menuInfo.css">

<form id="foodInfoForm" name="foodInfoForm">
	<h1>푸드</h1>
		
			<div id="foodInfoNav">
				<div>
					<a href="/milkyWayForest/"><img src="/milkyWayForest/image/icon_home.png" alt="홈"></a> > 
					<a href="/milkyWayForest/menuInfo">Menu</a> > 
					<a href="">푸드</a>
					
				</div>
			</div>
		
			<div id ="foodInfoMenu">
			<div id ="foodInfoMenuSubject">푸드</div>
				<ul style="display:inline-block">
		            <li>
						<a href="/milkyWayForest/menuInfo/menuInfo?category=케이크&menuCode=K&pg=1">케이크</a>&nbsp; &nbsp;
		         	    <a href="/milkyWayForest/menuInfo/menuInfo?category=브레드&menuCode=B&pg=1">브레드</a>&nbsp; &nbsp;
		         	    <a href="/milkyWayForest/menuInfo/menuInfo?category=샐러드&menuCode=D&pg=1">샐러드</a>&nbsp; &nbsp;
		         	    <a href="/milkyWayForest/menuInfo/menuInfo?category=샌드위치&menuCode=S&pg=1">샌드위치</a>&nbsp; &nbsp;
					</li>
				</ul>
			</div>

		
		<div id="cakeInfoMenuDiv">케이크</div>
		<div id="cakeMenuDiv"></div>
		<br><br><br>
		
		<div id="breadInfoMenuDiv">브레드</div>
		<div id="breadMenuDiv"></div>
		<br><br><br>
		
		<div id="saladInfoMenuDiv">샐러드</div>
		<div id="saladMenuDiv"></div>
		<br><br><br>
	
		<div id="sandwitchInfoMenuDiv">샌드위치</div>
		<div id="sandwitchMenuDiv"></div>
		<br><br><br>
	
</form>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function(){

	$.ajax({
		url: '/milkyWayForest/menuInfo/getFoodAll',
		type: 'post',
		data: 'menuCode=K',
		success: function(data) {
			//alert(JSON.stringify(data));
			$.each(data, function(index, items) {
				$('<div>').append($('<a>',{
					href: '/milkyWayForest/menuInfo/menuDetail?category=푸드&menuCode='+items.menuCode
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
				})).appendTo($('#cakeMenuDiv'));
			});
			
		},
		error: function(err) {
			console.log(err);
		}
	});
	
	$.ajax({
		url: '/milkyWayForest/menuInfo/getFoodAll',
		type: 'post',
		data: 'menuCode=B',
		success: function(data) {
			//alert(JSON.stringify(data));
			$.each(data, function(index, items) {
				$('<div>').append($('<a>',{
					href: '/milkyWayForest/menuInfo/menuDetail?category=푸드&menuCode='+items.menuCode
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
				})).appendTo($('#breadMenuDiv'));
			});
			
		},
		error: function(err) {
			console.log(err);
		}
	});
	
	$.ajax({
		url: '/milkyWayForest/menuInfo/getFoodAll',
		type: 'post',
		data: 'menuCode=D',
		success: function(data) {
			//alert(JSON.stringify(data));
			$.each(data, function(index, items) {
				$('<div>').append($('<a>',{
					href: '/milkyWayForest/menuInfo/menuDetail?category=푸드&menuCode='+items.menuCode
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
				})).appendTo($('#saladMenuDiv'));
			});
			
		},
		error: function(err) {
			console.log(err);
		}
	});

	$.ajax({
		url: '/milkyWayForest/menuInfo/getFoodAll',
		type: 'post',
		data: 'menuCode=S',
		success: function(data) {
			//alert(JSON.stringify(data));
			$.each(data, function(index, items) {
				$('<div>').append($('<a>',{
					href: '/milkyWayForest/menuInfo/menuDetail?category=푸드&menuCode='+items.menuCode
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
				})).appendTo($('#sandwitchMenuDiv'));
			});
			
		},
		error: function(err) {
			console.log(err);
		}
	});
})

</script>