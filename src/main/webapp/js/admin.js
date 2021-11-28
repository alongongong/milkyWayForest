$('#insertProductBtn').click(function(){
	$('#emptyDiv').empty();
	if($('#productCode').val()=='') {
		$('#emptuDiv').text('상품 코드를 입력해주세요.');
	} else if($('#productName').val()=='') {
		$('#emptyDiv').text('상품 이름을 입력해주세요.');
	} else if($('#productEngName').val()=='') {
		$('#emptyDiv').text('상품 영문 이름을 입력해주세요.');
	} else if($('#productUnit').val()=='') {
		$('#emptyDiv').text('상품 금액을 입력해주세요.');
	} else if($('#productOption').val()=='') {
		$('#emptyDiv').text('상품 옵션을 입력해주세요.');
	} else if($('#productRate').val()=='') {
		$('#emptyDiv').text('상품 할인율을 입력해주세요.');
	} else if($('#productSmallInfo').val()=='') {
		$('#emptyDiv').text('상품 설명을 입력해주세요.');
	} else if($('#productDetailInfo').val()==''){
		$('#emptyDiv').text('상세 설명을 입력해주세요.');
	} else {
		$.ajax({
			url: '/milkyWayForest/admin/pProductInsert',
			type: 'post',
			data: $('#pProductInsertForm').serialize(),
			success: function(data){
				if(confirm('상품 등록이 완료되었습니다. 상품 리스트로 이동하시겠습니까?')) {
					location.href='/milkyWayForest/admin/productList?dataNum=4';
				} else {
					location.href='/milkyWayForest/admin/productInsert?dataNum=5';
				}
			},
			error: function(err){
				console.log(err);
			}
			
		});
	}
});

$('#pQnaBoardTable').on('click', '.qnaSubject', function(){
	$('.pQnaContentClick').removeClass('pQnaContentClick').addClass('pQnaContent');
	$(this).next().find('td').removeClass('pQnaContent').addClass('pQnaContentClick');
	$(this).next().next().find('td').removeClass('pQnaContent').addClass('pQnaContentClick');
});