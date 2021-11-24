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
				<p>본인확인 이메일로 인증</p>
				
				<input type="hidden" id="id" value="${id}">
				
				<div id="findPwd-email-input-wrap">
					<input type="email" id="findPwd-email1-input" name="email1">
					<span>@</span>
					<input type="email" id="findPwd-email2-input" name="email2">
				</div>
				
				<div id="check-email-button-wrap">
					<button type="button" id="check-email-button">인증번호 받기</button>
				</div>
				
				<div id="check-number-input-wrap">
					<input type="text" id="check-number-input" name="check-number-input" disabled="disabled">
				</div>

				<div id="check-number-button-wrap">
					<button type="button" id="check-number-button">인증번호 확인</button>
				</div>
				<div id="result-div"></div>
			</div>
		</section>
	</div>
</div>
</form>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/milkyWayForest/js/login.js"></script>