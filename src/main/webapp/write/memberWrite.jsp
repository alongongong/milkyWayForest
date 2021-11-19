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
      </li>
      <li id="blankSpace"></li>
      <li>
        <input type="text" id="memberWriteId" placeholder="아이디" size="80%">
        <label></label>
      </li>
      <li>
        <input type="password" id="memberWritePwd" placeholder="비밀번호">
      </li>
      <li>
        <input type="password" id="memberWriteRePwd" placeholder="비밀번호 확인">
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
        <label>비밀번호 찾기 질문/답</label><br>
        <select class="form-select form-select-lg mb-3">
            <option selected>---질문을 선택하세요---</option>
            <option value="추억의 장소">기억에 남는 추억의 장소는?</option>
            <option value="좌우명">자신의 인생 좌우명은?</option>
            <option value="보물">자신의 보물 1호는?</option>
            <option value="선생님">가장 기억에 남는 선생님 성함은?</option>
            <option value="선물">받았던 선물 중 기억에 남는 독특한 선물은?</option>
            <option value="친구">유년시절 가장 생각나는 친구 이름은?</option>
            <option value="책">인상 깊게 읽은 책 이름은?</option>
            <option value="캐릭터">내가 좋아하는 캐릭터는?</option>
        </select>
        <input type="text">
      </li>
      <li>
        성별 :
        <input type="radio">남
        <input type="radio">여
      </li>
      <li>
        <label>휴대폰 번호</label>
        <select>
            <option>010</option>
            <option>011</option>
            <option>016</option>
            <option>017</option>
            <option>018</option>
            <option>019</option>
        </select>-
        <input type="text">-<input type="text">
      </li>
      <li>
        <label>이메일 주소</label><br>
        <input type="memberWriteEmail">
        <select>
            <option>naver.com</option>
            <option>daum.net</option>
            <option>gmail.com</option>
        </select>
      </li>
      <li>
          <input type="button">
      </li>
    </ul>
  </form>
</body>
