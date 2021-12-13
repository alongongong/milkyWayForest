<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet" type="text/css" href="/milkyWayForest/css/menuInfo.css">

<form id="menuInfoForm" name="menuInfoForm">

<h1> 메뉴소개 </h1>

	<div id="menuInfoNav">
		<div>
			<a href="/milkyWayForest/"><img src="/milkyWayForest/image/icon_home.png" alt="홈"></a> > 
			<a href="/milkyWayForest/menuInfo">Menu</a>  
		</div>
	</div>

	<div id ="menuInfoMenu">
	<div id ="menuInfoMenuSubject"> 메뉴 </div>
		<ul>
            <li>
			 	<span id="menu2">
			 	<a href="/milkyWayForest/menuInfo/drinkInfo">음료</a>  &nbsp; &nbsp; &nbsp;
			 	</span>
				<a href="/milkyWayForest/menuInfo/menuInfo?category=차&menuCode=T&pg=1">차</a>&nbsp; &nbsp;
				<a href="/milkyWayForest/menuInfo/menuInfo?category=커피&menuCode=C&pg=1"> 커피</a>
			</li>
			
			<li>
				<span id="menu2" style="padding-right: 10px;">
				<a href="/milkyWayForest/menuInfo/foodInfo">푸드</a>  &nbsp; &nbsp;
				</span>
				<a href="/milkyWayForest/menuInfo/menuInfo?category=케이크&menuCode=K&pg=1"> 케익</a>&nbsp; &nbsp;
				<a href="/milkyWayForest/menuInfo/menuInfo?category=브레드&menuCode=B&pg=1"> 브레드</a>&nbsp; &nbsp;
				<a href="/milkyWayForest/menuInfo/menuInfo?category=샐러드&menuCode=D&pg=1"> 샐러드</a>&nbsp; &nbsp;
				<a href="/milkyWayForest/menuInfo/menuInfo?category=샌드위치&menuCode=S&pg=1"> 샌드위치</a>
				
			</li>
		</ul>
	</div>


<div id="drinkInfoMenuDiv">음료</div>
<div id="drinkMenuDiv"></div>
<br><br><br>

<div id="foodInfoMenuDiv">푸드</div>
<div id="foodMenuDiv"></div>
<br><br><br>

</form>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function(){
	$.ajax({
		url: '/milkyWayForest/menuInfo/getDrink',
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
				})).appendTo($('#drinkMenuDiv'));
			});
		},
		error: function(err) {
			console.log(err);
		}
	}); // 음료 온로드
	
	$.ajax({
		url: '/milkyWayForest/menuInfo/getFood',
		type: 'post',
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
				})))).append($('<div>',{
					width: '50%',
					align: 'center',
					style : 'padding-bottom: 10px; margin-top: 15px; color: black; border-bottom: 1px solid gainsboro; font-size: 15px;',
					text: items.menuName
				})).append($('<div>',{
					text: items.menuEngName,
					align: 'center',
					style: 'margin: 5px 5px 40px 5px; color: #999; font-size: 9pt'
				}))).appendTo($('#foodMenuDiv'));
			});
		},
		error: function(err) {
			console.log(err);
		}
	});
})
</script>