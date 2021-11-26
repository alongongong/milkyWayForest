<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/milkyWayForest/css/findStore.css">

<div id="findStoreDiv">
	<div id="storeList">1111</div>
	<div id="storeMap"></div>
</div>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9430d87716e33fcf4d177c0233ad2b94"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9430d87716e33fcf4d177c0233ad2b94"></script>
	<script>
	$(function(){
		document.cookie = "safeCookie1=foo; SameSite=Lax";
		document.cookie = "safeCookie2=foo";
		document.cookie = "crossCookie=bar; SameSite=None; Secure";
		
		var container = document.getElementById('storeMap');
		var options = {
			center: new kakao.maps.LatLng(33.450701, 126.570667),
			level: 3
		};

		var map = new kakao.maps.Map(container, options);
	});
	</script>
