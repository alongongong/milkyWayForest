<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/milkyWayForest/bootstrap/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="../css/writeAgreeForm.css">
<!-- <script type="text/javascript" src="/milkyWayForest/js/date.js"></script> -->

  <form id="memberWriteForm" action="/milkyWayForest/write/writeOk" method="post">
    <ul id="memberWriteBox">
      <li id="memberWriteLi">
        <p id="memberWriteTitle">회원가입</p>
      </li>
      <div align="center">
        <img src="https://image.istarbucks.co.kr/common/img/util/mem/icon_find_sally.png" id="image1">
      </div>
      <li id="memberWriteContent">
          <ul>
            <li>스타벅스커피에 오신 것을 환영합니다.</li>
            <li>본인인증 없이 간편하게 가입하실 수 있습니다</li>
            <li>(만14세 이상 가입 가능)</li>
          </ul>
      </li>
      <li id="blankSpace"></li>
      <li class="blankLi">
        <div class="labelName">
          <p>ID <span>*</span></p>
        </div>
        <div class="writeInputText">
          <input type="text" id="memberWriteId" name="id" placeholder="영문,숫자포함 5~10자">
          <input type="hidden" id="checkId" val="">
          <div id="idDiv" style="width:20%; display:inline;"></div>
        </div>
      </li>
      <li class="blankLi">
        <div class="labelName">
          <p>비밀번호 <span>*</span></p>
        </div>
        <div class="writeInputText">
          <input type="password" id="memberWritePwd" name="pwd" placeholder="영문,숫자,특수문자 포함 8~16자">
          <div id="pwdDiv" style="width:20%; display:inline;"></div>
        </div>  
      </li>
      <li class="blankLi">
        <div class="labelName">
          <p>비밀번호 확인 <span>*</span></p>
        </div>
        <div class="writeInputText">
          <input type="password" id="memberWriteRePwd" placeholder="영문,숫자,특수문자 포함 8~16자">
          <div id="pwdReDiv" style="width:20%; display:inline;"></div>
        </div>
      </li>
      <li class="blankLi">
        <div class="labelName">
          <p>이름 <span>*</span></p>
        </div>
        <div class="writeInputText">
          <input type="text" id="memberWriteName" name="name" placeholder="한글만 적어주세요">
          <div id="nameDiv" style="width:20%; display:inline;"></div>
        </div>
      </li>
      <li class="blankLi">
        <div class="labelName">
          <p>닉네임 <span>*</span></p>
        </div>
        <div class="writeInputText">
          <input type="text" id="memberWriteNick" name="nickname">
          <div id="nickNameDiv" style="width:20%; display:inline;"></div>
        </div>
      </li>
      
      <li class="blankLi">
        <div class="labelName">
          <p>성별 <span>*</span></p>
        </div>
        <div class="writeInputText">
          <input type="radio" id="man" name="gender" class="gender" value="남">
          <label for="man" style="font-size: 14px; margin-right: 50px;">남</label>
          <input type="radio" id="woman" name="gender" class="gender" value="여">
          <label for="woman" style="font-size: 14px;">여</label>
        </div>
      </li>
      <li class="blankLi">
        <div class="labelName">
          <p>휴대폰 번호 <span>*</span></p>
        </div>
        <div class="writeInputText">
          <select id="writeTel1" name="tel1">
              <option value="010">010</option>
              <option value="011">011</option>
              <option value="016">016</option>
              <option value="017">017</option>
              <option value="018">018</option>
              <option value="019">019</option>
          </select> - 
        <input type="text" id="writeTel2" name="tel2"> - 
        <input type="text" id="writeTel3" name="tel3">
      </div>
      </li>
      <li class="blankLi">
        <div class="labelName">
          <p>생년월일 <span>*</span></p>
        </div>
        <div class="writeInputText">
    		<input type="text" id="yy" name="yy" placeholder="ex) 1950">년
    		<input type="text" id="mm" name="mm" placeholder= "ex) 01">월
    		<input type="text" id="dd" name="dd" placeholder= "ex) 01">일
        </div>
      </li>
      <li class="blankLi">
        <div class="labelName">
          <p>아이디 찾기 질문</p>
        </div>
        <div class="writeInputText">
          <select id="writeQuestion" name="idPwdQuestion">
              <option value="false" align="center">---질문을 선택하세요---</option>
              <option value="추억의 장소">기억에 남는 추억의 장소는?</option>
              <option value="좌우명">자신의 인생 좌우명은?</option>
              <option value="보물">자신의 보물 1호는?</option>
              <option value="선생님">가장 기억에 남는 선생님 성함은?</option>
              <option value="선물">받았던 선물 중 기억에 남는 독특한 선물은?</option>
              <option value="친구">유년시절 가장 생각나는 친구 이름은?</option>
              <option value="책">인상 깊게 읽은 책 이름은?</option>
              <option value="캐릭터">내가 좋아하는 캐릭터는?</option>
          </select>
        </div>
      </li>
      <li class="blankLi">
        <div class="labelName">
          <p>답</p>
          </div>
		  <div class="writeInputText">
          <input type="text" id="writeAnwer" name="idPwdAnswer" readonly>
        </div>
      </li>
      <li class="blankLi">
        <div class="labelName">
          <p>가입 경로</p>
        </div>
        <div class="writeInputText">
          <input type="text" id="joinPath" name="writePath">
        </div>
      </li>
      <li class="blankLi">
        <div class="labelName">
          <p>이메일 주소 <span>*</span></p>
        </div>
        <div class="writeInputText">
          	<input type="text" id="memberWriteEmail" name="email1">
			@
			<input type="text" id="memberWriteEmail1" name="email2" list="email2" placeholder="직접입력">
			<datalist id="email2" name="email2">
				<option value="naver.com">naver.com
				<option value="daum.net">daum.net
				<option value="gmail.com">gmail.com
			</datalist>
			<input type="button" id="athntEmail" class="btn" value="인증메일 전송">
        </div>
      </li>
      <li class="blankLi athntHide">
        <div class="labelName">
          <p>이메일 인증번호<span>*</span></p>
        </div>
        <div align="center" id="athnt" class="writeInputText">
      		<input type="text" id="athntNmbr">
      		<input type="button" id="athBtn" value="인증" class="btn"> <div id="athDiv" style="width:20%; display:inline;"></div>
      	</div>
      </li>
      <li style="height: 30px;">
      	<div>
			<div id="emailDiv"></div>   	
       	</div>
      </li>
      <li style="height:80px;">
        <div align="center">
          <input type="button" id="memberWriteBtn" class="btn" value="회원가입">
          <input type="reset" id="memberWriteReset" class="btn" value="취소">
        </div>
      </li>
    </ul>
  </form>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/milkyWayForest/js/write.js"></script>


