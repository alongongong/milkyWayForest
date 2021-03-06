<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 모달을 열기 위한 버튼 -->
<button type="button" class="btn btn-primary btn-lg" id="openModalBtn">
	모달 보기 버튼
</button>
<!-- 모달 영역 -->
<div id="modalBox" class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
        <h4 class="modal-title" id="myModalLabel">모달 타이틀</h4>
      </div>
      <div class="modal-body">
        내용
      </div>
      <div class="modal-footer">
		<button type="button" class="btn btn-primary">확인</button>
        <button type="button" class="btn btn-default" id="closeModalBtn">취소</button>
      </div>
    </div>
  </div>
</div>
<script>
  // 모달 버튼에 이벤트를 건다.
  $('#openModalBtn').on('click', function(){
    $('#modalBox').modal('show');
	console.log("click open");
  });
  // 모달 안의 취소 버튼에 이벤트를 건다.
  $('#closeModalBtn').on('click', function(){
    $('#modalBox').modal('hide');
	console.log("click close");
  });
  $('#modalBox').on('show.bs.modal', function (e) {
    console.log("show.bs.modal");
  });
  $('#modalBox').on('shown.bs.modal', function (e) {
    console.log("shown.bs.modal");
  });
  $('#modalBox').on('hide.bs.modal', function (e) {
    console.log("hide.bs.modal");
  });
  $('#modalBox').on('hidden.bs.modal', function (e) {
    console.log("hidden.bs.modal");
  });
</script>