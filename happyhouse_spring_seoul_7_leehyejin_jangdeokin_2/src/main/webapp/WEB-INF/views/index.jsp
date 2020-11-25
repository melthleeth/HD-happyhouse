<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">

<head>
<title>HappyHouse_Front_End_서울_7_이혜진_장덕인</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css?family=Rubik:300,400,500,700,900"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Playfair+Display:400,400i,700,700i,900,900i"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">

<link rel="stylesheet" href="${root}/css/style_hyejin.css">
<link rel="stylesheet" href="${root}/css/open-iconic-bootstrap.min.css">
<link rel="stylesheet" href="${root}/css/animate.css">

<link rel="stylesheet" href="${root}/css/owl.carousel.min.css">
<link rel="stylesheet" href="${root}/css/owl.theme.default.min.css">
<link rel="stylesheet" href="${root}/css/magnific-popup.css">

<link rel="stylesheet" href="${root}/css/aos.css">

<link rel="stylesheet" href="${root}/css/ionicons.min.css">

<link rel="stylesheet" href="${root}/css/bootstrap-datepicker.css">
<link rel="stylesheet" href="${root}/css/jquery.timepicker.css">


<link rel="stylesheet" href="${root}/css/flaticon.css">
<link rel="stylesheet" href="${root}/css/icomoon.css">
<link rel="stylesheet" href="${root}/css/style.css">

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=833a1d00eb0a2b88924bcd6ff33b7e2a&libraries=services,clusterer,drawing"></script>
</head>

