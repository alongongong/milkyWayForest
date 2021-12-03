$(function(){
	
	$('.shoppingDetailImg li:eq(0)').click(function(){
		$('#bigImg').attr("src",'/milkyWayForest/productImage/'+items.productImageName);
		$('.shoppingDetailImg li:eq(0) img').css('border', '1px solid  #154520');
		$('.shoppingDetailImg li:eq(1) img').css('border', '1px solid silver');
		$('.shoppingDetailImg li:eq(2) img').css('border', '1px solid silver');
	});
	$('.shoppingDetailImg li:eq(1)').click(function(){
		$('#bigImg').attr("src","/milkyWayForest/productImage/'+items.productImageName");
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
			











