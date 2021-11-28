<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" href="/milkyWayForest/css/mypage.css">

<form id="mypagePwdForm">
<div id="main-wrapper">
	<div id="mypagePwd-wrapper">
		<h2>비밀번호 확인</h2>
		<p>회원님의 개인정보를 안전하게 보호하기 위해<br>
			<strong>인증 후 변경이 가능</strong>합니다.
		</p>
		
		<div id="mypagePwd-setting-wrapper" class="border rounded">
			<span>은하숲 아이디 : ${memId }</span>
			<div id="mypagePwd-input-wrap">
				<input type="password" id="pwd" name="pwd" class="form-control bg-white border" placeholder="비밀번호">
			</div>

			<div align="center" id="button-wrap">
				<button type="button" id="next-button" class="btn btn-info">확인</button>
				<button type="reset" id="reset-button" class="btn btn-info">취소</button>
			</div>
			<div id="result-div"></div>
		</div>
	</div>
	
</div><!-- main-wrapper -->
</form>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>