<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/milkyWayForest/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="/milkyWayForest/css/admin.css">

<title>은하숲 관리자 로그인</title>

<form name="adminLoginForm" id="adminLoginForm">
	<div id="headerBackground"> </div>
		<div id="main-container">
			<h1>로그인</h1>
			
				<div id="main-wrap">
				
					<div id="welcomdeLogin">
						<span>Welcome! </span> 은하숲 관리자 로그인 페이지에 오신 것을 환영합니다.
					</div>
					
					<section id="login-input-wrap">
					
						<div id="id-input-wrap">	
							<input type="text" id="id-input" name="id" placeholder="아이디"></input>
						</div>
						
						<div id="pwd-input-wrap">	
							<input type="password" id="pwd-input" name="pwd" placeholder="비밀번호"></input>
						</div>
						
						<div id="login-button-wrap">
							<button type="button" id="login-button"  class="btn">로그인</button>
						</div>
					
						<div id="result-div"> </div>
						
					</section>
				
				
			</div>  <!-- main-wrap  -->
			
	</div>  <!-- main-container -->
</form>		

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/milkyWayForest/js/admin.js"></script>				
				