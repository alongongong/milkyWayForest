<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>차음료</title>
<link rel="stylesheet" type="text/css" href="/milkyWayForest/css/menuInfo.css">
</head>
<body>
<form id="teaInfoForm" name="teaInfoForm">
	<section id="content_box">
		<h1>차 전체메뉴</h1>
		
		<div id="teaInfoNav">
			<div>
				<a href=""><img src="/milkyWayForest/image/icon_home.png" alt="홈"></a> > 
				<a href="">Menu</a> > 
				<a href="">음료</a> > 
				<a href="">차</a>
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
			
		<div id="teaInfoMenuDiv">차</div>
		
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