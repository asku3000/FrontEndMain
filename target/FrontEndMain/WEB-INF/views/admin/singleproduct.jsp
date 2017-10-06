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
</style>
</head>
<body>
	<jsp:include page="header.jsp" />

	<div class="container" id="product-section">
		<ul class="nav nav-tabs" style="margin: 20px">
			<li>
				<div class="dropdown">
					<a href="${context}/index" style="text-decoration: none">
						<h4 style="margin: 10px">Home</h4>
					</a>
				</div>
			</li>
		</ul>
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



					<!-- end row -->

				</div>
			</div>
		</div>
		<!-- end row -->
	</div>
	<!-- end container -->

	<jsp:include page="footer.jsp" />
</body>
</html>