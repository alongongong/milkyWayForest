<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" href="/milkyWayForest/css/mypage.css">

<form id="mypageShpMngModifyForm" action="/milkyWayForest/mypage/mypageShpMngWrite" method="post">
<input type="hidden" name="shipCode" id="shipCode" value="${requestScope.shipCode }">
	<div id="myBasicInfo-wrapper" class="item">
		<div id="myBasicInfo-title" class="navbar navbar-light"style="text-align: center">
			<span class="mb-0" style="text-align: center">배송지 관리</span>
		</div>
		
		<div id="myBasicInfo-state" style="padding-top:40px;padding-left:50px;padding-right:50px;">		
			<table>
				<tbody>
					<tr>
						<td id="shipNicknameLabel" style="width:90px; padding-bottom:20px;">배송지명</td>
						<td>
							<div style="padding-bottom:20px;"><input type="text" id="shipNickname" name="shipNickname" class="form-control bg-white border" style="width:170px;"></div>
						</td>
					</tr>
					<tr>
						<td style="padding-bottom:20px;">수령인</td>
						<td>
							<div style="padding-bottom:20px;"><input type="text" id="shipReceiver" name="shipReceiver" class="form-control bg-white border" placeholder="150자 이내로 입력" style="width:170px;"></div>
						</td>
					</tr>
					<tr>
						<td style="padding-bottom:20px;">주소</td>
						<td style="padding-bottom:20px;">
							<div id="dd" class="input-group" style="padding-bottom:10px;">
								<input type="text" id="shipZipcode" name="shipZipcode" class="form-control bg-white border" size="5" readonly>
								<input type="button" class="btn" value="주소검색" id="zipcodeBtn" onclick="sample6_execDaumPostcode()" >
							</div>
							<div id="dd1" class="input-group"style="padding-bottom:10px;">
								<input type="text" id="shipAddr1" name="shipAddr1" class="form-control bg-white border" readonly>
							</div>
							<div id="dd2" class="input-group">
								<input type="text" id="shipAddr2" name="shipAddr2" class="form-control bg-white border">
							</div>
						</td>
					</tr>
					<tr>
						<td style="padding-bottom:10px;">연락처</td>
						<td>
							<div id="tel-input-wrapper" class="input-group mb-3">
								<input type="text" id="shipTel1" name="shipTel1" class="form-control bg-white border rounded">
								<div class="input-group-prepend">
									<span class="input-group-text bg-white border-0">-</span>
								</div>
								<input type="text" id="shipTel2" name="shipTel2" class="form-control bg-white border rounded">
								<div class="input-group-prepend">
									<span class="input-group-text bg-white border-0">-</span>
								</div>
								<input type="text" id="shipTel3" name="shipTel3" class="form-control bg-white border rounded">
							</div>
						</td>
					</tr>
					<tr>
						<td>기본배송지</td>
						<td>
							<div style="padding-left:50px;"><input type="checkbox" name="baseShip" value="1">&nbsp;기본 배송지로 설정</div>
						</td>
					</tr>
					<tr>
						<td colspan="2" style="padding-top:20px;">입력 / 수정하신 배송지는 배송 목록에 저장됩니다.</td>
					</tr>
				</tbody>
			</table>
			<div id="result-div"></div>
			
			<div align="center" id="button-wrap" style="padding-top:70px;">
				<button type="button" id="modifyCloseBtn" class="btn" onclick="javascript:window.close(); return false;">닫기</button>
				<button type="button" id="modifySaveBtn" class="btn">저장</button>
				
			</div>
		</div>
	</div>
</form>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

           /*  // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                document.getElementById("sample6_extraAddress").value = extraAddr;
            
            } else {
                document.getElementById("sample6_extraAddress").value = '';
            } */

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('shipZipcode').value = data.zonecode;
            document.getElementById("shipAddr1").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("shipAddr2").focus();
        }
    }).open();
}

$('#mypageShpMngWriteForm #saveBtn').click(function(){
	
	var telForm = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
	var tel1 = $('#mypageShpMngWriteForm #shipTel1').val();
	var tel2 = $('#mypageShpMngWriteForm #shipTel2').val();
	var tel3 = $('#mypageShpMngWriteForm #shipTel3').val();
	var tel = tel1 + "-" +  tel2 + "-" + tel3;
	
	if($('#mypageShpMngWriteForm #payShipReceiver').val() == ''){
		alert("수령인을 다시 입력해주세요.");
		return false;
	}else if($('#mypageShpMngWriteForm #zipcodeBtn').val() == ''){
		alert("우편번호를 다시 확인해주세요.");
		return false;
	}else if($('#mypageShpMngWriteForm #shipAddr2').val() == ''){
		alert("상세 주소를 입력해주세요");
		return false;
	}else if(!telForm.test(tel)){
		alert("연락처를 정확히 입력해주세요.");
		return false;
	}else{
 		$.ajax({
			url:'/milkyWayForest/mypage/mypageShpMngWrite',
			type:'post',
			data:$('#mypageShpMngWriteForm').serialize(),
			success: function(){

				alert('저장 되었습니다.');
				opener.parent.location.reload();
				window.close();
			},
			error:function(err){
				console.log(err);
			}
		});
	//$('#mypageShpMngWriteForm').submit();
	//alert("저장되었습니다");
	//opener.parent.location.reload();
	//window.close(); 
	}
});
$('#mypageShpMngModifyForm').ready(function(){
	$.ajax({
		url:'/milkyWayForest/mypage/getShpMngModify',
		type:'post',
		data:{'shipCode' : $('#mypageShpMngModifyForm #shipCode').val()},
		datatype:'json',
		success: function(data){
			console.log(JSON.stringify(data));
			
			if(data.shipNickname != null){
				$('#shipNickname').val(data.shipNickname);
			}
			if(data.shipReceiver != null){
				$('#shipReceiver').val(data.shipReceiver);
			}
			if(data.shipZipcode != null){
				$('#shipZipcode').val(data.shipZipcode);
				$('#shipAddr1').val(data.shipAddr1);
				$('#shipAddr2').val(data.shipAddr2);		
			}
			if(data.shipTel1 != null){
				$('#shipTel1').val(data.shipTel1);
				$('#shipTel2').val(data.shipTel2);
				$('#shipTel3').val(data.shipTel3);
			}
		},
		error:function(Err){
			console.log(err);
		}
	});
});

$('#mypageShpMngModifyForm #modifySaveBtn').click(function(){
	$.ajax({
		url: '/milkyWayForest/mypage/updateShpMng?shipCode=${shipCode}',
		type: 'get',
		data: $('#mypageShpMngModifyForm').serialize(),
		success: function(data) {
			alert('글이 수정되었습니다.');
			opener.parent.location.reload();
			window.close();
		},
		error: function(err) {
			console.log(err);
		}
	});
});
</script>