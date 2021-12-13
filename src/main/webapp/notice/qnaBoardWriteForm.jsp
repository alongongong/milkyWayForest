<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/milkyWayForest/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="/milkyWayForest/css/notice.css">

<div id="qnaBoardWriteDiv">
	<section>
		<div id="qnaBoardWriteInfo">
			<strong>고객님의 즐겁고 행복한 시간을 위해 정성을 다하고 있습니다. <br>
					이용하시면서 생기는 문의 사항을 알려주세요. 친절한 답변 드리겠습니다.</strong>
			<ul>
				<li>고객의 소리 운영시간 : 09:00 - 18:00(연중무휴)</li>
			</ul>
			<input type="button" value="나의 문의 내역 보기" id="myQnaList" class="btn btn-secondary">
		</div>
		<form id="qnaBoardWriteForm" method="post" enctype="multipart/form-data"
			action="/milkyWayForest/notice/qnaBoardWrite">
			<table id="qnaBoardWriteTable" class="table">
				<tr>
					<th width="200px">문의 유형</td>
					<td>
						<select id="qnaQuestionType" name="qnaQuestionType">
							<option value="0">문의 유형</option>
							<option value="상품 문의">상품 문의</option>
							<option value="배송 문의">배송 문의</option>
							<option value="취소 문의">취소 문의</option>
							<option value="교환 문의">교환 문의</option>
							<option value="반품 문의">반품 문의</option>
							<option value="기타 문의">기타 문의</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>제목</th>
					<td>
						<input type="text" id="qnaSubject" name="qnaSubject">
					</td>
				</tr>
				<tr>
					<th>내용</th>
					<td>
						<textarea id="qnaContent" name="qnaContent" rows="17"></textarea>
					</td>
				</tr>
				<tr>
					<th>글 비밀번호</th>
					<td>
						<input type="password" id="qnaPwd" name="qnaPwd">
					</td>
				</tr>
				<tr>
					<th>이미지 첨부파일1</th>
					<td class="filebox">
						<label class="btn" for="qnaAttachedFile">파일찾기</label>
						<input type="file" id="qnaAttachedFile" name="img" onchange="qnaAttachedFileName()">
						<input class="upload-name" id="upload-name" placeholder="파일 첨부" size="62">
					</td>
				</tr>
				<tr>
					<th>이미지 첨부파일2</th>
					<td class="filebox">
						<label class="btn" for="qnaAttachedFile">파일찾기</label>
						<input type="file" id="qnaAttachedFile" name="img" onchange="qnaAttachedFileName()">
						<input class="upload-name" id="upload-name" placeholder="파일 첨부" size="62">
					</td>
				</tr>
				<tr>
					<td>
						<div id="qnaBoardWriteCheck"> &emsp;</div>
					</td>
					<td></td>
				</tr>
			</table>
			
			<div id="qnaBoardBtnDiv" align="center">
				<input type="button" value=" 글쓰기 " id="qnaWriteBtn" class="btn">
				<input type="button" value=" 취소 " id="CancelBtn" class="btn btn-outline-secondary">
			</div>
		</form>
	</section>
</div>


<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/milkyWayForest/js/notice.js"></script>