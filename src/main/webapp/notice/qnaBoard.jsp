<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/milkyWayForest/bootstrap/css/bootstrap.css">
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
	<table id="qnaBoardTable" class="table">
		<thead>
			<tr>
				<th>
					<input type="checkbox" id="allQnaCheck">
				</th>
				<th>글번호</th>
				<th>말머리</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일자</th>
				<th>조회수</th>
				<th>답변여부</th>
			</tr>
		</thead>
		<tbody></tbody>
	</table>
	<div id="qndBoardBtnDiv">
		<input type="button" id="qnaBoardWriteBtn" value="글쓰기">
	</div>
	<div id="qnaBoardPaging"></div>
</form>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function(){
	$('#qnaBoardTable tbody').empty();
	$.ajax({
		url: '/milkyWayForest/notice/getQnaBoard?pg='+${pg},
		type: 'post',
		success: function(data){
			$.each(data.list, function(index, items){
				$('<tr>').append($('<td>').append($('<input>',{
					type: 'checkbox',
					class: 'qnaCheck',
					id: 'qnaCheck' + index
				}))).append($('<td>',{
					text: items.qnaCode
				})).append($('<td>',{
					text: items.qnaQuestionType
				})).append($('<td>',{
					text: items.qnaSubject
				})).append($('<td>',{
					text: items.id
				})).append($('<td>',{
					text: items.qnaDate
				})).append($('<td>',{
					text: items.qnaHit
				})).append($('<td>',{
					text: items.qnaAnswerCheck
				})).appendTo($('#qnaBoardTable tbody'));
			});
			
			$('#qnaBoardPaging').html(data.boardPaging)
		},
		error: function(err) {
			console.log(err);
		}
	});
	
	$('#qnaBoardWriteBtn').click(function(){
		location.href="/milkyWayForest/notice/qnaBoardWriteForm";
	});
});

function boardPaging(page){
	location.href="/milkyWayForest/notice/qnaBoard?pg="+page;
}
</script>