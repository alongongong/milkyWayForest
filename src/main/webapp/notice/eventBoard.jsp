<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/milkyWayForest/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="/milkyWayForest/css/notice.css">
<form id="eventBoardForm">
	<legend>이벤트</legend>
	<br>
	<div id="eventBoardNav">
		<div>
			<a href=""><img src="/milkyWayForest/image/icon_home.png" alt="홈"></a> > 
			<a href="">notice</a> > 
			<a href="">이벤트</a>
		</div>
	</div>
	<br>
	<div id="eventBoardNowDiv">
		<div>진행 이벤트</div>
	</div>
	<div id="eventBoardNowBody">
		<!-- ajax로 append -->
	</div>
	<br>
	<br>
	
	<table id="eventBoardTable" class="table">
	</table>
	<br><br>
	<div id="eventBoardEndDiv">
		<div>종료 이벤트</div>
	</div>
	<div id="eventBoardNowBody">
		<!-- ajax로 append -->
	</div>
	<br><br>
	<table id="eventBoardTable" class="table">
	</table>
</form>