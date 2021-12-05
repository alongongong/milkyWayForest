<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/milkyWayForest/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="/milkyWayForest/css/notice.css">
<form id="noticeBoardForm">
	<legend>공지사항</legend>
	<br>
	<div id="noticeBoardNav">
		<div>
			<a href=""><img src="/milkyWayForest/image/icon_home.png" alt="홈"></a> > 
			<a href="">notice</a> > 
			<a href="">공지사항</a>
		</div>
	</div>
	<br>
	<div id="noticeBoardSearchDiv">
		<div>
			<input type="text" id="noticeBoardSearch" placeholder="검색어를 입력해 주세요." size="35">
			<input type="button" id="noticeBoardSearchBtn" class="btn" value="검색">
		</div>
	</div>
	<br>
	<br>
	<table id="noticeBoardTable" class="table">
		<tr>
			<th>NO</th>
			<th>제목</th>
			<th>날짜</th>
			<th>조회수</th>
		</tr>
	</table>
	<br>
	<div id="boardPagingDiv"></div>
</form>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function(){
	$.ajax({
		url: '/milkyWayForest/notice/getNoticeBoard?pg='+${pg},
		type: 'post',
		success: function(data) {
			//alert(JSON.stringify(data))
			$.each(data.list, function(index, items){
				$('<tr>').append($('<td>',{
					align: 'center',
					text: items.noticeCode
				})).append($('<td>').append($('<a>',{
					text: items.noticeSubject,
					href: '/milkyWayForest/notice/noticeView?noticeCode='+items.noticeCode+'&pg='+data.pg
				}))).append($('<td>',{
					text: items.noticeDate
				})).append($('<td>',{
					text: items.noticeHit
				})).appendTo($('#noticeBoardTable'))
			});	
			
			$('#boardPagingDiv').html(data.boardPaging);
		},
		error: function(err) {
			console.log(err);
		}
	});
	
	$('#noticeBoardSearchBtn').click(function(){
		$.ajax({
			url: '/milkyWayForest/notice/noticeSearch',
			type: 'post',
			data: 'search='+$('#noticeBoardSearch').val()+'&pg=${pg}',
			success: function(data) {
				alert(JSON.stringify(data));
			},
			error: function(err) {
				console.log(err);
			}
		});
	});
});

function boardPaging(page){
	location.href="/milkyWayForest/notice/noticeBoard?pg="+page;
}
</script>