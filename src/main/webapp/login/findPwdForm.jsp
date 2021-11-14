<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/milkyWayForest/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="/milkyWayForest/css/findPwdForm.css">

<form name="findPwdForm" id="findPwdForm">
<div id="main-container">
	<div id="main-wrap">
		<section>
			<h2>비밀번호 찾기</h2>
			<div id="findPwd-input-wrap">
				<p>비밀번호를 찾고자 하는 아이디를 입력하세요</p>
				<div id="findPwd-id-input-wrap">
					<input type="text" name="id">
				</div>

				<p>이메일을 입력하세요</p>
				<div id="findPwd-email-input-wrap">
					<input type="email" name="email">
				</div>
				
				<div id="check-email-button-wrap">
					<button id="check-email-button">인증번호 받기</button>
				</div>
				
				<p>인증번호를 입력하세요</p>
				<div id="check-number-input-wrap">
					<input type="text" name="check-number-input">
				</div>
				
				<div id="check-number-button-wrap">
					<button id="check-number-button">인증번호 확인</button>
				</div>
			</div>
			
			<div id="findPwd-setting-wrap">
				<p>비밀번호를 재설정하세요</p>
				<div id="findPwd-pwd-input-wrap">
					<input type="text" name="pwd">
				</div>
				
				<p>다시 한번 입력하세요</p>
				<div id="findPwd-repwd-input-wrap">
					<input type="text" name="repwd">
				</div>

				<div id="findPwd-button-wrap">
					<button id="findPwd-button">비밀번호 재설정</button>
				</div>	
			</div>
		</section>
	</div>
</div>
</form>