$(function(){
	$('#qnaWriteBtn').click(function(){

		/*$('#qnaBoardWriteForm').submit();*/
		
		var formData = new FormData($('#qnaBoardWriteForm')[0]);
		
		$.ajax({
			url: '/milkyWayForest/notice/qnaBoardWrite',
			type: 'post',
			enctype: 'multipart/form-data',
			processData: false,
			contentType: false,
			data: formData,
			success: function(data) {
				alert('글이 등록되었습니다.');
				location.href='/milkyWayForest/notice/qnaBoard';
			},
			error: function(err) {
				console.log(err);
			}
			
		});
	});
});