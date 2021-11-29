<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" href="/milkyWayForest/css/mypage.css">

<form id="mypageMyInfo">
<div id="main-wrapper">
	<div id="main-sideNav" class="item">
		<jsp:include page="mypageSideNav.jsp"/>
	</div>

	<div id="main-topNav" class="item">
		<jsp:include page="mypageTopNav.jsp"/>	
	</div>
	<%----------------- 디폴트 설정 -----------------%>
	
	<div id="myBasicInfo-wrapper" class="item">
		<div id="myBasicInfo-title" class="navbar navbar-light alert-info">
			<span class="navbar-brand mb-0 h1">기본 정보</span>
		</div>
		
		<div id="myBasicInfo-state">		
			<table class="table table-bordered">
				<tbody>
					<tr>
						<td width="150px;">아이디</td>
						<td>
							<input type="text" id="id" name="id" value="${memId }" class="form-control bg-white border-0" disabled>
						</td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td>
							<input type="password" id="pwd" name="pwd" class="form-control bg-white border">
						</td>
					</tr>
					<tr>
						<td>비밀번호 확인</td>
						<td>
							<input type="password" id="repwd" name="repwd" class="form-control bg-white border">
						</td>
					</tr>
					<tr>
						<td>이름</td>
						<td>
							<input type="text" id="name" name="name"class="form-control bg-white border-0" disabled>
						</td>
					</tr>
					<tr>
						<td>닉네임</td>
						<td>
							<input type="text" id="nickname" name="nickname" class="form-control bg-white border">
						</td>
					</tr>
					<tr>
						<td>질문/답</td>
						<td>
							<div id="idPwdQuestion-wrapper" class="input-group mb-3">
								<select class="custom-select" id="idPwdQuestion" name="idPwdQuestion">
									<option selected>---질문을 선택하세요---</option>
								    <option value="추억의 장소">기억에 남는 추억의 장소는?</option>
								    <option value="좌우명">자신의 인생 좌우명은?</option>
								    <option value="보물">자신의 보물 1호는?</option>
								    <option value="선생님">가장 기억에 남는 선생님 성함은?</option>
								    <option value="선물">받았던 선물 중 기억에 남는 독특한 선물은?</option>
								    <option value="친구">유년시절 가장 생각나는 친구 이름은?</option>
								    <option value="책">인상 깊게 읽은 책 이름은?</option>
								    <option value="캐릭터">내가 좋아하는 캐릭터는?</option>
								</select>
								<div class="input-group-append">
									<input type="text" id="idPwdAnswer" name="idPwdAnswer" class="form-control" placeholder="답">
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<td>성별</td>
						<td>
							<div class="input-group-text bg-white border-0">
								<input type="text" id="gender" name="gender" class="form-control bg-white border-0" disabled>							
							</div>
						</td>
					</tr>
					<tr>
						<td>휴대폰 번호</td>
						<td>
							<div id="tel-input-wrapper" class="input-group mb-3">
								<input type="text" id="tel1" name="tel1" class="form-control bg-white border rounded">
								<div class="input-group-prepend">
									<span class="input-group-text bg-white border-0">-</span>
								</div>
								<input type="text" id="tel2" name="tel2" class="form-control bg-white border rounded">
								<div class="input-group-prepend">
									<span class="input-group-text bg-white border-0">-</span>
								</div>
								<input type="text" id="tel3" name="tel3" class="form-control bg-white border rounded">
							</div>
						</td>
					</tr>
					<tr>
						<td>생년월일</td>
						<td>
							<div id="birthday-input-wrapper" class="input-group mb-3">
								<input type="text" id="yy" name="yy" class="form-control bg-white border-0" disabled>
								<div class="input-group-prepend">
									<span class="input-group-text bg-white border-0">년</span>
								</div>
								<input type="text" id="mm" name="mm" class="form-control bg-white border-0" disabled>
								<div class="input-group-prepend">
									<span class="input-group-text bg-white border-0">월</span>
								</div>
								<input type="text" id="dd" name="dd" class="form-control bg-white border-0" disabled>
								<div class="input-group-prepend">
									<span class="input-group-text bg-white border-0">일</span>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<td>이메일 주소</td>
						<td>
							<div id="email-input-wrapper" class="input-group mb-3">
								<input type="text" id="email1" name="email1" class="form-control bg-white border rounded">
								<input type="hidden" id="reEmail1" name="reemail1" class="form-control bg-white border-0">
								
								<div class="input-group-prepend">
									<span class="input-group-text bg-white border-0">@</span>
								</div>
								<input type="text" id="email2" name="email2" class="form-control bg-white border rounded">
								
								<input type="hidden" id="reEmail2" name="reemail2" class="form-control bg-white border-0">
								<button type="button" id="email-send-button" class="btn btn-info">이메일인증</button>
							</div>
							
							<div id="email-number-wrapper" class="input-group">
								<input type="text" id="emailNum" name="emailNum" class="form-control bg-white border rounded" disabled>
								<button type="button" id="email-number-button" class="btn btn-info">인증번호확인</button>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
			
			<div align="center" id="button-wrap">
				<button type="button" id="Update-button" class="btn btn-info">회원정보수정</button>
				<button type="button" id="Delete-button" class="btn btn-info">회원탈퇴</button>
				<button type="reset" id="reset-button" class="btn btn-info">취소</button>
			</div>
			<div id="result-div"></div>
		</div>
	</div>
	
