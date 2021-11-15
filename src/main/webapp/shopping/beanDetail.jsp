<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>원두 상세페이지</title>
<link rel="stylesheet" href="/milkyWayForest/css/beanDetail.css">
</head>
<body>
<form id="beanDetailForm" name="beanDetailForm">
<header>
	</header>
	
	<section id="content_box">
		<h1>원두</h1>
		
		<div id="beanDetailNav">
		<div>
			<a href=""><img src="/milkyWayForest/image/icon_home.png" alt="홈"></a> > 
			<a href="">Menu</a> > 
			<a href="">원두/차</a> > 
			<a href="">원두</a>
		</div>
		</div>
		
		
		<div class="productView">
			<!-- 테이블로 상품이름 및 용량 가격 옵션 등 넣기  -->
			<table>
			<tr>
				<td>제목</td>
			</tr>
			</table>
		
				
			<div class="beanDetailImg">
				<img src ="/milkyWayForest/image/C001.jpg" alt="C001">
					<ul>
					<li class="on"><a href="#a"><img src ="/milkyWayForest/image/C001.jpg" alt="C001"></a></li>
					</ul>
			</div>
			<div>
			<input type="button" id="cartBtn" value="장바구니"> 
			<input type="button" id="cartBtn" value="구매하기">
				<!-- <a href="#a">장바구니</a>
				<a href="#a">구매하기</a> -->
			</div>
		</div>
		
	</section>
</form>

</body>
</html>