<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/basic.jsp"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/topMenu.css">

<div class="jain_container">
	<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
		<div class="container1 container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <i class="icon-menu"></i>
					Menu
				</button>
				<!-- <a class="navbar-brand" href="#"> <img
					src="http://mogulsdemo.com/html/pride-home/images/logo.png" /></a> -->
			</div>
			<div class="outer">
				<div class="col-md-8">
					<div class="collapse navbar-collapse"
						id="bs-example-navbar-collapse-1">
						<div class="col-md-12">
							<ul class="nav navbar-nav">
								<li class="dropdown mega-dropdown"><a href="#"
									class="dropdown-toggle" data-toggle="dropdown">FIND YORU HOTEL <span class="caret"></span>
								</a>
									<ul class="dropdown-menu mega-dropdown-menu">
										<li class="col-sm-4">
											<ul>
												<li class="dropdown-header">Features</li>
												<li><a href="#">Auto Carousel</a></li>
												<li><a href="#">Carousel Control</a></li>
												<li><a href="#">Left & Right Navigation</a></li>
												<li><a href="#">Four Columns Grid</a></li>
											</ul>
										</li>
										<li class="col-sm-4">
											<ul>
												<li class="dropdown-header">Plus</li>
												<li><a href="#">Navbar Inverse</a></li>
												<li><a href="#">Pull Right Elements</a></li>
												<li><a href="#">Coloured Headers</a></li>
												<li><a href="#">Primary Buttons & Default</a></li>
											</ul>
										</li>
										<li class="col-sm-4">
											<ul>
												<li class="dropdown-header">Much more</li>
												<li><a href="#">Easy to Customize</a></li>
												<li><a href="#">Calls to action</a></li>
												<li><a href="#">Custom Fonts</a></li>
												<li><a href="#">Slide down on Hover</a></li>
											</ul>
										</li>
									</ul></li>
								<li><a href="#">SPECIAL OFFERS</a></li>
								<li><a href="#">PLAN YOUR EVENTS</a></li>
								<li><a href="#">OUR BRANDS</a></li>
								<li><a href="#">LOYALTY</a></li>
								<li><a href="#">CONTACT US</a></li>
							</ul>
						</div>
						<div class="col-md-12">
							<form class="form-horizontal form-horizontal_x">
								<div class="col-md-12">
									<div class="form-group">
										<div class="col-sm-4">
											<select name="hotel" id="hotel" required=""
												class="form-control"
												onchange="changeFormaction2(this.value);">
												<option value="" selected="">Select Hotel</option>
												<option value="67961">Pride Plaza Hotel Ahmedabad</option>
												<option value="67964">The Pride Hotel Bengaluru</option>
												<option value="29191">The Pride Hotel Nagpur</option>
												<option value="67963">The Pride Hotel Chennai</option>
												<option value="29190">The Pride Hotel, Pune</option>
												<option value="67962">Pride Plaza Hotel Kolkata</option>
												<option value="67580">Pride Plaza Hotel Delhi</option>
												<option value="8">Pride Amber Vilas Jaipur</option>
												<option value="65728">Pride Surya Mountain Resort Mcleodganj</option>
												<option value="60533">Pride Sun Village Resort SPA,Goa</option>
												<option value="138227">The Pride Biznotel,Vadodara</option>
											</select>
										</div>
										<div class="col-sm-3">
											<input type="text" class="form-control" id="pwd"
												placeholder="Check In">
										</div>
										<div class="col-sm-3">
											<input type="text" class="form-control" id="pwd"
												placeholder="Check Out">
										</div>
										<div class="col-sm-2">
											<button type="submit" class="btn btn-default">Book
												Now</button>
										</div>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</nav>
</div>