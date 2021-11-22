$(function(){
	$('.menuDetailImg li:eq(0)').click(function(){
		$('#bigImg').attr("src","/milkyWayForest/image/C001.jpg");
		$('.menuDetailImg li:eq(0) img').css('border', '1px solid  #154520');
		$('.menuDetailImg li:eq(1) img').css('border', '1px solid silver');
		$('.menuDetailImg li:eq(2) img').css('border', '1px solid silver');
	});
	$('.menuDetailImg li:eq(1)').click(function(){
		$('#bigImg').attr("src","/milkyWayForest/image/C002.jpg");
		$('.menuDetailImg li:eq(1) img').css('border', '1px solid  #154520');
		$('.menuDetailImg li:eq(0) img').css('border', '1px solid silver');
		$('.menuDetailImg li:eq(2) img').css('border', '1px solid silver');
	});
	$('.menuDetailImg li:eq(2)').click(function(){
		$('#bigImg').attr("src","/milkyWayForest/image/C003.jpg");
		$('.menuDetailImg li:eq(2) img').css('border', '1px solid  #154520');
		$('.menuDetailImg li:eq(0) img').css('border', '1px solid silver');
		$('.menuDetailImg li:eq(1) img').css('border', '1px solid silver');
	});

});	