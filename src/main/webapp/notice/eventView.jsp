<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/milkyWayForest/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="/milkyWayForest/css/notice.css">
<form id="eventViewForm">
	<div id="eventViewFormDiv">
		<section>
			<legend>이벤트</legend>
			<br>
			<div id="eventViewBoardNav">
				<div>
					<a href="/milkyWayForest/"><img src="/milkyWayForest/image/icon_home.png" alt="홈"></a> > 
					<a href="/milkyWayForest/notice/eventBoard">이벤트</a>
				</div>
			</div>
			<br>
			<table id="eventViewTable">
				<tr>
					<th id="eventViewSubject"></th>
				</tr>
				<tr>
					<td id="eventViewContent"></td>
				</tr>
			</table>
			<br>
			<input type="button" id="eventListBtn" class="btn btn-secondary" value="목록">
		</section>
	</div>
</form>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function(){
	$.ajax({
		url: '/milkyWayForest/notice/getEventView',
		type: 'post',
		data: 'eventCode=${eventCode}',
		success: function(data) {
			// alert(JSON.stringify(data));
			$.each(data, function(index, items){
				if(index==0) {
					$('#eventViewSubject').text(items.eventSubject);
					$('<div>',{
						id: 'eventViewDate',
						text: items.eventDate
					}).appendTo($('#eventViewSubject'));
					$('<div>').appendTo($('#eventViewContent'));
				}
				$('<img>',{
					src: '/milkyWayForest/noticeImg/'+items.imgName,
					alt: '이미지'+index,
					style: 'margin: 0 auto;'
				}).appendTo($('#eventViewContent > div'));
			});
		},
		error: function(err) {
			console.log(err);
		}
	});
	
	$('#eventListBtn').click(function(){
		location.href='/milkyWayForest/notice/eventBoard';
	});
});
</script>