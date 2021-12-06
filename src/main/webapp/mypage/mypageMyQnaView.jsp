<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" href="/milkyWayForest/css/mypage.css">

<form id="mypageMyQnaView">
<div id="main-wrapper">
	<div id="main-sideNav" class="item">
		<jsp:include page="mypageSideNav.jsp"/>
	</div>

	<div id="main-topNav" class="item">
		<jsp:include page="mypageTopNav.jsp"/>	
	</div>
	<%----------------- 디폴트 설정 -----------------%>
	
	<div id="myQnaView-wrapper" class="item">
		<div id="myQnaView-state">		
			<div id="qnaSubject">
				<p id="qnaDate"></p>
			</div>
			<div id="qnaContent"></div>
			<div id="myQnaListBtnDiv">
				<input type="button" class="btn btn-info" id="myQnaListBtn" value="목록">
				<input type="button" class="btn btn-info" id="updateBtn" value="수정">				
				<input type="button" class="btn btn-info" id="deleteBtn" value="삭제">
			</div>
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
			$('#qnaSubject').text(data.qnaSubject);
			$('<p>',{
				text: data.qnaDate,
				id: 'qnaDate'
			}).appendTo($('#qnaSubject'));
			$('#qnaContent').html(data.qnaContent);
			
			if(data.qnAImage1 != null) {
				$('<p>').append($('<img>',{
					src: '/milkyWayForest/image/'+data.qnAImage1,
					alt: data.qnAImage1,
					width: '100%'
				})).appendTo($('#qnaContent'));
				
			}else if(data.qnAImage2 != null) {
				$('<p>').append($('<img>',{
					src: '/milkyWayForest/image/'+data.qnAImage2,
					alt: data.qnAImage2,
					width: '100%'
				})).appendTo($('#qnaContent'));
			}
		},
		error: function(err) {
			console.log(err);
		}
	});
	
	$('#myQnaListBtn').click(function(){
		location.href='/milkyWayForest/mypage/mypageMyPost?pg=${pg}';
	});
});
</script>
