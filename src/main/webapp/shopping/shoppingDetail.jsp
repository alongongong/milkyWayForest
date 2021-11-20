<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세페이지</title>
<link rel="stylesheet" href="/milkyWayForest/css/shopping.css">
</head>
<body>
<form id="shoppingDetailForm" name="shoppingDetailForm">

	
	<section id="content_box">
		<h1>원두</h1>
		
		<div id="shoppingDetailNav">
			<div>
				<a href=""><img src="/milkyWayForest/image/icon_home.png" alt="홈"></a> > 
				<a href="">Menu</a> > 
				<a href="">원두/차</a> > 
				<a href="">원두</a>
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
				
				<tr>
					<td>가격</td>
					<td class="price"><b>금액</b>원</td>
				</tr>
				
				
				
				<tr>
					<td>옵션</td>
					<td>
						
						<select class="shoppingSelect">
							<option>--옵션--</option>
							<option>1</option>
							<option>2</option>
						</select>
						
					</td>
				</tr>
			
				<tr>
					<td>옵션</td>
					<td>
						<select class="shoppingSelect">
							<option>--옵션--</option>
							<option>1</option>
							<option>2</option>
						</select>
					</td>
				</tr>
				
				<tr>
					<td>구매수량</td>
					<td>
						<div class="length">
							<input type="number" min="1" value="1">  <!--마이너스 안들어가게 min -->
							<a href="#a">증가</a>
							<a href="#a">감소</a>
						</div>
					</td>
					
				</tr>
				
				<tr>
					<td>배송비</td>
					<td>2500원(50,000원 구매시 무료)</td>
				</tr>
				
				<tr>
					<td>가격</td>
					<td class="total"><b>금액</b>원</td>
				</tr>
			</table>
		
				
			<div class="shoppingDetailImg">
				<img src ="/milkyWayForest/image/C001.jpg" alt="C001">
			
					<ul>
					
						<li class="on"><a href="#a"><img src ="/milkyWayForest/image/C001.jpg" alt="C001"></a></li>
						<li><a href="#a"><img src ="/milkyWayForest/image/C001.jpg" alt="C001"></a></li>
						<li><a href="#a"><img src ="/milkyWayForest/image/C001.jpg" alt="C001"></a></li>
					
					</ul>
			</div>
			
			<div class="btnDiv">
				<input type="button" id="wishListBtn" value="찜하기"> 
				<input type="button" id="cartBtn" value="장바구니"> 
				<input type="button" id="purchaseBtn" value="구매하기">
					<!-- <a href="#a">장바구니</a>
					<a href="#a">구매하기</a> -->
			</div>
			
	</div>
		
	</section>
</form>

</body>
</html>