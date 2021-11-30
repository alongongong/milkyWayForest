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
			$('#korsubjectSpan').text(items.productName);
			$('#engsubjectSpan').text(items.productEngName);
			$('#productSmallinfoSpan').text(items.productSmallInfo);
			$('#productpriceSpan').text(items.productUnit);
			$('#productOptionSpan2').text(items.productOption);
			
			if(index==0) {
			$('#bigImg').attr('src', '/milkyWayForest/productImage/'+items.productImageName);
			$('#img1').attr('src', '/milkyWayForest/productImage/'+items.productImageName);}
			else if(index==1) {
			$('#img2').attr('src', '/milkyWayForest/productImage/'+items.productImageName);}
			else if( index==2) {
			$('#img3').attr('src', '/milkyWayForest/productImage/'+items.productImageName);}
		});
		
		},
		error: function(err) {
			console.log(err);
		}
	});	
});







