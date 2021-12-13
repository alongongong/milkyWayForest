<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- 윤화 작성 -->
<meta charset="UTF-8">

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" href="/milkyWayForest/css/body2.css">

<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.8.0/gsap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.8.0/ScrollTrigger.min.js"></script>

</head>

<body>

	<div id="parallax" >
		<h2>
			<!-- <div class="stagger-items"> -->
			 	Pick Your Favorite
			<!--  </div> -->
		 </h2>

			<p id="text1" style="text-align:right;  white-space:pre-line; word-break: break-all;">
				다양한 메뉴를 은하숲에서 즐겨보세요
			    은하숲만의 특별함을 경험할수 있는 최상의 음료
			    은하숲 커피와 완벽한 어울림을 자랑하는 푸드
				다양한 시도와 디자인으로 가치를 더하는 상품
				소중한 사람에게 은하숲 상품들로 마음을 전하세요
			</p>
		
	</div> <!-- #parallax -->
	
	<div class="show2">
		<h2> 화이팅 !! </h2>
	</div>

	<div id="show3" class="show3"  data-trigger>
		<h2 class="show3_fadeInUp"  style="white-space:pre-line; word-break: break-all;"> 
		완젼 잘 할 수 있지
		Pick Your Favorite 
		</h2>
		<p  class="show3_fadeInUp" id="text2" style="text-align:right;  white-space:pre-line; word-break: break-all;">
			다양한 메뉴를 은하숲에서 즐겨보세요
		    은하숲만의 특별함을 경험할수 있는 최상의 음료
		    은하숲 커피와 완벽한 어울림을 자랑하는 푸드
			다양한 시도와 디자인으로 가치를 더하는 상품
			소중한 사람에게 은하숲 상품들로 마음을 전하세요
		</p>
		<h1>
			  <span>w</span>
			  <span>o</span>
			  <span>o</span>
			  <span>h</span>
			  <span>o</span>
			  <span>o</span>
			  <span>o</span>
			  <span>!</span>
		
		</h1>
		
	</div>
	
	<div class="show4">
		<h2> 성공하쟈 </h2>
	</div>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>


  
<script type="text/javascript">
const parallax = document.getElementById("parallax");

window.addEventListener("scroll", function(){
	let offset= window.pageYOffset;
	/* console.log('Offset:' + offset);
	console.log('Offset*0.7:' + offset*0.7); */
	parallax.style.backgroundPositionY =offset
	* 1 + "px";  /* 시간이 0.7또는 1 에 픽셀을 추가 한다. 그리고 이것이 시차에 대한 코드 
					여기서 아래로 스크롤 하면 여기에 parallax효과
					1을  기재하면 이제 이미지 그대로 유지되어 고정된 것과 같이 보인다. */
	
}); 

const trigger = new ScrollTrigger.default();
trigger.add('[data-trigger]');



/* var scroll = widndow.requestAnimationFrame || 
			function(callback) {window.setTimeout(callback, 1000/60)};
	
}
var elementsToShow =document.querySelectorAll('.show3');
function loop() {
		elementsToShow.forEach(function(element){
			if(isElementInViewport(element)) {
				element.classList.add('is-visible');
			}
			element.classList.remove('is-visible');
		});
		scroll(loop);
	}
loop(); */


const show3 = document.getElementById("show3");

/* window.addEventListener("scroll", function(){
	   var currentScrollValue = document.documentElement.scrollTop; //스크롤 위치 구하기
	   var proDes1 =document.getElementById("show3");
	   var proDes2 =document.getElementById("show3");
	   console.log('currentScrollValue is ' + currentScrollValue); //스크롤 위치 콘솔에 출력
	    
	    //위치에따른 이벤트 주기
	   if(currentScrollValue<800){ // 915
	    	proDes1.classList.add('show3_fadeInUp'); 
	    	proDes2.classList.remove('show3_fadeInUp');
	    	
	    	
	    }else if(currentScrollValue>=800&&currentScrollValue<2300){  //2300
	    	proDes2.classList.add('show3_fadeInUp');
	    	proDes1.classList.remove('show3_fadeInUp');
	    }else{
	    	proDes2.classList.remove('show3_fadeInUp');
	    } 
	
}); 
 */


/* let oldValue = 0;
window.addEventListener("scroll", function(){
	 const newValue = window.scrollY || window.pageYOffset || document.documentElement.scrollTop || document.body.scrollTop;
	    
	    // 음수 : 스크롤 다운
	    if(oldValue - newValue < 0) {
	        nav.classList.add('active');
	    }

	    // 양수 : 스크롤 업
	    if(oldValue - newValue > 0) {
	        nav.classList.remove('active');
	    }
	    
	    oldValue = newValue;
	    
	    console.log(oldValue, newValue);
	
}); */



/* const show3 = document.getElementById("show3");

window.addEventListener("scroll", function(){
	let {scrollTop} = event.target.scrollingElement; 
	   show3.style.add('animation'); 
	   if(scrollTop <= 50) show3.style.remove('animation');
});

window.addEventListener('scroll', function() {
    const top = window.scrollY || window.pageYOffset;
    (top >= 50 )
        ?  show3.style.add('animation'); 
        : show3.style.remove('animation');
})
 */
</script>


</body>