<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/milkyWayForest/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="/milkyWayForest/css/notice.css">
<form id="qnaBoardForm">
	<legend>Q&A</legend>
	<br>
	<div id="qnaBoardNav">
		<div>
			<a href="/milkyWayForest/"><img src="/milkyWayForest/image/icon_home.png" alt="홈"></a> > 
			<a href="/milkyWayForest/notice/qnaBoard?pg=1">Q&A</a>
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
		<input type="button" id="qnaBoardWriteBtn" class="btn" value="글쓰기">
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
			// alert(JSON.stringify(data));
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
					style: 'vertical-align: middle; text-align: center; padding: 60px;'
				}).append($('<input>',{
					type: 'text',
					placeholder: '비밀번호 입력',
					style: 'margin-right: 5px; padding: 3px; outline: none;',
					class: 'pwdInput'
				})).append($('<input>',{
					type: 'button',
					value: '입력',
					id: 'pwdBtn'+index,
					class: 'btn pwbWriteBtn'
				})).append($('<div>',{
					class: 'qndPwdCheck'
				}))).appendTo($('#qnaBoardTable tbody'));
				
				if(items.qnaImage1 == null) {
					$('<tr>', {
						class: 'contentHide'
					}).append($('<td>', {
						colspan: '8',
						text: items.qnaContent,
						style: 'padding: 80px 80px 120px 80px;'
					})).appendTo($('#qnaBoardTable tbody'));
				} else if(items.qnaImage2 == null){
					$('<tr>', {
						class: 'contentHide'
					}).append($('<td>', {
						colspan: '8',
						text: items.qnaContent,
						style: 'padding: 80px 80px 120px 80px;'
					}).append($('<div>',{
						style: 'width: 30%; margin-top: 30px;'
					}).append($('<img>',{
						src: '/milkyWayForest/storage/'+items.qnaImage1,
						style: 'margin: 20px; width: 40%;'
					})))).appendTo($('#qnaBoardTable tbody'));
				} else {
					$('<tr>', {
						class: 'contentHide'
					}).append($('<td>', {
						colspan: '8',
						text: items.qnaContent,
						style: 'padding: 80px 80px 120px 80px;'
					}).append($('<div>',{
						style: 'width: 30%; margin-top: 30px;'
					}).append($('<img>',{
						src: '/milkyWayForest/storage/'+items.qnaImage1,
						style: 'margin: 20px; width: 40%;'
					}).append($('<img>',{
						src: '/milkyWayForest/storage/'+items.qnaImage2,
						style: 'margin: 20px; width: 40%;'
					}))))).appendTo($('#qnaBoardTable tbody'));
				}
				
				$('<tr>',{
					class: 'contentHide'
				}).append($('<td>',{
					colspan: '6',
					text: items.qnaContent,
					style: 'padding: 20px;',
					class: 'pQnaContent'
				})).appendTo($('#qnaBoardTable tbody'));
				
				$('<tr>',{
					class: 'contentHide'
				}).append($('<td>',{
					colspan: '6',
					style: 'padding: 10px 10px 20px 10px;',
					class: 'pQnaContent'
				}).append($('<div>',{
					id: 'commentDiv'+index,
					align: 'left',
					background: '#ccc'
				})).append($('<textarea>',{
					type: 'text',
					id: 'qnaComment'+index,
					style: 'width: 80%; margin: 5px; height: 60px; vertical-align: middle'
				})).append($('<input>',{
					type: 'button',
					value: '입력',
					class: 'btn qnaCommentBtn',
					id: 'commentInsertBtn'+index,
					style: 'height: 60px;'
				}))).appendTo($('#qnaBoardTable tbody'));
			
				
				$('#pwdBtn'+index).click(function(){
					$('.qndPwdCheck').text('');
					if(items.qnaPwd == $(this).prev().val()){
						$('.pwdWriteShow').removeClass('pwdWriteShow').addClass('pwdWrite');
						$(this).parent().parent().next().removeClass('contentHide').addClass('contentShow');
						$(this).parent().parent().next().next().removeClass('contentHide').addClass('contentShow');
					} else {
						$('.qndPwdCheck').empty();
						$(this).next().text('비밀번호가 일치하지 않습니다.');
					}
				});
				
				
				
				$.ajax({
					url: '/milkyWayForest/notice/getQnaComment',
					type: 'post',
					data: 'qnaCode='+items.qnaCode,
					success: function(data) {
						$.each(data, function(index1, items){
							$('#commentDiv'+index).append($('<p>',{
								class: 'commentContent'
							}).append($('<span>', {
								text: items.id,
								style: 'margin: 0 10px;'
							})).append($('<input>',{
								type: 'button',
								value: '수정',
								id: 'commentUpdataBtn'+index,
								class: 'btn commentUpdateBtn'
							})).append($('<input>',{
								type: 'button',
								value: '삭제',
								id: 'commentDeleteBtn'+index,
								class: 'btn commentDeleteBtn'
							})).append($('<p>', {
								text: items.commentContent
							})));
						});
					},
					error: function(err) {
						console.log(err);
					}
				});
				
				
			});
			
			$('.qnaSubject').click(function() {
				$('.qndPwdCheck').text('');
				$('.pwdInput').val('');
				if($(this).parent().next().attr('class')=='pwdWrite') {
					$('.pwdWriteShow').removeClass('pwdWriteShow').addClass('pwdWrite');
					$(this).parent().next().removeClass('pwdWrite').addClass('pwdWriteShow');
					$('.contentShow').removeClass('contentShow').addClass('contentHide');
				} else {
					$(this).parent().next().removeClass('pwdWriteShow').addClass('pwdWrite');
				}
			});
			
			$('#qnaBoardPaging').html(data.boardPaging);
			
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