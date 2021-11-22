<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet" type="text/css" href="../css/writeAgreeForm.css">

<body>
  <form id="memberWriteForm">
    <ul id="memberWriteBox" algin>
      <li id="memberWriteLi">
        <p id="memberWriteTitle">회원가입</p>
      </li>
      <div align="center">
        <img src="../img/starbucksStaff.JPG" id="image1">
      </div>
      <li id="memberWriteContent">
          <ul>
            <li>스타벅스커피에 오신 것을 환영합니다.</li>
            <li>본인인증 없이 간편하게 가입하실 수 있습니다</li>
            <li>만14세 이상 가입 가능</li>
          </ul>
      </li>
      <li id="blankSpace"></li>
      <li class="blankLi">
        <div class="labelName">
          <p>ID</p>
        </div>
        <div class="writeInputText">
          <input type="text" id="memberWriteId" placeholder="ID">
        </div>
      </li>
      <li class="blankLi">
        <div class="labelName">
          <p>비밀번호</p>
        </div>
        <div class="writeInputText">
          <input type="password" id="memberWritePwd" placeholder="비밀번호">
        </div>  
      </li>
      <li class="blankLi">
        <div class="labelName">
          <p>비밀번호 확인</p>
        </div>
        <div class="writeInputText">
          <input type="password" id="memberWriteRePwd" placeholder="비밀번호 확인">
        </div>
      </li>
      <li class="blankLi">
        <div class="labelName">
          <p>이름</p>
        </div>
        <div class="writeInputText">
          <input type="text" id="memberWriteName">
        </div>
      </li>
      <li class="blankLi">
        <div class="labelName">
          <p>닉네임</p>
        </div>
        <div class="writeInputText">
          <input type="text" id="memberWriteNick">
        </div>
      </li>
      <li class="blankLi">
        <div class="labelName">
          <p>질문/답</p>
        </div>
        <div class="writeInputText">
          <select id="writeQuestion">
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
          <input type="text" id="writeAnwer">
        </div>
      </li>
      <li class="blankLi">
        <div class="labelName">
          <p>성별</p>
        </div>
        <div class="writeInputText">
          <input type="radio" name="sex" class="sex" value="man">남
          <input type="radio" name="sex" class="sex" value="woman">여
        </div>
      </li>
      <li class="blankLi">
        <div class="labelName">
          <p>휴대폰 번호</p>
        </div>
        <div class="writeInputText">
          <select id="writeTel1">
              <option>010</option>
              <option>011</option>
              <option>016</option>
              <option>017</option>
              <option>018</option>
              <option>019</option>
          </select>-
        <input type="text" id="writeTel2">-<input type="text" id="writeTel3">
      </div>
      </li>
      <li class="blankLi">
        <div class="labelName">
          <p>가입 경로</p>
        </div>
        <div class="writeInputText">
          <input type="text" id="joinPath">
        </div>
      </li>
      <li class="blankLi">
        <div class="labelName">
          <p>이메일 주소</p>
        </div>
        <div class="writeInputText">
          <input type="text" id="memberWriteEmail">
          <select id="memberWriteEmail1">
              <option>naver.com</option>
              <option>daum.net</option>
              <option>gmail.com</option>
          </select>
        </div>
      </li>
      <li class="blankLi">
        <div class="labelName">
          <p>생년월일</p>
        </div>
        <div class="writeInputText">
          <select id="year">
            <option>2021</option>
            <option>2020</option>
            <option>2019</option>
            <option>2018</option>
            <option>2017</option>
            <option>2016</option>
            <option>2015</option>
            <option>2014</option>
            <option>2013</option>
            <option>2012</option>
            <option>2011</option>
            <option>2010</option>
            <option>2009</option>
            <option>2008</option>
            <option>2007</option>
            <option>2006</option>
            <option>2005</option>
            <option>2004</option>
            <option>2003</option>
            <option>2002</option>
            <option>2001</option>
            <option>2000</option>
            <option>1999</option>
            <option>1998</option>
            <option>1997</option>
            <option>1996</option>
            <option>1995</option>
            <option>1994</option>
            <option>1993</option>
            <option>1992</option>
            <option>1991</option>
            <option>1990</option>
            <option>1989</option>
            <option>1988</option>
            <option>1987</option>
            <option>1986</option>
            <option>1985</option>
            <option>1984</option>
            <option>1983</option>
            <option>1982</option>
            <option>1981</option>
            <option>1980</option>
            <option>1979</option>
            <option>1978</option>
            <option>1977</option>
          </select>년
          <select id="month">
            <option>12</option>
            <option>11</option>
            <option>10</option>
            <option>9</option>
            <option>8</option>
            <option>7</option>
            <option>6</option>
            <option>5</option>
            <option>4</option>
            <option>3</option>
            <option>2</option>
            <option>1</option>
          </select>월
          <select id="day">
            <option>31</option>
            <option>30</option>
            <option>29</option>
            <option>28</option>
            <option>27</option>
            <option>26</option>
            <option>25</option>
            <option>24</option>
            <option>23</option>
            <option>22</option>
            <option>21</option>
            <option>20</option>
            <option>19</option>
            <option>18</option>
            <option>17</option>
            <option>16</option>
            <option>15</option>
            <option>14</option>
            <option>13</option>
            <option>12</option>
            <option>11</option>
            <option>10</option>
            <option>9</option>
            <option>8</option>
            <option>7</option>
            <option>6</option>
            <option>5</option>
            <option>4</option>
            <option>3</option>
            <option>2</option>
            <option>1</option>
          </select>일
        </div>
      </li>
      <li align="center" style="height:160px;">
        <div>
          <input type="button" id="memberWriteBtn" value="회원가입">
          <input type="reset" id="memberWriteReset" value="취소">
        </div>
      </li>
    </ul>
  </form>
</body>
