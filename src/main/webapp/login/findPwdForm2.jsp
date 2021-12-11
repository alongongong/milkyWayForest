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
				
				<input type="hidden" id="id" value="${id}">
				
				<div id="findPwd-email-input-wrap">
					<input type="email" id="findPwd-email1-input" name="email1">
					<span>@</span>
					<input type="email" id="findPwd-email2-input" name="email2">
				</div>
				
				<div id="check-email-button-wrap">
					<button type="button" id="check-email-button" class="btn">인증번호 받기</button>
				</div>
				
				<div id="checkEmailNumber" class="checkEmailNumberHide">
					<div id="check-number-input-wrap">
						<input type="text" id="check-number-input" name="check-number-input" placeholder="인증번호를 입력하세요">
					</div>
	
					<div id="check-number-button-wrap">
						<button type="button" id="check-number-button" class="btn">인증번호 확인</button>
					</div>
				</div>
				<div id="result-div"></div>
			</div>
		</section>
	</div>
</div>
</form>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/milkyWayForest/js/login.js"></script>