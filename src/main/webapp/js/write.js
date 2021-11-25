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
		$('#emailDiv').html('이메일을 입력해주세요');
	}else if($('#memberWriteForm #memberWriteEmail1').val() == ''){
		$('#emailDiv').html('이메일을 입력해주세요');
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
//$('#writeAllAgreecheck').change(function(){
//	var checked = $(this).prop('checked');
//	$('.acptChck1').prop('checked', checked);
//});

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



