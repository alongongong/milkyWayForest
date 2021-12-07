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
	<input type ="hidden" name="productCode" id="productCode" value ="${productCode}">
	
	<section id="content_box">
		<h1>상품</h1>
		
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
					<td id="productKorName" colspan="2">
					<span id="korsubjectSpan"></span>
					</td>
				</tr>
				
				<tr>
					<td id="productEngName" colspan="2">
					<span id="engsubjectSpan"></span>
					</td>
				</tr>
				
				
				<tr>
					<td colspan="2">
					<span id="productSmallinfoSpan"></span>
					</td>
				</tr>
				
				<tr>
					<td>가격</td>
					<td class="price">
					<b><span id="productpriceSpan"></span></b>원
					</td>
				</tr>
				
				<tr>
					<td>옵션</td>
					<td>
						
						<select class="shoppingSelect"  name="cartOption">
							<option>&nbsp; ------------ 옵션 ------------ &nbsp; </option>
							<!--  <option><span id="productOptionSpan2"></span></option>
							<option><span id="productOptionSpan2"></span></option> -->
						</select>
						
					</td>
				</tr>
			
				<tr>
					<td>구매수량</td>
					<td>
						<div class="length">
							<input type="text" name="cartQty" value="1" readonly>  
							<a href="#a" id="plus">증가</a>
							<a href="#a" id="minus">감소</a>
						</div>
					</td>
					
				</tr>
				
				<tr>
					<td>배송비</td>
					<td>2500원  (50,000원 구매시 무료)</td>
				</tr>
				
				<tr>
					<td>총가격</td>
					<td class="total">
					<b></b>원
					<!-- <b><span id="productTotalSpan"></span></b>원 -->
					</td>
				</tr>
			</table>
		
				
			<div class="shoppingDetailImg">
				<img alt="B001" id="bigImg">
					<ul class="imgList">
						<li class="on">
							<div class="imgListBorder">
							<a href="#a">
							<img id="img1" alt="B001">
							</a>
							</div>
						</li>
						<!-- 에이작스에서 li 추가해주기 사진이 있을때만 추가하는걸로 바꿔줌! -->
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

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/milkyWayForest/js/shopping.js"></script>
<script type="text/javascript"> //온로드할때 바로 이 부분이 실행되어야 해서 디테일jsp로 옮겨줌
$(function(){
	$.ajax({
		url: '/milkyWayForest/shopping/getShoppingDetail',  
		type: 'post',
		data: 'productCode=${productCode}', // 이걸 추가해주고 컨트롤러에 productCode를 리퀘스트파람으로 가져간다. 
		dataType: 'json',  
		success : function(data) {
		
			console.log(JSON.stringify(data));
				
		$.each(data, function(index,items) {		
			$('#korsubjectSpan').text(items.productName);
			$('#engsubjectSpan').text(items.productEngName);
			$('#productSmallinfoSpan').text(items.productSmallInfo);
			$('#productpriceSpan').text(items.productUnit.toLocaleString())+" 원";
			/* $('#productOptionSpan2').text(items.productOption);
			$('#productOptionSpan2').text(items.productOption); */
			/* $('#productTotalSpan').text((items.productUnit)*parseInt($('.length input').val())); */
				
			
			//사진 나타나게 하기(인덱스별로 조정)
			if(index==0) {  // 여기 인덱스는 위에 each 문의 인덱스. 우리가 데이터를 가져올때 이미지는 여러개(프로덕트코드만 같고 이미지명은 뒤에 _1 이런식으로 다른 이미지들)가져오니깐 그 이미지네임에 조건을 붙여서 써주기위해 인덱스라는 순번을 붙여준것
				$('#bigImg').attr('src', '/milkyWayForest/productImage/'+items.productImageName);
				$('#img1').attr('src', '/milkyWayForest/productImage/'+items.productImageName);
			}
			
			else if(index==1) {  // 사진이 여러장일때만 li태그가 붙는다. 여러장이 아닐때는 else if 부분을 주석해야만 개발자도구에서 li태그가 붙는걸 확인할수 있다.
				// 어펜드라는 속성은 항상 맨끝에 붙여주는 역할을 하기때문에 아래와 같이 ul태그 에 어펜드 li속성을 붙이면 
				//자동으로 우리가 폼태그 안에 첫번째 li태그 밑에 두번째 li 태그로 생성되게 된다.
				//어펜드로 하는 이유는 우리가 productImageName 이 올 때만 이미지를 붙여줄꺼라서(동적변환이 일어나게 하려고) 어펜드를 붙여준것.
				//상품사진이 만약 1개만 있다면 이부분에는 사진이 안 붙을것.
				
				$('.imgList').append($('<li>').append($('<img>', { 
					src: '/milkyWayForest/productImage/'+items.productImageName,
					id: 'img2'
				})));
			
			}
			
			 else if(index==2) {
				$('.imgList').append($('<li>').append($('<img>' , { 
					src: '/milkyWayForest/productImage/'+items.productImageName,
					id: 'img3'
				})));
				
			}
			
			 else if(index==3) {
				$('.imgList').append($('<li>').append($('<img>' , { 
					src: '/milkyWayForest/productImage/'+items.productImageName,
					id: 'img4'
				})));
					
			}
			
			 else if(index==4) {
				$('.imgList').append($('<li>').append($('<img>' , { 
					src: '/milkyWayForest/productImage/'+items.productImageName,
					id: 'img5'
				})));
					
			}
			
			 else if(index==5) {
				$('.imgList').append($('<li>').append($('<img>' , { 
					src: '/milkyWayForest/productImage/'+items.productImageName,
					id: 'img6'
				})));
					
			}
			
			 else if(index==6) {
				$('.imgList').append($('<li>').append($('<img>' , { 
					src: '/milkyWayForest/productImage/'+items.productImageName,
					id: 'img7'
				})));
					
			}
			
			//인덱스가 0번일때의 옵션과 총가격
			if(index==0) {
			$('.shoppingSelect').append($('<option>' ,{text: items.productOption, value:items.productOption })); //벨류가 실제로 넘겨주는값 텍스트는 눈에 보이는거
			$('.total b').append($('<span>', {
				id:'totalSpan',  
				text:((items.productUnit)*parseInt($('.length input').val())).toLocaleString()
			})); //이걸 안 넣으면 1개일때의 가격이 안나옴
		    	
			}


			//구매수량 늘어날때      수량 상품코드 장바구니 에 가져간다.(결제금액은 가져갈 필요 없다.) 장바구니 버튼을 눌렀을떄 에이작스를 실행해서 로케이션뒤에 장바구니코드를 붙여준다.
			$('#plus').click(function(){
				
				if(index==0){  // 인덱스가 0번일때만 아래 항목들이 수행되게 해라
					$('.length input').val(parseInt($('.length input').val())+1); // 이걸 인덱스 0번일때에 넣지 않고 바깥으로 빼면 사진의 갯수만큼 구매수량이 늘어나버림 
					$('.total b span').remove();  // 스팬태그를 지우고 다시 시작해줘라(클릭할때마다!)
					$('.total b').append($('<span>', {text:((items.productUnit)*parseInt($('.length input').val())).toLocaleString() //인덱스가 0번일때만 계산해줘라
					})); 
				} 
			});//#plus
			
			//구매수량 줄어들때
			$('#minus').click(function(){
				
				if(index==0) {
					$('.length input').val(parseInt($('.length input').val())-1);
						if($('.length input').val() < 1) {
							$('.length input').val(1);
						}
					$('.total b span').remove();
					$('.total b').append($('<span>', {text:((items.productUnit)*parseInt($('.length input').val())).toLocaleString()
					}));
					
				}		
			});//#minus
			

		});//each
		
		$('.shoppingDetailImg li:eq(0)').on("click", $('.shoppingDetailImg li:eq(0)'), function(){
			//alert('0');
			$('#bigImg').prop("src", $('.shoppingDetailImg li:eq(0) img').prop("src"));
			$('.shoppingDetailImg li:eq(0) img').css('border', '1px solid  #154520');
			$('.shoppingDetailImg li:eq(1) img').css('border', '1px solid silver');
			$('.shoppingDetailImg li:eq(2) img').css('border', '1px solid silver');
		});
		$('.shoppingDetailImg li:eq(1)').on("click", $('.shoppingDetailImg li:eq(1)'), function(){
			//alert('1');
			$('#bigImg').prop("src", $('.shoppingDetailImg li:eq(1) img').prop("src"));
			$('.shoppingDetailImg li:eq(1) img').css('border', '1px solid  #154520');
			$('.shoppingDetailImg li:eq(0) img').css('border', '1px solid silver');
			$('.shoppingDetailImg li:eq(2) img').css('border', '1px solid silver');
		});
		$('.shoppingDetailImg li:eq(2)').on("click", $('.shoppingDetailImg li:eq(2)'), function(){
			//alert('2');
			$('#bigImg').prop("src", $('.shoppingDetailImg li:eq(2) img').prop("src"));
			$('.shoppingDetailImg li:eq(2) img').css('border', '1px solid  #154520');
			$('.shoppingDetailImg li:eq(0) img').css('border', '1px solid silver');
			$('.shoppingDetailImg li:eq(1) img').css('border', '1px solid silver');
		});
		$('.shoppingDetailImg li:eq(3)').on("click", $('.shoppingDetailImg li:eq(3)'), function(){
			//alert('2');
			$('#bigImg').prop("src", $('.shoppingDetailImg li:eq(3) img').prop("src"));
			$('.shoppingDetailImg li:eq(3) img').css('border', '1px solid  #154520');
			$('.shoppingDetailImg li:eq(0) img').css('border', '1px solid silver');
			$('.shoppingDetailImg li:eq(1) img').css('border', '1px solid silver');
			$('.shoppingDetailImg li:eq(2) img').css('border', '1px solid silver');
		});
		$('.shoppingDetailImg li:eq(4)').on("click", $('.shoppingDetailImg li:eq(4)'), function(){
			//alert('2');
			$('#bigImg').prop("src", $('.shoppingDetailImg li:eq(4) img').prop("src"));
			$('.shoppingDetailImg li:eq(4) img').css('border', '1px solid  #154520');
			$('.shoppingDetailImg li:eq(0) img').css('border', '1px solid silver');
			$('.shoppingDetailImg li:eq(1) img').css('border', '1px solid silver');
			$('.shoppingDetailImg li:eq(2) img').css('border', '1px solid silver');
			$('.shoppingDetailImg li:eq(3) img').css('border', '1px solid silver');
		});
		$('.shoppingDetailImg li:eq(5)').on("click", $('.shoppingDetailImg li:eq(5)'), function(){
			//alert('2');
			$('#bigImg').prop("src", $('.shoppingDetailImg li:eq(5) img').prop("src"));
			$('.shoppingDetailImg li:eq(5) img').css('border', '1px solid  #154520');
			$('.shoppingDetailImg li:eq(0) img').css('border', '1px solid silver');
			$('.shoppingDetailImg li:eq(1) img').css('border', '1px solid silver');
			$('.shoppingDetailImg li:eq(2) img').css('border', '1px solid silver');
			$('.shoppingDetailImg li:eq(3) img').css('border', '1px solid silver');
			$('.shoppingDetailImg li:eq(4) img').css('border', '1px solid silver');
		});

	

	
		},

		error: function(err) {
			console.log(err);
		}
	});	//getShoppingDetail 에이작스
	

	//장바구니 버튼 클릭시
	$('#cartBtn').click(function(){
		$.ajax({
			url: '/milkyWayForest/shopping/productSelect',  
			type: 'post',
			data: 'id=yun&productCode=${productCode}', //'id=${memId}',  
			 
			success : function(data) {  //알아서 자료형을 맞춰줌
				console.log(JSON.stringify(data));
				
					
					if(data !=0) {
					alert("이미 장바구니에 있는 상품입니다.");
				
					}
					else { 
					
						$.ajax({
						url: '/milkyWayForest/cart/cartInsert',
						type: 'post',
						data: $('#shoppingDetailForm').serialize(),
						
						success : function() {  //에이작스는 성공만하면 success 를 수행할수 있음 따라서 받아오는 데이터 타입이 없어도 됨. 바로 카트.jsp 로 넘겨준다.  
							alert("장바구니 성공");
							location.href= "/milkyWayForest/cart";
						},
	
						error: function(err) {
							console.log(err);
						
							}
						});
					
				 
				}
				

			},
			error: function(err) {
				console.log(err);
			} 


		});

		
	});//
	
	
	
	
}); //큰 function



</script>

</body>
</html>