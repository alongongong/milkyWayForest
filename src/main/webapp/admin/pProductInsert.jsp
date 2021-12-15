<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/milkyWayForest/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="/milkyWayForest/css/admin.css">
<div id="pProductInsert" class="card">
	<div class="card-body">
		<form id="pProductInsertForm">
			<table id="pProductInsertTable" cellpadding="5">
				<tr>
					<td>상품 코드</td>
					<td>
						<input type="text" id="productCode" name="productCode" size="50"  value="">
					</td>
				</tr>
				<tr>
					<td>상품 이름</td>
					<td>
						<input type="text" id="productName" name="productName" size="50">
					</td>
				</tr>
				<tr>
					<td>상품 영문 이름</td>
					<td>
						<input type="text" id="productEngName" name="productEngName" size="50">
					</td>
				</tr>
				<tr>
					<td>카테고리</td>
					<td>
						<select id="category" name="category" style="width: 409px; height:27px;">
							<option value="글라스">글라스</option>
							<option value="머그">머그</option>
							<option value="원두">원두</option>
							<option value="스테인리스 텀블러">스테인리스 텀블러</option>
							<option value="플라스틱 텀블러">플라스틱 텀블러</option>
							<option value="차">차</option>
							<option value="보온병">보온병</option>
							<option value="커피용품">커피용품</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>상품 금액</td>
					<td>
						<input type="text" id="productUnit" name="productUnit" size="50">
					</td>
				</tr>
				<tr>
					<td>상품 옵션</td>
					<td>
						<input type="text" id="productOption" name="productOption" size="50">
					</td>
				</tr>
				<tr>
					<td>상품 할인율</td>
					<td>
						<input type="text" id="productRate" name="productRate" size="50">
					</td>
				</tr>
				<tr>
					<td>상품 설명</td>
					<td>
						<textarea rows="5" cols="52" id="productSmallInfo" name="productSmallInfo"></textarea>
					</td>
				</tr>
				<tr>
					<td>상품 상세 설명</td>
					<td>
						<textarea rows="10" cols="52" id="productDetailInfo" name="productDetailInfo"></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="button" id="insertProductBtn" value="상품 등록">
						<input type="button" id="insertCancelBtn" value="취소"><br><br>
						<div id="emptyDiv"></div>
					</td>
				</tr>
			</table>
		</form>
	</div>
</div>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/milkyWayForest/js/admin.js"></script>