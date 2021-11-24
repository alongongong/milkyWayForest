<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/milkyWayForest/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="/milkyWayForest/css/notice.css">

<div id="qnaBoardWriteDiv">
	<div id="qnaBoardWriteInfo">
		<strong>고객님의 즐겁고 행복한 시간을 위해 정성을 다하고 있습니다. <br>
				이용하시면서 생기는 문의 사항을 알려주세요. 친절한 답변 드리겠습니다.</strong>
		<ul>
			<li>고객의 소리 운영시간 : 09:00 - 18:00(연중무휴)</li>
		</ul>
		<input type="button" value="나의 문의 내역 보기" id="myQnaList" class="btn btn-secondary">
	</div>
	<form id="qnaBoardWriteForm" method="post" enctype="multipart/form-data">
		<table id="qnaBoardWriteTable" class="table">
			<tr>
				<td width="200px">문의 유형</td>
				<td>
					<select id="qnaQuestionType" name="qnaQuestionType">
						<option>문의 유형</option>
						<option id="productType">상품 문의</option>
						<option id="shipType">배송 문의</option>
						<option id="cancelType">취소/교환/반품 문의</option>
						<option id="etcType">기타 문의</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>제목</td>
				<td>
					<input type="text" id="qnaSubject" name="qnaSubject">
				</td>
			</tr>
			<tr>
				<td>내용</td>
				<td>
					<textarea id="qnaContent" rows="17"></textarea>
				</td>
			</tr>
			<tr>
				<td>글 비밀번호</td>
				<td>
					<input type="password" id="qnaPwd" name="qnaPwd">
				</td>
			</tr>
			<tr>
				<td>이미지 첨부파일1</td>
				<td>
					<input type="file" id="qnaImage1" name="qnaImage1">
				</td>
			</tr>
			<tr>
				<td>이미지 첨부파일2</td>
				<td>
					<input type="file" id="qnaImage2" name="qnaImage2">
				</td>
			</tr>
			<tr>
				<td> </td>
				<td></td>
			</tr>
		</table>
		<div id="qnaBoardBtnDiv" align="center">
			<input type="button" value=" 글쓰기 " id="qnaWriteBtn" class="btn btn-warning">
			<input type="button" value=" 취소 " id="CancelBtn" class="btn btn-outline-secondary">
		</div>
	</form>
</div>


<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/milkyWayForest/js/notice.js"></script>