<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/milkyWayForest/css/findStore.css">

<div id="findStoreDiv">
	<div id="storeList">1111</div>
	<div id="storeMap"></div>
</div>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9430d87716e33fcf4d177c0233ad2b94"></script>
<script>
	var location_name = 'aa';
	var x = 37.57309;
	var y = 126.97469;
	var mapContainer = document.getElementById('storeMap'), // 지도를 표시할 div 
	mapOption = {
		center: new kakao.maps.LatLng(x+0.0007, y), // 지도의 중심좌표
		level: 4, // 지도의 확대 레벨
		mapTypeId : kakao.maps.MapTypeId.ROADMAP // 지도종류
	}; 

	// 지도를 생성한다 
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	// 지도에 확대 축소 컨트롤을 생성한다
	var zoomControl = new kakao.maps.ZoomControl();
	
	// 지도의 우측에 확대 축소 컨트롤을 추가한다
	map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
	
	// 지도에 마커를 생성하고 표시한다
	var marker = new kakao.maps.Marker({
	    position: new kakao.maps.LatLng(x, y), // 마커의 좌표
	    map: map // 마커를 표시할 지도 객체
	});
	
	// 마커 위에 표시할 인포윈도우를 생성한다
	var infowindow = new kakao.maps.InfoWindow({
	    content : '<div style="padding:5px;">인포윈도우 :D</div>' // 인포윈도우에 표시할 내용
	});
	
	// 인포윈도우를 지도에 표시한다
	infowindow.open(map, marker);
	
	// 마커에 클릭 이벤트를 등록한다 (우클릭 : rightclick)
	kakao.maps.event.addListener(marker, 'click', function() {
	    alert('마커를 클릭했습니다!');
	});
	$(function(){
		$.ajax({
			   type: 'get',
			   url: 'https://dapi.kakao.com/v2/local/search/address.json',
			   headers: { Authorization: 'KakaoAK {983faebe014b975e78a41ddbea38de92}' },
			   data: { query: 'loacation_name'},
			   success: function(data){
			      alert('success');
			   },
			   error: function(err){
			      console.log(err);
			   }
			   
			});
	});
</script>
