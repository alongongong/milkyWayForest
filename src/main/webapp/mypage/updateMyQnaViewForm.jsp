<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> --%>
<meta name="_csrf_header" content="${_csrf.headerName}" />
<meta name="_csrf" content="${_csrf.token}" />

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" href="/milkyWayForest/css/mypage.css">

<form id="updateMyQnaViewForm"> <!-- method="post" enctype="multipart/form-data"
		action="/milkyWayForest/mypage/updateMyQnaView" -->
<div id="h1Div"><h1 style="font-size: 35px;">마이페이지</h1></div>
<div id="main-wrapper">
	<div id="main-sideNav" class="item">
		<jsp:include page="mypageSideNav.jsp"/>
	</div>

	<div id="main-topNav" class="item">
		<jsp:include page="mypageTopNav.jsp"/>	
	</div>
	<%----------------- 디폴트 설정 -----------------%>
	<%-- <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> --%>
	<input type="hidden" id="qnaCode" name="qnaCode" value="${qnaCode }">
	<input type="hidden" id="pg" name="pg" value="${pg }">
	
	<div id="myQnaView-wrapper" class="item">
		<table id="updateMyQnaViewTable" class="table">
			<tr>
				<td width="200px">문의 유형</td>
				<td>
					<select id="qnaQuestionType" name="qnaQuestionType">
						<option>문의 유형</option>
						<option value="상품 문의">상품 문의</option>
						<option value="배송 문의">배송 문의</option>
						<option value="취소 문의">취소 문의</option>
						<option value="교환 문의">교환 문의</option>
						<option value="반품 문의">반품 문의</option>
						<option value="기타 문의">기타 문의</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>제목</td>
				<td>
					<input type="text" id="qnaSubject" name="qnaSubject">
				</td>
			</tr>
			<tr>
				<td>내용</td>
				<td>
					<textarea id="qnaContent" name="qnaContent" rows="17"></textarea>
				</td>
			</tr>
			<tr>
				<td></td>
				<td></td>
			</tr>
		</table>
		<div id="updateMyQnaViewBtnDiv" align="center">
			<input type="button" value=" 글수정 " id="updateMyQnaBtn" class="btn">
			<input type="button" value=" 취소 " id="cancelBtn" onclick="history.back()" class="btn">
		</div>
	</div>
	
</div><!-- main-wrapper -->
</form>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/milkyWayForest/js/mypage.js"></script>
<script>
$(function(){
	$.ajax({
		url: '/milkyWayForest/mypage/getMyQnaView',
		type: 'post',
		data: 'qnaCode=${qnaCode}',
		success: function(data) {
			$('#updateMyQnaViewForm #qnaQuestionType').val(data.qnaQuestionType);
			$('#updateMyQnaViewForm #qnaSubject').val(data.qnaSubject);
			$('#updateMyQnaViewForm #qnaContent').val(data.qnaContent);
		},
		error: function(err) {
			console.log(err);
		}
	});
	

});

$('#updateMyQnaViewForm #updateMyQnaBtn').click(function(){
	$.ajax({
		url: '/milkyWayForest/mypage/updateMyQnaView?qnaCode=${qnaCode}',
		type: 'get',
		data: $('#updateMyQnaViewForm').serialize(),
		success: function(data) {
			alert('글이 수정되었습니다.');
			location.href='/milkyWayForest/mypage/mypageMyPost?pg=${pg}';
		},
		error: function(err) {
			console.log(err);
		}
	});
});
</script>
