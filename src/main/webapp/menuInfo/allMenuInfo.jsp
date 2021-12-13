<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="/milkyWayForest/css/menuInfo.css">

<form id="allMenuInfoForm" name="allMenuInfoForm">
	<section id="content_box">
		<h1>${ smallMenu } 전체메뉴</h1>
		
		<div id="allMenuInfoNav">
			<div>
				<a href="/milkyWayForest/"><img src="/milkyWayForest/image/icon_home.png" alt="홈"></a> > 
				<a href="/milkyWayForest/menuInfo">Menu</a> > 
				<c:if test="${smallMenu == '차' || smallMenu == '커피' }">
					<a href="/milkyWayForest/menuInfo/drinkInfo" id="category">음료</a> > 
				</c:if>
				<c:if test="${smallMenu == '브레드' || smallMenu == '샌드위치' || smallMenu == '샐러드' || smallMenu == '케이크' }">
					<a href="/milkyWayForest/menuInfo/foodInfo" id="category">푸드</a> > 
				</c:if>
				<a href="">${smallMenu }</a>
			</div>
		</div>
		<br>
		<!-- 
		<div class="productGroup">
			<div>
			<select>
				<option>상세분류</option>
				<option>신규출시된 메뉴</option>
				<option>시즌 한정상품</option>
				<option>판매완료된 상품</option>
			</select>
			</div>
		</div>
		 -->	
		<div id="AllInfoMenuDiv">${smallMenu }</div>
		
		<div id="AllMenuDiv"></div>
		<br><br><br>
		<div id="boardPagingDiv"></div>
		
	</section>
</form>


<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function(){

	$.ajax({
		url: '/milkyWayForest/menuInfo/getMenuInfo',
		type: 'post',
		data: 'menuCode=${menuCode}&pg=${pg}',
		success: function(data) {
			//alert(JSON.stringify(data));
			$.each(data.list, function(index, items) {
				$('<div>').append($('<a>',{
					href: '/milkyWayForest/menuInfo/menuDetail?category='+$('#category').text()+'&menuCode='+items.menuCode
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
				})).appendTo($('#AllMenuDiv'));
			});
			
			$('#boardPagingDiv').html(data.boardPaging);
		},
		error: function(err) {
			console.log(err);
		}
	});
})

function boardPaging(page){
	location.href="/milkyWayForest/menuInfo/menuInfo?category=${smallMenu}&menuCode=${menuCode}&pg="+page;
}
</script>