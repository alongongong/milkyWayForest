<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet" href="/milkyWayForest/css/menuInfo.css">

<form id="menuDetailForm" name="menuDetailForm">

	
	<section id="content_box">
		
		<div id="menuDetailNav">
			<div>
				<a href="/milkyWayForest/"><img src="/milkyWayForest/image/icon_home.png" alt="홈"></a> > 
				<a href="/milkyWayForest/menuInfo">Menu</a> > 
				<a href="" id="category">${category }</a> > 
				<a href="" id="smallMenu"></a>
			</div>
		</div>
		<br><br>
		
		<div id="menuDetailView">
			<div id="menuImgDiv" class="items">
				<div id="menuDetailBigImg">
					<img id="bigImg" class="imgClick">
				</div>
				<ul class="imgList">
					<li class="on"><img></li>
				</ul>
			</div>
			<div id="menuName" class="items"></div>
			<div id="menuDetail" class="items"></div>
			<div id="menuNutri" class="items">
				<div id="menuWeight" class="items">제품영양정보</div>
				<div id="menuLeftInfo" class=items>
					<div id="menuKcal1">1회 제공량 (kcal)
					<span id="menuKcal2"></span></div>
					<div id="menuSugar1">당류 (g) 
					<span id="menuSugar2"></span></div>
					<div id="menuFat1">포화지방 (g)
					<span id="menuFat2"></span></div>
				</div>
				<div id="menuRightInfo" class="items">
					<div id="menuProtein1">단백질 (g)
					<span id="menuProtein2"></span></div>
					<div id="menuSodium1">나트륨 (mg)
					<span id="menuSodium2"></span></div>
				</div>
				<div id="menuFactor" class="items"></div>
			</div>
		</div>
		
		
	<!-- <div class="productView">
		테이블로 상품이름 및 용량 가격 옵션 등 넣기 
		<table id="detailTable">
			<tr>
				<td id="productKorName" colspan="2"></td>
			</tr>
			
			<tr>
				<td id="productEngName" colspan="2"></td>
			</tr>
			
			<tr>
				<td colspan="2" id="productDetail"></td>
			</tr>
		</table>
		
		<div id="menuNutriInfo"></div>
		
		<div class="menuDetailImg">
			<img id="bigImg">
				<ul class="imgList">
					<li class="on"><img></li>
				</ul>
		</div>
			
	</div> -->
		
	</section>
</form>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function(){
	$.ajax({
		url: '/milkyWayForest/menuInfo/getMenuDetail',
		type: 'post',
		data: 'menuCode=${menuCode}',
		success: function(data) {
			// alert(JSON.stringify(data));
			$('#smallMenu').text(data.menuCategory);
			if(data.menuCategory == '차') {
				$('#category').attr('href', '/milkyWayForest/menuInfo/drinkInfo');
				$('#smallMenu').attr('href', '/milkyWayForest/menuInfo/menuInfo?category=차&menuCode=T&pg=1')
			} else if(data.menuCategory == '커피') {
				$('#category').attr('href', '/milkyWayForest/menuInfo/drinkInfo');
				$('#smallMenu').attr('href', '/milkyWayForest/menuInfo/menuInfo?category=커피&menuCode=C&pg=1')
			} else if(data.menuCategory == '케이크') {
				$('#category').attr('href', '/milkyWayForest/menuInfo/foodInfo');
				$('#smallMenu').attr('href', '/milkyWayForest/menuInfo/menuInfo?category=케이크&menuCode=K&pg=1')
			} else if(data.menuCategory == '브레드') {
				$('#category').attr('href', '/milkyWayForest/menuInfo/foodInfo');
				$('#smallMenu').attr('href', '/milkyWayForest/menuInfo/menuInfo?category=브레드&menuCode=B&pg=1')
			} else if(data.menuCategory == '샐러드') {
				$('#category').attr('href', '/milkyWayForest/menuInfo/foodInfo');
				$('#smallMenu').attr('href', '/milkyWayForest/menuInfo/menuInfo?category=샐러드&menuCode=D&pg=1')
			} else if(data.menuCategory == '샌드위치') {
				$('#category').attr('href', '/milkyWayForest/menuInfo/foodInfo');
				$('#smallMenu').attr('href', '/milkyWayForest/menuInfo/menuInfo?category=샌드위치&menuCode=S&pg=1')
			}
			
			$('#menuImgDiv #bigImg').attr('src', data.menuImg);
			$('#menuName').text(data.menuName);
			$('<p>',{
				text: data.menuEngName,
				id: 'menuEngName'
			}).appendTo($('#menuName'))
			$('#menuDetail').html(data.menuDetail);
			$('#menuKcal2').text(data.menuKcal);
			$('#menuSugar2').text(data.menuSugar);
			$('#menuFat2').text(data.menuFat);
			$('#menuProtein2').text(data.menuProtein);
			$('#menuSodium2').text(data.menuSodium);
			if(data.menuFactor != null) {
				$('#menuFactor').text(data.menuFactor);
			} else {
				$('#menuFactor').css('visibility', 'hidden');
			}
			
			if(data.menuCaffeine != 0) {
				$('<div>',{
					text: '카페인 (mg)'
				}).append($('<span>',{
					text: data.menuCaffeine
				})).appendTo($('#menuRightInfo'));
			}
			$('.imgList .on img').attr('src', data.menuImg);
			$('.imgList .on img').css('border', '1px solid  #154520');
			
			/* 
			$('#productKorName').text(data.menuName);
			$('#productEngName').text(data.menuEngName);
			$('#productDetail').html(data.menuDetail);
			$('.menuDetailImg #bigImg').attr('src', data.menuImg);
			$('.imgList .on img').attr('src', data.menuImg);
			$('.imgList .on img').css('border', '1px solid  #154520');
			*/
		},
		error: function(err) {
			console.log(err);
		}
	})
});
</script>
