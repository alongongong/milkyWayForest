<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/milkyWayForest/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="/milkyWayForest/css/notice.css">
<form id="noticeBoardForm">
	<legend>공지사항</legend>
	<br>
	<div id="noticeBoardNav">
		<div>
			<a href=""><img src="/milkyWayForest/image/icon_home.png" alt="홈"></a> > 
			<a href="">notice</a> > 
			<a href="">공지사항</a>
		</div>
	</div>
	<br>
	<div id="noticeBoardSearchDiv">
		<div>
			<input type="text" id="noticeBoardSearch" placeholder="검색어를 입력해 주세요." size="35">
			<input type="button" id="noticeBoardSearchBtn" class="btn table" value="검색">
		</div>
	</div>
	<br>
	<br>
	<table id="noticeBoardTable" class="table">
		<tr>
			<th>NO</th>
			<th>제목</th>
			<th>날짜</th>
			<th>조회수</th>
		</tr>
	</table>
</form>