<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/milkyWayForest/css/login.css">

<form name="findIdResultForm" id="findIdResultForm">
<div id="main-container">
	<div id="main-wrap">
		<section id="findIdResult-wrap">
			<h2>아이디 찾기</h2>
			<p>고객님의 정보와 일치하는 아이디 목록입니다</p>
			<div id="id-wrap">
				<div id="id-result">${id }</div>
			</div>

			<div id="find-write">
				<p><a href="/milkyWayForest/login/loginForm">로그인</a></p> | 
				<p><a href="/milkyWayForest/login/findPwd">비밀번호 찾기</a></p> | 
				<p><a href="/milkyWayForest/write/memberWrite">회원가입</a></p>
			</div>
		</section>
	</div>
</div>
</form>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/milkyWayForest/js/login.js"></script>
