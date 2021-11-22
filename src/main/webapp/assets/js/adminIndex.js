$(function(){
	if($('#liNum').val() != 1 && $('#liNum').val() != '') {
		$('#'+$('#liNum').val()).addClass('active');
	} else {
		$('#1').addClass('active');
	}
});