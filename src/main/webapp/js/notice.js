$(function(){
	$('#qnaWriteBtn').click(function(){

		$('#qnaBoardWriteForm').submit();
		
		/* $.ajax({
			url: '/milkyWayForest/notice/qnaBoardWrite',
			type: 'post',
			enctype: 'multipart/form-data',
			data: $('#qnaBoardWriteForm').serialize(),
			success: function(data) {
				alert('글이 등록되었습니다.');
				location.href='/milkyWayForest/notice/qnaBoard';
			},
			error: function(err) {
				console.log(err);
			}
			
		}); */
	});
});