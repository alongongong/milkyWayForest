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
</head>

<body>

	<div id="parallax">
		<h2> 할수있따!! </h2>
		<p>해보쟈해보쟈<p>
	</div>
	
	<div>
		<h2> 화이팅 !! </h2>
	</div>

	<div>
		<h2> 완젼 잘 할 수 있지 </h2>
	</div>
	
	<div>
		<h2> 성공하쟈 </h2>
	</div>

<script type="text/javascript">
const parallax = document.getElementById("parallax");

window.addEventListener("scroll", function(){
	let offset= window.pageYOffset;
	/* console.log('Offset:' + offset);
	console.log('Offset*0.7:' + offset*0.7); */
	parallax.style.backgroundPositionY =offset
	* 1 + "px";  /* 시간이 0.7또는 1 에 픽셀을 추가 한다. 그리고 이것이 시차에 대한 코드 
					여기서 아래로 스크롤 하면 여기에 parallax효과
					1을  기재하면 이제 이미지 그대로 유지되어 고정된 것과 같이 보인다.*/
	
});

</script>

<!-- <div id="container">
	<div id="wrapper">	
		<div id="backgroundImg" >	
			<header>
				<h1>할수이따!! </h1>
				<p> 화이팅!!</p>
			
			</header>
		</div>	
	</div>
</div> -->

</body>