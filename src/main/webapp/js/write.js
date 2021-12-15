
//회원가입 유효성 검사
$('#memberWriteForm #memberWriteBtn').click(function(){
	
//	$('#idDiv').empty();
//	$('#pwdDiv').empty();
//	$('#pwdReDiv').empty();
//	$('#nameDiv').empty();
//	$('#nickNameDiv').empty();
	$('#emailDiv').empty();
//	$('#athDiv').empty();
	
	
	var nameForm = /^[가-힣]{2,4}$/;
	var nicknameForm = /^[\w\Wㄱ-ㅎㅏ-ㅣ가-힣]{2,20}$/;
	var telForm = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
	var pwdForm = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/; //정규표현식
	var birthDayForm = /^(19[0-9][0-9]|20\d{2})(0[0-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])$/;
	var yy = $('#memberWriteForm #yy').val();
	var mm = $('#memberWriteForm #mm').val();
	var dd = $('#memberWriteForm #dd').val();
	var birthDay = yy + mm + dd;
	var name = $('#memberWriteForm #memberWriteName').val();	
	var nickname = $('#memberWriteForm #memberWriteNick').val();
	var tel1 = $('#memberWriteForm #writeTel1').val();
	var tel2 = $('#memberWriteForm #writeTel2').val();
	var tel3 = $('#memberWriteForm #writeTel3').val();
	var tel = tel1 + "-" +  tel2 + "-" + tel3;
	var pwd = $('#memberWriteForm #memberWritePwd').val();
	
	if($('#memberWriteForm #memberWriteId').val() == ''){
		$('#memberWriteForm #emailDiv').html('아이디를 입력하세요');
		$('#memberWriteForm #emailDiv').css('color','red');
		$('#memberWriteId').focus();
	}else if($('#memberWriteForm #memberWritePwd').val() == ''){
		$('#memberWriteForm #emailDiv').html('비밀번호를 입력하세요');
		$('#memberWriteForm #emailDiv').css('color','red');
		$('#memberWritePwd').focus();
	}else if(!pwdForm.test(pwd)){
		$('#memberWriteForm #emailDiv').html('잘못된 비밀번호 형식입니다.');
		$('#memberWriteForm #emailDiv').css('color','red');
		$('#memberWritePwd').focus();
	}else if($('#memberWriteForm #memberWritePwd').val() != $('#memberWriteRePwd').val()){
		$('#memberWriteForm #emailDiv').html('동일한 비밀번호를 입력하세요.');
		$('#memberWriteForm #emailDiv').css('color','red');
		$('#memberWritePwd').focus();
	}else if($('#memberWriteForm #memberWriteName').val() == ''){
		$('#memberWriteForm #emailDiv').html('이름을 입력하세요');
		$('#memberWriteForm #emailDiv').css('color','red');
		$('#memberWriteName').focus();
	}else if(!nameForm.test(name)){
		$('#memberWriteForm #emailDiv').html('잘못된 이름 형식입니다.');
		$('#memberWriteForm #emailDiv').css('color','red');
		$('#memberWriteName').focus();
	}else if($('#memberWriteForm #memberWriteNick').val() == ''){
		$('#memberWriteForm #emailDiv').html('닉네임을 입력하세요');
		$('#memberWriteForm #emailDiv').css('color','red');
		$('#memberWriteNick').focus();
	}else if(!nicknameForm.test(nickname)){
		$('#memberWriteForm #emailDiv').html('잘못된 닉네임 형식입니다.');
		$('#memberWriteForm #emailDiv').css('color','red');
		$('#memberWriteNick').focus();
	}else if($('input[name=gender]:radio:checked').length < 1){
		$('#memberWriteForm #emailDiv').html('성별을 입력하세요');
		$('#memberWriteForm #emailDiv').css('color','red');
	}else if(!telForm.test(tel)){
		$('#memberWriteForm #emailDiv').html('잘못된 번호 형식입니다.');
		$('#memberWriteForm #emailDiv').css('color','red');
	}else if(!birthDayForm.test(birthDay)){
		$('#memberWriteForm #emailDiv').html('잘못된 생년월일 형식입니다.');
		$('#memberWriteForm #emailDiv').css('color', 'red');
	}else if($('#memberWriteForm #memberWriteEmail').val() == ''){
		$('#memberWriteForm #emailDiv').html('이메일을 입력하세요');
		$('#memberWriteForm #emailDiv').css('color','red');
	}else if($('#memberWriteForm .gender').val() == ''){
		$('memberWriteForm #emailDiv').html('성별을 체크하세요');
	}else if($('#memberWriteForm #memberWriteEmail1').val() == ''){
		$('#memberWriteForm #emailDiv').html('이메일을 입력하세요');
		$('#memberWriteForm #emailDiv').css('color','red');
	}else if($('#memberWriteForm #athntNmbr').val() == ''){
		$('#memberWriteForm #emailDiv').html('이메일을 인증하세요');
		$('#memberWriteForm #emailDiv').css('color','red');
	}else{

//		if($('#memberWriteForm #writeAnwer').val() == ''){
//		
//			$('#memberWriteForm #writeAnwer').val('false');
//			$('#memberWriteForm #writeQuestion').val('false').prop('selected',true);
//		}
//		 if($('#memberWriteForm #joinPath').val() == ''){
//			$('#memberWriteForm #joinPath').val('false');
/*		$.ajax({
			url: '/milkyWayForest/write/write',                url의 주소로 
			type:'post',
			data: $('#memberWriteForm').serialize(),
			success: function(){
				alert('회원 가입 등록');
				$('#memberWriteForm').submit();
			},
			error:function(err){
				console.log(err);
			}
		}); */
		$('#memberWriteForm').submit();
		}
});
$('#memberWriteForm #writeQuestion').change(function(){
	if($("#memberWriteForm #writeQuestion option").index( $("#memberWriteForm #writeQuestion option:selected")) >= 1){
		$('#writeAnwer').removeAttr('readonly');
	}else{
		$('#writeAnwer').attr('readonly','readonly');
	}
});

