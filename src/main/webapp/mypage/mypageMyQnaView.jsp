<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" href="/milkyWayForest/css/mypage.css">

<form id="mypageMyQnaView">
<div id="h1Div"><h1 style="font-size: 35px;">마이페이지</h1></div>
<div id="main-wrapper">
	<div id="main-sideNav" class="item">
		<jsp:include page="mypageSideNav.jsp"/>
	</div>

	<div id="main-topNav" class="item">
		<jsp:include page="mypageTopNav.jsp"/>	
	</div>
	<%----------------- 디폴트 설정 -----------------%>
	<input type="hidden" id="qnaCode" name="qnaCode" value="${qnaCode }">
	<input type="hidden" id="pg" name="pg" value="${pg }">
	
	<div id="myQnaView-wrapper" class="item">
		<div id="myQnaView-state">		
			<div id="qnaSubject">
				<p id="qnaDate"></p>
			</div>
			<div id="qnaContent">
				<img id="qnaImage1">
				<img id="qnaImage2">
			</div>
			<div id="qnaComment">
			</div>
			<div id="myQnaListBtnDiv">
				<input type="button" class="btn" id="myQnaListBtn" value="목록">
				<input type="button" class="btn" id="updateBtn" value="수정">				
				<input type="button" class="btn" id="deleteBtn" value="삭제">
			</div>
		</div>
	</div>
	
</div><!-- main-wrapper -->
</form>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/milkyWayForest/js/mypage.js"></script>
<script>
$(function(){
	//글내용 불러오기
	$.ajax({
		url: '/milkyWayForest/mypage/getMyQnaView',
		type: 'post',
		data: 'qnaCode=${qnaCode}',
		success: function(data) {
			$('#mypageMyQnaView #qnaSubject').html(data.qnaSubject);
			$('<p>',{
				text: data.qnaDate,
				id: 'qnaDate'
			}).appendTo($('#mypageMyQnaView #qnaSubject'));
			$('#mypageMyQnaView #qnaContent').html(data.qnaContent);
			
			if(data.qnaImage1 != null) {
				$('<p>').append($('<img>',{
					src: '/milkyWayForest/storage/'+data.qnaImage1,
					alt: data.qnaImage1,
					width: '100%'
				})).appendTo($('#mypageMyQnaView #qnaContent'));
				
			}
			if(data.qnaImage2 != null) {
				$('<p>').append($('<img>',{
					src: '/milkyWayForest/storage/'+data.qnaImage2,
					alt: data.qnaImage2,
					width: '100%'
				})).appendTo($('#mypageMyQnaView #qnaContent'));
			}
		},
		error: function(err) {
			console.log(err);
		}
	});
	
	//댓글 불러오기
	$.ajax({
		url: '/milkyWayForest/mypage/getMyQnaComment',
		type: 'post',
		data: 'qnaCode=${qnaCode}',
		success: function(data) {
			
			$.each(data, function(index, items){
				$('#mypageMyQnaView #qnaComment').append($('<p>',{
					text: 'comments'
				})).append($('<p>',{
					class: 'commentContent'
				}).append($('<span>', {
					text: items.id,
					style: 'margin: 0 10px;'
				})).append($('<p>', {
					text: items.commentContent
				})));
			});
			
		},
		error: function(err) {
			console.log(err);
		}
	});
	
	$('#mypageMyQnaView #myQnaListBtn').click(function(){
		location.href='/milkyWayForest/mypage/mypageMyPost?pg=${pg}';
	});
	
	$('#mypageMyQnaView #updateBtn').click(function(){
		location.href='/milkyWayForest/mypage/updateMyQnaViewForm?qnaCode=${qnaCode}&pg=${pg}';
	});
	
	$('#mypageMyQnaView #deleteBtn').click(function(){
		if(confirm('삭제하시겠습니까?')){
			$.ajax({
				url: '/milkyWayForest/mypage/deleteMyQnaView?qnaCode=${qnaCode}',
				type: 'get',
				success: function(data) {
					alert('글이 삭제되었습니다.');
					location.href='/milkyWayForest/mypage/mypageMyPost?pg=1';
				},
				error: function(err) {
					console.log(err);
				}
			});
		}
	});
	
	
});
</script>
