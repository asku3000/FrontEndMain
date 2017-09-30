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
.disabled {
	pointer-events: none;
	cursor: default;
}
</style>

</head>
<body>
	<c:if test="${param.msg != null}">
		<script>
			alert('${param.msg}');
		</script>

	</c:if>
	<jsp:include page="header.jsp" />
	<ul class="nav nav-tabs" style="margin-top: 10px;">
		<li class="active"><a href="#home" data-toggle="tab">Home</a></li>
		<li><a href="#Product" data-toggle="tab">Products</a></li>
		<li><a href="#UploadProduct" data-toggle="tab">Add Product</a></li>
	</ul>

	<div id="myTabContent" class="tab-content">
		<div class="tab-pane active in" id="home">
			<div class="container-fluid"
				style="margin: 10px auto 10px; height: 450px; width: 50%;">
				<div class="row">
					<div class="col-md-12">
						<h1 style="color: #FF0000;" class="text-center">Welcome
							Seller ${user_firstName}</h1>
					</div>
					<br> <br>
					<div class="row">
						<div class="col-md-12">
							<h3 style="color: #64B5F6;" class="text-center">
								Seller at <span style="color: blue;">bookbag.com</span> can do
								these tasks
							</h3>

						</div>
						<br> <br> <br> <br>
						<div class="row">
							<div class="col-md-12 text-center">
								<ul class="text-center" style="list-style: none;">
									<br>
									<br>
									<li><h4>
											Add<span style="text-decoration: none; color: #311B92;">
												Products</span>
										</h4></li>
									<br>
									<br>
									<li><h4>
											Delete<span style="text-decoration: none; color: #311B92;">
												Products</span>
										</h4></li>
									<br>
									<br>
									<li><h4>
											Edit<span style="text-decoration: none; color: #311B92;">
												Products</span>
										</h4></li>

								</ul>

							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="tab-pane fade" id="Product">
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-12">
						<h3>
							Upload Your Products <span
								class="glyphicon glyphicon-arrow-right"></span>
						</h3>
						<a href="${context}/supplier/uploadProducts"><span
							class="pull-right btn btn-primary glyphicon glyphicon-arrow-up">
								Upload Products</span></a>
					</div>
				</div>
				<h2>Product Table</h2>
				<br>
				<p>Enable or disable the Product from this table</p>
				<br> <br>
				<div class="table-responsive">
					<table class="table table-hover table-bordered">
						<thead>
							<tr>
								<th>Product Id</th>
								<th>Image</th>
								<th>Name</th>
								<th>Author</th>
								<th>Publisher</th>
								<th>Status</th>
								<th>Price</th>
								<th>Quantity</th>
								<th>Language</th>
								<th>Description</th>
								<th>Supplier</th>
								<th>Active</th>
								<th>Update</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${productList}" var="b">
								<c:if test="${b.product_activeIs==true}">
									<tr class="success">
								</c:if>
								<c:if test="${b.product_activeIs==false}">
									<tr class="danger">
								</c:if>
								<th>${b.product_Id}</th>

								<td><div class="media">
										<div class="thumbnail pull-left">
											<a href="${context}/singleproduct1?name=${b.product_Id}">
												<img class="media-object"
												src="<c:url value='${b.product_imgUrl}' />"
												alt="${b.product_imgUrl}" style="width: 72px; height: 72px;" />
											</a>
										</div>
									</div></td>

								<td class="text-capitalize"><a
									href="${context}/singleproduct1?name=${b.product_Id}">${b.product_bookName}</a></td>

								<td class="text-capitalize">${b.product_author}</td>
								<td class="text-capitalize">${b.product_publisher}</td>
								<td class="text-capitalize">${b.product_status}</td>
								<td>${b.product_price}</td>
								<td>${b.product_quantity}</td>
								<td class="text-capitalize">${b.product_language}</td>
								<td class="text-capitalize">${b.product_description}</td>
								<td class="text-capitalize warning">${b.user.supplier_brandName}</td>
								<td><c:if
										test="${b.product_activeIs==false && b.user.enabled==false}">
										<a
											href="${context}/admin/productenableordelete?product=${b.product_Id}"
											class="btn btn-danger disabled glyphicon glyphicon-ok">
											Enable</a>
									</c:if> <c:if
										test="${b.product_activeIs==false && b.user.enabled==true}">
										<a
											href="${context}/supplier/productenableordeleteBySupplier?product=${b.product_Id}"
											class="btn btn-danger glyphicon glyphicon-ok"> Enable</a>
									</c:if> <c:if test="${b.product_activeIs==true}">
										<a
											href="${context}/supplier/productenableordeleteBySupplier?product=${b.product_Id}"
											class="btn btn-success glyphicon glyphicon-remove">
											Disable</a>
									</c:if></td>
								<td><a
									href="${context}/supplier/updateproductBySupplier?product=${b.product_Id}"
									class="btn btn-primary glyphicon glyphicon-arrow-up">
										Update</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div class="tab-pane fade" id="UploadProduct">
			<div class="container-fluid">
				<div class="row">
				<br>
				<br>
				<br>
				<br>
				
					<div class="col-md-12">
						<h3>
							Upload Your Products <span
								class="glyphicon glyphicon-arrow-right"></span>
						</h3>
						<a href="${context}/supplier/uploadProducts"><span
							class="pull-right btn btn-primary glyphicon glyphicon-arrow-up">
								Upload Products</span></a>
					</div>
				</div>
			</div>
		</div>

	</div>
</body>
</html>