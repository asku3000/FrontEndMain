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
.icon-flipped {
	transform: scaleX(-1);
	-moz-transform: scaleX(-1);
	-webkit-transform: scaleX(-1);
	-ms-transform: scaleX(-1);
}
</style>

</head>
<body>
	<jsp:include page="/WEB-INF/views/head.jsp" />
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-12 col-md-10 col-md-offset-1">
				<table class="table table-hover">
					<thead>
						<tr>
							<th>Product</th>
							<th>Quantity</th>
							<th class="text-center">Price</th>
							<th class="text-center">Total</th>
							<th> </th>
						</tr>
					</thead>
					<tbody>
						<!-- Start of loop -->
						<c:forEach items="${cartitems}" var="a">
							<tr>
								<td class="col-md-6">
									<div class="media">
										<a class="thumbnail pull-left" style="margin-right: 10px;"
											href="${context}/singleproduct1?name=${a.product.product_Id}">
											<img class="media-object"
											src="<c:url value='${a.product.product_imgUrl}' />"
											alt="${a.product.product_imgUrl}"
											style="width: 72px; height: 72px;" />
										</a>
										<div class="media-body">
											<h4 class="media-heading text-capitalize">
												<a
													href="${context}/singleproduct1?name=${a.product.product_Id}">${a.product.product_bookName}</a>
											</h4>

											<h5 class="media-heading text-capitalize">

												by <a href="#">${a.product.product_author}</a>
											</h5>
											<c:if
												test="${a.product.product_quantity >0 && a.product.product_activeIs==true}">
												<span>Status: </span>
												<span class="text-success"><strong>In Stock</strong></span>
											</c:if>
											<c:if
												test="${a.product.product_quantity <=0 || a.product.product_activeIs==false}">
												<span>Status: </span>
												<span class="text-success"><strong>In Stock</strong></span>
											</c:if>
										</div>
									</div>
								</td>
								<td class="col-md-3"><a
									href="${context}/plusbutton?name=${a.product.product_Id}"
									class="btn btn-info">+</a> <input type="text" name=""
									value='${a.sell_quantity}' style="width: 25px;" readonly /> <a
									href="${context}/minusbutton?name=${a.product.product_Id}"
									class="btn btn-info">-</a></td>
								<td class="col-sm-1 col-md-1 text-center"><strong>&#x20B9;
										${a.product.product_price}</strong></td>
								<td class="col-sm-1 col-md-1 text-center"><strong>&#x20B9;
										${a.total_price}</strong></td>
								<td class="col-sm-1 col-md-1"><a
									href="${context}/removebutton?name=${a.product.product_Id}">
										<button type="button" class="btn btn-danger">
											<span class="glyphicon glyphicon-remove"></span>
										</button>
								</a></td>

							</tr>
						</c:forEach>
						<!-- end loop -->
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td><h5>Total Items</h5></td>
							<td class="text-right"><h5>
									<strong>${cart.cartItemCount}</strong>
								</h5></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td><h5>Subtotal</h5></td>
							<td class="text-right"><h5>
									<strong>&#x20B9; ${cart.grandTotal}</strong>
								</h5></td>
						</tr>

						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td><h3>Total</h3></td>
							<td class="text-right"><h3>
									<strong>&#x20B9; ${cart.grandTotal}</strong>
								</h3></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td><a href="${context}/index"><button type="button"
										class="btn btn-default">
										<span
											class="glyphicon icon-rotate icon-flipped glyphicon-play"></span>
										Continue Shopping
									</button></a></td>
							<td>
								<button type="button" class="btn btn-success">
									Checkout <span class="glyphicon glyphicon-play"></span>
								</button>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/footer.jsp" />
</body>