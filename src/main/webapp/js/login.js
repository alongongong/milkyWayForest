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
			data: $('#loginForm').serialize(),
			dataType: 'text',
			success: function(data){
				data = data.trim();
				
				if(data == 'loginOk'){
					location.href='/milkyWayForest/index.jsp';
				}else if(data == 'loginFail'){
					$('#loginForm #result-div').html('아이디와 비밀번호를 정확히 입력하세요');
				}
			},
			error: function(err){
				console.log(err);
			}
		});
	}

});

//카카오 로그인
$('#loginForm #kakao-login-btn').click(function(){
	Kakao.init('3587b0269dadf42ae93f816477db8cd8'); //발급받은 키 중 javascript키를 사용해준다.
	console.log(Kakao.isInitialized()); // sdk초기화여부판단
	
    Kakao.Auth.login({
      success: function (response) {
        Kakao.API.request({
          url: '/v2/user/me',
          success: function (response) {
        	  console.log(response)
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

//네이버 로그인
/*$('#loginForm #naver-login-btn').click(function(){
	var naverLogin = new naver.LoginWithNaverId({
			clientId: "2biHKSrVEVG9904D9MZF", //내 애플리케이션 정보에 cliendId를 입력해줍니다.
			callbackUrl: "http://localhost:8080/naverLogin", // 내 애플리케이션 API설정의 Callback URL 을 입력해줍니다.
			isPopup: false,
			callbackHandle: true
		}
	);	


var naverLogin = new naver.LoginWithNaverId(
		{
			clientId: "80mdf88flkWWJT1f93Tz", //내 애플리케이션 정보에 cliendId를 입력해줍니다.
			callbackUrl: "http://localhost:8181/naverLogin", // 내 애플리케이션 API설정의 Callback URL 을 입력해줍니다.
			isPopup: false,
			callbackHandle: true
		}
	);	

	naverLogin.init();
	
	window.addEventListener('load', function () {
		naverLogin.getLoginStatus(function (status) {
			if (status) {
				var email = naverLogin.user.getEmail(); // 필수로 설정할것을 받아와 아래처럼 조건문을 줍니다.
	    		
				console.log(naverLogin.user); 
	    		
	            if( email == undefined || email == null) {
					alert("이메일은 필수정보입니다. 정보제공을 동의해주세요.");
					naverLogin.reprompt();
					return;
				}
			} else {
				console.log("callback 처리에 실패하였습니다.");
			}
		});
	});
	
	
	var testPopUp;
	function openPopUp() {
	    testPopUp= window.open("https://nid.naver.com/nidlogin.logout", "_blank", "toolbar=yes,scrollbars=yes,resizable=yes,width=1,height=1");
	}
	function closePopUp(){
	    testPopUp.close();
	}
	
	function naverLogout() {
		openPopUp();
		setTimeout(function() {
			closePopUp();
			}, 1000);
		
		
	}

});*/

/////////////////////////////////////////////////////////////////

//아이디 찾기
$('#findIdForm').ready(function(){
	$('#findIdForm #result1-div').empty();
	$('#findIdForm #result2-div').empty();
	$('#findIdForm #result3-div').empty();
	
	//질문으로 찾기
	$('#findIdForm #select-question-button').click(function(){
		$('#findIdForm #findId-question-wrap').show();
		$('#findIdForm #findId-email-wrap').hide();		
	});
	
	$('#findIdForm #findId-button1').click(function(){
		$('#findIdForm #result1-div').empty();
		
		if($('#findIdForm select option:selected').index() < 1){
			$('#findIdForm option:eq(0)').attr('selected', true);
			$('#findIdForm #result1-div').html('질문을 선택하세요');
			
		}else if($('#findIdForm #findId-question-input').val()=='') {
			$('#findIdForm #result1-div').html('답을 입력하세요');
			$('#findIdForm #findId-question-input').focus();	
			
		}else{
			$.ajax({
				url: '/milkyWayForest/login/findId',
				type: 'post',
				data: {'question' : $('#findIdForm select option:selected').val(), 'answer' : $('#findIdForm #findId-question-input').val()},
				dataType: 'jason',
				success: function(data){
					data = data.trim();
					
					if(data == 'findIdOk'){
						location.href='/milkyWayForest/login/loginForm';
						$('#loginForm #result-div').html('찾으신 아이디는 '+data.id+'입니다');
						
					}else if(data == 'findIdFail'){
						$('#findIdForm #result1-div').html('질문과 답을 다시 한번 확인하세요');
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
	});
	
	var code = '';
	//이메일 인증번호 받기 https://kimvampa.tistory.com/105?category=771727 참고
	$('#findIdForm #check-email-button').click(function(){
		$('#findIdForm #result2-div').empty();
		
		var emailForm = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
		var email = $('#findIdForm #findId-email-input').val();
		
		if(email =='') {
			$('#findIdForm #result2-div').html('이메일을 입력하세요');
			$('#findIdForm #findId-email-input').focus();
	
		}else if(!emailForm.test(email)){
			$('#findIdForm #result2-div').html('잘못된 이메일 형식입니다');
			
		}else{
			$.ajax({
       			url: "/milkyWayForest/login/loginEmailCheck",
				type: "get",
       			data: {'email' : $('#findIdForm #findId-email-input').val()},
       			dataType: 'text',
				success: function(data){
					$('#findIdForm #result2-div').html('인증번호가 발송되었습니다');
					$("#findIdForm #check-email-input").attr("disabled", false);
					code = data;
				},
				error: function(err){
					console.log(err);
				}
			});
		}
	});
	
	//인증번호 확인
	$('#findIdForm #check-number-button').click(function(){
		$('#findIdForm #result2-div').empty();
		
		var inputCode = $('#findIdForm #check-email-input').val();
		
		if(inputCode != code){
			$('#findIdForm #result2-div').html('인증번호를 다시 확인해주세요');
			
		}else{
			$.ajax({
				url: '/milkyWayForest/login/findId',
				type: 'post',
				data: {'email' : $('#findIdForm #findId-email-input').val()},
				dataType: 'jason',
				success: function(data){
					data = data.trim();
					
					if(data == 'findIdOk'){
						location.href='/milkyWayForest/login/loginForm';
						$('#loginForm #result-div').html('찾으신 아이디는 '+data.id+'입니다');
						
					}else if(data == 'findIdFail'){
						$('#findIdForm #result1-div').html('질문과 답을 다시 한번 확인하세요');
					}
				},
				error: function(err){
					console.log(err);
				}
			});
		}
	});
	

});	

/////////////////////////////////////////////////////////////////

//비밀번호 찾기

