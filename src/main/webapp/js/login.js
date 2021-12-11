$('#loginForm #login-button').click(function(){
	$('#loginForm #result-div').empty();
	
	if($('#loginForm #id-input').val()=='') {
		$('#loginForm #result-div').html('아이디를 입력하세요');
		$('#loginForm #id-input').focus();	
			
	}else if($('#loginForm #pwd-input').val()=='') {
		$('#loginForm #result-div').html('비밀번호를 입력하세요');
		$('#loginForm #pwd-input').focus();	
	}
	else{
		$.ajax({
			url: '/milkyWayForest/login/login',
			type: 'post',
			data: {'id':$('#loginForm #id-input').val(),
				   'pwd':$('#loginForm #pwd-input').val()},
			success: function(data){
				console.log(JSON.stringify(data));
				
				if(data == ''){
					$('#loginForm #result-div').html('아이디와 비밀번호를 정확히 입력하세요');
				}else{
					location.href='/milkyWayForest/index.jsp';
				}
			},
			error: function(err){
				console.log(err);
			}
		});
	}

});

//카카오 로그인 - 자바스크립트 방법 - https://tyrannocoding.tistory.com/61 참고
$('#loginForm #kakao-login-btn').click(function(){
	Kakao.init('3587b0269dadf42ae93f816477db8cd8'); //발급받은 키 중 javascript키를 사용
	console.log(Kakao.isInitialized()); // sdk초기화여부판단
	
	Kakao.Auth.login({
		success: function (response) {
      		//사용자 정보 가져오기
        	Kakao.API.request({
				url: '/v2/user/me', //계정 정보를 가져오는 request url
	          	success: function (data) {
	        		console.log(data)
	        			        		
	        		//카카오 로그인 선택 동의 사항
					var mm;
					var dd;
					var email1;
					var email2;
					var writePath = 'kakao';

					if(!(data.kakao_account.hasOwnProperty("birthday"))){
						mm = 0;
						dd = 0;
					
					}else{
						var birthday = data.kakao_account.birthday;
						mm = birthday.substr(0,2);
						dd = birthday.substr(2,2);
						
					}if(!(data.kakao_account.hasOwnProperty("email"))){
						email1 = 'false';
						email2 = 'false';
						
					}else{
						var email = (data.kakao_account.email).split("@");
						email1 = email[0];
						email2 = email[1];
					}

	        		//세션에 카카오 계정 정보 저장
	        		$.ajax({
			       			url: "/milkyWayForest/login/kakaoLogin",
							type: "post",
			       			data: {'id' : data.id,
			       				   'nickname' : data.properties.nickname,
			       				   'mm' : mm,
			       				   'dd' : dd,
			       				   'email1' : email1,
			       				   'email2' : email2,
			       				   'writePath' : writePath},
							success: function(){
								location.href='/milkyWayForest/index.jsp';
								
							},
							error: function(err){
								console.log(err);
							}
					});
						
				},
				fail: function (error) {
				  console.log(error)
				},
			})
		},
		fail: function (error) {
			console.log(error)
		},
	})
	
});

/*
//카카오로그아웃  
function kakaoLogout() {
    if (Kakao.Auth.getAccessToken()) {
      Kakao.API.request({
        url: '/v1/user/unlink',
        success: function (response) {
        	console.log(response)
        },
        fail: function (error) {
          console.log(error)
        },
      })
      Kakao.Auth.setAccessToken(undefined)
    }
  }
*/

//////////////////////////////////////////////////////////////////

