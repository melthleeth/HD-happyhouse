<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<link rel="stylesheet" href="/css/open-iconic-bootstrap.min.css">
<link rel="stylesheet" href="/css/animate.css">

<link rel="stylesheet" href="/css/owl.carousel.min.css">
<link rel="stylesheet" href="/css/owl.theme.default.min.css">
<link rel="stylesheet" href="/css/magnific-popup.css">

<link rel="stylesheet" href="/css/aos.css">

<link rel="stylesheet" href="/css/ionicons.min.css">

<link rel="stylesheet" href="/css/bootstrap-datepicker.css">
<link rel="stylesheet" href="/css/jquery.timepicker.css">


<link rel="stylesheet" href="/css/flaticon.css">
<link rel="stylesheet" href="/css/icomoon.css">
<link rel="stylesheet" href="/css/style.css">

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<!-- <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA7GT09DhDSFW-RCE_lr1Qv78b1av8RO9k&callback=initMap&region=kr"></script> -->
<script src="js/jquery.min.js"></script>
<script src="js/jquery-migrate-3.0.1.min.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.easing.1.3.js"></script>
<script src="js/jquery.waypoints.min.js"></script>
<script src="js/jquery.stellar.min.js"></script>
<script src="js/owl.carousel.min.js"></script>
<script src="js/jquery.magnific-popup.min.js"></script>
<script src="js/aos.js"></script>
<script src="js/jquery.animateNumber.min.js"></script>
<script src="js/scrollax.min.js"></script>
<!-- <script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script> -->
<script src="js/google-map.js"></script>
<script src="js/main.js"></script>
<script
	src="https://unpkg.com/@google/markerclustererplus@4.0.1/dist/markerclustererplus.min.js"></script>
<script defer
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCZ-UitoKEtkU-eHluv1CbD2lLkuxMuYXs&callback=initMap">
	
</script>
<style>
#detailedSearch {
	float: left;
	padding: 5px 16px;
	width: 10vw;
	border-radius: 50px;
	margin-top: 5px;
	font-size: 17px;
}
</style>
</head>

