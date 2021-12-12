$(function(){
	$('#Allheader .menu a').mouseenter(function(){
		$('#headerSection').stop().animate({height: '450'}, 200);
		$('#headerSection').css('background-color', 'rgba(255,255,255,0.8)');
		$('.menu > li').css('padding', '0 1rem 0 0');
		$('.menu > li > a').css('color', 'black');
		$('.menu > li > a').css('font-size', '1rem');
		$('#Allheader header > div .spot li a').css('font-size', '.8rem');
		$('#Allheader header > div .spot li a').css('font-weight', 'bold');
		
		$('#headerSection').hover(function(){
			
		}, function(){
			$('#headerSection').stop().animate({height: '120'}, 200);
			$('#headerSection').css('background-color', 'rgba(255,255,255,0.5)');
			$('.menu').css('padding', '16px 0 10px 4rem');	
			$('.menu > li').css('padding', '0');
			$('.menu > li > a').css('color', '#444');
			$('.menu > li > a').css('font-size', '.9rem');
			$('#Allheader header > div .spot li a').css('font-size', '.7rem');
			$('#Allheader header > div .spot li a').css('font-weight', 'bold');
		});
	});
});