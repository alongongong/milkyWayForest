<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" href="/milkyWayForest/css/mypage.css">

<form id="mypagePwdForm2">
<div id="main-wrapper">
	<div id="mypagePwd-wrapper">
		<h2>비밀번호 확인</h2>
		<p>회원님의 개인정보를 안전하게 보호하기 위해<br>
			<strong>인증 후 탈퇴가 가능</strong>합니다.
		</p>
		
		<div id="mypagePwd-setting-wrapper" class="border rounded">
			<span>은하숲 아이디 : ${memId }</span>
			<input type="hidden" id="id" value="${memId }">
			<div id="mypagePwd-input-wrap">
				<input type="password" id="pwd" name="pwd" class="form-control bg-white border" placeholder="비밀번호">
			</div>

			<div align="center" id="button-wrap">
				<button type="button" id="next-button" class="btn">확인</button>
				<button type="reset" id="reset-button" onclick="history.back()" class="btn">취소</button>
			</div>
			<div id="result-div"></div>
		</div>
	</div>
	
</div><!-- main-wrapper -->
</form>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/milkyWayForest/js/mypage.js"></script>