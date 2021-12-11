<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/milkyWayForest/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="/milkyWayForest/css/notice.css">
<form id="eventBoardForm">
	<div id="eventBoardFormDiv">
		<section>
			<legend>이벤트</legend>
			<br>
			<div id="eventBoardNav">
				<div>
					<a href="/milkyWayForest/"><img src="/milkyWayForest/image/icon_home.png" alt="홈"></a> > 
					<a href="/milkyWayForest/notice/eventBoard">이벤트</a>
				</div>
			</div>
			<br>
			<div id="eventBoardNowDiv">
				<div>진행 이벤트</div>
			</div>
			<div id="eventBoardNowBody">
				<!-- ajax로 append -->
			</div>
			<br>
			<br>
		
			<br><br>
			<div id="eventBoardEndDiv">
				<div>종료 이벤트</div>
			</div>
			<div id="eventBoardEndBody">
				<!-- ajax로 append -->
			</div>
			<br><br>
		</section>
	</div>
</form>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function(){
	$.ajax({
		url: '/milkyWayForest/notice/getEventBoard',
		type: 'post',
		success: function(data) {
			//alert(JSON.stringify(data))
			$.each(data, function(index, items){
				if(items.eventStatus=='진행중') {
					$('<div>').append($('<a>',{
						href: '/milkyWayForest/notice/eventView?eventCode='+items.eventCode
					}).append($('<div>').append($('<img>',{
						src: '/milkyWayForest/noticeImg/'+items.imgName,
						width: '100%'
					})))).append($('<div>',{
						text: items.eventSubject,
						align: 'center',
						style: 'margin-top: 10px;'
					}).append($('<p>',{
						id: 'eventDate',
						text: items.eventDate
					}))).appendTo($('#eventBoardNowBody'));
				} else {
					$('<div>').append($('<a>',{
						href: '/milkyWayForest/notice/eventView?eventCode='+items.eventCode,
						class: 'endEventA'
					}).append($('<div>',{
						style: 'position: relative'
					}).append($('<span>',{
						class: 'endEvent'
					}).append($('<img>',{
						src: '/milkyWayForest/noticeImg/icon_end_event.png',
						alt: '종료 이벤트'
					}))).append($('<img>',{
						src: '/milkyWayForest/noticeImg/'+items.imgName,
						width: '100%'
					})))).append($('<div>',{
						text: items.eventSubject,
						align: 'center',
						style: 'margin-top: 10px;'
					}).append($('<p>',{
						id: 'eventDate',
						text: items.eventDate
					}))).appendTo($('#eventBoardEndBody'));
				}
			});
		},
		error: function(err) {
			console.log(err);
		}
	});
});
</script>
