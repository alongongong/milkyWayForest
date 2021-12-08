$(function(){
	$('#shoppingDetailForm #purchaseBtn').click(function(){
		$.ajax({
			url: '/milkyWayForest/payment/cartInsert',
			type: 'post',
			data: $('#shoppingDetailForm').serialize(),
			success: function(data) {
				alert(data);
				location.href='/milkyWayForest/payment?cartCode='+data;
			},
			error: function(err) {
				console.log(err);
			}
			
		});
	});
});
