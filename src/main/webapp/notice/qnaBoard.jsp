<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/milkyWayForest/css/notice.css">
<form id="qnaBoardForm">
	<legend>Q&A</legend>
	<br>
	<div id="qnaBoardNav">
		<div>
			<a href=""><img src="/milkyWayForest/image/icon_home.png" alt="홈"></a> > 
			<a href="">notice</a> > 
			<a href="">Q&A</a>
		</div>
	</div>
	<br>
	<table id="qnaBoardTable"></table>
	<div id="qndBoardBtnDiv">
		<input type="button" id="qnaBoardWriteBtn" value="글쓰기">
	</div>
</form>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function(){
	$.ajax({
		url: '/milkyWayForest/notice/getQnaBoard',
		type: 'post',
		success: function(data){
			alert(JSON.stringify(data));
		},
		error: function(err) {
			console.log(err);
		}
	});
});
</script>