<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<input type="button" id="open" value="상담관리">
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function() {
	$('#open').click(function() {
		window.open("https://desk.channel.io/#/signin?redirectTo=/channels");		
	});
});

</script>