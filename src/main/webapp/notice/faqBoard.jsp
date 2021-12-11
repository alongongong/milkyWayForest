<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/milkyWayForest/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="/milkyWayForest/css/notice.css">
<form id="faqBoardForm">
	<div id="faqBoardFormDiv">
		<section>
			<legend>자주 묻는 질문</legend>
			<br>
			<div id="faqBoardNav">
				<div>
					<a href="/milkyWayForest/"><img src="/milkyWayForest/image/icon_home.png" alt="홈"></a> > 
					<a href="/milkyWayForest/notice/faqBoard?pg=1">자주 묻는 질문</a>
				</div>
			</div>
			<br>
			<div id="faqBoardSearchDiv">
				<div>
					<input type="text" id="faqBoardSearch" placeholder="검색어를 입력해 주세요." size="35">
					<input type="button" id="faqBoardSearchBtn" class="btn" value="검색">
				</div>
			</div>
			<br>
			<br>
			<table id="faqBoardTable" class="table">
				<tr>
					<th width="120" style="text-align:center;">글번호</th>
					<th>제목</th>
				</tr>
			</table>
			<br>
			<div id="boardPagingDiv"></div>
		</section>
	</div>
</form>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function(){
	$.ajax({
		url: '/milkyWayForest/notice/getFaqBoard',
		type: 'post',
		data: 'pg=${pg}',
		success: function(data) {
			// alert(JSON.stringify(data));
			$.each(data.list, function(index, items) {
				$('<tr>').append($('<td>',{
					align: 'center',
					text: items.faqCode
				})).append($('<td>').append($('<span>',{
					text: items.faqSubject,
					class: 'faqSubject'
				}))).appendTo($('#faqBoardTable'));
				$('<tr>',{
					class: 'faqContentHidden'
				}).append($('<td>',{
					colspan: '2',
					html: items.faqContent,
					style: 'padding: 40px 50px'
				})).appendTo($('#faqBoardTable'));
				
			});
			
			$('.faqSubject').click(function(){
				if($(this).parents('tr').next().prop('class')=='faqContentHidden')
					$(this).parents('tr').next().removeClass('faqContentHidden').addClass('faqContent');
				else $(this).parents('tr').next().removeClass('faqContent').addClass('faqContentHidden');
			});
			
			$('#boardPagingDiv').html(data.boardPaging);
		},
		error: function(err) {
			console.log(err);
		}
	});
});



function boardPaging(page){
	location.href="/milkyWayForest/notice/faqBoard?pg="+page;
}

</script>