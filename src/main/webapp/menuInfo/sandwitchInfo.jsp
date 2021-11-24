<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>브레드</title>
<link rel="stylesheet" type="text/css" href="/milkyWayForest/css/menuInfo.css">
</head>
<body>
<form id="sandwitchInfoForm" name="sandwitchInfoForm">
	<section id="content_box">
		<h1>샌드위치 전체메뉴</h1>
		
		<div id="sandwitchInfoNav">
			<div>
				<a href=""><img src="/milkyWayForest/image/icon_home.png" alt="홈"></a> > 
				<a href="">Menu</a> > 
				<a href="">푸드</a> > 
				<a href="">샌드위치</a>
			</div>
		</div>
		
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
			
		<div id="sandwitchInfoMenuDiv">샌드위치</div>
		
		<!-- 상품배열 -->
		<div class="listDiv">
			<ul class="productList1">
				<li><a href="#"><img></a></li>
				<li><a href="#">상품이름</a></li>
				<li><a href="#">가격</a></li>
			</ul>
		</div>
		
	</section>
</form>
</body>
</html>