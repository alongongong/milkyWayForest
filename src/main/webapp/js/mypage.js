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

//////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////