$(function(){
	$('#qnaWriteBtn').click(function(){
		$('#qnaBoardWriteCheck').empty();
		
		if($('#qnaQuestionType').val()=='0') {
		 	$('#qnaBoardWriteCheck').text('문의 유형을 선택해주세요.');
		} else if($('#qnaSubject').val()=='') {
		 	$('#qnaBoardWriteCheck').text('제목을 입력해주세요.');
		} else if($('#qnaContent').val()=='') {
		 	$('#qnaBoardWriteCheck').text('문의 내용을 입력해주세요.');
		} else if($('#qnaPwd').val()=='') {
		 	$('#qnaBoardWriteCheck').text('비밀번호를 입력해주세요.');
		} else {
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
					location.href='/milkyWayForest/notice/qnaBoard?pg=1';
				},
				error: function(err) {
					console.log(err);
				}
				
			});
		}
	});
});

// 파일첨부
function qnaAttachedFileName() {
	var file_name = document.getElementById("qnaAttachedFile").value;
	document.getElementById("upload-name").value = file_name;
}