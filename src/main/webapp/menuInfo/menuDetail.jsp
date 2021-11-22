<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세페이지</title>
<link rel="stylesheet" href="/milkyWayForest/css/menuInfo.css">
</head>
<body>
<form id="menuDetailForm" name="menuDetailForm">

	
	<section id="content_box">
		<h1> 품목 </h1>
		
		<div id="menuDetailNav">
			<div>
				<a href=""><img src="/milkyWayForest/image/icon_home.png" alt="홈"></a> > 
				<a href="">Menu</a> > 
				<a href="">푸드</a> > 
				<a href="">브레드</a>
			</div>
		</div>
		
		
	<div class="productView">
		<!-- 테이블로 상품이름 및 용량 가격 옵션 등 넣기  -->
		<table id="detailTable">
			<tr>
				<td id="productKorName" colspan="2">상품 한국이름</td>
			</tr>
			
			<tr>
				<td id="productEngName" colspan="2">상품 영어이름</td>
			</tr>
			
			<tr>
				<td colspan="2">상품설명</td>
			</tr>
		</table>
		
			<div class="menuDetailImg">
				<img src ="/milkyWayForest/image/C001.jpg" alt="C001" id="bigImg">
					<ul class="imgList">
						<li class="on"><a href="#a"><img src ="/milkyWayForest/image/C001.jpg" alt="C001"></a></li>
						<li><a href="#a"><img src ="/milkyWayForest/image/C002.jpg" alt="C001"></a></li>
						<li><a href="#a"><img src ="/milkyWayForest/image/C003.jpg" alt="C001"></a></li>
					</ul>
			</div>
			
	</div>
		
	</section>
</form>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/milkyWayForest/js/menuInfo.js"></script>

</body>
</html>