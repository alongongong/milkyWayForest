$(function(){
	$('#Allheader .menu a').mouseenter(function(){
		$('#headerSection').stop().animate({height: '450'}, 500);
		
		$('#headerSection').css('background-color', 'rgba(255,255,255,0.95)');
		$('#headerSection').css('transition-property', 'background-color');
		$('#headerSection').css('transition-duration', '0.5s');
		$('#headerSection').css('box-shadow', '3px 0 10px rgba(120,120,120,0.1)');
		
		$('.menu > li').css('padding', '0 1rem 0 0');
		$('.menu > li').css('transition-property', 'padding');
		$('.menu > li').css('transition-duration', '0.5s');
	
		$('.menu > li > a').css('color', 'black');
		$('.menu > li > a').css('font-size', '1rem');
		$('.menu > li > a').css('transition-property', 'color, font-size');
		$('.menu > li > a').css('transition-duration', '0.5s');
	
		$('#Allheader header > div .spot li a').css('font-size', '.8rem');
		$('#Allheader header > div .spot li a').css('font-weight', 'bold');
		$('#Allheader header > div .spot li a').css('transition-property', 'font-weight, font-size');
		$('#Allheader header > div .spot li a').css('transition-duration', '0.5s');
		
		
		
		$('#headerSection').hover(function(){
			
		}, function(){
			$('#headerSection').stop().animate({height: '120'}, 500);
			
			$('#headerSection').css('background-color', 'rgba(255,255,255,0.5)');
			$('#headerSection').css('transition-property', 'background-color');
			$('#headerSection').css('transition-duration', '1s');
			$('#headerSection').css('box-shadow', 'none');
			
			$('.menu > li').css('padding', '0');
			$('.menu > li').css('transition-property', 'padding');
			$('.menu > li').css('transition-duration', '1s');
				
			$('.menu > li > a').css('color', '#444');
			$('.menu > li > a').css('font-size', '.9rem');
			$('.menu > li > a').css('transition-property', 'color, font-size');
			$('.menu > li > a').css('transition-duration', '1s');
			
			$('#Allheader header > div .spot li a').css('font-size', '.7rem');
			$('#Allheader header > div .spot li a').css('font-weight', 'bold');
			$('#Allheader header > div .spot li a').css('transition-property', 'font-weight, font-size');
			$('#Allheader header > div .spot li a').css('transition-duration', '0.5s');

		});
	});
});