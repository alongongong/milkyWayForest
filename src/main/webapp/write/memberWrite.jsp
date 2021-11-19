<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet" type="text/css" href="../css/writeAgreeForm.css">

<body>
  <form id="memberWriteForm">
    <ul id="memberWriteBox">
      <li id="memberWriteLi">
        <p id="memberWriteTitle">회원가입</p>
        <ul>
          <li>스타벅스커피에 오신 것을 환영합니다.</li>
          <li>본인인증 없이 간편하게 가입하실 수 있습니다</li>
          <li>만14세 이상 가입 가능</li>
        </ul>
        <hr/>
      </li>
      <li id="blankSpace"></li>
      <li>
        <label>아이디</label><br>
        <input type="text" id="memberWriteId">
      </li>
      <li>
        <label>이름</label><br>
        <input type="text" id="memberWriteName">
      </li>
      <li>
        <label>닉네임</label><br>
        <input type="text" id="memberWriteNick">
      </li>
      <li>
        <label>비밀번호</label><br>
        <input type="password" id="memberWritePwd">
      </li>
      <li>
        <label>비밀번호 재입력</label><br>
        <input type="password" id="memberWriteRePwd">
      </li>
      <li>
        <input type="radio">남
        <input type="radio">여
      </li>
      <li>
        <label>휴대폰 번호</label>
        <input type="text">-<input type="text">-<input type="text">
      </li>
      <li>
        <label>이메일 주소</label><br>
        <input type="memberWriteEmail"><br>
        <input type="memberWriteEmail2">
      </li>
    </ul>
  </form>
</body>
