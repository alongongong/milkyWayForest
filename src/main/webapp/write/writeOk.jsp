<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/milkyWayForest/bootstrap/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="/milkyWayForest/css/writeAgreeForm.css">
<form id="writeOkForm">
	<div id="writeOkBox">
		<div id="writeOkSubject">회원가입 완료!<br><br><br></div>
		<div id="writeOkContent">
			<p>회원가입이 완료 되었습니다</p>
			<p><span style="color:green;">${id }</span>님의 회원가입을 축하합니다.</p>
			<p>알차고 실속있는 서비스로 찾아뵙겠습니다.</p>
		</div>
		<div id="writeOkBtn">
			<input type="button" id="writeOkHomeBtn" class="btn" value="홈으로" onclick="location.href='/milkyWayForest/admin'">
			<input type="button" id="writeOkLoginBtn" class="btn" value="로그인" onclick="location.href='/milkyWayForest/login/loginForm'">
		</div>
	</div>
</form>