//아이디 중복 체크
$('#memberWriteForm #memberWriteId').focusout(function(){
	$('#memberWriteForm #emailDiv').empty();
	
	var idForm = /^(?=.*[a-zA-z])(?=.*[0-9]).{5,10}$/;
	var id = $('#memberWriteForm #memberWriteId').val();
	
	if($('#memberWriteForm #memberWriteId').val() == ''){
		$('#memberWriteForm #emailDiv').html('아이디를 입력하세요');
		$('#memberWriteForm #emailDiv').css('color','red');
	}else if(!idForm.test(id)){
		$('#memberWriteForm #emailDiv').html('잘못된 아이디 형식입니다');	
		$('#memberWriteForm #emailDiv').css('color','red');
		$('#memberWriteId').focus();	
	}else{
		$.ajax({
			url: '/milkyWayForest/write/writeIdCheck',
			type:'post',
			data:'id='+$('#memberWriteForm #memberWriteId').val(),
			dataType:'text',
			success: function(data){
				data = data.trim();
				
				if(data == 'writeIdCheck_non_exist'){	
					$('#memberWriteForm #emailDiv').html('사용 가능');
					$('#memberWriteForm #emailDiv').css('color','green');
					
					$('#checkId').val($('#memberWriteForm #memberWriteId').val());
				
				}else{
					$('#memberWriteForm #emailDiv').html('사용 불가능');
					$('#memberWriteForm #emailDiv').css('color','red');
				}
			},
			error: function(err){
				console.log(err);
			}
		});
	}
});


