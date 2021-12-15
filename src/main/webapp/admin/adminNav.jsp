<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <!-- <link href="/milkyWayForest/assets/css/adminIndexTemplate.css" rel="stylesheet" /> -->
 <div class="sidebar" data-color="white" data-active-color="danger">
      <div class="logo">
        <a href="https://www.creative-tim.com" class="simple-text logo-mini">
          <!-- <div class="logo-image-small">
            <img src="./assets/img/logo-small.png">
          </div> -->
          <!-- <p>CT</p> -->
        </a>
        <a href="/milkyWayForest/admin/adminIndex" class="simple-text logo-normal">
          <div class="logo-image-big">
            <img src="/milkyWayForest/image/milkyWayForestLogo.png" border="1" width="60%">
          </div>
        </a>
      </div>
      <div class="sidebar-wrapper">
      	<input type="hidden" value="${dataNum }" id="liNum">
        <ul class="nav">
          <li class="menu">메뉴 관리</li>
          <li class="navMenu" id="1">
            <a href="/milkyWayForest/admin/pAllMenu?dataNum=1">
              <i class="nc-icon nc-bullet-list-67"></i>
              <p>메뉴 관리</p>
            </a>
          </li>
          <li class="menu">회원 혜택 관리</li>
          <li class="navMenu" id="2">
            <a href="/milkyWayForest/admin/memberList?dataNum=2&pg=1">
              <i class="nc-icon nc-bank"></i>
              <p>회원리스트</p>
            </a>
          </li>
          <li class="navMenu" id="3">
            <a href="/milkyWayForest/admin/gradeBenefit?dataNum=3">
              <i class="nc-icon nc-atom"></i>
              <p>등급별 혜택</p>
            </a>
          </li>
          <li class="menu">상품 관리</li>
          <li class="navMenu" id="4">
            <a href="/milkyWayForest/admin/productList?dataNum=4">
              <i class="nc-icon nc-basket"></i>
              <p>상품 조회, 수정, 삭제</p>
            </a>
          </li>
          <li class="navMenu" id="5">
            <a href="/milkyWayForest/admin/productInsert?dataNum=5">
              <i class="nc-icon nc-box-2"></i>
              <p>상품 등록</p>
            </a>
          </li>
          <li class="menu">상담 관리</li>
          <li class="navMenu" id="6">
            <a href="/milkyWayForest/admin/talk?dataNum=6">
         <!--  	<div class="channelTalk">
            	<a href="https://desk.channel.io/#/channels/71259/team_chats/groups/117229">
            	</div> -->
              <i class="nc-icon nc-chat-33"></i>
              <p>상담 관리</p>
            </a>
          </li>
          <li class="menu">판매 관리</li>
          <li class="navMenu" id="7">
            <a href="/milkyWayForest/admin/dailyOrder?dataNum=7">
              <i class="nc-icon nc-credit-card"></i>
              <p>일자별 주문 내역 확인</p>
            </a>
          </li>
          <li class="navMenu" id="8">
            <a href="/milkyWayForest/admin/orderNShip?dataNum=8">
              <i class="nc-icon nc-delivery-fast"></i>
              <p>주문 확인 / 발송 관리</p>
            </a>
          </li>
           <li class="navMenu" id="9">
            <a href="/milkyWayForest/admin/orderCancel?dataNum=9">
              <i class="nc-icon nc-refresh-69"></i>
              <p>취소, 교환, 반품 관리</p>
            </a>
          </li>
          <li class="menu">게시글 관리</li>
          <li class="navMenu" id="10">
            <a href="/milkyWayForest/admin/qnaBoard?dataNum=10&pg=1">
              <i class="nc-icon nc-email-85"></i>
              <p>문의 게시판 관리</p>
            </a>
          </li>
          <li class="navMenu" id="11">
            <a href="/milkyWayForest/admin/reviewBoard?dataNum=11">
              <i class="nc-icon nc-ruler-pencil"></i>
              <p>상품 후기 관리</p>
            </a>
          </li>
          <li class="menu">물류 관리</li>
          <li class="navMenu" id="12">
            <a href="/milkyWayForest/admin/stock?dataNum=12">
              <i class="nc-icon nc-box"></i>
              <p>물류 관리</p>
            </a>
          </li>
        </ul>
      </div>
    </div>