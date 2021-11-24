$('#memberWriteForm #memberWriteBtn').click(function(){
	
	$('#idDiv').empty();
	$('#pwdDiv').empty();
	$('#pwdReDiv').empty();
	$('#nameDiv').empty();
	$('#nickNameDiv').empty();
	$('#emailDiv').empty();
	$('#athDiv').empty();
	
	if($('#memberWriteForm #memberWriteId').val() == ''){
		$('#emailDiv').html('아이디 입력');
		$('#memberWriteId').focus();
	}else if($('#memberWriteForm #memberWritePwd').val() == ''){
		$('#emailDiv').html('비밀번호 입력');
		$('#memberWritePwd').focus();
	}else if($('#memberWriteForm #memberWritePwd').val() != $('#memberWriteRePwd').val()){
		$('#emailDiv').html('비밀번호 틀림');
		$('#memberWritePwd').focus();
	}else if($('#memberWriteForm #memberWriteName').val() == ''){
		$('#emailDiv').html('이름 입력');
		$('#memberWriteName').focus();
	}else if($('#memberWriteForm #memberWriteNick').val() == ''){
		$('#emailDiv').html('닉네임 입력');
		$('#memberWriteNick').focus();
	}else if($('#memberWriteForm #memberWriteEmail').val() == ''){
		$('#emailDiv').html('이메일 입력');
	}else if($('#memberWriteForm #memberWriteEmail1').val() == ''){
		$('#emailDiv').html('도메인 입력');
	}else if($('#memberWriteForm #athntNmbr').val() == ''){
		$('#emailDiv').html('이메일 인증 해주세요');
	}
	else{
		$.ajax({
			url: '/milkyWayForest/write/write',
			type:'post',
			data: $('memberWriteForm').serialize(),
			success: function(){
				alert('회원 가입 등록');
				location.href='/milkyWayForest/index.';
			},
			error:function(err){
				console.log(err);
			}
		});
	}
});

$('#memberWriteForm #athntEmail').click(function(){
	
	var emailForm = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
	var email1 = $('#memberWriteForm #memberWriteEmail').val();
	var email2 = $('#memberWriteForm #memberWriteEmail1').val();
	var email = email1+"@"+email2;
	
	if(email == ''){
		$('#memberWriteForm #emailDiv').html('이메일을 입력해주세요');
		$('#memberWriteForm #memberWriteEmail').focus();
	}else if(!emailForm.test(email)){
		$('#memberWriteForm #emailDiv').html('잘못된 이메일 형식입니다');
	}
});

$('#writeAllAgreecheck').click(function(){
	if($('#writeAllAgreecheck').prop("checked")){
		$('.acptChck').prop("checked", true);
	}else{
		$('.acptChck').prop("checked", false);
	}
});





