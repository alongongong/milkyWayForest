$(function(){
	if($('#liNum').val() != 1 && $('#liNum').val() != '') {
		$('.active').removeClass('active');
		$('#'+$('#liNum').val()).addClass('active');
	}
});