<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" href="/milkyWayForest/css/mypage.css">

<form id="mypageMyInfo">
<div id="main-wrapper" class="container">
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
							<input type="text" id="name" name="name" value="111" class="form-control bg-white border-0" disabled>
						</td>
					</tr>
					<tr>
						<td>닉네임</td>
						<td>
							<input type="text" id="nickname" name="nickname" class="form-control bg-white border" value="ㅇㅇㅇ">
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
								<input type="radio" name="gender" class="gender" value="남" disabled>남 &nbsp;
								<input type="radio" name="gender" class="gender" value="여" checked disabled>여								
							</div>
						</td>
					</tr>
					<tr>
						<td>휴대폰 번호</td>
						<td>
							<div id="tel-input-wrapper" class="input-group mb-3">
								<input type="text" id="tel1" name="tel1" class="form-control bg-white border rounded" value="111">
								<div class="input-group-prepend">
									<span class="input-group-text bg-white border-0">-</span>
								</div>
								<input type="text" id="tel2" name="tel2" class="form-control bg-white border rounded" value="111">
								<div class="input-group-prepend">
									<span class="input-group-text bg-white border-0">-</span>
								</div>
								<input type="text" id="tel3" name="tel3" class="form-control bg-white border rounded" value="111">
							</div>
						</td>
					</tr>
					<tr>
						<td>생년월일</td>
						<td>
							<div id="birthday-input-wrapper" class="input-group mb-3">
								<input type="text" id="yy" name="yy" class="form-control bg-white border-0" value="1111" disabled>
								<div class="input-group-prepend">
									<span class="input-group-text bg-white border-0">년</span>
								</div>
								<input type="text" id="mm" name="mm" class="form-control bg-white border-0" value="11" disabled>
								<div class="input-group-prepend">
									<span class="input-group-text bg-white border-0">월</span>
								</div>
								<input type="text" id="dd" name="dd" class="form-control bg-white border-0" value="11" disabled>
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
								<input type="text" id="email1" name="email1" class="form-control bg-white border rounded" value="111">
								<input type="hidden" id="email1" name="email1" class="form-control bg-white border-0" value="111">
								<div class="input-group-prepend">
									<span class="input-group-text bg-white border-0">@</span>
								</div>
								<input type="text" id="email2" name="email2" class="form-control bg-white border rounded" value="111">
								<input type="hidden" id="email2" name="email2" class="form-control bg-white border-0" value="111">
								<button type="button" id="email-send-button" class="btn btn-info">이메일인증</button>
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

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<script>
$('#mypageMyInfo').ready(function(){
	alert('왜안됑..');
	$.ajax({
		url: '/milkyWayForest/mypage/getMypageMyInfo',
		type: 'post',
		/* data: {'id' : $('#mypageMyInfo #id').val()},
		dataType: 'json', */
		success: function(data){
			alert(data);
			console.log(JSON.stringify(data));

		},
		error: function(err){
			console.log(err);
		}
	});
});
</script>