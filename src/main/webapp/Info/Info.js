$('bi bi-chevron-down').click(function(){
        if ($('.bi bi-chevron-down').css('display') == 'none') {
            display(show);
        } else {
            $('.bi bi-chevron-down').css('display', 'block');
			display(none);
        }
  });
