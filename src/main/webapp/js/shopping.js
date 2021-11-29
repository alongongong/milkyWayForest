$(function(){
	$('.shoppingDetailImg li:eq(0)').click(function(){
		$('#bigImg').attr("src","/milkyWayForest/image/C001.jpg");
		$('.shoppingDetailImg li:eq(0) img').css('border', '1px solid  #154520');
		$('.shoppingDetailImg li:eq(1) img').css('border', '1px solid silver');
		$('.shoppingDetailImg li:eq(2) img').css('border', '1px solid silver');
	});
	$('.shoppingDetailImg li:eq(1)').click(function(){
		$('#bigImg').attr("src","/milkyWayForest/image/C002.jpg");
		$('.shoppingDetailImg li:eq(1) img').css('border', '1px solid  #154520');
		$('.shoppingDetailImg li:eq(0) img').css('border', '1px solid silver');
		$('.shoppingDetailImg li:eq(2) img').css('border', '1px solid silver');
	});
	$('.shoppingDetailImg li:eq(2)').click(function(){
		$('#bigImg').attr("src","/milkyWayForest/image/C003.jpg");
		$('.shoppingDetailImg li:eq(2) img').css('border', '1px solid  #154520');
		$('.shoppingDetailImg li:eq(0) img').css('border', '1px solid silver');
		$('.shoppingDetailImg li:eq(1) img').css('border', '1px solid silver');
	});
	
	$('#plus').click(function(){
		$('.length input').val(parseInt($('.length input').val())+1);
	});
	
	$('#minus').click(function(){
		
		$('.length input').val(parseInt($('.length input').val())-1);
		if($('.length input').val() < 1) {
			$('.length input').val(1);
		}		
	});

});

$(function(){
	$.ajax({
		url: '/milkyWayForest/shopping/getShoppingDetail',  
		type: 'post',
		dataType: 'json',
		success : function(data) {
			console.log(JSON.stringify(data));
			
			$.each(data, function(index,items) {
				$('<tr>')
				.append($('<td>', {
					colspan: '2',
					text: items.productName,
					id: 'productKorName'
				
				}))
				.append($('<tr>')
				.append($('<td>' , {
					colspan: '2',
					text: items.productEngName,
					id: 'productEngName'
				
				})))
				
				.append($('<tr>')
				.append($('<td>' , {
					colspan: '2',
					text: items.productSmallInfo,
				})))
				
				.append($('<tr>')
				.append($('<td>' , {
					text: 가격,
				}))
				.append($('<td>' , {
					text: items.productUnit,
					class: price
				
				})))
			
			});
			
			
		},
		error: function(err) {
			console.log(err);
		}
	});	
});







