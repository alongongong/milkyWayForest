<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/milkyWayForest/css/admin.css">
<div class="card" id="pGradeBenefitDiv">
	<div id="gradeBenefitWrap">
		<div><br>WELCOME<br><br></div>
		<div><br>GREEN<br><br></div>
		<div><br>GOLD<br><br></div>
		
		<div>
			<textarea id="welcomeBenefit" cols="37" rows="8"></textarea>
		</div>
		<div>
			<textarea id="greenBenefit" cols="38" rows="8"></textarea>
		</div>
		<div>
			<textarea id="goldBenefit" cols="37" rows="8"></textarea>
		</div>
	</div>
	
	<div id="gradeBenefitBtnWrap">
		<input type="button" id="benefitUpdateBtn" class="btn btn-secondary" value="수정" disabled>
	</div>
</div>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function(){
	$.ajax({
		url: '/milkyWayForest/admin/getGradeBenefit',
		type: 'post',
		success: function(data) {
			$.each(data, function(index, items){
				if(index == 0)
					$('#welcomeBenefit').val(items.gradeBenefit);
				else if(index == 1)
					$('#greenBenefit').val(items.gradeBenefit);
				else $('#goldBenefit').val(items.gradeBenefit);
			});
		},
		error: function(err) {
			console.log(err);
		}
	});
});
</script>