</div><!-- main-wrapper -->
</form>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
//회원정보 불러오기
$('#mypageMyInfo').ready(function(){
	$.ajax({
		url: '/milkyWayForest/mypage/getMypageMyInfo',
		type: 'post',
		data: {'id' : $('#mypageMyInfo #id').val()},
		success: function(data){
			console.log(JSON.stringify(data));
			
			if(data.name != null){
				$('#name').val(data.name);	
				
			}if(data.nickname != null){
				$('#nickname').val(data.nickname);	
				
			}if(data.idPwdQuestion != null && data.idPwdQuestion != 'false'){
				$('#idPwdQuestion').val(data.idPwdQuestion);
				$('#idPwdAnswer').val(data.idPwdAnswer);
				
			}if(data.gender != null){
				$('#gender').val(data.gender);	
				
			}if(data.tel1 != null){
				$('#tel1').val(data.tel1);
				$('#tel2').val(data.tel2);
				$('#tel3').val(data.tel3);
				
			}if(data.yy != null){
				$('#yy').val(data.yy);
				
			}if(data.mm != null && data.mm != 0){
				$('#mm').val(data.mm);
				$('#dd').val(data.dd);
				
			}if(data.email1 != null && data.email1 != 'false'){
				$('#email1').val(data.email1);
				$('#email2').val(data.email2);
				$('#reEmail1').val(data.email1);
				$('#reEmail2').val(data.email2);
			}
		},
		error: function(err){
			console.log(err);
		}
	});
});

//이메일 인증
var code = '';

$('#mypageMyInfo #email-send-button').click(function(){
	$('#mypageMyInfo #result-div').empty();
	
	var emailForm = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
	var email1 = $('#mypageMyInfo #email1').val();
	var email2 = $('#mypageMyInfo #email2').val();
	var email = email1+"@"+email2;
	
	if(email1 =='') {
		$('#mypageMyInfo #result-div').html('이메일을 입력하세요');
		$('#mypageMyInfo #email1').focus();

	}else if(email2 =='') {
		$('#mypageMyInfo #result-div').html('이메일을 입력하세요');
		$('#mypageMyInfo #email2').focus();

	}else if(!emailForm.test(email)){
		$('#mypageMyInfo #result-div').html('잘못된 이메일 형식입니다');
		
	}else{
		//이메일 발송
		$.ajax({
   			url: "/milkyWayForest/mypage/mypageEmailSend",
			type: "get",
   			data: {'email' : email},
			success: function(data){
				$('#mypageMyInfo #result-div').html('인증번호가 발송되었습니다');
				$("#mypageMyInfo #emailNum").prop("disabled", false);
				code = data;
			},
			error: function(err){
				console.log(err);
			}
		});
	}
});

//인증번호 확인
$('#mypageMyInfo #email-number-button').click(function(){
	$('#mypageMyInfo #result-div').empty();
	
	var inputCode = $('#mypageMyInfo #emailNum').val();
	
	if(inputCode == ''){
		$('#mypageMyInfo #result-div').html('인증번호를 입력하세요');
		
	}else if(inputCode != code){
		$('#mypageMyInfo #result-div').html('인증번호를 다시 확인해주세요');
		
	}else if(inputCode == code){
		//아이디 찾기 결과 창
		//location.href='/milkyWayForest/mypage/findIdResult?id='+id;
	}
});

//회원정보수정
$('#mypageMyInfo #Update-button').click(function(){
	$('#mypageMyInfo #result-div').empty();
	
	//정규표현식
	var pwdForm = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/; 
	var nicknameForm = /^[\w\Wㄱ-ㅎㅏ-ㅣ가-힣]{2,20}$/;
	var telForm = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
	
	var pwd = $('#mypageMyInfo #pwd').val();
	var nickname = $('#mypageMyInfo #nickname').val();
	var tel1 = $('#mypageMyInfo #tel1').val();
	var tel2 = $('#mypageMyInfo #tel2').val();
	var tel3 = $('#mypageMyInfo #tel3').val();
	var tel = tel1 + "-" +  tel2 + "-" + tel3;
	
	if($('#mypageMyInfo #pwd').val()=='') {
		$('#mypageMyInfo #result-div').html('비밀번호를 입력하세요');
		$('#mypageMyInfo #pwd').focus();
		
	}else if(!pwdForm.test(pwd)){
		$('#mypageMyInfo #result-div').html('잘못된 비밀번호 형식입니다');
		
	}else if($('#mypageMyInfo #repwd').val()=='') {
		$('#mypageMyInfo #result-div').html('비밀번호를 한번 더 입력하세요');
		$('#mypageMyInfo #repwd').focus();
		
	}else if($('#mypageMyInfo #pwd').val() != $('#mypageMyInfo #repwd').val()) {
		$('#mypageMyInfo #result-div').html('비밀번호가 맞지 않습니다');
	
	}else {
		$.ajax({
			url: '/milkyWayForest/login/findPwdUpdate',
			type: 'post',
			data: {'id' : $('#mypageMyInfo #id').val(),
				   'pwd': $('#mypageMyInfo #pwd').val()},
			success: function(){
				alert('비밀번호가 변경되었습니다');
				location.href='/milkyWayForest/login/loginForm';
			},
			error: function(err){
				console.log(err);
			}
		});
	}
});
</script>