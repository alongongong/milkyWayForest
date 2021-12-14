<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/milkyWayForest/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="/milkyWayForest/css/admin.css">
<form id="pReviewBoardForm">
<div class="card" id="pReviewBoardDiv">
  <div class="card-header">
    <h4 class="card-title"> 상품 후기 관리</h4>
	<div id="stockSearch">
		
	</div>
  </div>
  <div class="card-body">
    <div class="">
	  <table id="reviewTable" class="table">
	  	<thead class=" text-primary">
	  		<tr>
	  			<th>상품명</th>
	  			<th>별점</th>
	  			<th>후기</th>
	  			<th>작성자</th>
	  			<th>작성일자</th>
	  		</tr>
	  	</thead>
	  	<tbody></tbody>
	  </table>
      <br>
      <div id="boardPagingDiv"></div>
      <br><br>
    </div>
  </div>
</div>
</form>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function(){
	$.ajax({
		url: '/milkyWayForest/admin/getReview?pg=1',
		type: 'post',
		success: function(data) {
			$.each(data.list, function(index, items){
				$('<tr>').append($('<td>',{
					text: items.productName
				})).append($('<td>',{
					id: 'reviewLike'+index
				})).append($('<td>',{
					text: items.reviewContent
				})).append($('<td>',{
					text: items.id
				})).append($('<td>',{
					text: items.reviewDate
				})).appendTo($('#reviewTable tbody'));
				
				var reviewStar = '';
				
				for(var i=0; i< items.reviewLike; i++) {
					reviewStar += '<img width="20px" height="20px" src="https://cdn-icons-png.flaticon.com/512/1163/1163655.png">';
				}
				
				$('#reviewLike'+index).html(reviewStar);
				
				
			});
			
			$('#boardPagingDiv').html(data.boardPaging);
		},
		error: function(err) {
			console.log(err);
		}
	});
});

function boardPaging(page){
	location.href = "/milkyWayForest/admin/getReview?pg="+page
}
</script>