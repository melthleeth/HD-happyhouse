<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주변 공원 정보</title>
<link rel="stylesheet" href="${root}/css/style_hyejin.css">
<link rel="stylesheet" href="${root}/css/open-iconic-bootstrap.min.css">
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
	<!-- 인증키: 77504243576d656c393548576b476d -->
	<div class="container">
		<div class="spacing_4 align_center park_bg">
			<h1 class="park_title" id="park_info">주변 공원 정보</h1>
			<table id="table_width_1" class="table borderless table_style_2 text-center">
				<thead>
					<colgroup>
	                    <col width="25%">
	                    <col width="*">
	                    <col width="20%">
	                    <col width="15%">
	                </colgroup>
					<tr class="text-center table_header">
						<th>공원명</th>
						<th>위치</th>
						<th>전화번호</th>
						<th>웹사이트</th>
					</tr>
				</thead>
				<tbody id="result_park">
				</tbody>
			</table>
		</div>
	</div>
	
	<!-- 공원 상세정보 modal -->
	<div class="modal" id="parkinfoModal">
		<div class="modal-dialog">
			<div class="modal-content ">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title park_text_1">공원 정보</h4>
					<a class="spacing_5 park_text_2" id="modal_park_guide">가이드맵</a>
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
								<th class="text-center">공원명</th>
								<td class="text-left" colspan="3" id="modal_park_name"></td>
							</tr>
							<tr>
								<th class="text-center">주소</th>
								<td class="text-left" colspan="3" id="modal_park_addr"></td>
							</tr>
							<tr>
								<th class="text-center">개장일</th>
								<td class="text-left" colspan="3" id="modal_park_openDate"></td>
							</tr>
							<tr>
								<th class="text-center">면적</th>
								<td class="text-left" colspan="3" id="modal_park_area"></td>
							</tr>
							<tr>
								<th class="text-center">식물 종류</th>
								<td class="text-left" colspan="3" id="modal_park_plants"></td>
							</tr>
							<tr>
								<!-- <th class="text-center">정보</th> -->
								<td class="text-left" colspan="4" id="modal_park_content"></td>
							</tr>
							<tr>
								<td colspan="4" class="text-center"><img
									id="modal_park_img"  style="width:350px;"></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<!-- modal 끝 -->
	
	<script>
		$(document).ready(function() {
			$("#dong").change(function() {
				$.ajax({
					url: 'http://openapi.seoul.go.kr:8088/77504243576d656c393548576b476d/json/SearchParkInfoService/1/132/',
					type : 'GET',
					contentType : 'application/json;charset=utf-8',
					dataType : 'json',
					/* key: '77504243576d656c393548576b476d'
					type: 'json',
					service: 'SearchParkInfoService'
					start_index: 1,
					end_index: 132, */
					success: function(response) {
						let parks = response.SearchParkInfoService.row;
						let P_ZONE = $("#gugun option:selected").text();
						console.log("P_ZONE: " + P_ZONE);
						$("#park_info").text(P_ZONE + " 공원 정보");
						//hideMarker();
						$("#result_park").empty();
						$.each(parks, function(index, park) {
							if (park.P_ZONE === P_ZONE)  {
								//console.log((index + 1) + ": " + park.P_PARK + ", 주소: " + park.P_ADDR);
								//console.log("웹사이트: " + park.TEMPLATE_URL);
								//console.log(park);
								// park_no: modal 띄울때 필요한 attr
								let str = "<tr park_idx=\"" + park.P_IDX + "\" class=\"view_park\">" +
												"<td>" + park.P_PARK + "</td>" + 
												"<td>" + park.P_ADDR + "</td>" + 
												"<td>" + park.P_ADMINTEL + "</td>";
								if (park.TEMPLATE_URL.length > 0)
									str += "<td><a href=\"" + park.TEMPLATE_URL + "\" target=\"_blank\">" +
											"<img src=\"${root}/images/website.png\" width=\"32\">" +
											"</a></td>";
								else str += "<td></td>"
								str += "</tr>";
								$("#result_park").append(str);
								let coords = new kakao.maps.LatLng(park.LATITUDE, park.LONGITUDE);
						        displayMarker(coords, park.P_PARK, 2); // 결과값으로 받은 위치를 마커로 표시합니다
							} // if P_ZONE
						}); // each
					} // success
				})
			}); // gugun change
			
			
			// -- 공원 상세정보 modal -- //
			$(document).on("click", "tr.view_park", function() {
				let P_IDX = $(this).attr("park_idx");
				console.log("공원 번호: " + P_IDX)
				$.ajax({
					url: 'http://openapi.seoul.go.kr:8088/77504243576d656c393548576b476d/json/SearchParkInfoService/1/132/',
					type : 'GET',
					contentType : 'application/json;charset=utf-8',
					dataType : 'json',
					success : function(response) {
						let parks = response.SearchParkInfoService.row;
						
						$.each(parks, function(index, park) {
							if (park.P_IDX === P_IDX)  {
								let w = window.innerWidth * 0.7;
								let h = window.innerHeight * 0.7;
								let top = (screen.height/2)-(h/2);
								let clickSrc = "window.open(\'" + park.GUIDANCE + "\','popup', 'width=" + w + ", height=" + h + ", top=" + top + ", left=" + 50 +"'); return false;";
								let imgsrc = park.GUIDANCE;
								$("#modal_park_name").text(park.P_PARK);
								$("#modal_park_addr").text(park.P_ADDR);
								$("#modal_park_openDate").text(park.OPEN_DT);								
								$("#modal_park_area").text(park.AREA);								
								$("#modal_park_plants").text(park.MAIN_PLANTS);								
								$("#modal_park_visit").text(park.VISIT_ROAD);								
								$("#modal_park_content").text(park.P_LIST_CONTENT);
								$("#modal_park_img").attr("src", park.P_IMG);
								$("#modal_park_guide").attr("href", park.GUIDANCE);
								$("#modal_park_guide").attr("onclick", clickSrc);
								$("#parkinfoModal").modal();
							} // if P_IDX
						}); // each
					}, // success 
					error : function(xhr, status, msg) {
						console.log("상태값 : " + status + " Http에러메시지 : " + msg);
					}
				});
			}); // click
			
		}); // ready
	</script>
</body>

</html>