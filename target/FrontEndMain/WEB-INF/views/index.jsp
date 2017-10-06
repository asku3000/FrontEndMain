<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="context" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Bookbag.com</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
.imgcont {
	width: 400px;
	height: 300px
}

.imgcont img {
	width: 340px;
	height: 320px;
}
</style>

</head>
<body>
	<jsp:include page="head.jsp" />
	<div class="container-fluid" style="margin: 40px 30px;">

		<br />
		<div class="container">


			<div id="myCarousel" class="carousel slide" data-ride="carousel">
				<!-- Indicators -->
				<ol class="carousel-indicators">
					<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
					<li data-target="#myCarousel" data-slide-to="1"></li>
					<li data-target="#myCarousel" data-slide-to="2"></li>
					<li data-target="#myCarousel" data-slide-to="3"></li>
				</ol>

				<!-- Wrapper for slides -->
				<div class="carousel-inner">
					<div class="item active">
						<img src="resources/Images/bookshelf.png" alt="No Image"
							style="height: 250px; width: 100%;">
						<div class="carousel-caption">
							<h2>WELCOME</h2>
							<h3>
								Flat 20% Off , use code:"BOOK20"
								<h3>
						</div>
					</div>

					<div class="item">
						<img src="resources/Images/carousel_3_1.png" alt="no image"
							style="height: 250px; width: 100%;">
						<div class="carousel-caption">
							<h2>OLD BOOKS !!</h2>
							<h3>Get 50% on Return</h3>
						</div>
					</div>

					<div class="item">
						<img src="resources/Images/web.jpg" alt="no image"
							style="height: 250px; width: 100%;">
						<div class="carousel-caption">
							<h2>Magazines unbelievable</h2>
							<h3>Top Brands !!!</h3>
						</div>
					</div>

					<div class="item">
						<img src="resources/Images/Package.png" alt="no image"
							style="height: 250px; width: 100%;">

					</div>
				</div>

				<!-- Left and right controls -->
				<a class="left carousel-control" href="#myCarousel"
					data-slide="prev"> <span
					class="glyphicon glyphicon-chevron-left"></span> <span
					class="sr-only">Previous</span>
				</a> <a class="right carousel-control" href="#myCarousel"
					data-slide="next"> <span
					class="glyphicon glyphicon-chevron-right"></span> <span
					class="sr-only">Next</span>
				</a>
			</div>
		</div>

		<div class="container" style="margin-top: 30px;">
			<h2>Trending Products</h2>
			<hr>
			<div class="row">
				<div class="col-md-12">
					<c:forEach items="${reviewlist}" var="a">
						<div class="col-sm-6 col-md-4">
							<a href="${context}/singleproduct1?name=${a.product.product_Id}">
								<div class="thumbnail">

									<div class="imgcont">
										<img src="<c:url value='${a.product.product_imgUrl}' />"
											alt="${a.product.product_imgUrl}" />
									</div>
									<div class="caption">
										<div class="row">
											<div class="col-md-12 col-xs-12">
												<h3 class="text-capitalize">${a.product.product_bookName}</h3>
											</div>
										</div>
										<div class="row">
											<div class="col-md-6 col-xs-6">
												<p class="small">Author :- ${a.product.product_author}</p>
											</div>
											<div class="col-md-6 col-xs-6">
												<h5 class="text-center">
													<span class="label label-danger text-capitalize">${a.product.product_status}</span>
												</h5>
											</div>
										</div>

										<div class="row">
											<div class="col-md-6 col-xs-6">
												<h4>
													<label style="text-color: blue;">&#x20B9;
														${a.product.product_price}</label>
												</h4>
											</div>
											<div class="col-md-6">
												<c:if
													test="${a.product.product_quantity >0 && a.product.product_activeIs==true}">
													<a
														href="${context}/user/product?name=${a.product.product_Id}"
														class="btn btn-primary btn-product"><span
														class="glyphicon glyphicon-shopping-cart"></span> Add To
														Cart</a>
												</c:if>
												<c:if
													test="${a.product.product_quantity <=0 || a.product.product_activeIs==false}">
													<a href="" disabled="true"
														class="btn btn-primary btn-product"><span
														class="glyphicon glyphicon-shopping-cart"></span>Out of
														stock</a>
												</c:if>
											</div>
										</div>
									</div>
								</div>
							</a>
						</div>
					</c:forEach>
				</div>
			</div>

		</div>

	</div>

	<jsp:include page="footer.jsp" />
</body>


</html>