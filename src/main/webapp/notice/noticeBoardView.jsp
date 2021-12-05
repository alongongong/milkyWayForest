<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/milkyWayForest/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="/milkyWayForest/css/notice.css">
<form id="noticeBoardViewForm">
	<legend>공지사항</legend><br>
	<div id="noticeBoardViewDiv">
		<div id="noticeSubject">
			<p id="noticeDate"></p>
		</div>
		<div id="noticeContent"></div>
		<div id="noticeListBtnDiv">
			<input type="button" class="btn btn-secondary" id="noticeListBtn" value="목록">
		</div>
	</div>
</form>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function(){
	$.ajax({
		url: '/milkyWayForest/notice/getNoticeView',
		type: 'post',
		data: 'noticeCode=${noticeCode}',
		success: function(data) {
			$('#noticeSubject').text(data.noticeSubject);
			$('<p>',{
				text: data.noticeDate,
				id: 'noticeDate'
			}).appendTo($('#noticeSubject'));
			$('#noticeContent').html(data.noticeContent);
			
			if(data.imgName != null) {
				$('<p>').append($('<img>',{
					src: '/milkyWayForest/noticeImg/'+data.imgName,
					alt: data.imgName,
					width: '100%'
				})).appendTo($('#noticeContent'));
			}
		},
		error: function(err) {
			console.log(err);
		}
	});
	
	$('#noticeListBtn').click(function(){
		location.href='/milkyWayForest/notice/noticeBoard?pg=${pg}';
	});
});
</script>