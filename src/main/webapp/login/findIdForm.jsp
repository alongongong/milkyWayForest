<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet" href="/milkyWayForest/css/findIdForm.css">

<form name="findIdForm" id="findIdForm">
<div class="main-container">
	<div class="main-wrap">
		<header>
			<div class="logo-wrap">
				<img src="/milkyWayForest/img/milkyway.jpg" alt="logo">
			</div>
		</header>
		
		<section>
			<div class="findId-select-wrap">
				<h2>아이디 찾기</h2>
				<p>아이디 찾는 방법을 선택하세요</p>
				<ul>
					<li><button class="select-question-button"><span>질문으로 찾기</span></button></li>
					<li><button class="select-email-button"><span>이메일로 찾기</span></button></li>
				</ul>
			</div>
			
			<!-- 질문으로 찾기 버튼 클릭하면 보이게 -->
			<div class="findId-question-wrap">
				<select>
					<option>---질문을 선택하세요---</option>
					<option value="추억의 장소">기억에 남는 추억의 장소는?</option>
					<option value="좌우명">자신의 인생 좌우명은?</option>
					<option value="보물">자신의 보물 1호는?</option>
					<option value="선생님">가장 기억에 남는 선생님 성함은?</option>
					<option value="선물">받았던 선물 중 기억에 남는 독특한 선물은?</option>
					<option value="친구">유년시절 가장 생각나는 친구 이름은?</option>
					<option value="책">인상 깊게 읽은 책 이름은?</option>
					<option value="캐릭터">내가 좋아하는 캐릭터는?</option>
				</select>
				
				<p>질문에 대한 답을 입력하세요</p>
				<div class="findId-question-input-wrap">	
					<input type="text" name="findId-question-input"></input>
				</div>
			</div>
			
			<!-- 이메일로 찾기 버튼 클릭하면 보이게 -->
			<div class="findId-email-wrap">
				<p>이메일을 입력하세요</p>
				<div class="findId-email-input-wrap">
					<input type="email" name="email">
				</div>
				
				<div class="check-email-button-wrap">
					<button class="check-email-button">인증번호 받기</button>
				</div>
				
				<p>인증번호를 입력하세요</p>
				<div class="check-email-input-wrap">
					<input type="text" name="check-email-input">
				</div>
			</div>
			
			<!-- 공통으로 계속 뜨는 부분 -->
			<div class="findId-button-wrap">
				<button class="findId-button">아이디 찾기</button>
			</div>
		</section>
		
		<footer>
			<div class="copyright-wrap">
				<span>
					<img src="/milkyWayForest/img/milkyway.jpg" alt="logo"> Copyright © MilkyWayForest Corp. All Rights Reserved.
				</span>
			</div>
		</footer>	
	</div><!-- main-wrap -->
</div><!-- main-container -->
</form>