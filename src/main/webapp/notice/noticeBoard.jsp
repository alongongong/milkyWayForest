<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/milkyWayForest/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="/milkyWayForest/css/notice.css">
<form id="noticeBoardForm">
	<div id="noticeBoardFormDiv">
		<section>
			<legend>공지사항</legend>
			<br>
			<div id="noticeBoardNav">
				<div>
					<a href="/milkyWayForest/"><img src="/milkyWayForest/image/icon_home.png" alt="홈"></a> > 
					<a href="/milkyWayForest/notice/noticeBoard?pg=1">공지사항</a>
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
				<thead>
					<tr>
						<th width="100">NO</th>
						<th>제목</th>
						<th width="200">날짜</th>
						<th width="150">조회수</th>
					</tr>
				</thead>
				<tbody></tbody>
			</table>
			<br>
			<div id="boardPagingDiv"></div>
		</section>
	</div>
</form>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function(){
	$.ajax({
		url: '/milkyWayForest/notice/getNoticeBoard?pg='+${pg},
		type: 'post',
		success: function(data) {
			//alert(JSON.stringify(data))
			$('#noticeBoardTable tbody').empty();
			$.each(data.list, function(index, items){
				$('<tr>').append($('<td>',{
					align: 'center',
					text: items.noticeCode
				})).append($('<td>').append($('<a>',{
					text: items.noticeSubject,
					class: 'noticeSubject',
					href: '/milkyWayForest/notice/noticeView?noticeCode='+items.noticeCode+'&pg='+data.pg,
					style: 'padding-left: 10px;'
				}))).append($('<td>',{
					text: items.noticeDate,
					align: 'center'
				})).append($('<td>',{
					text: items.noticeHit,
					align: 'center'
				})).appendTo($('#noticeBoardTable tbody'))
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
			data: 'search='+$('#noticeBoardSearch').val(),
			success: function(data) {
				// alert(JSON.stringify(data));
				$('#noticeBoardTable tbody').empty();
				$('#boardPagingDiv').empty();
				
				$.each(data, function(index, items){
					$('<tr>').append($('<td>',{
						align: 'center',
						text: items.noticeCode
					})).append($('<td>').append($('<a>',{
						text: items.noticeSubject,
						href: '/milkyWayForest/notice/noticeView?noticeCode='+items.noticeCode+'&pg=1'
					}))).append($('<td>',{
						text: items.noticeDate,
						align: 'center'
					})).append($('<td>',{
						text: items.noticeHit,
						align: 'center'
					})).appendTo($('#noticeBoardTable tbody'));
				});	
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