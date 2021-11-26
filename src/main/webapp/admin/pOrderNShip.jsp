<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<form id="pOrderNShipForm">
<div class="card" id="pOrderNShipDiv">
  <div class="card-header">
    <h4 class="card-title"> 주문 확인 / 발송 관리</h4>
	<div id="stockSearch">
		
	</div>
  </div>
  <div class="card-body">
    <div class="table-responsive">
      <table class="table" id="pOrderNShipTable">
        <thead class=" text-primary">
          <th>주문번호</th>
          <th>상품명</th>
          <th>수량</th>
          <th>배송현황</th>
          <th>버튼</th>
        </thead>
        <tbody>
        </tbody>
      </table>
      <br>
      <div id="boardPagingDiv"></div>
      <br><br>
    </div>
  </div>
</div>
</form>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript"></script>