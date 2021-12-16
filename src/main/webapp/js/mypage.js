//비밀번호 확인 창
$('#mypagePwdForm #next-button').click(function(){
	$('#mypagePwdForm #result-div').empty();
	
	if($('#mypagePwdForm #pwd').val()=='') {
		$('#mypagePwdForm #result-div').html('비밀번호를 입력하세요');
		$('#mypagePwdForm #pwd').focus();	
	}
	else{
		$.ajax({
			url: '/milkyWayForest/mypage/mypagePwdCheck',
			type: 'post',
			data: {'id': $('#mypagePwdForm #id').val(),
				   'pwd': $('#mypagePwdForm #pwd').val()},
			success: function(data){
				console.log(JSON.stringify(data));
				
				if(data == ''){
					$('#mypagePwdForm #result-div').html('비밀번호를 정확히 입력하세요');
				}else{
					location.href='/milkyWayForest/mypage/mypageMyInfo';
				}
			},
			error: function(err){
				console.log(err);
			}
		});
	}

});

//////////////////////////////////////////////////////////////////////////
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
				$('#mypageMyInfo #emailNum').val('');
				$('#mypageMyInfo #result-div').html('인증번호가 발송되었습니다');
				$("#mypageMyInfo #emailNum").prop("disabled", false);
				$("#mypageMyInfo #email-number-button").prop("disabled", false);
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
		$('#mypageMyInfo #result-div').html('인증번호가 확인되었습니다');
		$('#reEmail1').val($('#mypageMyInfo #email1').val());
		$('#reEmail2').val($('#mypageMyInfo #email2').val());
		$("#mypageMyInfo #emailNum").prop("disabled", true);
		$("#mypageMyInfo #email-number-button").prop("disabled", true);
	}
});

//회원정보수정
$('#mypageMyInfo #Update-button').click(function(){
	$('#mypageMyInfo #result-div').empty();
	
	//정규표현식
	var pwdForm = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/; 
	var nicknameForm = /^[\w\Wㄱ-ㅎㅏ-ㅣ가-힣]{2,20}$/;
	var telForm = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
	var emailForm = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
	
	var pwd = $('#mypageMyInfo #pwd').val();
	var repwd = $('#mypageMyInfo #repwd').val();
	var nickname = $('#mypageMyInfo #nickname').val();
	var tel1 = $('#mypageMyInfo #tel1').val();
	var tel2 = $('#mypageMyInfo #tel2').val();
	var tel3 = $('#mypageMyInfo #tel3').val();
	var tel = tel1 + "-" +  tel2 + "-" + tel3;
	var email1 = $('#mypageMyInfo #email1').val();
	var email2 = $('#mypageMyInfo #email2').val();
	var email = email1+"@"+email2;
	var reEmail1 = $('#mypageMyInfo #reEmail1').val();
	var reEmail2 = $('#mypageMyInfo #reEmail2').val();
	
	if(pwd == '') {
		$('#mypageMyInfo #result-div').html('비밀번호를 입력하세요');
		$('#mypageMyInfo #pwd').focus();
		
	}else if(!pwdForm.test(pwd)){
		$('#mypageMyInfo #result-div').html('잘못된 비밀번호 형식입니다');
		
	}else if(repwd == '') {
		$('#mypageMyInfo #result-div').html('비밀번호를 한번 더 입력하세요');
		$('#mypageMyInfo #repwd').focus();
		
	}else if(pwd != repwd) {
		$('#mypageMyInfo #result-div').html('비밀번호가 맞지 않습니다');
	
	}else if(nickname == '') {
		$('#mypageMyInfo #result-div').html('닉네임을 입력하세요');
		$('#mypageMyInfo #nickname').focus();
		
	}else if(!nicknameForm.test(nickname)){
		$('#mypageMyInfo #result-div').html('잘못된 닉네임 형식입니다');

	}else if(tel1 == '') {
		$('#mypageMyInfo #result-div').html('휴대폰 번호를 입력하세요');
		$('#mypageMyInfo #tel1').focus();
		
	}else if(tel2 == '') {
		$('#mypageMyInfo #result-div').html('휴대폰 번호를 입력하세요');
		$('#mypageMyInfo #tel2').focus();
		
	}else if(tel3 == '') {
		$('#mypageMyInfo #result-div').html('휴대폰 번호를 입력하세요');
		$('#mypageMyInfo #tel3').focus();
		
	}else if(!telForm.test(tel)){
		$('#mypageMyInfo #result-div').html('잘못된 휴대폰 번호 형식입니다');
		
	}else if(email1 =='') {
		$('#mypageMyInfo #result-div').html('이메일을 입력하세요');
		$('#mypageMyInfo #email1').focus();

	}else if(email2 =='') {
		$('#mypageMyInfo #result-div').html('이메일을 입력하세요');
		$('#mypageMyInfo #email2').focus();

	}else if(!emailForm.test(email)){
		$('#mypageMyInfo #result-div').html('잘못된 이메일 형식입니다');
		
	}else if($('#mypageMyInfo #emailNum').val() == ''){
		$('#mypageMyInfo #result-div').html('이메일을 인증하세요');
		
	}else if(email1==reEmail1 && email2==reEmail2){
		
		$.ajax({
			url: '/milkyWayForest/mypage/mypageMyInfoUpdate',
			type: 'post',
			data: $('#mypageMyInfo').serialize(),
			success: function(){
				alert('회원정보가 수정되었습니다');
				location.href='/milkyWayForest/mypage/mypageMain';
			},
			error: function(err){
				console.log(err);
			}
		});
	}
});
//////////////////////////////////////////////////////////////////////////
//비밀번호 확인 창, 회원탈퇴
$('#mypagePwdForm2 #next-button').click(function(){
	$('#mypagePwdForm2 #result-div').empty();
	
	if($('#mypagePwdForm2 #pwd').val()=='') {
		$('#mypagePwdForm2 #result-div').html('비밀번호를 입력하세요');
		$('#mypagePwdForm2 #pwd').focus();	
	}
	else{
		$.ajax({
			url: '/milkyWayForest/mypage/mypagePwdCheck',
			type: 'post',
			data: {'id': $('#mypagePwdForm2 #id').val(),
				   'pwd': $('#mypagePwdForm2 #pwd').val()},
			success: function(data){
				console.log(JSON.stringify(data));
				
				if(data == ''){
					$('#mypagePwdForm2 #result-div').html('비밀번호를 정확히 입력하세요');
				}else{
					$.ajax({
						url: '/milkyWayForest/mypage/mypageMyInfoDelete',
						type: 'post',
						data: {'id': $('#mypagePwdForm2 #id').val(),
							   'pwd': $('#mypagePwdForm2 #pwd').val()},
						success: function(data){
							console.log(JSON.stringify(data));
							alert('회원정보가 삭제되었습니다');
							location.href='/milkyWayForest/login/logout';
						},
						error: function(err){
							console.log(err);
						}
					});
				}
			},
			error: function(err){
				console.log(err);
			}
		});
	}
});
//////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////