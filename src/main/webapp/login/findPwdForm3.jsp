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
				<p>비밀번호를 재설정하세요</p>
				<div id="findPwd-pwd-input-wrap">
					<input type="text" name="pwd">
				</div>
				
				<p>다시 한번 입력하세요</p>
				<div id="findPwd-repwd-input-wrap">
					<input type="text" name="repwd">
				</div>

				<div id="result-div"></div>
				<div id="findPwd-button-wrap">
					<button type="button" id="findPwd-button">비밀번호 재설정</button>
				</div>	
			</div>
		</section>
	</div>
</div>
</form>