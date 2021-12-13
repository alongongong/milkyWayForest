<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/milkyWayForest/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="/milkyWayForest/css/login.css">

<form name="findIdForm" id="findIdForm">
<div id="main-container">
	<div id="main-wrap">
		<section>
			<div id="findId-select-wrap">
				<h3>아이디 찾기</h3>
				<p>아이디 찾을 방법을 선택하세요</p>
				<ul class="nav">
					<li class="nav-item selectBtn"><button type="button" id="select-question-button"><span>질문으로 찾기</span></button></li>
					<li class="nav-item"><button type="button" id="select-email-button"><span>이메일로 찾기</span></button></li>
				</ul>
			</div>
			
			<!-- 질문으로 찾기 버튼 클릭하면 보이게 -->
			<div id="findId-question-wrap">
				<select class="form-select form-select-lg">
					<option style="text-align: center;">------- 질문을 선택하세요 ------- </option>
					<option value="추억의 장소">기억에 남는 추억의 장소는?</option>
					<option value="좌우명">자신의 인생 좌우명은?</option>
					<option value="보물">자신의 보물 1호는?</option>
					<option value="선생님">가장 기억에 남는 선생님 성함은?</option>
					<option value="선물">받았던 선물 중 기억에 남는 독특한 선물은?</option>
					<option value="친구">유년시절 가장 생각나는 친구 이름은?</option>
					<option value="책">인상 깊게 읽은 책 이름은?</option>
					<option value="캐릭터">내가 좋아하는 캐릭터는?</option>
				</select>
				
				<div id="findId-question-input-wrap">	
					<input type="text" id="findId-question-input" name="findId-question-input" placeholder="질문에 대한 답을 입력하세요"></input>
				</div>
				
				<div id="findId-button-wrap">
					<button type="button" id="findId-button1" class="btn">아이디 찾기</button>
				</div>
				<div id="result1-div"></div>
			</div>
			
			<!-- 이메일로 찾기 버튼 클릭하면 보이게 -->
			<div id="findId-email-wrap">
				<p>이메일을 입력하세요</p>
				<div id="findId-email-input-wrap">
					<input type="email" id="findId-email-input1" name="email1"> @
					<input type="email" id="findId-email-input2" name="email2">
				</div>
				
				<div id="check-email-button-wrap">
					<button type="button" id="check-email-button" class="btn">인증번호 받기</button>
				</div>
				<div id="checkEmailInput" class="checkEmailInputHide">
					<p>인증번호를 입력하세요</p>
					<div id="check-email-input-wrap">
						<input type="text" id="check-email-input" name="check-email-input">
					</div>
	
					<div id="check-number-button-wrap">
						<button type="button" id="check-number-button" class="btn">인증번호 확인</button>
					</div>
				</div>
				<div id="result2-div"></div>
			</div>
		</section>
	</div>
</div>
</form>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/milkyWayForest/js/login.js"></script>