<body>
	<jsp:include page="./nav.jsp"></jsp:include>

	<section id="section-map">
		<div class="container">

			<section id="index_section">
				<div class="card col-sm-12 mt-1" style="min-height: 850px;">
					<div class="card-body">
						<script>
							// ####### 시/도 - 구/군 - 동 option 선택 동작 부분 #######
							let colorArr = [ '', '' ];
							$(document).ready(function() {
								$.ajax({
									url : '${root}/housedata/step1',
									type : 'GET',
									contentType : 'application/json;charset=utf-8',
									dataType : 'json',
									success : function(data, status) {
										console.log("시도 불러오기 성공");
										console.log(data);
										$.each(data, function(index, vo) {
											//console.log(vo.sidoCode + " " + vo.sidoName);
											$("#sido").append("<option value='" + vo.sidoCode + "'>" + vo.sidoName + "</option>");
										}); //each
									} // success
								}) // ajax
							}); //ready

							$(document).ready(function() {
								$("#sido").change(function() {
									$.ajax({
										url : '${root}/housedata/step2/' + $("#sido").val(),
										type : 'GET',
										contentType : 'application/json;charset=utf-8',
										dataType : 'json',
										success : function(data, status) {
											console.log("구군 불러오기 성공");
											console.log(data);
											$("#gugun").empty();
											$("#gugun").append('<option value="0">선택</option>');
											$.each(data, function(index, vo) {
												$("#gugun").append("<option value='"+vo.gugunCode+"'>" + vo.gugunName + "</option>");
											});//each
										} // success
									}) // ajax
								}); //change
								$("#gugun").change(function() {
									console.log("path: ${root}/housedata/step3/" + $("#gugun").val());
									$.ajax({
										url : "${root}/housedata/step3/" + $("#gugun").val(),
										type : 'GET',
										contentType : 'application/json;charset=utf-8',
										dataType : 'json',
										success : function(data, status) {
											console.log("동 불러오기 성공");
											console.log(data);
											$("#dong").empty();
											$("#dong").append('<option value="0">선택</option>');
											$.each(data, function(index, vo) {
												$("#dong").append("<option value='" + vo.dong + "'>" + vo.dong + "</option>");
											}); //each
										} // success
									}) //ajax
								}); //change
								$("#dong").change(function() {
									console.log("path: ${root}/housedata/step4/" + $("#dong").val());
									$.ajax({
										url : "${root}/housedata/step4/" + $("#dong").val(),
										type : 'GET',
										contentType : 'application/json;charset=utf-8',
										dataType : 'json',
										success : function(data, status) {
											console.log("아파트정보 불러오기 성공");
											console.log(data);
											$("#searchResult").empty();
											hideMarker();
											
											$.each(data, function(index, item) {
												let str = "<tr house_no=\"" + item.no + "\" class=\"view\">" +
												//"<td>" + item.no + "</td>" + 
												"<td>" + item.aptName + "</td>" + "<td>" + item.dong + "</td>" + "<td>" + item.jibun + "</td>" +
												//"<td>" + item.code + "</td>" + 			
												"<td>" + item.dealAmount + "만원</td>" +
												//"<td id='lat_" + index + "'></td>" +
												//"<td id='lng_" + index + "'></td>" +
												"</tr>";
												$("#searchResult").append(str);
												//$("#searchResult").append(vo.dong + " " + vo.aptName + " " + vo.jibun + "<br>");
												let message =	item.aptName + "<br>" + 
																item.dealAmount + "만원<br>" +
																item.area + "㎡";
												setMarker(item.dong + " " + item.jibun + " " + item.aptName, message);
											}); //each
											console.log("마커 개수: " + markers.length);
											
											//geocode(data);
											
										} // success
									}) //ajax
								}); //change

								// 상세검색부분의 옵션 선택시 console창에 값을 출력
								$("#detailSearch_apt_dong").change(function() {
									console.log("선택값: " + $("#detailSearch_apt_dong").val());
								}); //change

								$("#btn_detailedSearch").on("click", function() {
									console.log("path: ${root}/housedata/search/" + $("#detailSearch_apt_dong").val() + "/" + $("#detailedSearch").val());
									$.ajax({
										url : "${root}/housedata/search/" + $("#detailSearch_apt_dong").val().trim() + "/" + $("#detailedSearch").val(),
										type : 'GET',
										contentType : 'application/json;charset=utf-8',
										dataType : 'json',
										success : function(data, status) {
											console.log("상세검색 성공 - 옵션: " + $("#detailSearch_apt_dong").val() + ", 검색값: " + $("#detailedSearch").val());
											$("#searchResult").empty();
											$.each(data, function(index, item) {
												let str = "<tr house_no=\"" + item.no + "\" class=\"view\">" +
												//"<td>" + item.no + "</td>" + 
												"<td>" + item.aptName + "</td>" + "<td>" + item.dong + "</td>" + "<td>" + item.jibun + "</td>" +
												//"<td>" + item.code + "</td>" + 			
												"<td>" + item.dealAmount + "만원</td>" +
												//"<td id='lat_" + index + "'></td>" +
												//"<td id='lng_" + index + "'></td>" +
												"</tr>";
												$("#searchResult").append(str);
												//$("#searchResult").append(vo.dong + " " + vo.aptName + " " + vo.jibun + "<br>");
												let message =	item.aptName + "<br>" + 
																item.dealAmount + "만원<br>" +
																item.area + "㎡";
												
												setMarker(item.dong + " " + item.jibun + " " + item.aptName, message);
											}); //each
											console.log("마커 개수: " + markers.length);
											//geocode(data);
										} //function
									}) // ajax
								}); // onclick: search

								// ####### 아파트 td 클릭시 modal창으로 상세정보 표시 동작 #######
								// tr에 house_no attr이 추가되어 있고 no 값을 담고 있음
								$(document).on("click", "tr.view", function() {
									let no = $(this).attr("house_no");
									console.log("매물 번호: " + no)
									$.ajax({
										url : '${root}/housedata/modal/' + no,
										type : 'GET',
										contentType : 'application/json;charset=utf-8',
										success : function(house) {
											console.log("월세: " + house.rentMoney);
											let rentMoney = (house.rentMoney < 1) ? "없음" : house.rentMoney + "만원";
											let imgsrc = "https://robohash.org/" + house.no;
											$("#modal_AptName").text(house.aptName);
											$("#modal_dong_jibun").text(house.dong + " " + house.jibun);
											$("#modal_buildYear").text(house.buildYear);
											$("#modal_dealYMD").text(house.dealYear + "." + house.dealMonth + "." + house.dealDay);
											$("#modal_dealAmount").text(house.dealAmount + "만원");
											$("#modal_rentMoney").text(rentMoney);
											$("#modal_area").text(house.area + "㎡");
											$("#modal_floor").text(house.floor + "층");
											$("#modal_img").attr("src", imgsrc);
											$("#houseDataModal").modal();
										},
										error : function(xhr, status, msg) {
											console.log("상태값 : " + status + " Http에러메시지 : " + msg);
										}
									});
								}); // click

							}); //ready
							
							
						</script>

						<section class="ftco-section ftco-no-pb ftco-no-pt">
							<div class="container">
								<div class="row">
									<div class="col-md-12">
										<div class="search-wrap-1 ftco-animate p-4 px-5"
											style="margin-top: 0;">
											<form action="#" class="search-property-1">
												<div class="row">
													<div class="col-lg align-items-end">
														<div class="form-group">
															<label for="#">도/광역시</label>
															<div class="form-field">
																<div class="select-wrap">
																	<div class="icon">
																		<span class="ion-ios-arrow-down"></span>
																	</div>
																	<select name="" id="sido" class="form-control">
																		<option value="0">선택</option>
																	</select>
																</div>
															</div>
														</div>
													</div>
													<div class="col-lg align-items-end">
														<div class="form-group">
															<label for="#">구/군</label>
															<div class="form-field">
																<div class="select-wrap">
																	<div class="icon">
																		<span class="ion-ios-arrow-down"></span>
																	</div>
																	<select name="" id="gugun" class="form-control">
																		<option value="0">선택</option>
																	</select>
																</div>
															</div>
														</div>
													</div>
													<div class="col-lg align-items-end">
														<div class="form-group">
															<label for="#">동</label>
															<div class="form-field">
																<div class="select-wrap">
																	<div class="icon">
																		<span class="ion-ios-arrow-down"></span>
																	</div>
																	<select name="" id="dong" class="form-control">
																		<option value="0">선택</option>
																	</select>
																</div>
															</div>
														</div>
													</div>
													<div class="col-lg align-items-end">
														<div class="form-group">
															<label for="#">상세검색</label>
															<div class="form-field">
																<div class="select-wrap">
																	<div class="icon">
																		<span class="ion-ios-arrow-down"></span>
																	</div>
																	<select name="detailSearch_apt_dong"
																		id="detailSearch_apt_dong" class="form-control">
																		<option value="apt">아파트</option>
																		<option value="dong">동</option>
																	</select>
																</div>
																<input id="detailedSearch" type="text"
																	placeholder="검색어 입력">
															</div>
														</div>
													</div>
													<div class="col-lg align-self-end">
														<div class="form-group">
															<div class="form-field">
																<a id="btn_detailedSearch">Search</a>
																<!-- <input type="submit" value="Search" class="form-control btn btn-primary"> -->
															</div>
														</div>
													</div>
												</div>
											</form>
										</div>
									</div>
								</div>
							</div>
						</section>

						<!-- 결과 출력 부분 -->
						<table
							class="table mt-2 table-hover my-5 text-center table_searchResult s-coredream-light">
							<thead>
								<tr class="text-center table_header">
									<!-- <th>번호</th> -->
									<th>매물명</th>
									<th>법정동</th>
									<th>지번</th>
									<!-- <th>지역코드</th> -->
									<th>실거래가</th>
									<!-- <th>위도</th> -->
									<!-- <th>경도</th> -->
								</tr>
							</thead>
							<tbody id="searchResult">
							</tbody>
						</table>

						<!-- 아파트 상세정보 modal -->
						<div class="modal" id="houseDataModal">
							<div class="modal-dialog">
								<div class="modal-content ">

									<!-- Modal Header -->
									<div class="modal-header">
										<h4 class="modal-title">매물 정보</h4>
										<button type="button" class="close" data-dismiss="modal">&times;</button>
									</div>

									<!-- Modal body -->
									<div class="modal-body">
										<table class="table table-bordered">
											<colgroup>
												<col width="120">
												<col width="*">
												<col width="120">
												<col width="*">
											</colgroup>
											<tbody>
												<tr>
													<th class="text-center">매물명</th>
													<td class="text-left" colspan="3" id="modal_AptName"></td>
												</tr>
												<tr>
													<th class="text-center">주소</th>
													<td class="text-left" colspan="3" id="modal_dong_jibun"></td>
												</tr>
												<tr>
													<th class="text-center">완공년도</th>
													<td class="text-left" colspan="3" id="modal_buildYear"></td>
												</tr>
												<tr>
													<th class="text-center">최근 거래일</th>
													<td class="text-left" colspan="3" id="modal_dealYMD"></td>
												</tr>
												<tr>
													<th class="text-center">거래가</th>
													<td class="text-left" id="modal_dealAmount"></td>
													<th class="text-center">월세</th>
													<td class="text-left" id="modal_rentMoney"></td>
												</tr>
												<tr>
													<th class="text-center">전용면적</th>
													<td class="text-left" id="modal_area"></td>
													<th class="text-center">층수</th>
													<td class="text-left" id="modal_floor"></td>
												</tr>
												<!-- <tr>
													<td colspan="4" class="text-center"><img
														id="modal_img"></td>
												</tr> -->
												<tr>
													<td colspan="4"><div id="roadview" style="height:300px"></div></td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
						<!-- modal 끝 -->

						<!-- google map 표시 -->
						<!-- <div id="map" style="width: 100%; height: 500px; margin: auto;"></div> -->

						<!-- kakao map 표시 -->
						<div id="map" style="width: 100%; height: 500px;"></div>
						
						<!-- kakap map script -->
						<script>
							/* *******************카카오맵 API ******************** */
							var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
							mapOption = {
								center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
								level : 4
							// 지도의 확대 레벨 
							};

							var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
							map.addOverlayMapTypeId(kakao.maps.MapTypeId.TRAFFIC);	// 교통정보
							//map.addOverlayMapTypeId(kakao.maps.MapTypeId.ROADVIEW);	// 로드뷰
							//map.addOverlayMapTypeId(kakao.maps.MapTypeId.TERRAIN);	// 지형도
							
							// -- map control 추가 -- //
							// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
							var mapTypeControl = new kakao.maps.MapTypeControl();

							// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
							// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
							map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
							
							// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
							var zoomControl = new kakao.maps.ZoomControl();
							map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
							// -- map control end -- //

							// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
							if (navigator.geolocation) {

								// GeoLocation을 이용해서 접속 위치를 얻어옵니다
								navigator.geolocation.getCurrentPosition(function(position) {

									var lat = position.coords.latitude, // 위도
									lon = position.coords.longitude; // 경도

									var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
									message = '<div style="padding:5px;">현위치</div>'; // 인포윈도우에 표시될 내용입니다

									// 마커와 인포윈도우를 표시합니다
									displayMarker(locPosition, message);

								});

							} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다

								var locPosition = new kakao.maps.LatLng(33.450701, 126.570667), message = 'geolocation을 사용할수 없어요..'

								displayMarker(locPosition, message);
							}
							
							
							// -- 주소로 좌표 검색하며 마커찍기 -- //
							function setMarker(address, message) {
								//console.log("address: " + address + ", message: " + message);
								// 주소-좌표 변환 객체를 생성합니다
								var geocoder = new kakao.maps.services.Geocoder();

								// 주소로 좌표를 검색합니다
								// 형식: '제주특별자치도 제주시 첨단로 242' 시/도 구/군 동
								geocoder.addressSearch(address, function(result, status) {

								    // 정상적으로 검색이 완료됐으면 
								     if (status === kakao.maps.services.Status.OK) {

								        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

								        // 결과값으로 받은 위치를 마커로 표시합니다
								        displayMarker(coords, message);
								    } 
								});   
							}
							// -- 주소로 좌표 검색하며 마커찍기 end -- //
							
							/* let locPosition = new kakao.maps.LatLng(33.450701, 126.570667);
							let message = vo.aptName;
							displayMarker(locPosition, message); */

							var markers = [];
                            var customOverlays = [];
                            var lastPosition;
                            var flag_marker = false;
							// 지도에 마커와 인포윈도우를 표시하는 함수입니다
							function displayMarker(locPosition, message) {
								var imageSrc = '${root}/images/heart.png', // 마커이미지의 주소입니다    
							    imageSize = new kakao.maps.Size(43, 40), // 마커이미지의 크기입니다
							    imageOption = {offset: new kakao.maps.Point(20, 40)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

								// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
								var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);


								// 마커를 생성합니다
								var marker = new kakao.maps.Marker({
									//map : map,
									image: markerImage, // marker image 설정
									position : locPosition
								});

								markers.push(marker); //
								marker.setMap(map);
								lastPosition = locPosition;
								
								let content = "<div class=\"marker_message\">" + message  + "</div>";
								
								//var content = message;
								var customOverlay = new kakao.maps.CustomOverlay({
									map: map,
									position: locPosition,
									content: content
								});
								
								customOverlays.push(customOverlay); //
								customOverlay.setMap(map);
								
								/* var iwContent = message, // 인포윈도우에 표시할 내용
								iwRemoveable = true;

								// 인포윈도우를 생성합니다
								var infowindow = new kakao.maps.InfoWindow({
									content : iwContent,
									removable : iwRemoveable
								});

								// 인포윈도우를 마커위에 표시합니다 
								infowindow.open(map, marker); */

								// 지도 중심좌표를 접속위치로 변경합니다
								if (!flag_marker) {
									flag_marker = true;
									map.setCenter(locPosition);
								}
							}
							
							// 중첩된 마커를 제거합니다.
							function hideMarker() {
								flag_marker = false;
								for (var i = 0; i < markers.length; i++) {
									markers[i].setMap(null);
								}
								for (var i = 0; i < customOverlays.length; i++) {
									customOverlays[i].setMap(null);
								}
							}

							/*
							$.get("https://maps.googleapis.com/maps/api/geocode/json", {
										key : 'AIzaSyCZ-UitoKEtkU-eHluv1CbD2lLkuxMuYXs',
										address : vo.dong + "+" + vo.aptName + "+" + vo.jibun
									},
							 */

							// 구글맵 위도 경도 불러오기
							/* function geocode(jsonData) {
								let idx = 0;
								$.each(jsonData, function(index, vo) {
									let tmpLat;
									let tmpLng;
									$.ajax({
										url : 'https://maps.googleapis.com/maps/api/geocode/json',
										key : 'AIzaSyCZ-UitoKEtkU-eHluv1CbD2lLkuxMuYXs',
										address : vo.dong + "+" + vo.aptName + "+" + vo.jibun,
										type : 'GET',
										contentType : 'application/json;charset=utf-8',
										success : function(data, status) {
											//alert(data.results[0].geometry.location.lat);
											tmpLat = data.results[0].geometry.location.lat;
											tmpLng = data.results[0].geometry.location.lng;
											$("#lat_" + index).text(tmpLat);
											$("#lng_" + index).text(tmpLng);
											addMarker(tmpLat, tmpLng, vo.aptName);
										}
									}); //ajax
								}); //each
							}
							var multi = {
								lat : 37.5665734,
								lng : 126.978179
							};
							var map;

							function initMap() {
								map = new google.maps.Map(document.getElementById('map'), {
									center : multi,
									zoom : 15
								});
								var marker = new google.maps.Marker({
									position : multi,
									map : map
								});
							}

							function addMarker(tmpLat, tmpLng, aptName) {
								var marker = new google.maps.Marker({
									position : new google.maps.LatLng(parseFloat(tmpLat), parseFloat(tmpLng)),
									label : aptName,
									title : aptName
								});
								marker.addListener('click', function() {
									map.setZoom(17);
									map.setCenter(marker.getPosition());
									callHouseDealInfo();
								});
								marker.setMap(map);
							}

							function callHouseDealInfo() {
								alert("you can call HouseDealInfo");
							} */
						</script>

					</div>
				</div>

			</section>
			<!-- 시군동 section -->
		</div>
	</section>


	<%-- <section class="ftco-section ftco-no-pb">
		<div class="container">
			<div class="row justify-content-start mb-5">
				<div class="col-md-8 heading-section ftco-animate">
					<h2 class="mb-4">최근 추가된 매물</h2>
					<p>완벽한 파노라마 한강뷰, 반포 아크로리버파크</p>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<div class="carousel-properties owl-carousel">
						<div class="item">
							<div class="project">
								<div class="img">
									<img src="${root}/images/work-1.jpg" class="img-fluid"
										alt="Colorlib Template">
									<div class="text">
										<span>Sale</span>
										<h3>
											<a href="properties.jsp">Fatima <br> Subdivision
											</a>
										</h3>
									</div>
								</div>
								<div class="desc pt-3">
									<h4 class="price">$120,000</h4>
									<p class="h-info">
										<span class="location">New York</span> <span class="details">&mdash;
											3bds, 2bath</span>
									</p>
								</div>
							</div>
						</div>
						<div class="item">
							<div class="project">
								<div class="img">
									<img src="${root}/images/work-2.jpg" class="img-fluid"
										alt="Colorlib Template">
									<div class="text">
										<span>Sale</span>
										<h3>
											<a href="properties.jsp">Fatima <br> Subdivision
											</a>
										</h3>
									</div>
								</div>
								<div class="desc pt-3">
									<h4 class="price">$120,000</h4>
									<p class="h-info">
										<span class="location">New York</span> <span class="details">&mdash;
											3bds, 2bath</span>
									</p>
								</div>
							</div>
						</div>
						<div class="item">
							<div class="project">
								<div class="img">
									<img src="${root}/images/work-3.jpg" class="img-fluid"
										alt="Colorlib Template">
									<div class="text">
										<span>Sale</span>
										<h3>
											<a href="properties.jsp">Fatima <br> Subdivision
											</a>
										</h3>
									</div>
								</div>
								<div class="desc pt-3">
									<h4 class="price">$120,000</h4>
									<p class="h-info">
										<span class="location">New York</span> <span class="details">&mdash;
											3bds, 2bath</span>
									</p>
								</div>
							</div>
						</div>
						<div class="item">
							<div class="project">
								<div class="img">
									<img src="${root}/images/work-4.jpg" class="img-fluid"
										alt="Colorlib Template">
									<div class="text">
										<span>Sale</span>
										<h3>
											<a href="properties.jsp">Fatima <br> Subdivision
											</a>
										</h3>
									</div>
								</div>
								<div class="desc pt-3">
									<h4 class="price">$120,000</h4>
									<p class="h-info">
										<span class="location">New York</span> <span class="details">&mdash;
											3bds, 2bath</span>
									</p>
								</div>
							</div>
						</div>
						<div class="item">
							<div class="project">
								<div class="img">
									<img src="${root}/images/work-4.jpg" class="img-fluid"
										alt="Colorlib Template">
									<div class="text">
										<span>Sale</span>
										<h3>
											<a href="properties.jsp">Fatima <br> Subdivision
											</a>
										</h3>
									</div>
								</div>
								<div class="desc pt-3">
									<h4 class="price">$120,000</h4>
									<p class="h-info">
										<span class="location">New York</span> <span class="details">&mdash;
											3bds, 2bath</span>
									</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section> --%>

	<!-- <section
		class="ftco-section ftco-no-pb ftco-no-pt ftco-counter img ftco-animate"
		id="section-counter">
		<div class="container">
			<div class="row d-md-flex align-items-center justify-content-start">
				<div class="col-lg-10">
					<div class="bg-counter p-4">
						<div class="row py-2 d-md-flex align-items-center">
							<div
								class="col-md d-flex justify-content-center counter-wrap ftco-animate">
								<div class="block-18">
									<div class="text">
										<strong class="number" data-number="172934">0</strong> <span>등록된
											매물 수</span>
									</div>
								</div>
							</div>
							<div
								class="col-md d-flex justify-content-center counter-wrap ftco-animate">
								<div class="block-18">
									<div class="text">
										<strong class="number" data-number="35150">0</strong> <span>사이트
											이용 회원 수</span>
									</div>
								</div>
							</div>
							<div
								class="col-md d-flex justify-content-center counter-wrap ftco-animate">
								<div class="block-18">
									<div class="text">
										<strong class="number" data-number="264">0</strong> <span>거래
											완료된 매물 수</span>
									</div>
								</div>
							</div>
							<div class="col-md d-flex justify-content-center counter-wrap ftco-animate">
								<div class="block-18">
									<div class="text">
										<strong class="number" data-number="300">0</strong>
										<span>Working Days</span>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section> -->

	<jsp:include page="./parkinfo.jsp"></jsp:include>
	<jsp:include page="./footer2.jsp"></jsp:include>

	<!-- loader -->
	<div id="ftco-loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
			<circle class="path-bg" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke="#eeeeee" />
			<circle class="path" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg>
	</div>


	<script src="${root}/js/jquery.min.js"></script>
	<script src="${root}/js/jquery-migrate-3.0.1.min.js"></script>
	<script src="${root}/js/popper.min.js"></script>
	<script src="${root}/js/bootstrap.min.js"></script>
	<script src="${root}/js/jquery.easing.1.3.js"></script>
	<script src="${root}/js/jquery.waypoints.min.js"></script>
	<script src="${root}/js/jquery.stellar.min.js"></script>
	<script src="${root}/js/owl.carousel.min.js"></script>
	<script src="${root}/js/jquery.magnific-popup.min.js"></script>
	<script src="${root}/js/aos.js"></script>
	<script src="${root}/js/jquery.animateNumber.min.js"></script>
	<script src="${root}/js/scrollax.min.js"></script>
	<script src="${root}/js/main.js"></script>
</html>