<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/milkyWayForest/css/findStore.css">

<div id="findStoreDiv">
	<div id="storeList">
		<div id="storeFindSubject">매장찾기</div>
		<div id="storeListBorder"></div>
	</div>
	<div id="storeMap"></div>

</div>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9430d87716e33fcf4d177c0233ad2b94&libraries=services"></script>
<script>
$(function(){
	
	let positions = new Array();
	let now_x = 37.55855218147396; // 위도
	let now_y = 126.94597385565802; // 경도
	let aa;

	let mapContainer = document.getElementById('storeMap'), // 지도를 표시할 div 
		mapOption = { //지도를 생성할 때 필요한 기본 옵션
			center: new kakao.maps.LatLng(now_x, now_y), // 지도의 중심좌표
			level: 4, // 지도의 확대 레벨
			mapTypeId : kakao.maps.MapTypeId.ROADMAP // 지도종류
		}; 

	// 지도를 생성한다 
	let map = new kakao.maps.Map(mapContainer, mapOption); 

	// 지도에 확대 축소 컨트롤을 생성한다
	let zoomControl = new kakao.maps.ZoomControl();

	// 지도의 우측에 확대 축소 컨트롤을 추가한다
	map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

	//실시간 현재 위치 https://apis.map.kakao.com/web/sample/geolocationMarker/
	// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
	if (navigator.geolocation) {
	    function geo_success(position) { 
	    	var lat = position.coords.latitude, // 위도
	            lon = position.coords.longitude; // 경도
	        
	        var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
	            message = '<div style="padding:5px;">현재위치</div>'; // 인포윈도우에 표시될 내용입니다
	        
	        // 마커와 인포윈도우를 표시합니다
	        displayMarker(locPosition, message); 
			alert('와이파이 이용시 정확도가 다소 떨어질 수 있습니다');
			
	        now_x = lat;
	        now_y = lon;
	        
			getStore();
    	}
	    
	    function geo_error() {
	    	alert("위치 정보를 사용할 수 없습니다."); 
	    	
	    	getStore();
    	}
	    
	    var geo_options = {
    		enableHighAccuracy: true, // 불리언 
    		maximumAge : 30000, // 천분의 1초 단위 
    		timeout : 27000 // 천분의 1초 단위 
   		};
	    
	    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
	    navigator.geolocation.getCurrentPosition(geo_success, geo_error, geo_options);


	    var watcherID = navigator.geolocation.watchPosition(geo_success, geo_error, geo_options);
	    
	    navigator.geolocation.clearWatch(watcherID); // 위치 갱신 그만 두기

	} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
	    
	    var locPosition = new kakao.maps.LatLng(37.4992856, 127.0285939),    
	        message = '현재 위치를 찾을 수 없습니다'
	        
	    displayMarker(locPosition, message);
	
	    getStore();
	}

	// 지도에 마커와 인포윈도우를 표시하는 함수입니다
	function displayMarker(locPosition, message) {

	    // 마커를 생성합니다
	    var marker = new kakao.maps.Marker({  
	        map: map, 
	        position: locPosition
	    }); 
	    
	    var iwContent = message, // 인포윈도우에 표시할 내용
	        iwRemoveable = true;

	    // 인포윈도우를 생성합니다
	    var infowindow = new kakao.maps.InfoWindow({
	        content : iwContent,
	        removable : iwRemoveable
	    });
	    
	    // 인포윈도우를 마커위에 표시합니다 
	    //infowindow.open(map, marker);
	    
	    // 지도 중심좌표를 접속위치로 변경합니다
	    map.setCenter(locPosition);      
	}   
	
	function getStore() {
		//스타벅스 매장
		$.ajax({
			type: 'post',
			url: '/milkyWayForest/findStore/getStore',
			data: { 'now_x': now_x,
					'now_y': now_y },
			success: function(data){
				console.log(JSON.stringify(data));
				$.each(data, function(index, items){
					let json = new Object();
					json = {'title': items.storeName,
							'latlng': new kakao.maps.LatLng(items.storeX, items.storeY),
							'storeUrl': items.storeUrl}
					positions.push(json);
	
					
					$('<div>',{
						class: 'storeList',
						id: 'storeList'+index
					}).append($('<div>',{
						text: '스타벅스 '+items.storeName+'점',
						class: 'storeName',
						id: 'storeName'+index
					})).append($('<div>',{
						text: items.storeLocation,
						class: 'storeLocation'
					})).append($('<div>',{
						class: 'storePin'
					}).append($('<img>',{
						src: '//image.istarbucks.co.kr/common/img/store/pin/pin_general.png',
						width: '35px',
						height: '55px',
						id: 'storePin'+index
					}))).appendTo($('#storeListBorder'))
					
				});
	
				
					// 마커의 이미지 주소
					let imageSrc = "//image.istarbucks.co.kr/common/img/store/pin/pin_general.png"; 
					
					// 마커 이미지 크기
					let imageSize = new kakao.maps.Size(35, 55);
					
					// 마커 이미지 생성
					let markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
				
					// 지도에 마커를 생성하고 표시한다
					$.each(positions, function(index, items){
	
						// 마커 생성
						let marker = new kakao.maps.Marker({
							map: map, // 마커를 표시할 지도
							position: items.latlng, // 마커를 표시할 위치
							title: items.title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시
							image: markerImage // 마커 이미지
						});
					
					
						// 마커 위에 표시할 인포윈도우를 생성한다
						let infowindow = new kakao.maps.InfoWindow({
							content : '<div class="infoWindow" id="infoWindow'+index+'" style="padding:5px; font-size: 10pt;">스타벅스 '+items.title+'점</div>' // 인포윈도우에 표시할 내용
						});
	
	
						// 마커에 클릭 이벤트를 등록한다 (우클릭 : rightclick)
						kakao.maps.event.addListener(marker, 'click', function() {
							infowindow.open(map, marker);
							if(aa) {
								aa.hide();
							} 
							aa = $('#infoWindow'+index).parent().parent();
							aa.show();
							
							$('.infoWindow').click(function(){
								window.open(items.storeUrl);
							})
						});
						
						$('#findStoreDiv').on('click', '#storeList'+index, function() {
							infowindow.open(map, marker);
							if(aa) {
								aa.hide();
							} 
							aa = $('#infoWindow'+index).parent().parent();
							aa.show();
							
							$('.infoWindow').click(function(){
								window.open(items.storeUrl);
							})
						});
						
					});
		
					/* // 인포윈도우를 지도에 표시한다
					infowindow.open(map, markerNow); */
			},
			error: function(err){
				console.log(err);
			}
			
		});
	}
});
</script>
