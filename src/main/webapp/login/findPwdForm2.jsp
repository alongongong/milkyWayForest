<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/milkyWayForest/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="/milkyWayForest/css/login.css">

<form name="findPwdForm2" id="findPwdForm2">
<div id="main-container">
	<div id="main-wrap">
		<section>
			<h2>비밀번호 찾기</h2>
			<div id="findPwd-input-wrap">
				<p>이메일을 입력하세요</p>
				<div id="findPwd-email-input-wrap">
					<input type="email" name="email">
				</div>
				
				<div id="result1-div"></div>
				<div id="check-email-button-wrap">
					<button type="button" id="check-email-button">인증번호 받기</button>
				</div>
				
				<p>인증번호를 입력하세요</p>
				<div id="check-number-input-wrap">
					<input type="text" name="check-number-input">
				</div>
				
				<div id="result2-div"></div>
				<div id="check-number-button-wrap">
					<button type="button" id="check-number-button">인증번호 확인</button>
				</div>
			</div>
		</section>
	</div>
</div>
</form>