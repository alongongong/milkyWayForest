<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" href="/milkyWayForest/css/mypage.css">

<style type="text/css">
#mypageMyinfo #contents{
	margin-bottom: 10px;
}

</style>
<form id="mypageMyInfo" name="mypageMyInfo">
<div id="main-wrapper">
	<div id="main-sideNav" class="item">
		<jsp:include page="mypageSideNav.jsp"/>
	</div>

	<div id="main-topNav" class="item">
		<jsp:include page="mypageTopNav.jsp"/>	
	</div>
	<%----------------- 디폴트 설정 -----------------%>
	<div id="myPayment-state">
		<div align="right" id="abcd">
			<input type="button" id="contents"value="배송지 등록" onclick="showPopup();">
		</div>
		<div>
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>배송지 관리</th>
					<tr>
						<th scope="col">배송지 이름</th>
						<th scope="col">주소</th>
						<th scope="col">연락처</th>
						<th scope="col">수정/삭제</th>
					</tr>
				</thead>
			</table>
		</div>	
	</div>

</div>
    
</form>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
function showPopup(){
	window.open("mypageShpMngWriteForm.jsp","배송지 등록","width=600,height=700,left=200,top=110");
}
</script>		
		