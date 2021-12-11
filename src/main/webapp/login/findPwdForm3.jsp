<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/milkyWayForest/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="/milkyWayForest/css/login.css">

<form name="findPwdForm3" id="findPwdForm3">
<div id="main-container">
	<div id="main-wrap">
		<section>
			<h2>비밀번호 찾기</h2>
			<div id="findPwd-setting-wrap">
			
				<input type="hidden" id="id" value="${id}">
			
				<p>은하숲 아이디 : ${id }</p>
				<div id="findPwd-pwd-input-wrap">
					<input type="password" id="pwd" name="pwd" placeholder="새 비밀번호">
				</div>

				<div id="findPwd-repwd-input-wrap">
					<input type="password" id="repwd" name="repwd" placeholder="새 비밀번호 확인">
				</div>

				<div id="findPwd-button-wrap">
					<button type="button" id="findPwd-button" class="btn">비밀번호 재설정</button>
				</div>	
				<div id="result-div"></div>
			</div>
		</section>
	</div>
</div>
</form>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/milkyWayForest/js/login.js"></script>