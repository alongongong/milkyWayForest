<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/milkyWayForest/css/admin.css">
<div class="card" id="pQnaBoardDiv">
  <div class="card-header">
    <h4 class="card-title"> 문의 게시판</h4>
	<div id="stockSearch">
		
	</div>
  </div>
  <div class="card-body">
    <div class="table-responsive">
      <table class="table" id="pQnaBoardTable">
        <thead class=" text-primary">
          <th>
          	<input type="checkbox" id="qnaAllCheck">
          </th>
          <th>
            말머리
          </th>
          <th>
            글번호
          </th>
          <th>
          	제목
          </th>
          <th>
            작성자
          </th>
          <th>
          	작성일자
          </th>
          <th>
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
<script type="text/javascript">
$(function(){
	$('#pQnaBoardTable tbody').empty();
	$.ajax({
		url: '/milkyWayForest/admin/getQnaBoard?pg='+${pg},
		type: 'post',
		success: function(data){
			
			$.each(data.list, function(index, items){
				$('<tr>').append($('<td>').append($('<input>',{
					type: 'checkbox',
					id: 'qnaCheck'+index,
					class: 'qnaCheck'
				}))).append($('<td>',{
					text: items.qnaQuestionType
				})).append($('<td>',{
					text: items.qnaCode
				})).append($('<td>',{
					text: items.qnaSubject
				})).append($('<td>',{
					text: items.id
				})).append($('<td>',{
					text: items.qnaDate
				})).append($('<td>',{
					text: items.qnaAnswerCheck
				})).appendTo($('#pQnaBoardTable tbody'));
			});
			
			$('#boardPagingDiv').html(data.boardPaging);
			
			$('#qnaAllCheck').click(function(){
				if($(this).is('checked')) {
					$('.qnaCheck').prop('checked', false);	
				} else {
					$('.qnaCheck').prop('checked', true);
				}
			});
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