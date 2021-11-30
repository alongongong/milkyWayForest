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
					text: items.qnaSubject,
					id: 'qnaSubject'+index,
					class: 'qnaSubject'
				})).append($('<td>',{
					text: items.id
				})).append($('<td>',{
					text: items.qnaDate
				})).append($('<td>',{
					text: items.qnaHit
				})).append($('<td>',{
					text: items.qnaAnswerCheck
				})).appendTo($('#qnaBoardTable tbody'));
			
				$('<tr>', {
					class: 'pwdWrite'
				}).append($('<td>',{
					colspan: '8',
					style: 'vertical-align: middle; text-align: center; padding: 60px'
				}).append($('<input>',{
					type: 'text',
					placeholder: '비밀번호 입력',
					style: 'margin-right: 5px;'
				})).append($('<input>',{
					type: 'button',
					value: '입력',
					id: 'pwdBtn'+index
				})).append($('<div>',{
					class: 'qndPwdCheck'
				}))).appendTo($('#qnaBoardTable tbody'));
				
				$('<tr>', {
					class: 'contentHide'
				}).append($('<td>', {
					colspan: '8',
					text: items.qnaContent,
					style: 'vertical-align: middle; text-align: center; padding: 50px'
				})).appendTo($('#qnaBoardTable tbody'));
				
			
				$('#pwdBtn'+index).click(function(){
					if(items.qnaPwd == $(this).prev().val()){
						$('.pwdWriteShow').removeClass('pwdWriteShow').addClass('pwdWrite');
						$(this).parent().parent().next().removeClass('contentHide').addClass('contentShow');
					} else {
						$('.qndPwdCheck').empty();
						$('.qndPwdCheck').text('비밀번호가 일치하지 않습니다.');
					}
				});
				
			});
			
			$('.qnaSubject').click(function() {
				if($(this).parent().next().attr('class')=='pwdWrite') {
					$('.pwdWriteShow').removeClass('pwdWriteShow').addClass('pwdWrite');
					$(this).parent().next().removeClass('pwdWrite').addClass('pwdWriteShow');
				} else {
					$(this).parent().next().removeClass('pwdWriteShow').addClass('pwdWrite');
				}
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