$(function(){


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
			











