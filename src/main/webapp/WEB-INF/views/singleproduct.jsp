<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="context" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>${product.product_bookName}</title>
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

<link href='https://fonts.googleapis.com/css?family=Ubuntu+Mono'
	rel='stylesheet' type='text/css'>
<style>
.monospaced {
	font-family: 'Ubuntu Mono', monospaced;
}

.add-to-cart .btn-qty {
	width: 52px;
	height: 46px;
}

.add-to-cart .btn {
	border-radius: 0;
}

.add-to-cart {
	margin: 25px auto 10px 5px;
}

.imgcont img {
	width: 350px;
	height: 470px;
}

.rating-block {
	background-color: #FAFAFA;
	border: 1px solid #EFEFEF;
	padding: 15px 15px 20px 15px;
	border-radius: 3px;
	margin: 50px auto 20px;
}

.review-block {
	background-color: #FAFAFA;
	border: 1px solid #EFEFEF;
	padding: 10px;
	border-radius: 3px;
	margin-bottom: 5px;
}

.review-block-name {
	font-size: 12px;
	margin: 10px 0;
}

.review-block-rate {
	font-size: 13px;
	margin-bottom: 15px;
}

.review-block-description {
	font-size: 13px;
}

.input-xlarge {
	width: 100%;
	padding: 9px 20px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	box-sizing: border-box;
	border-radius: 20px;
}
</style>
</head>
<body>
	<script>
		function checkReviewField() {
			var a = document.getElementById("reviewField").value;
			var b = document.getElementById("starsValue").value;
			if (a == "") {
				alert("Review Field Cannot Be Empty");
			}
			if (b == "null") {
				alert("Please give The Stars");
			}
		}
	</script>
	<jsp:include page="head.jsp" />

	<div class="container" id="product-section">
		<div class="row" style="margin: 40px auto 10px 5px;">
			<div class="col-md-6 imgcont">
				<img src="<c:url value='${product.product_imgUrl}' />"
					alt="Unable To Load" class="image-responsive" />
			</div>
			<div class="col-md-6" style="background: #ECF0F1;">
				<div class="row">
					<div class="col-md-12">
						<h1 class="text-capitalize">${product.product_bookName}</h1>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6">
						<h4 class="text-danger text-capitalize">Author :-
							${product.product_author}</h4>
					</div>
					<div class="col-md-6">
						<h4 class="text-danger text-capitalize">Publisher :-
							${product.product_publisher}</h4>
					</div>
				</div>

				<div class="row pull-center" style="margin-top: 15px;">
					<div class="col-md-6">
						<h4>
							<span class="label label-primary text-capitalize">${product.product_status}</span>
						</h4>
					</div>
					<div class="col-md-6">
						<h4>
							<span class="label label-danger text-capitalize">${product.product_language}</span>
						</h4>
					</div>
				</div>
				<!-- end row -->
				<div class="row">
					<div class="col-md-12" style="margin: 30px auto 5px 5px;">
						<p class="description text-capitalize">${product.product_description}</p>
					</div>
				</div>
				<!-- end row -->
				<div class="row"></div>
				<!-- end row -->
				<div class="row" style="margin: 15px auto 10px 5px;">
					<div class="col-md-4">
						<h2 class="product-price">&#x20B9; ${product.product_price}</h2>
					</div>
					<div class="col-md-8">
						<h3>Sold by :- ${product.supplier.supplier_brandName}</h3>
					</div>
					<!-- end row -->

					<div class="row add-to-cart">

						<div class="col-md-12" style="margin-top: 20px;">
							<c:if
								test="${product.product_quantity >0 && product.product_activeIs==true}">
								<a href="${context}/user/product?name=${product.product_Id}"
									class="btn btn-primary btn-lg btn-product"><span
									class="glyphicon glyphicon-shopping-cart"></span> Add To Cart</a>
							</c:if>
							<c:if
								test="${product.product_quantity <=0 || product.product_activeIs==false}">
								<a href="" disabled="true"
									class="btn btn-primary btn-lg btn-product"><span
									class="glyphicon glyphicon-shopping-cart"></span>Out of Stock</a>
							</c:if>
						</div>
					</div>
					<!-- end row -->

					<div class="row" style="margin: 15px auto 10px 5px;">
						<div class="col-md-6">
							<c:if
								test="${product.product_quantity >0 && product.product_activeIs==true}">
								<h4>
									<span class="text-success" style="text-color: green;">In
										Stock</span>
								</h4>
							</c:if>
							<c:if
								test="${product.product_quantity <=0 || product.product_activeIs==false}">
								<h4>
									<span class="text-success" style="text-color: green;">Out
										of Stock</span>
								</h4>
							</c:if>
						</div>
						<div class="col-md-6 text-center">
							<c:if
								test="${product.product_quantity >0 && product.product_activeIs==true}">
								<h4>
									<span class="label label-success">Available
										${product.product_quantity}</span>
								</h4>
							</c:if>
							<c:if test="${product.product_activeIs==false}">
								<h4>
									<span class="label label-success">Product Disabled</span>
								</h4>
							</c:if>
							<c:if test="${product.product_quantity <=0}">
								<h4>
									<span class="label label-success">Not Available</span>
								</h4>
							</c:if>
						</div>
					</div>
					<!-- end row -->
					<div class="row">
						<div class="col-sm-12">
							<div class="rating-block">
								<h4>Average user rating</h4>
								<h2 class="bold padding-bottom-7">
									${average} <small>/ 5</small>
								</h2>
								<c:forEach begin="1" end="${average1}" var="i">
									<button type="button" class="btn btn-primary btn-sm"
										aria-label="Left Align">
										<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
									</button>
								</c:forEach>
								<c:forEach begin="1" end='${average2}' var="a">
									<button type="button" class="btn btn-default btn-grey btn-sm"
										aria-label="Left Align">
										<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
									</button>
								</c:forEach>
							</div>
						</div>
					</div>


					<!-- end row -->

				</div>
			</div>
		</div>
		<!-- end row -->
		<div class="row">
			<ul class="nav nav-tabs" style="margin-top: 10px;">
				<li class="active"><a href="" data-toggle="tab">Reviews</a></li>

			</ul>


			<div class="col-md-3">
				<h4>
					Give Your Review &nbsp;&nbsp;<span
						class="glyphicon glyphicon-arrow-right"></span>
				</h4>
			</div>
			<div class="col-md-9">
				<div class="row">
					<form action="${context}/user/giveReviewPageController"
						method="get">
						<input type="hidden" name="product_id"
							value="${product.product_Id}" />
						<div class="col-md-8">
							<input type="text" class="input-xlarge" name="review_message"
								placeholder="Type Review Here" id="reviewField"
								onblur="checkReviewField()" />
						</div>
						<div class="col-md-2">
							<select name="review_stars" id="starsValue" class="input-xlarge">
								<option selected value="null">Stars</option>

								<option value="1">1</option>

								<option value="2">2</option>

								<option value="3">3</option>

								<option value="4">4</option>

								<option value="5">5</option>
							</select>
						</div>
						<div class="col-md-2">
							<c:if
								test="${product.product_activeIs==false && reviewButton==0}">
								<button type="submit" disabled="true"
									class="btn btn-lg btn-primary pull-right">Give Review</button>
							</c:if>
							<c:if test="${product.product_activeIs==true && reviewButton==1}">
								<button type="submit" class="btn btn-lg btn-primary pull-right">
									Give Review</button>
							</c:if>
							<c:if test="${login==1}">
								<h4>Login To Review</h4>
							</c:if>
						</div>
					</form>
				</div>
			</div>

		</div>
		<div class="row">
			<div class="col-md-6">
				<h3>Reviews</h3>
			</div>
			<div class="col-md-6">
				<a href="${context}/user/editMyreview?product_id=${product.product_Id}"><span class="btn btn-danger pull-right glyphicon glyphicon-pencil"> Edit Your Review</span></a>
			</div>

		</div>
		<c:forEach items="${reviewsList}" var="reviewsList">
			<div class="row">
				<div class="col-sm-12">
					<hr />

					<div class="review-block">
						<div class="row">
							<div class="col-sm-3">

								<div class="review-block-name">
									<h4 class="text-capitalize">${reviewsList.user.user_firstName}
										${reviewsList.user.user_lastName}</h4>
								</div>

							</div>
							<div class="col-sm-9">
								<div class="review-block-rate">
									<c:forEach begin="1" end='${reviewsList.review_stars}' var="i">

										<button type="button" style="margin-left: 2px;"
											class="btn btn-info btn-xs pull-left" aria-label="Left Align">
											<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
										</button>
									</c:forEach>
									<c:forEach begin="1" end='${5-reviewsList.review_stars}'
										var="i">

										<button type="button" class="btn btn-grey btn-xs pull-left"
											style="margin-left: 2px;" aria-label="Left Align">
											<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
										</button>
									</c:forEach>
								</div>
								<div class="row">
									<div class="col-sm-12" style="margin-top: 10px;">
										<div class="review-block-description pull-left">${reviewsList.review_message}</div>

									</div>
								</div>
							</div>
						</div>

					</div>
				</div>
			</div>
		</c:forEach>

	</div>



	<!-- end container -->

	<jsp:include page="footer.jsp" />
</body>
</html>