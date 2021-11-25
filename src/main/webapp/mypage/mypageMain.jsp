<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

<div id="myInfoBox-wrapper">
	<div id="myInfoBox">
		<p><img src="" alt="회원등급이미지"></p>
		<div id="myInfoDescript">
			<span>저희 은하숲을 이용해주셔서 감사합니다. 
			<strong>${memId }</strong>님은
			<strong>${gradeName }</strong>등급입니다.
			</span>
		</div>
	</div>
	
<div id="myBenefit-wrapper">
	<ul>
		<li><span>사용가능한 쿠폰</span></li>
		<li><span>사용가능한 적립금</span></li>
		<li><span>총 주문 횟수</span></li>
		<li><span>총 주문 금액</span></li>
	</ul>
</div>
</div>