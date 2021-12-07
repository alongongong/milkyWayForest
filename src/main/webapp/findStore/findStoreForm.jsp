<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/milkyWayForest/css/findStore.css">

<div id="findStoreDiv">
	<div id="storeList">1111</div>
	<div id="storeMap"></div>
</div>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9430d87716e33fcf4d177c0233ad2b94&libraries=services"></script>
<script>
$(function(){
	
 
	var location_name = '스타벅스';
	var location_id = [];
	var positions = [];

	var mapContainer = document.getElementById('storeMap'), // 지도를 표시할 div  
	mapOption = { 
		center: new kakao.maps.LatLng(37.499405, 127.028994), // 지도의 중심좌표
		level: 3 // 지도의 확대 레벨
	};
	
	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	 
	
	$.ajax({
		type: 'get',
		url: 'https://dapi.kakao.com/v2/local/search/keyword.json',
		headers: { 'Authorization': 'KakaoAK 983faebe014b975e78a41ddbea38de92' },
		data: { 'query': location_name},
		success: function(data){
			console.log(JSON.stringify(data));
			$.each(data.documents, function(index, items){
				positions[index] = {title: items.place_name,
									latlng: new kakao.maps.LatLng(items.y, items.x)
				}
				location_id[index] = items.id;
				console.log(positions[index].title+"  "+location_id[index]+"  "+positions[index].latlng);
			});
			
		},
		error: function(err){
			console.log(err);
		}
	});
	
/* 	// 마커를 표시할 위치와 title 객체 배열입니다 
	var positions = [
		{
			title: '카카오', 
			latlng: new kakao.maps.LatLng(33.450705, 126.570677)
		},
		{
			title: '생태연못', 
			latlng: new kakao.maps.LatLng(33.450936, 126.569477)
		},
		{
			title: '텃밭', 
			latlng: new kakao.maps.LatLng(33.450879, 126.569940)
		},
		{
			title: '근린공원',
			latlng: new kakao.maps.LatLng(33.451393, 126.570738)
		}
	]; */
	
	// 마커 이미지의 이미지 주소입니다
	var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
	    
	for (var i = 0; i < positions.length; i ++) {
		
		// 마커 이미지의 이미지 크기 입니다
		var imageSize = new kakao.maps.Size(24, 35); 
		
		// 마커 이미지를 생성합니다    
		var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
		
		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
			map: map, // 마커를 표시할 지도
			position: positions[i].latlng, // 마커를 표시할 위치
			title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
			image : markerImage // 마커 이미지 
		});
	}
		/*
	// 원(Circle)의 옵션으로 넣어준 반지름
	var radius = 100;

	// 마커들이 담긴 배열
	marker.forEach(function(m) {
	    var c1 = map.getCenter();
	    var c2 = m.getPosition();
	    var poly = new Polyline({
	      // map: map, 을 하지 않아도 거리는 구할 수 있다.
	      path: [c1, c2]
	    });
	    var dist = poly.getLength(); // m 단위로 리턴

	    if (dist < radius) {
	        m.setMap(map);
	    } else {
	        m.setMap(null);
	    }
	});
	
	*/
/*	
	 
	var location_name = '스타벅스';
	var location_id = [];
	var positions = [];

	$.ajax({
		type: 'get',
		url: 'https://dapi.kakao.com/v2/local/search/keyword.json',
		headers: { 'Authorization': 'KakaoAK 983faebe014b975e78a41ddbea38de92' },
		data: { 'query': location_name},
		success: function(data){
			console.log(JSON.stringify(data));
			$.each(data.documents, function(index, items){
				positions[index] = {title: items.id,
									lating: new kakao.maps.LatLng(items.y, items.x)
				}
				location_id[index] = items.id;
				console.log(items.x+"  "+items.y+"  "+items.id);
			});
			
		},
		error: function(err){
			console.log(err);
		}
	});
	
	var mapContainer = document.getElementById('storeMap'), // 지도를 표시할 div 
	mapOption = {
		center: new kakao.maps.LatLng(37.4992856,127.0285939), // 지도의 중심좌표
		level: 4, // 지도의 확대 레벨
		mapTypeId : kakao.maps.MapTypeId.ROADMAP // 지도종류
	}; 

	// 지도를 생성한다 
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	// 지도에 확대 축소 컨트롤을 생성한다
	var zoomControl = new kakao.maps.ZoomControl();
	
	// 지도의 우측에 확대 축소 컨트롤을 추가한다
	map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
	
	// 마커의 이미지 주소
	var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 

	// 지도에 마커를 생성하고 표시한다
	for(var i=0; i<positions.length; i++) {
		// 마커 이미지 크기
		var imageSize = new kakao.maps.Size(24, 25);
		
		// 마커 이미지 생성
		var markerImange = new kakao.maps.MarkerImage(imageSrc, imageSize);
		
		// 마커 생성
		var marker = new kakao.maps.Marker({
			map: map, // 마커를 표시할 지도
			position: positions[i].lating, // 마커를 표시할 위치
			title: positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시
			image: markerImage // 마커 이미지
		});
	}
	
	*/
	// 마커 위에 표시할 인포윈도우를 생성한다
	var infowindow = new kakao.maps.InfoWindow({
		content : '<div style="padding:5px;">스타벅스 국기원사거리점</div>' // 인포윈도우에 표시할 내용
	});
	
	// 인포윈도우를 지도에 표시한다
	infowindow.open(map, marker);
	
	// 마커에 클릭 이벤트를 등록한다 (우클릭 : rightclick)
	kakao.maps.event.addListener(marker, 'click', function() {
		location.href="https://place.map.kakao.com/"+location_id;
	});

	
});
</script>