//이메일 유효성 검사 및 발송
$('#memberWriteForm #athntEmail').click(function(){
	$('#memberWriteForm #emailDiv').html('');
	var emailForm = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
	var email1 = $('#memberWriteForm #memberWriteEmail').val();
	var email2 = $('#memberWriteForm #memberWriteEmail1').val();
	var email = email1+"@"+email2;
	
	if(email == ''){
		$('#memberWriteForm #emailDiv').html('이메일을 입력해주세요');
		$('#memberWriteForm #emailDiv').css('color','red');
		$('#memberWriteForm #memberWriteEmail').focus();
	}else if(!emailForm.test(email)){
		$('#memberWriteForm #emailDiv').html('잘못된 이메일 형식입니다');
		$('#memberWriteForm #emailDiv').css('color','red');
	}else{
		$.ajax({
			url:"/milkyWayForest/write/writeEmailCheck",
			type:"post",
			data:{'email1' : email1, 'email2' : email2},
			success: function(data){
				if(data != 'writeEmailCheck_non_exist'){
					$('#memberWriteForm #emailDiv').html('이미 등록된 이메일입니다');
					$('#memberWriteForm #emailDiv').css('color','red');
					
				}else{
					$('#memberWriteForm #athntNmbr').val("");
					$('#memberWriteForm #athntNmbr').removeAttr('readonly');
					$('#memberWriteForm #athBtn').removeAttr('disabled');
					$('#memberWriteForm .athntHide').removeClass('athntHide');
					$.ajax({
						url: "/milkyWayForest/write/writeEmailSend",
						type:"get",
						data:{'email' : email},
						success: function(data){
							$('#memberWriteForm #emailDiv').html('인증번호가 발송되었습니다');
							$('#memberWriteForm #emailDiv').css('color','green');
							code = data;
						},
						error: function(err){
							console.log(err);
						}
					});
				}
			},
			error : function(err){
				console.log(err);
			}
		});
	}
});
//인증번호 확인 
$('#memberWriteForm #athBtn').click(function(){
	$('#memberWriteForm #emailDiv').empty();
	
	var inputCode = $('#memberWriteForm #athntNmbr').val();
	
	if(inputCode == ''){
		$('#memberWriteForm #emailDiv').html('인증번호를 입력하세요');
		$('#memberWriteForm #emailDiv').css('color','red');
	}else if(inputCode != code){
		$('#memberWriteForm #emailDiv').html('인증번호를 다시 확인해주세요');
		$('#memberWriteForm #emailDiv').css('color','red');
	}else if(inputCode == code){
		$('#memberWriteForm #emailDiv').html('인증되었습니다');
		$('#memberWriteForm #emailDiv').css('color','green');
		$('#memberWriteForm #memberWriteBtn').removeAttr('disabled','disabled');
		$('#memberWriteForm #athBtn').attr('disabled','disabled');
		$('#memberWriteForm #athntNmbr').attr('readonly','readonly');
	}
	
});
	
//약관창 all check box 
$('#writeAllAgreecheck').click(function(){
	if($('#writeAllAgreecheck').prop("checked")){
		$('.acptChck').prop("checked", true);
	}else{
		$('.acptChck').prop("checked", false);
	}
});
//$('#writeAllAgreecheck').change(function(){
//	var checked = $(this).prop('checked');
//	$('.acptChck1').prop('checked', checked);
//});
//페이지 뒤로가기 앞으로 가기 할 시에 초기화
window.onpageshow = function(event){
	$("#writeAllAgreecheck:checkbox:checked").prop("checked",false);
	$(".acptChck:checkbox:checked").prop("checked",false);
	$('#writeAgreeBtn1').attr('disabled','disabled');
	
	$('input[name="acptChck1"]').change(function(){
		var tmpLength = $('input[name="acptChck1"]').length;
		var checkedLength = $('input[name="acptChck1"]:checked').length;
		var selectAll = (tmpLength == checkedLength);
		$('#writeAllAgreecheck').prop('checked', selectAll);
		selectAll ? $('#writeAgreeBtn1').removeAttr('disabled'):$('#writeAgreeBtn1').attr('disabled','disabled');
	});
	//전체선택 checkbox의 상태에 따라 id = next 값을 가진 버튼의 비활성화를 적용/해제
	$('#writeAllAgreecheck').change(function(){
		//#checkAll의 값이 true 인 경우 $('#next').removeAttr('disabled');
		//#checkAll의 값이 false인 경우 $('#next').attr('disabled','disabled'); 이 적용됨
		$(this).prop('checked') ? $('#writeAgreeBtn1').removeAttr('disabled'):$('#writeAgreeBtn1').attr('disabled','disabled');
	});
	
	
	//약관동의 동의버튼 이동 
	$(document).ready(function(){
		$('#writeAgreeForm #writeAgreeBtn1').click(function(){
			$(location).attr('href','/milkyWayForest/write/memberWrite')
		});
	});
};

$('#writeAgreeForm #kakaoWriteBtn').click(function(){
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


