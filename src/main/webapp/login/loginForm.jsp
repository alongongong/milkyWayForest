<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- <link rel="stylesheet" href="/milkyWayForest/bootstrap/css/bootstrap.css"> -->
<link rel="stylesheet" href="/milkyWayForest/css/login.css">

<form name="loginForm" id="loginForm">
<div id="main-container">
	<div id="main-wrap">
		<section id="login-input-wrap">
			<h2>ID 로그인</h2>
			<div id="id-input-wrap">	
				<input type="text" id="id-input" placeholder="아이디"></input>
				<div id="id-input-div"></div>
			</div>
			<div id="pwd-input-wrap">	
				<input type="password" id="pwd-input" placeholder="비밀번호"></input>
				<div id="pwd-input-div"></div>
			</div>
			<div id="login-button-wrap">
				<button id="login-button" type="button">로그인</button>
			</div>
		</section>
		
		<section id="easy-login-wrap">
			<h2>간편 로그인</h2>
			<ul>
				<li>
					<button>
						<img src="/milkyWayForest/image/kakao.png" alt="kakao">
						<span>카카오로 로그인</span>
					</button>
				</li>
				<li>
					<button>
						<img src="/milkyWayForest/image/naver.png" alt="naver">
						<span>네이버로 로그인</span>
					</button>
				</li>
				<li>
					<button>
						<img src="/milkyWayForest/image/google.png" alt="google">
						<span>구글로 로그인</span>
					</button>
				</li>
			</ul>
			<p id="find-write">
				<a href="#">아이디 찾기</a> | 
				<a href="#">비밀번호 찾기</a> | 
				<a href="#">회원가입</a>
			</p>
		</section>
	</div>
</div>
</form>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/milkyWayForest/js/login.js"></script>