<body>
	<jsp:include page="./nav.jsp"></jsp:include>

	<section id="section-map">
		<div class="container">

			<section id="index_section">
				<div class="card col-sm-12 mt-1" style="min-height: 850px;">
					<div class="card-body">

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
																	<select name="" id="select1_sido" class="form-control">
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
																	<select name="" id="select2_gugun" class="form-control">
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
																	<select name="" id="select3_dong" class="form-control">
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
																<button id="btn_detailedSearch" class="btn btn-primary">Search</button>
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
						<!-- 시도 : <select id="sido">
					<option value="0">선택</option>
				</select>
				구군 : <select id="gugun">
					<option value="0">선택</option>
				</select>
				읍면동 : <select id="dong">
					<option value="0">선택</option>
				</select> -->
						<table class="table mt-2 table-hover">
							<thead>
								<tr>
									<th>번호</th>
									<th>법정동</th>
									<th>아파트이름</th>
									<th>지번</th>
									<th>지역코드</th>
									<th>실거래가</th>
									<th>위도</th>
									<th>경도</th>
								</tr>
							</thead>
							<tbody id="searchResult">
							</tbody>
						</table>

						<div id="map" style="width: 100%; height: 500px; margin: auto;"></div>

					</div>
				</div>
			</section>
		</div>
	</section>


	<section class="ftco-section ftco-no-pb">
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
									<img src="./images/work-1.jpg" class="img-fluid"
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
									<img src="images/work-2.jpg" class="img-fluid"
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
									<img src="images/work-3.jpg" class="img-fluid"
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
									<img src="images/work-4.jpg" class="img-fluid"
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
									<img src="images/work-5.jpg" class="img-fluid"
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
	</section>

	<section
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
							<!-- <div class="col-md d-flex justify-content-center counter-wrap ftco-animate">
								<div class="block-18">
									<div class="text">
										<strong class="number" data-number="300">0</strong>
										<span>Working Days</span>
									</div>
								</div>
							</div> -->
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<jsp:include page="./footer.jsp"></jsp:include>
	<!-- <footer class="ftco-footer ftco-footer-2 ftco-section">
		<div class="container">
			<div class="row mb-5">
				<div class="col-md">
					<div class="ftco-footer-widget mb-4">
						<h2 class="ftco-heading-2">Hamlet.</h2>
						<p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia,
							there live the blind texts.</p>
						<ul class="ftco-footer-social list-unstyled float-md-left float-lft mt-3">
							<li class="ftco-animate"><a href="#"><span class="icon-twitter"></span></a></li>
							<li class="ftco-animate"><a href="#"><span class="icon-facebook"></span></a></li>
							<li class="ftco-animate"><a href="#"><span class="icon-instagram"></span></a></li>
						</ul>
					</div>
				</div>
				<div class="col-md">
					<div class="ftco-footer-widget mb-4 ml-md-4">
						<h2 class="ftco-heading-2">Company</h2>
						<ul class="list-unstyled">
							<li><a href="#"><span class="icon-long-arrow-right mr-2"></span>Home</a></li>
							<li><a href="#"><span class="icon-long-arrow-right mr-2"></span>About</a></li>
							<li><a href="#"><span class="icon-long-arrow-right mr-2"></span>Services</a></li>
							<li><a href="#"><span class="icon-long-arrow-right mr-2"></span>FAQ</a></li>
							<li><a href="#"><span class="icon-long-arrow-right mr-2"></span>Reviews</a></li>
							<li><a href="#"><span class="icon-long-arrow-right mr-2"></span>Stories</a></li>
						</ul>
					</div>
				</div>
				<div class="col-md">
					<div class="ftco-footer-widget mb-4">
						<h2 class="ftco-heading-2">Explore</h2>
						<ul class="list-unstyled">
							<li><a href="#"><span class="icon-long-arrow-right mr-2"></span>Privacy</a></li>
							<li><a href="#"><span class="icon-long-arrow-right mr-2"></span>Policy</a></li>
							<li><a href="#"><span class="icon-long-arrow-right mr-2"></span>Terms</a></li>
							<li><a href="#"><span class="icon-long-arrow-right mr-2"></span>Review</a></li>
							<li><a href="#"><span class="icon-long-arrow-right mr-2"></span>Features</a></li>
						</ul>
					</div>
				</div>
				<div class="col-md">
					<div class="ftco-footer-widget mb-4">
						<h2 class="ftco-heading-2">Get Started</h2>
						<ul class="list-unstyled">
							<li><a href="#"><span class="icon-long-arrow-right mr-2"></span>Buy</a></li>
							<li><a href="#"><span class="icon-long-arrow-right mr-2"></span>Rent</a></li>
							<li><a href="#"><span class="icon-long-arrow-right mr-2"></span>Payment</a></li>
							<li><a href="#"><span class="icon-long-arrow-right mr-2"></span>Mortgage</a></li>
							<li><a href="#"><span class="icon-long-arrow-right mr-2"></span>Loan</a></li>
						</ul>
					</div>
				</div>
				<div class="col-md">
					<div class="ftco-footer-widget mb-4">
						<h2 class="ftco-heading-2">Newsletter</h2>
						<p>Far far away, behind the word mountains, far from the countries.</p>
						<form action="#" class="subscribe-form">
							<div class="form-group">
								<input type="text" class="form-control mb-2 text-center"
									placeholder="Enter email address">
								<input type="submit" value="Subscribe" class="form-control submit px-3">
							</div>
						</form>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12 text-center">

					<p>
						Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0.
						Copyright &copy;
						<script>document.write(new Date().getFullYear());</script> All rights reserved | This template
						is made with <i class="icon-heart" aria-hidden="true"></i> by <a href="https://colorlib.com"
							target="_blank">Colorlib</a>
						Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0.
					</p>
				</div>
			</div>
		</div>
	</footer> -->



	<!-- loader -->
	<div id="ftco-loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
			<circle class="path-bg" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke="#eeeeee" />
			<circle class="path" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg>
	</div>

	<script>
		let colorArr = [ '', '' ];
		$(document).ready(
				function() {
					$.get("${pageContext.request.contextPath}/map", {
						act : "sido"
					}, function(data, status) {
						$.each(data, function(index, vo) {
							$("#sido").append(
									"<option value='" + vo.sido_code + "'>"
											+ vo.sido_name + "</option>");
						}); //each
					} //function
					, "json"); //get
				}); //ready
		$(document)
				.ready(
						function() {
							$("#sido")
									.change(
											function() {
												$
														.get(
																"${pageContext.request.contextPath}/map",
																{
																	act : "gugun",
																	sido : $(
																			"#sido")
																			.val()
																},
																function(data,
																		status) {
																	$("#gugun")
																			.empty();
																	$("#gugun")
																			.append(
																					'<option value="0">선택</option>');
																	$
																			.each(
																					data,
																					function(
																							index,
																							vo) {
																						$(
																								"#gugun")
																								.append(
																										"<option value='" + vo.gugun_code + "'>"
																												+ vo.gugun_name
																												+ "</option>");
																					}); //each
																} //function
																, "json"); //get
											}); //change
							$("#gugun")
									.change(
											function() {
												$
														.get(
																"${pageContext.request.contextPath}/map",
																{
																	act : "dong",
																	gugun : $(
																			"#gugun")
																			.val()
																},
																function(data,
																		status) {
																	$("#dong")
																			.empty();
																	$("#dong")
																			.append(
																					'<option value="0">선택</option>');
																	$
																			.each(
																					data,
																					function(
																							index,
																							vo) {
																						$(
																								"#dong")
																								.append(
																										"<option value='" + vo.dong + "'>"
																												+ vo.dong
																												+ "</option>");
																					}); //each
																} //function
																, "json"); //get
											}); //change
							$("#dong")
									.change(
											function() {
												$
														.get(
																"${pageContext.request.contextPath}/map",
																{
																	act : "apt",
																	dong : $(
																			"#dong")
																			.val()
																},
																function(data,
																		status) {
																	$(
																			"#searchResult")
																			.empty();
																	$
																			.each(
																					data,
																					function(
																							index,
																							vo) {
																						let str = "<tr class="
																								+ colorArr[index % 2]
																								+ ">"
																								+ "<td>"
																								+ vo.no
																								+ "</td>"
																								+ "<td>"
																								+ vo.dong
																								+ "</td>"
																								+ "<td>"
																								+ vo.aptName
																								+ "</td>"
																								+ "<td>"
																								+ vo.jibun
																								+ "</td>"
																								+ "<td>"
																								+ vo.code
																								+ "</td>"
																								+ "<td>"
																								+ vo.dealAmount
																								+ "</td>"
																								+ "<td id='lat_" + index + "'></td><td id='lng_" + index +
															"'></td></tr>";
																						$(
																								"tbody")
																								.append(
																										str);
																						$(
																								"#searchResult")
																								.append(
																										vo.dong
																												+ " "
																												+ vo.aptName
																												+ " "
																												+ vo.jibun
																												+ "<br>");
																					}); //each
																	geocode(data);
																} //function
																, "json"); //get
											}); //change

							// map은 HouseMapController의 annotation
							$("#detailSearch_apt_dong")
									.change(
											function() {
												$
														.get(
																"${pageContext.request.contextPath}/map",
																{
																	act : "apt",
																	detailSearch_apt_dong : $(
																			"#detailSearch_apt_dong")
																			.val()
																},
																function(data,
																		status) {
																	$(
																			"#searchResult")
																			.empty();
																	$
																			.each(
																					data,
																					function(
																							index,
																							vo) {
																						let str = "<tr class="
																								+ colorArr[index % 2]
																								+ ">"
																								+ "<td>"
																								+ vo.no
																								+ "</td>"
																								+ "<td>"
																								+ vo.dong
																								+ "</td>"
																								+ "<td>"
																								+ vo.aptName
																								+ "</td>"
																								+ "<td>"
																								+ vo.jibun
																								+ "</td>"
																								+ "<td>"
																								+ vo.code
																								+ "</td>"
																								+ "<td>"
																								+ vo.dealAmount
																								+ "</td>"
																								+ "<td id='lat_" + index + "'></td><td id='lng_" + index +
															"'></td></tr>";
																						$(
																								"tbody")
																								.append(
																										str);
																						$(
																								"#searchResult")
																								.append(
																										vo.dong
																												+ " "
																												+ vo.aptName
																												+ " "
																												+ vo.jibun
																												+ "<br>");
																					}); //each
																	geocode(data);
																} //function
																, "json"); //get
											}); //change

							$("#btn_detailedSearch")
									.on(
											"click",
											function() {
												$
														.get(
																"${pageContext.request.contextPath}/map",
																{
																	"act" : "searchByKeyword",
																	"searchType" : $(
																			"#detailSearch_apt_dong")
																			.val(),
																	"detailedSearch" : $(
																			"#detailedSearch")
																			.val()
																},
																function(data,
																		status) {
																	$(
																			"#searchResult")
																			.empty();
																	$
																			.each(
																					data,
																					function(
																							index,
																							vo) {
																						let str = "<tr class="
																								+ colorArr[index % 2]
																								+ ">"
																								+ "<td>"
																								+ vo.no
																								+ "</td>"
																								+ "<td>"
																								+ vo.dong
																								+ "</td>"
																								+ "<td>"
																								+ vo.aptName
																								+ "</td>"
																								+ "<td>"
																								+ vo.jibun
																								+ "</td>"
																								+ "<td>"
																								+ vo.dealAmount
																								+ "</td>"
																								+ "<td id='lat_" + index + "'></td><td id='lng_" + index +
															"'></td></tr>";
																						$(
																								"tbody")
																								.append(
																										str);
																						$(
																								"#searchResult")
																								.append(
																										vo.dong
																												+ " "
																												+ vo.aptName
																												+ " "
																												+ vo.jibun
																												+ "<br>");
																					}); //each
																	geocode(data);
																} //function
																, "json"); //get
											}); // onclick: search

						}); //ready

		function geocode(jsonData) {
			let idx = 0;
			$.each(jsonData, function(index, vo) {
				let tmpLat;
				let tmpLng;
				$.get("https://maps.googleapis.com/maps/api/geocode/json", {
					key : 'AIzaSyCZ-UitoKEtkU-eHluv1CbD2lLkuxMuYXs',
					address : vo.dong + "+" + vo.aptName + "+" + vo.jibun
				}, function(data, status) {
					//alert(data.results[0].geometry.location.lat);
					tmpLat = data.results[0].geometry.location.lat;
					tmpLng = data.results[0].geometry.location.lng;
					$("#lat_" + index).text(tmpLat);
					$("#lng_" + index).text(tmpLng);
					addMarker(tmpLat, tmpLng, vo.aptName);
				}, "json"); //get
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
				position : new google.maps.LatLng(parseFloat(tmpLat),
						parseFloat(tmpLng)),
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
		}
	</script>
</html>