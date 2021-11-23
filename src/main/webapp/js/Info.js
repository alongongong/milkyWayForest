$(function(){
       $('.nav_Info').click(function(){
       		if($('#noneDiv').css('display')=='none'){
       			$('#noneDiv').show();
       			$('.bi-chevron-down').hide();
       			$('.bi-chevron-up').show();
			} else {
	       		$('#noneDiv').hide();
	       		$('.bi-chevron-down').show();
	       		$('.bi-chevron-up').hide();
	       	}
       	});
    });	    
        
            