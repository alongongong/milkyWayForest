$(function(){
	$('#qnaWriteBtn').click(function(){
		$.ajax({
			url: '/milkyWayForest/notice/qnaBoardWrite',
			type: 'post',
			data: $('#qnaBoardWriteForm').serialize(),
			success: function(data) {
				alert(JSON.stringify(data));
			},
			error: function(err) {
				console.log(err);
			}
		});
	});
	
	$('')
});