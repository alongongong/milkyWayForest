$(function() {
	$('#fullpage').fullpage({
		//options here
		autoScrolling:true,
		scrollHorizontally: true,
		navigation:true,
		navigation:'right'
	});
});
//좌우슬라이딩
/*setInterval(function(){
    $('#imgholder>li').delay(10000);
    $('#imgholder>li').animate({marginLeft: "-100%"})
    $('#imgholder>li').delay(10000);
    $('#imgholder>li').animate({marginLeft: "100%"})
    $('#imgholder>li').delay(10000);
    $('#imgholder>li').animate({marginLeft: "0px"})
});
*/
