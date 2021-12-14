<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/milkyWayForest/bootstrap/css/bootstrap.css">
<form id="pMemberListForm">
<div class="card" id="pQnaBoardDiv">
  <div class="card-header">
    <h4 class="card-title"> 회원 리스트</h4>
	<div id="stockSearch">
		
	</div>
  </div>
  <div class="card-body">
    <div class="">
      <table class="table" id="pQnaBoardTable">
        <thead class=" text-primary">
          <th>아이디</th>
          <th>닉네임</th>
          <th>이름</th>
          <th>성별</th>
          <th>전화번호</th>
          <th>이메일</th>
          <th>생년월일</th>
          <th>등급</th>
          <th>적립금</th>
          <th>쿠폰수</th>
          <th>최근 접속</th>
          <th>가입경로</th>
          <th>가입일자</th>
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
</form>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function(){
	$.ajax({
		url: '/milkyWayForest/admin/getMemberList?pg='+${pg},
		type: 'post',
		success: function(data){
			// alert(JSON.stringify(data));
			$.each(data.list, function(index, items){
				$('<tr>').append($('<td>',{
					text: items.id
				})).append($('<td>',{
					text: items.nickname
				})).append($('<td>',{
					text: items.name
				})).append($('<td>',{
					text: items.gender
				})).append($('<td>',{
					text: items.tel1+"-"+items.tel2+"-"+items.tel3
				})).append($('<td>',{
					text: items.email1+"@"+items.email2
				})).append($('<td>',{
					text: items.yy+'-'+items.mm+'-'+items.dd
				})).append($('<td>',{
					text: items.memberGrade
				})).append($('<td>',{
					text: items.savedMoney
				})).append($('<td>',{
					text: items.couponName
				})).append($('<td>',{
					text: items.loginTime
				})).append($('<td>',{
					text: items.writePath
				})).append($('<td>',{
					text: items.writeDate
				})).appendTo($('#pQnaBoardTable'));
			});
			
			$('#boardPagingDiv').html(data.boardPaging);
		},
		error: function(err){
			console.log(err);
		}
	});
});
</script>