//아이디 찾기
$('#findIdForm').ready(function(){
	$('#findIdForm #result1-div').empty();
	$('#findIdForm #result2-div').empty();
	$('#findIdForm #result3-div').empty();
	
	//질문으로 찾기
	$('#findIdForm #select-question-button').click(function(){
		$('#findIdForm #result1-div').empty();
		$('.form-select').val($('.form-select option:eq(0)').val());
		$('#findId-question-input').val('');
		$('#findIdForm #findId-question-wrap').show();
		$('#findIdForm #findId-email-wrap').hide();	
		$('.selectBtn').removeClass('selectBtn');
		$(this).parent().addClass('selectBtn');
	});
	
	$('#findIdForm #findId-button1').click(function(){
		$('#findIdForm #result1-div').empty();
		
		if($('#findIdForm select option:selected').index() < 1){
			$('#findIdForm option:eq(0)').prop('selected', true);
			$('#findIdForm #result1-div').html('질문을 선택하세요');
			
		}else if($('#findIdForm #findId-question-input').val()=='') {
			$('#findIdForm #result1-div').html('답을 입력하세요');
			$('#findIdForm #findId-question-input').focus();	
			
		}else{		
			$.ajax({
				url: '/milkyWayForest/login/findIdQna',
				type: 'post',
				data: {'idPwdQuestion' : $('#findIdForm select option:selected').val(), 
					   'idPwdAnswer' : $('#findIdForm #findId-question-input').val()},
				success: function(data){
					console.log(JSON.stringify(data));
					
					if(data == 'findIdQna_non_exist'){
						$('#findIdForm #result1-div').html('질문과 답을 다시 한번 확인하세요');
					
					}else{
						var id = data;
						location.href='/milkyWayForest/login/findIdResult?id='+id;
					}
				},
				error: function(err){
					console.log(err);
				}
			});
		}
		
		
	});

	//이메일로 찾기
	$('#findIdForm #select-email-button').click(function(){
		$('#findIdForm #findId-question-wrap').hide();
		$('#findIdForm #findId-email-wrap').show();	
		$('.selectBtn').removeClass('selectBtn');
		$(this).parent().addClass('selectBtn');
		$('#findId-email-input1').val('');
		$('#findId-email-input2').val('');
		$('#findIdForm #result2-div').empty();
		$('#checkEmailInput').addClass('checkEmailInputHide');
	});
	
	var code = '';
	var id='';
	
	//인증번호 받기 https://kimvampa.tistory.com/105?category=771727 참고
	$('#findIdForm #check-email-button').click(function(){
		$('#findIdForm #result2-div').empty();
		$('#findIdForm #check-email-input').val('');
		
		var emailForm = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i; //정규표현식
		var email1 = $('#findIdForm #findId-email-input1').val();
		var email2 = $('#findIdForm #findId-email-input2').val();
		var email = email1+"@"+email2;
		
		if(email1 =='') {
			$('#findIdForm #result2-div').html('이메일을 입력하세요');
			$('#findIdForm #findId-email-input1').focus();
	
		}else if(email2 =='') {
			$('#findIdForm #result2-div').html('이메일을 입력하세요');
			$('#findIdForm #findId-email-input2').focus();
	
		}else if(!emailForm.test(email)){
			$('#findIdForm #result2-div').html('잘못된 이메일 형식입니다');
			
		}else{
			//디비에 등록된 이메일인지 확인
			$.ajax({
				url: "/milkyWayForest/login/loginEmailCheck",
				type: "post",
       			data: {'email1' : email1, 'email2' : email2},
				success: function(data){
					//alert(data);
					
					if(data == 'loginEmailCheck_non_exist'){
						$('#findIdForm #result2-div').html('이메일 주소를 정확히 입력하세요');
					
					}else{
						id = data;
						//alert('디비 등록된 이메일? '+data);
						$('#findIdForm .checkEmailInputHide').removeClass('checkEmailInputHide');
						//이메일 발송
						$.ajax({
			       			url: "/milkyWayForest/login/loginEmailSend",
							type: "get",
			       			data: {'email' : email},
							success: function(data){
								$('#findIdForm #result2-div').html('인증번호가 발송되었습니다');
								$("#findIdForm #check-email-input").prop("disabled", false);
								$("#findIdForm #check-number-button").prop("disabled", false);
								code = data;
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
			});//ajax	
		}//else
		
		
	});
	
	//인증번호 확인
	$('#findIdForm #check-number-button').click(function(){
		$('#findIdForm #result2-div').empty();
		
		var inputCode = $('#findIdForm #check-email-input').val();
		
		if(inputCode == ''){
			$('#findIdForm #result2-div').html('인증번호를 입력하세요');
			
		}else if(inputCode != code){
			$('#findIdForm #result2-div').html('인증번호를 다시 확인해주세요');
			
		}else if(inputCode == code){
			//아이디 찾기 결과 창
			location.href='/milkyWayForest/login/findIdResult?id='+id;
		}
	});
	
	
	

});	

///////////////////////////////////////////////////////////////////

//비밀번호 찾기 1
$('#findPwdForm1 #check-id-button').click(function(){
	$('#findPwdForm1 #result-div').empty();
	
	if($('#findPwdForm1 #id').val()=='') {
		$('#findPwdForm1 #result-div').html('아이디를 입력하세요');
		$('#findPwdForm1 #id').focus();	
			
	}else{
		//디비에 등록된 아이디인지 확인
		$.ajax({
			url: "/milkyWayForest/login/loginIdCheck",
			type: "post",
   			data: {'id' : $('#findPwdForm1 #id').val()},
			success: function(data){
				//alert(data);
				
				if(data == 'loginIdCheck_non_exist'){
					$('#findPwdForm1 #result-div').html('입력하신 아이디를 찾을 수 없습니다');
				
				}else{
					var id = data;
					location.href='/milkyWayForest/login/findPwd2?id='+id;
				}
			},
			error: function(err){
				console.log(err);
			}
		});//ajax	
	}

});

//비밀번호 찾기 2
var code = '';

$('#findPwdForm2 #check-email-button').click(function(){
	$('#findPwdForm2 #result-div').empty();
	
	var emailForm = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i; //정규표현식
	var email1 = $('#findPwdForm2 #findPwd-email1-input').val();
	var email2 = $('#findPwdForm2 #findPwd-email2-input').val();
	var email = email1+"@"+email2;
	
	if(email =='') {
		$('#findPwdForm2 #result-div').html('이메일을 입력하세요');
		$('#findPwdForm2 #findPwd-email1-input').focus();

	}else if(!emailForm.test(email)){
		$('#findPwdForm2 #result-div').html('잘못된 이메일 형식입니다');
		
	}else{
		//디비에 등록된 이메일인지 확인
			$.ajax({
				url: "/milkyWayForest/login/loginEmailCheck",
				type: "post",
       			data: {'email1' : email1, 'email2' : email2},
				success: function(data){
					//alert(data);
					
					if(data == 'loginEmailCheck_non_exist'){
						$('#findPwdForm2 #result-div').html('이메일 주소를 정확히 입력하세요');
					
					}else{
						id = data;
						//alert('디비 등록된 이메일? '+data);
						
						$('#checkEmailNumber').removeClass('checkEmailNumberHide');
					
						//이메일 발송
						$.ajax({
				   			url: "/milkyWayForest/login/loginEmailSend",
							type: "get",
				   			data: {'email' : email},
							success: function(data){
								$('#findPwdForm2 #result-div').html('인증번호가 발송되었습니다');
								$("#findPwdForm2 #check-number-input").prop("disabled", false);
								$("#findPwdForm2 #check-number-button").prop("disabled", false);
								code = data;
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
			});//ajax
	}//else
	
});

//인증번호 확인
$('#findPwdForm2 #check-number-button').click(function(){
	$('#findPwdForm2 #result-div').empty();
	
	var id = $('#findPwdForm2 #id').val();
	
	var inputCode = $('#findPwdForm2 #check-number-input').val();
	
	if(inputCode == ''){
		$('#findPwdForm2 #result-div').html('인증번호를 입력하세요');
		
	}else if(inputCode != code){
		$('#findPwdForm2 #result-div').html('인증번호를 다시 확인해주세요');
		
	}else if(inputCode == code){
		//비밀번호 찾기 창 3
		location.href='/milkyWayForest/login/findPwd3?id='+id;
	}
});

//비밀번호 찾기 3
//비밀번호 재설정
$('#findPwdForm3 #findPwd-button').click(function(){
	$('#findPwdForm3 #result-div').empty();

	var pwdForm = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/; //정규표현식
	var pwd = $('#findPwdForm3 #pwd').val();
	
	if($('#findPwdForm3 #pwd').val()=='') {
		$('#findPwdForm3 #result-div').html('비밀번호를 입력하세요');
		$('#findPwdForm3 #pwd').focus();
		
	}else if(!pwdForm.test(pwd)){
		$('#findPwdForm3 #result-div').html('잘못된 비밀번호 형식입니다');
		
	}else if($('#findPwdForm3 #repwd').val()=='') {
		$('#findPwdForm3 #result-div').html('비밀번호를 한번 더 입력하세요');
		$('#findPwdForm3 #repwd').focus();
		
	}else if($('#findPwdForm3 #pwd').val() != $('#findPwdForm3 #repwd').val()) {
		$('#findPwdForm3 #result-div').html('비밀번호가 맞지 않습니다');
	
	}else {
		$.ajax({
			url: '/milkyWayForest/login/findPwdUpdate',
			type: 'post',
			data: {'id' : $('#findPwdForm3 #id').val(),
				   'pwd': $('#findPwdForm3 #pwd').val()},
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
