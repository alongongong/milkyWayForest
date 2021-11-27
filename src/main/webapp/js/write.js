
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
	
		
	var name = $('#memberWriteForm #memberWriteName').val();	
	var nickname = $('#memberWriteForm #memberWriteNick').val();
	var tel1 = $('#memberWriteForm #writeTel1').val();
	var tel2 = $('#memberWriteForm #writeTel2').val();
	var tel3 = $('#memberWriteForm #writeTel3').val();
	var tel = tel1 + "-" +  tel2 + "-" + tel3;
	var pwd = $('#memberWriteForm #memberWritePwd').val();
	
	if($('#memberWriteForm #memberWriteId').val() == ''){
		$('#memberWriteForm #emailDiv').html('아이디 입력');
		$('#memberWriteId').focus();
	}else if($('#memberWriteForm #memberWritePwd').val() == ''){
		$('#memberWriteForm #emailDiv').html('비밀번호 입력');
		$('#memberWritePwd').focus();
	}else if(!pwdForm.test(pwd)){
		$('#memberWriteForm #emailDiv').html('잘못된 비밀번호 형식입니다.');
		$('#memberWritePwd').focus();
	}else if($('#memberWriteForm #memberWritePwd').val() != $('#memberWriteRePwd').val()){
		$('#memberWriteForm #emailDiv').html('비밀번호 틀림');
		$('#memberWritePwd').focus();
	}else if($('#memberWriteForm #memberWriteName').val() == ''){
		$('#memberWriteForm #emailDiv').html('이름 입력');
		$('#memberWriteName').focus();
	}else if(!nameForm.test(name)){
		$('#memberWriteForm #emailDiv').html('잘못된 이름 형식입니다.');
		$('#memberWriteName').focus();
	}else if($('#memberWriteForm #memberWriteNick').val() == ''){
		$('#memberWriteForm #emailDiv').html('닉네임 입력');
		$('#memberWriteNick').focus();
	}else if(!nicknameForm.test(nickname)){
		$('#memberWriteForm #emailDiv').html('잘못된 닉네임 형식입니다.');
		$('#memberWriteNick').focus();
	}else if(!telForm.test(tel)){
		$('#memberWriteForm #emailDiv').html('잘못된 번호 형식입니다.');
	}else if($('#memberWriteForm #memberWriteEmail').val() == ''){
		$('#memberWriteForm #emailDiv').html('이메일을 입력해주세요');
	}else if($('#memberWriteForm #memberWriteEmail1').val() == ''){
		$('#memberWriteForm #emailDiv').html('이메일을 입력해주세요');
	}else if($('#memberWriteForm #athntNmbr').val() == ''){
		$('#memberWriteForm #emailDiv').html('이메일 인증 해주세요');
	}
	else{
		$.ajax({
			url: '/milkyWayForest/write/write',
			type:'post',
			data: $('#memberWriteForm').serialize(),
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
	
	var emailForm = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
	var email1 = $('#memberWriteForm #memberWriteEmail').val();
	var email2 = $('#memberWriteForm #memberWriteEmail1').val();
	var email = email1+"@"+email2;
	
	if(email == ''){
		$('#memberWriteForm #emailDiv').html('이메일을 입력해주세요');
		$('#memberWriteForm #memberWriteEmail').focus();
	}else if(!emailForm.test(email)){
		$('#memberWriteForm #emailDiv').html('잘못된 이메일 형식입니다');
	}else{
		$.ajax({
			url:"/milkyWayForest/write/writeEmailCheck",
			type:"post",
			data:{'email1' : email1, 'email2' : email2},
			success: function(data){
				if(data != 'writeEmailCheck_non_exist'){
					$('#memberWriteForm #emailDiv').html('이미 등록된 이메일입니다');
					
				}else{
					$.ajax({
						url: "/milkyWayForest/write/writeEmailSend",
						type:"get",
						data:{'email' : email},
						success: function(data){
							$('#memberWriteForm #emailDiv').html('인증번호가 발송되었습니다');
							$('#memberWriteForm #athnt').show();
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
	}else if(inputCode != code){
		$('#memberWriteForm #emailDiv').html('인증번호를 다시 확인해주세요');
	}else if(inputCode == code){
		$('#memberWriteForm #emailDiv').html('인증되었습니다');
		$('#memberWriteForm #emailDiv').css('color','green');
		$('#memberWriteForm #memberWriteBtn').removeAttr('disabled','disabled');
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



