$(function(){
	// 메뉴 클릭하면 소메뉴가 나타나게 하기.
	$('.navMenu').click(function(){
		$('.navClickMenu').parent().css('background', '#dddddd');
		$('.navClickMenu').removeClass('navClickMenu').addClass('navMenu');
		$('.navSubClickMenu').removeClass('navSubClickMenu').addClass('navSubMenu');
		$(this).removeClass('navMenu').addClass('navClickMenu');
		$(this).parent().css({'background' : '#999'});
		$(this).parent().children().not(this).removeClass('navSubMenu').addClass('navSubClickMenu');
	});
	
})