<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/milkyWayForest/css/notice.css">
<form id="eventViewForm">
	<legend>이벤트</legend>
	<br>
	<div id="eventViewBoardNav">
		<div>
			<a href=""><img src="/milkyWayForest/image/icon_home.png" alt="홈"></a> > 
			<a href="">notice</a> > 
			<a href="">이벤트</a>
		</div>
	</div>
	<br><br>
	<table id="eventViewTable">
		<tr>
			<th id="eventViewSubject">제목
				<div id="eventViewDate">날짜</div>
			</th>
		</tr>
		<tr>
			<td>내용</td>
		</tr>
	</table>
	<br>
	<input type="button" id="eventListBtn" value="목록">
</form>