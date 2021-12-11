<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/milkyWayForest/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="/milkyWayForest/css/login.css">

<form name="findPwdForm1" id="findPwdForm1">
<div id="main-container">
	<div id="main-wrap">
		<section>
			<h2>비밀번호 찾기</h2>
			<div id="findPwd-input-wrap">
				<p>아이디를 입력하세요</p>
				<div id="findPwd-id-input-wrap">
					<input type="text" id="id" name="id" placeholder="은하숲 아이디">
				</div>

				<div id="check-id-button-wrap">
					<button type="button" id="check-id-button" class="btn">다음</button>
				</div>
				<div id="result-div"></div>
			</div>
		</section>
	</div>
</div>
</form>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/milkyWayForest/js/login.js"></script>