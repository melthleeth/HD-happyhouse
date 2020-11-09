<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
	<title>Properties</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<link href="https://fonts.googleapis.com/css?family=Rubik:300,400,500,700,900" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Playfair+Display:400,400i,700,700i,900,900i" rel="stylesheet">

	<link rel="stylesheet" href="css/open-iconic-bootstrap.min.css">
	<link rel="stylesheet" href="css/animate.css">

	<link rel="stylesheet" href="css/owl.carousel.min.css">
	<link rel="stylesheet" href="css/owl.theme.default.min.css">
	<link rel="stylesheet" href="css/magnific-popup.css">

	<link rel="stylesheet" href="css/aos.css">

	<link rel="stylesheet" href="css/ionicons.min.css">

	<link rel="stylesheet" href="css/bootstrap-datepicker.css">
	<link rel="stylesheet" href="css/jquery.timepicker.css">


	<link rel="stylesheet" href="css/flaticon.css">
	<link rel="stylesheet" href="css/icomoon.css">
	<link rel="stylesheet" href="css/style.css">
</head>

<body>

	<jsp:include page="/nav.jsp"></jsp:include>
	<!-- END nav -->

	<section class="hero-wrap hero-wrap-2" style="background-image: url('images/bg_4.jpg');"
		data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
		<div class="container">
			<div class="row no-gutters slider-text align-items-center justify-content-center">
				<div class="col-md-9 ftco-animate text-center">
					<h1 class="mb-2 bread">Properties</h1>
					<p class="breadcrumbs"><span class="mr-2"><a href="index.html">Home <i
									class="ion-ios-arrow-forward"></i></a></span> <span>Properties <i
								class="ion-ios-arrow-forward"></i></span></p>
				</div>
			</div>
		</div>
	</section>

	<section class="ftco-section">
		<div class="container">
			<div class="row">
				<div class="col-lg-3">
					<div class="search-wrap">
						<h3>Advance Search</h3>
						<form action="#" class="search-property">
							<div class="row">
								<div class="col-md-12 align-items-end ftco-animate">
									<div class="form-group">
										<label for="#">Keyword</label>
										<div class="form-field">
											<div class="icon"><span class="icon-pencil"></span></div>
											<input type="text" class="form-control" placeholder="Keyword">
										</div>
									</div>
								</div>
								<div class="col-md-12 align-items-end ftco-animate">
									<div class="form-group">
										<label for="#">Location</label>
										<div class="form-field">
											<div class="icon"><span class="icon-pencil"></span></div>
											<input type="text" class="form-control" placeholder="City/Locality Name">
										</div>
									</div>
								</div>
								<div class="col-md-12 align-items-end ftco-animate">
									<div class="form-group">
										<label for="#">Property Type</label>
										<div class="form-field">
											<div class="select-wrap">
												<div class="icon"><span class="ion-ios-arrow-down"></span></div>
												<select name="" id="" class="form-control">
													<option value="">Type</option>
													<option value="">Commercial</option>
													<option value="">- Office</option>
													<option value="">Residential</option>
													<option value="">Villa</option>
													<option value="">Condominium</option>
													<option value="">Apartment</option>
												</select>
											</div>
										</div>
									</div>
								</div>
								<div class="col-md-12 align-items-end ftco-animate">
									<div class="form-group">
										<label for="#">Property Status</label>
										<div class="form-field">
											<div class="select-wrap">
												<div class="icon"><span class="ion-ios-arrow-down"></span></div>
												<select name="" id="" class="form-control">
													<option value="">Type</option>
													<option value="">Rent</option>
													<option value="">Sale</option>
												</select>
											</div>
										</div>
									</div>
								</div>
								<div class="col-md-12 align-items-end ftco-animate">
									<div class="form-group">
										<label for="#">Agents</label>
										<div class="form-field">
											<div class="select-wrap">
												<div class="icon"><span class="ion-ios-arrow-down"></span></div>
												<select name="" id="" class="form-control">
													<option value="">Any</option>
													<option value="">Jonh Doe</option>
													<option value="">Doe Mags</option>
													<option value="">Kenny Scott</option>
													<option value="">Emily Storm</option>
												</select>
											</div>
										</div>
									</div>
								</div>
							</div>

							<div class="row">
								<div class="col-md-12 align-items-end ftco-animate">
									<div class="form-group">
										<label for="#">Min Beds</label>
										<div class="form-field">
											<div class="select-wrap">
												<div class="icon"><span class="ion-ios-arrow-down"></span></div>
												<select name="" id="" class="form-control">
													<option value="">1</option>
													<option value="">2</option>
													<option value="">3</option>
													<option value="">4</option>
													<option value="">5</option>
												</select>
											</div>
										</div>
									</div>
								</div>
								<div class="col-md-12 align-items-end ftco-animate">
									<div class="form-group">
										<label for="#">Min Bathroom</label>
										<div class="form-field">
											<div class="select-wrap">
												<div class="icon"><span class="ion-ios-arrow-down"></span></div>
												<select name="" id="" class="form-control">
													<option value="">1</option>
													<option value="">2</option>
													<option value="">3</option>
													<option value="">4</option>
													<option value="">5</option>
												</select>
											</div>
										</div>
									</div>
								</div>
								<div class="col-md-12 align-items-end ftco-animate">
									<div class="form-group">
										<label for="#">Min Price</label>
										<div class="form-field">
											<div class="select-wrap">
												<div class="icon"><span class="ion-ios-arrow-down"></span></div>
												<select name="" id="" class="form-control">
													<option value="">Min Price</option>
													<option value="">$1,000</option>
													<option value="">$5,000</option>
													<option value="">$10,000</option>
													<option value="">$50,000</option>
													<option value="">$100,000</option>
													<option value="">$200,000</option>
													<option value="">$300,000</option>
													<option value="">$400,000</option>
													<option value="">$500,000</option>
													<option value="">$600,000</option>
													<option value="">$700,000</option>
													<option value="">$800,000</option>
													<option value="">$900,000</option>
													<option value="">$1,000,000</option>
												</select>
											</div>
										</div>
									</div>
								</div>
								<div class="col-md-12 align-items-end ftco-animate">
									<div class="form-group">
										<label for="#">Max Price</label>
										<div class="form-field">
											<div class="select-wrap">
												<div class="icon"><span class="ion-ios-arrow-down"></span></div>
												<select name="" id="" class="form-control">
													<option value="">Max Price</option>
													<option value="">$5,000</option>
													<option value="">$10,000</option>
													<option value="">$50,000</option>
													<option value="">$100,000</option>
													<option value="">$200,000</option>
													<option value="">$300,000</option>
													<option value="">$400,000</option>
													<option value="">$500,000</option>
													<option value="">$600,000</option>
													<option value="">$700,000</option>
													<option value="">$800,000</option>
													<option value="">$900,000</option>
													<option value="">$1,000,000</option>
													<option value="">$2,000,000</option>
												</select>
											</div>
										</div>
									</div>
								</div>
								<div class="col-md-12 align-items-end ftco-animate">
									<div class="form-group">
										<label for="#">Min Area <span>(sq ft)</span></label>
										<div class="form-field">
											<div class="icon"><span class="icon-pencil"></span></div>
											<input type="text" class="form-control" placeholder="Min Area">
										</div>
									</div>
								</div>
								<div class="col-md-12 align-items-end ftco-animate">
									<div class="form-group">
										<label for="#">Max Area <span>(sq ft)</span></label>
										<div class="form-field">
											<div class="icon"><span class="icon-pencil"></span></div>
											<input type="text" class="form-control" placeholder="Max Area">
										</div>
									</div>
								</div>
								<div class="col-md-12 align-self-end ftco-animate">
									<div class="form-group">
										<div class="form-field">
											<input type="submit" value="Search" class="form-control btn btn-primary">
										</div>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div><!-- end -->
				<div class="col-lg-9">
					<div class="row">
						<div class="col-md-6 col-lg-4 ftco-animate">
							<div class="project">
								<div class="img">
									<img src="images/work-1.jpg" class="img-fluid" alt="Colorlib Template">
									<div class="text">
										<span>Sale</span>
										<h3><a href="properties-single.html">Fatima <br> Subdivision</a></h3>
									</div>
								</div>
								<div class="desc pt-3">
									<h4 class="price">$120,000</h4>
									<p class="h-info"><span class="location">New York</span> <span
											class="details">&mdash; 3bds, 2bath</span></p>
								</div>
							</div>
						</div>
						<div class="col-md-6 col-lg-4 ftco-animate">
							<div class="project">
								<div class="img">
									<img src="images/work-2.jpg" class="img-fluid" alt="Colorlib Template">
									<div class="text">
										<span>Sale</span>
										<h3><a href="properties-single.html">Fatima <br> Subdivision</a></h3>
									</div>
								</div>
								<div class="desc pt-3">
									<h4 class="price">$120,000</h4>
									<p class="h-info"><span class="location">New York</span> <span
											class="details">&mdash; 3bds, 2bath</span></p>
								</div>
							</div>
						</div>
						<div class="col-md-6 col-lg-4 ftco-animate">
							<div class="project">
								<div class="img">
									<img src="images/work-3.jpg" class="img-fluid" alt="Colorlib Template">
									<div class="text">
										<span>Sale</span>
										<h3><a href="properties-single.html">Fatima <br> Subdivision</a></h3>
									</div>
								</div>
								<div class="desc pt-3">
									<h4 class="price">$120,000</h4>
									<p class="h-info"><span class="location">New York</span> <span
											class="details">&mdash; 3bds, 2bath</span></p>
								</div>
							</div>
						</div>
						<div class="col-md-6 col-lg-4 ftco-animate">
							<div class="project">
								<div class="img">
									<img src="images/work-4.jpg" class="img-fluid" alt="Colorlib Template">
									<div class="text">
										<span>Sale</span>
										<h3><a href="properties-single.html">Fatima <br> Subdivision</a></h3>
									</div>
								</div>
								<div class="desc pt-3">
									<h4 class="price">$120,000</h4>
									<p class="h-info"><span class="location">New York</span> <span
											class="details">&mdash; 3bds, 2bath</span></p>
								</div>
							</div>
						</div>
						<div class="col-md-6 col-lg-4 ftco-animate">
							<div class="project">
								<div class="img">
									<img src="images/work-5.jpg" class="img-fluid" alt="Colorlib Template">
									<div class="text">
										<span>Sale</span>
										<h3><a href="properties-single.html">Fatima <br> Subdivision</a></h3>
									</div>
								</div>
								<div class="desc pt-3">
									<h4 class="price">$120,000</h4>
									<p class="h-info"><span class="location">New York</span> <span
											class="details">&mdash; 3bds, 2bath</span></p>
								</div>
							</div>
						</div>
						<div class="col-md-6 col-lg-4 ftco-animate">
							<div class="project">
								<div class="img">
									<img src="images/work-6.jpg" class="img-fluid" alt="Colorlib Template">
									<div class="text">
										<span>Sale</span>
										<h3><a href="properties-single.html">Fatima <br> Subdivision</a></h3>
									</div>
								</div>
								<div class="desc pt-3">
									<h4 class="price">$120,000</h4>
									<p class="h-info"><span class="location">New York</span> <span
											class="details">&mdash; 3bds, 2bath</span></p>
								</div>
							</div>
						</div>
						<div class="col-md-6 col-lg-4 ftco-animate">
							<div class="project">
								<div class="img">
									<img src="images/work-7.jpg" class="img-fluid" alt="Colorlib Template">
									<div class="text">
										<span>Sale</span>
										<h3><a href="properties-single.html">Fatima <br> Subdivision</a></h3>
									</div>
								</div>
								<div class="desc pt-3">
									<h4 class="price">$120,000</h4>
									<p class="h-info"><span class="location">New York</span> <span
											class="details">&mdash; 3bds, 2bath</span></p>
								</div>
							</div>
						</div>
						<div class="col-md-6 col-lg-4 ftco-animate">
							<div class="project">
								<div class="img">
									<img src="images/work-8.jpg" class="img-fluid" alt="Colorlib Template">
									<div class="text">
										<span>Sale</span>
										<h3><a href="properties-single.html">Fatima <br> Subdivision</a></h3>
									</div>
								</div>
								<div class="desc pt-3">
									<h4 class="price">$120,000</h4>
									<p class="h-info"><span class="location">New York</span> <span
											class="details">&mdash; 3bds, 2bath</span></p>
								</div>
							</div>
						</div>
						<div class="col-md-6 col-lg-4 ftco-animate">
							<div class="project">
								<div class="img">
									<img src="images/work-9.jpg" class="img-fluid" alt="Colorlib Template">
									<div class="text">
										<span>Sale</span>
										<h3><a href="properties-single.html">Fatima <br> Subdivision</a></h3>
									</div>
								</div>
								<div class="desc pt-3">
									<h4 class="price">$120,000</h4>
									<p class="h-info"><span class="location">New York</span> <span
											class="details">&mdash; 3bds, 2bath</span></p>
								</div>
							</div>
						</div>
					</div>
					<div class="row no-gutters my-5">
						<div class="col text-center">
							<div class="block-27">
								<ul>
									<li><a href="#">&lt;</a></li>
									<li class="active"><span>1</span></li>
									<li><a href="#">2</a></li>
									<li><a href="#">3</a></li>
									<li><a href="#">4</a></li>
									<li><a href="#">5</a></li>
									<li><a href="#">&gt;</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>


	<jsp:include page="/footer.jsp"></jsp:include>



	<!-- loader -->
	<div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px">
			<circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee" />
			<circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10"
				stroke="#F96D00" /></svg></div>


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
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script src="js/google-map.js"></script>
	<script src="js/main.js"></script>

</body>

</html>