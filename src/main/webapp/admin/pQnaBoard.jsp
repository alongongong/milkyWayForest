<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/milkyWayForest/css/admin.css">
<div class="card" id="pQnaBoardDiv">
  <div class="card-header">
    <h4 class="card-title"> 상품 리스트</h4>
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
    </div>
  </div>
</div>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function(){
	$.ajax({
		url: '/milkyWayForest/admin/getQnaBoard',
		type: 'post',
		success: function(data){
			alert(JSON.stringify(data));
		},
		error: function(err){
			console.log(err);
		}
	});
});
</script>