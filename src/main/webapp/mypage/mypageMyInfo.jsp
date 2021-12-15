<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" href="/milkyWayForest/css/mypage.css">

<form id="mypageMyInfo" name="mypageMyInfo">
<div id="h1Div"><h1 style="font-size: 35px;">마이페이지</h1></div>
<div id="main-wrapper">
	<div id="main-sideNav" class="item">
		<jsp:include page="mypageSideNav.jsp"/>
	</div>

	<div id="main-topNav" class="item">
		<jsp:include page="mypageTopNav.jsp"/>	
	</div>
	<%----------------- 디폴트 설정 -----------------%>
	
	<div id="myBasicInfo-wrapper" class="item">
		<div id="myBasicInfo-title" class="navbar navbar-light">
			<span class="mb-0">기본 정보</span>
		</div>
		
		<div id="myBasicInfo-state">		
			<table class="table border-bottom">
				<tbody>
					<tr>
						<td id="td-id">아이디 *</td>
						<td>
							<input type="text" id="id" name="id" value="${memId }" class="form-control shadow-none bg-white border-0" readonly>
						</td>
					</tr>
					<tr>
						<td>비밀번호 *</td>
						<td>
							<input type="password" id="pwd" name="pwd" class="form-control bg-white border" placeholder="영문,숫자,특수문자 포함 8~16자">
						</td>
					</tr>
					<tr>
						<td>비밀번호 확인 *</td>
						<td>
							<input type="password" id="repwd" class="form-control bg-white border" placeholder="비밀번호 확인">
						</td>
					</tr>
					<tr>
						<td>이름 *</td>
						<td>
							<input type="text" id="name" name="name" class="form-control shadow-none bg-white border-0" readonly>
						</td>
					</tr>
					<tr>
						<td>닉네임 *</td>
						<td>
							<input type="text" id="nickname" name="nickname" class="form-control bg-white border">
						</td>
					</tr>
					<tr>
						<td>질문/답</td>
						<td>
							<div id="idPwdQuestion-wrapper" class="input-group mb-3">
								<select class="custom-select" id="idPwdQuestion" name="idPwdQuestion">
									<option value="false" selected>---질문을 선택하세요---</option>
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
						<td>성별 *</td>
						<td>
							<input type="text" id="gender" name="gender" class="form-control shadow-none bg-white border-0" readonly>
						</td>
					</tr>
					<tr>
						<td>휴대폰 번호 *</td>
						<td>
							<div id="tel-input-wrapper" class="input-group mb-3">
								<input type="text" id="tel1" name="tel1" class="form-control bg-white border rounded">
								<div class="input-group-prepend">
									<span class="input-group-text bg-white border-0">-</span>
								</div>
								<input type="text" id="tel2" name="tel2" class="form-control bg-white border rounded">
								<div class="input-group-prepend">
									<span class="input-group-text bg-white border-0">-</span>
								</div>
								<input type="text" id="tel3" name="tel3" class="form-control bg-white border rounded">
							</div>
						</td>
					</tr>
					<tr>
						<td>생년월일 *</td>
						<td>
							<div id="birthday-input-wrapper" class="input-group mb-3">
								<input type="text" id="yy" name="yy" class="form-control shadow-none bg-white border-0" readonly>
								<div class="input-group-prepend">
									<span class="input-group-text bg-white border-0">년</span>
								</div>
								<input type="text" id="mm" name="mm" class="form-control shadow-none bg-white border-0" readonly>
								<div class="input-group-prepend">
									<span class="input-group-text bg-white border-0">월</span>
								</div>
								<input type="text" id="dd" name="dd" class="form-control shadow-none bg-white border-0" readonly>
								<div class="input-group-prepend">
									<span class="input-group-text bg-white border-0">일</span>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<td>이메일 주소 *</td>
						<td>
							<div id="email-input-wrapper" class="input-group mb-3">
								<input type="text" id="email1" name="email1" class="form-control bg-white border rounded">
								<input type="hidden" id="reEmail1" class="form-control bg-white border-0">
								
								<div class="input-group-prepend">
									<span class="input-group-text bg-white border-0">@</span>
								</div>
								<input type="text" id="email2" name="email2" class="form-control bg-white border rounded">
								
								<input type="hidden" id="reEmail2" class="form-control bg-white border-0">
								<button type="button" id="email-send-button" class="btn">이메일인증</button>
							</div>
							
							<div id="email-number-wrapper" class="input-group">
								<input type="text" id="emailNum" name="emailNum" class="form-control bg-white border rounded" disabled>
								<button type="button" id="email-number-button" class="btn" disabled>인증번호확인</button>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
			<div id="result-div"></div>
			
			<div align="center" id="button-wrap">
				<button type="button" id="Update-button" class="btn">회원정보수정</button>
				<button type="button" id="Delete-button" class="btn" onclick="location.href='/milkyWayForest/mypage/mypagePwdForm2'">회원탈퇴</button>
				<button type="reset" id="reset-button" class="btn">취소</button>
			</div>
		</div>
	</div>
	
</div><!-- main-wrapper -->
</form>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/milkyWayForest/js/mypage.js"></script>
<script>
//회원정보 불러오기 
$('#mypageMyInfo').ready(function(){
	$.ajax({
		url: '/milkyWayForest/mypage/getMypageMyInfo',
		type: 'post',
		data: {'id' : $('#mypageMyInfo #id').val()},
		success: function(data){
			console.log(JSON.stringify(data));
			
			if(data.name != null){
				$('#name').val(data.name);	
				
			}if(data.nickname != null){
				$('#nickname').val(data.nickname);	
				
			}if(data.idPwdQuestion != null && data.idPwdQuestion != 'false'){
				$('#idPwdQuestion').val(data.idPwdQuestion);
				$('#idPwdAnswer').val(data.idPwdAnswer);
				
			}if(data.gender != null){
				$('#gender').val(data.gender);	
				
			}if(data.tel1 != null){
				$('#tel1').val(data.tel1);
				$('#tel2').val(data.tel2);
				$('#tel3').val(data.tel3);
				
			}if(data.yy != null){
				$('#yy').val(data.yy);
				
			}if(data.mm != null && data.mm != 0){
				$('#mm').val(data.mm);
				$('#dd').val(data.dd);
				
			}if(data.email1 != null && data.email1 != 'false'){
				$('#email1').val(data.email1);
				$('#email2').val(data.email2);
				$('#reEmail1').val(data.email1);
				$('#reEmail2').val(data.email2);
			}
		},
		error: function(err){
			console.log(err);
		}
	});
});
</script>