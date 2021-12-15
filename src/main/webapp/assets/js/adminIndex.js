$(function(){
	if($('#liNum').val() != 1 && $('#liNum').val() != '') {
		$('#'+$('#liNum').val()).addClass('active');
	} else {
		$('#1').addClass('active');
	}
});


$('#logoutBtn').click(function(){
	$.ajax({
		url: '/milkyWayForest/admin/adminLogout',
		type: 'post',
		success: function(data) {
			location.href='/milkyWayForest/admin';
		},
		error: function(err) {
			console.log(err);
		}
	});
});