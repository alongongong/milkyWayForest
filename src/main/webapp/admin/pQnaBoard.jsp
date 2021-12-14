<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/milkyWayForest/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="/milkyWayForest/css/admin.css">
<div class="card" id="pQnaBoardDiv">
  <div class="card-header">
    <h4 class="card-title"> 문의 게시판</h4>
	<div id="stockSearch">
		
	</div>
  </div>
  <div class="card-body">
    <div class="">
      <table class="table" id="pQnaBoardTable">
        <thead class=" text-primary">
          <th width="120">
            말머리
          </th>
          <th width="70">
            글번호
          </th>
          <th>
          	제목
          </th>
          <th width="120">
            작성자
          </th>
          <th width="120">
          	작성일자
          </th>
          <th width="120">
          	답변여부
          </th>
        </thead>
        <tbody>
        </tbody>
      </table>
      <br>
      <div id="boardPagingDiv"></div>
      <br><br>
    </div>
  </div>
</div>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/milkyWayForest/js/admin.js"></script>
<script type="text/javascript">
$(function(){
	$('#pQnaBoardTable tbody').empty();
	$.ajax({
		url: '/milkyWayForest/admin/getQnaBoard?pg='+${pg},
		type: 'post',
		success: function(data){
			
			$.each(data.list, function(index, items){
				$('<tr>',{
					class: 'qnaSubject'
				}).append($('<td>',{
					text: items.qnaQuestionType
				})).append($('<td>',{
					text: items.qnaCode
				})).append($('<td>',{
					text: items.qnaSubject,
					style: 'text-align: left; padding: 20px;'
				})).append($('<td>',{
					text: items.id
				})).append($('<td>',{
					text: items.qnaDate
				})).append($('<td>',{
					text: items.qnaAnswerCheck
				})).appendTo($('#pQnaBoardTable tbody'));
				
				
				$('<tr>').append($('<td>',{
					colspan: '6',
					text: items.qnaContent,
					style: 'padding: 40px 20px;',
					class: 'pQnaContent'
				})).appendTo($('#pQnaBoardTable tbody'));
				
				$('<tr>').append($('<td>',{
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
					style: 'width: 80%; margin: 5px; height: 60px; vertical-align: middle; resize: none;'
				})).append($('<input>',{
					type: 'button',
					value: '입력',
					class: 'btn qnaCommentBtn',
					id: 'commentInsertBtn'+index,
					style: 'height: 60px; background:#154520; color: white; font-weight: bold;'
				}))).appendTo($('#pQnaBoardTable tbody'));
				
				
				$.ajax({
					url: '/milkyWayForest/admin/getQnaCommentContent',
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
								id: 'commentUpdataBtn'+index1,
								class: 'btn commentUpdateBtn'
							})).append($('<input>',{
								type: 'button',
								value: '삭제',
								id: 'commentDeleteBtn'+index1,
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
				
				
				$('#commentInsertBtn'+index).click(function(){
					if($('#qnaComment'+index).val() == ''){
						alert('댓글을 입력하세요.');
					} else {
						$.ajax({
							url: '/milkyWayForest/admin/qnaCommentInsert',
							type: 'post',
							data: 'commentContent='+$('#qnaComment'+index).val()+'&qnaCode='+items.qnaCode,
							success: function(data){
								alert('작성완료');
								$('#commentDiv'+index).append($('<div>',{
									style: 'margin: 0 auto; font-size: 14px;',
									class: 'commentContent'
								}).append($('<p>').append($('<span>', {
									text: '${adminId}',
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
								}))).append($('<p>', {
									text: $('#qnaComment'+index).val(),
								})));
								
								$('#qnaComment'+index).val('');

								
								
							},
							error: function(err){
								console.log(err);
							}
						});
					}
				});
				
				
				
			});
			
			$('#boardPagingDiv').html(data.boardPaging);
			
			
		},
		error: function(err){
			console.log(err);
		}
	});
	
});

function boardPaging(page){
	location.href="/milkyWayForest/admin/qnaBoard?dataNum=10&pg="+page;
}
</script>