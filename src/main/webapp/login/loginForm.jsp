<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet" href="/milkyWayForest/css/loginForm.css">

<form name="loginForm" id="loginForm">
<div class="main-container">
	<div class="main-wrap">
		<header>
			<div class="logo-wrap">
				<img src="/milkyWayForest/img/milkyway.jpg" alt="logo">
			</div>
		</header>
		
		<section class="login-input-wrap">
			<h2>ID 로그인</h2>
			<div class="id-input-wrap">	
				<input type="text" placeholder="아이디"></input>
				<div id="id-input-div"></div>
			</div>
			<div class="pwd-input-wrap">	
				<input type="password" placeholder="비밀번호"></input>
				<div id="pwd-input-div"></div>
			</div>
			<div class="login-button-wrap">
				<button>로그인</button>
			</div>
		</section>
		
		<section class="easy-login-wrap">
			<h2>간편 로그인</h2>
			<ul>
				<li><button><img src="/milkyWayForest/img/kakao.png" alt="kakao"><span>카카오로 로그인</span></button></li>
				<li><button><img src="/milkyWayForest/img/naver.png" alt="naver"><span>네이버로 로그인</span></button></li>
				<li><button><img src="/milkyWayForest/img/google.png" alt="google"><span>구글로 로그인</span></button></li>
			</ul>
			<p class="find-write">
				<a href="#">아이디 찾기</a> | 
				<a href="#">비밀번호 찾기</a> | 
				<a href="#">회원가입</a>
			</p>
		</section>
		
		<footer>
			<div class="copyright-wrap">
				<span>
					<img src="/milkyWayForest/img/milkyway.jpg" alt="logo"> Copyright © MilkyWayForest Corp. All Rights Reserved.
				</span>
			</div>
		</footer>	
	</div><!-- main-wrap -->
</div><!-- main-container -->
</form>