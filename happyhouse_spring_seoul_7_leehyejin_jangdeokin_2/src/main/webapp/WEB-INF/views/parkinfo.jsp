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
	<div class="spacing_4 align_center park_bg">
		<h1 class="park_title" id="park_info">주변 공원 정보</h1>
		<div class="">
			<table class="table borderless table_style_2 text-center">
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
						$.each(parks, function(index, park) {
							if (park.P_ZONE === P_ZONE)  {
								console.log((index + 1) + ": " + park.P_PARK + ", 주소: " + park.P_ADDR);
								console.log("웹사이트: " + park.TEMPLATE_URL);
								console.log(park);
								// park_no: modal 띄울때 필요한 attr
								let str = "<tr park_no=\"" + park.P_IDX + "\" class=\"view_park\">" +
												"<td>" + park.P_PARK + "</td>" + 
												"<td>" + park.P_ADDR + "</td>" + 
												"<td>" + park.P_ADMINTEL + "</td>";
								if (park.TEMPLATE_URL.length > 0)
									str += "<td><a href=\"" + park.TEMPLATE_URL + "\">" + 
											"<img src=\"${root}/images/website.png\" width=\"32\">" +
											"</a></td>";
								else str += "<td></td>"
								str += "</tr>";
								$("#result_park").append(str);
							}
						});
					}
				})
			});
		});
	</script>
</body>

</html>