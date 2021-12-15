<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" href="/milkyWayForest/css/mypage.css">

<form id="mypageShpMngListForm" name="mypageMyInfo">
<div id="h1Div"><h1 style="font-size: 35px;">마이페이지</h1></div>
<div id="main-wrapper">
	<div id="main-sideNav" class="item">
		<jsp:include page="mypageSideNav.jsp"/>
	</div>

	<div id="main-topNav" class="item">
		<jsp:include page="mypageTopNav.jsp"/>	
	</div>
	<%----------------- 디폴트 설정 -----------------%>
	<div id="myPayment-state" class="item">
		<div align="right" id="buttonWrap">
			<input type="button" class="btn" id="WriteBtn"value="배송지 등록" onclick="showPopup();">
		</div>
		<div id="myPayment-title" class="navbar navbar-light">
			<span class="mb-0">배송지 관리</span>
		</div>
		<div>
			<table id="mypageShpMngTable" class="table border-bottom" style="width:820px;">
				<thead>
					<tr>
						<th scope="col" style="text-align: center;">배송지명</th>
						<th scope="col" style="text-align: center;">주소</th>
						<th scope="col" style="text-align: center;">연락처</th>
						<th scope="col" width="350px;">수정/삭제</th>
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
	window.open("/milkyWayForest/mypage/mypageShpMngWriteForm","배송지 등록","width=600,height=700,left=200,top=110");
}
$(function(){
	$.ajax({
		url:'/milkyWayForest/mypage/getShpMngList',
		type:'post',
		dataType:'json',
		success:function(data){
			console.log(JSON.stringify(data));
			$.each(data, function(index, items){
				$('<tr/>').append($('<td>',{
					width:200,
					align:'center',
					text:items.shipNickname
				})).append($('<td>',{
					width:800,
					align:'center',
					text:items.shipZipcode+ " " +items.shipAddr1+ " "+items.shipAddr2
				})).append($('<td>',{
					width:300,
					align:'center',
					text:items.shipTel1+ "-" + items.shipTel2 + "-" +items.shipTel3
				})).append($('<td>',{
					width:200
				}).append($('<input>',{
					type:'button',
					align:'center',
					value:'수정',
					class:'btn',
					id:'modifyBtn',
					onclick:'showPopup1('+items.shipCode+');'
				})).append($('<input>',{
					type:'hidden',
					value:items.shipCode
				})).append($('<input>',{
					type:'button',
					align:'center',
					value:'삭제',
					class:'btn',
					id:'deleteBtn',
					onclick:'showPopup2('+items.shipCode+');'
				}))).appendTo($('#mypageShpMngTable'));
			});
		},
		error:function(err){
			console.log(err);
		}
	});
});

function showPopup1(shipCode){
	window.open("/milkyWayForest/mypage/mypageShpMngModifyForm?shipCode="+shipCode,"배송지 수정","width=600,height=700,left=200,top=110");
}
function showPopup2(shipCode){
	if(confirm('삭제하시겠습니까?')){
		$.ajax({
			url: '/milkyWayForest/mypage/deleteShpMng?shipCode='+shipCode,
			type: 'get',
			success: function(data) {           
				alert('글이 삭제되었습니다.');
				location.href='/milkyWayForest/mypage/mypageShpMng'
			},
			error: function(err) {
				console.log(err);
			}
		});
	} 
}
/* $(document).on('click', '.deleteBtn', function(){
	alert("안녕하세요");
	alert(${shipCode});
	 if(confirm('삭제하시겠습니까?')){
		$.ajax({
			url: '/milkyWayForest/mypage/deleteShpMng?shipCode=${shipCode}',
			type: 'get',
			success: function(data) {           
				alert('글이 삭제되었습니다.');
				
			},
			error: function(err) {
				console.log(err);
			}
		});
	} 
}); */
</script>		
		