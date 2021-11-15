$('#loginForm #login-button').click(function(){
	$('#loginForm #id-input-div').empty();
	$('#loginForm #pwd-input-div').empty();
	
	if($('#loginForm #id-input').val()=='') {
		$('#loginForm #id-input-div').html('아이디를 입력하세요');
		$('#loginForm #id-input').focus();	
			
	}else if($('#loginForm #pwd-input').val()=='') {
		$('#loginForm #pwd-input-div').html('비밀번호를 입력하세요');
		$('#loginForm #pwd-input').focus();	
	}
	else{
		$.ajax({});
	}

});

