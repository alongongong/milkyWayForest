<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" href="/milkyWayForest/css/mypage.css">

<form id="mypageMyPost" name="mypageMyPost">
<div id="h1Div"><h1 style="font-size: 35px;">마이페이지</h1></div>
<div id="main-wrapper">
	<div id="main-sideNav" class="item">
		<jsp:include page="mypageSideNav.jsp"/>
	</div>

	<div id="main-topNav" class="item">
		<jsp:include page="mypageTopNav.jsp"/>	
	</div>
	<%----------------- 디폴트 설정 -----------------%>
	
	<div id="myQna-wrapper" class="item">
		<div id="myQna-title" class="navbar navbar-light">
			<span class="mb-0">나의 문의 & 답변 내역</span>
		</div>
		<input type="hidden" id="id" value="${memId }">
		
		<div id="myQna-state">		
			<table id="myQnaTable" class="table border-bottom">
				<thead>
					<tr>
						<td scope="col">번호</td>
						<td scope="col">분류</td>
						<td scope="col">제목</td>
						<td scope="col">작성자</td>
						<td scope="col">작성일</td>
						<td scope="col">답변상태</td>
					</tr>
				</thead>
				<tbody>
				</tbody>
			</table>
			<div id="result-div"></div>
			
			<div id="myQnaPagingDiv"></div>
		</div>
	</div>
	
</div><!-- main-wrapper -->
</form>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/milkyWayForest/js/mypage.js"></script>
<script>
$(function(){
	$('#myQnaTable tbody').empty();
	
	$.ajax({
		url: '/milkyWayForest/mypage/getMyQnaList?pg='+${pg},
		type: 'post',
		success: function(data){
			//alert(JSON.stringify(data));
			
			$.each(data.list, function(index, items){
				$('<tr>').append($('<td>',{
					text: items.qnaCode
				})).append($('<td>',{
					text: items.qnaQuestionType
				})).append($('<td>',{
				}).append($('<a>',{
					href: '/milkyWayForest/mypage/MyQnaView?qnaCode='+items.qnaCode+'&pg='+data.pg,
					text: items.qnaSubject,
					id: 'qnaSubject'+index,
					class: 'qnaSubject'
				}))).append($('<td>',{
					text: items.id
				})).append($('<td>',{
					text: items.qnaDate
				})).append($('<td>',{
					text: items.qnaAnswerCheck
				})).appendTo($('#myQnaTable tbody'));
			});
			
			$('#myQnaPagingDiv').html(data.boardPaging);
		},
		error: function(err){
			console.log(err);
		}
	});
});

function boardPaging(page){
	location.href="/milkyWayForest/mypage/mypageMyPost?pg="+page;
}
</script>
