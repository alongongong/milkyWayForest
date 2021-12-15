<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<html>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" href="/milkyWayForest/css/thirdScroll.css">
<link rel="stylesheet" type="text/css" href="/milkyWayForest/css/jquery.fullPage.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="/milkyWayForest/css/body.css"><!-- pc버전 -->
<link rel="stylesheet" href="/milkyWayForest/css/body_tablet.css" media="all and (max-width:1252px)">
<link rel="stylesheet" href="/milkyWayForest/css/body_mobile.css" media="all and (max-width:767px)"> <!--960 이하 모바일-->	
<style type="text/css">
.section {  width:100%; height:100%; position:relative; color:#ffffff; font-size:24pt; }
.section .second_section_text { position:relative; top:26%; transform:translate(-47%, -50%); opacity:0;}  
.fp-completely .second_section_text, .fp-completely .text_container { animation:fade_in .5s  0s forwards;  }


@keyframes fade_in {
	0% { opacity:0; left:40%;}
	100% { opacity:1; left:50%;} 
}
</style>
<body>
<!-- 전체영역 -->
<div id="fullPage">

	<!-- FullPage -->
	<div id="fullpage">
		<section class="section" style="background-attachment: fixed;">
			<div class="sildeDiv">
				<ul>
					<li>
						<img src="/milkyWayForest/image/main1_Image.jpg" alt="mainpic1.jpg" id="image1">
					</li>
					<li>
						<img src="/milkyWayForest/image/mainImage3.jpg" alt="mainImage3.jpg" id="image2">
					</li>
					<li>
						<img src="/milkyWayForest/image/imageSlide.jpg" alt="imageSlide.jpg" id="image3">
					</li>
				</ul>
				<div id="dotDiv" style="text-align:center">
					<span class="dotSpan"></span> 
					<span class="dotSpan"></span> 
					<span class="dotSpan"></span> 
				</div>
			</div>
		
			<!-- <div class="slide">
				<img src="/milkyWayForest/image/main1_Image.jpg" alt="mainpic1.jpg" 
				style="width: 110vw; height: 100vh;  top: 0;">
			</div>
			<div class="slide">
				<img src="/milkyWayForest/image/mainImage3.jpg" alt="mainImage3.jpg" 
				style="width: 100vw; height: 100vh;  top: 0;">
			</div>
			<div class="slide">
				<img src="/milkyWayForest/image/imageSlide.jpg" alt="imageSlide.jpg" 
				style="width: 100%; height: 100%;  top: 0;">
			</div> -->
		</section>
		
		<section class="section">
			<div class="second_section_text">
				<h1>Pick Your Favorite</h1>
	
				<h2 style="white-space:pre-line;">
				다양한 메뉴를 은하숲에서 즐겨보세요<br>
	         	은하숲만의 특별함을 경험할수 있는 최상의 음료<br>
	          	은하숲 커피와 완벽한 어울림을 자랑하는 푸드<br>
	         	다양한 시도와 디자인으로 가치를 더하는 상품<br>
	         	소중한 사람에게 은하숲 상품들로 마음을 전하세요<br>
         		</h2>
			</div>
		</section>
		
		<section class="section">
			<div class="Allcontainer">
				<div class="text_container">
					<h1>은하숲을 가까이에서 경험해보세요</h1>
		
					<h3>고객님과 가장 가까이 있는 매장을 찾아보세요!</h3>
	         		
	         		<h4 style="white-space:pre-line;">
	         		차별화된 커피 경험을 누릴 수 있는 <strong>은하숲</strong><br>
		         	다양한 방법으로 편리하게 즐길 수 있는 <strong>은하숲</strong><br>
		          	함께해서 더 따뜻할 수 있는 지역사회 소통 공간 <strong>은하숲</strong><br>
	         		</h4>
				</div>
			         		
				<div class="container2">
				  <div class="row beans">
				  </div>
				  <div class="row grinder">
				  </div>
				  <div class="row grinder_bottom">
				  </div>
				  <div class="row v60">
				  </div>
				  <div class="row drip">
				  </div>
				  <div class="row cup">
				  </div>
				</div>
			</div>
		</section>
		
		<section class="section fp-auto-height">
			<jsp:include page="/main/footer.jsp"/>
		</section>
	</div>	
</div>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="/milkyWayForest/js/jquery.fullPage.js"></script>
<script src="/milkyWayForest/js/body.js"></script>
<script type="text/javascript">

</script>
</body>
</html>