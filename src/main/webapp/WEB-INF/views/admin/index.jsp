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
		<li><a href="#User" data-toggle="tab">User</a></li>
		<li><a href="#Product" data-toggle="tab">Product</a></li>
		<li><a href="#Supplier" data-toggle="tab">Supplier</a></li>
		<li><a href="#Reviews" data-toggle="tab">Reviews</a></li>
	</ul>

	<div id="myTabContent" class="tab-content">
		<div class="tab-pane active in" id="home">
			<div class="container-fluid"
				style="margin: 10px auto 10px; height: 450px; width: 50%;">
				<div class="row">
					<div class="col-md-12">
						<h1 style="color: #FF0000;" class="text-center">Welcome Admin</h1>
					</div>
					<br> <br>
					<div class="row">
						<div class="col-md-12">
							<h3 style="color: #64B5F6;" class="text-center">
								Admin at <span style="color: blue;">bookbag.com</span> can do
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
											Enable or Disable <span
												style="text-decoration: none; color: #311B92;"> User</span>
										</h4></li>
									<br>
									<br>
									<li><h4>
											Enable or Disable<span
												style="text-decoration: none; color: #311B92;">
												Product</span>
										</h4></li>
									<br>
									<br>
									<li><h4>
											Upload or Edit<span
												style="text-decoration: none; color: #311B92;">
												Product</span>
										</h4></li>
									<br>
									<br>
									<li><h4>
											Enable or Disable<span
												style="text-decoration: none; color: #311B92;">
												Supplier</span>
										</h4></li>



								</ul>

							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="tab-pane fade" id="User">
			<div class="container-fluid">
				<h2>User Table</h2>
				<br>
				<p>Enable or disable the user</p>
				<br> <br>
				<div class="table-responsive">
					<table class="table table-hover table-bordered">
						<thead>
							<tr>
								<th>User Id</th>
								<th>First Name</th>
								<th>Last Name</th>
								<th>Email</th>
								<th>Role</th>
								<th>Gender</th>
								<th>DOB</th>
								<th>Address</th>
								<th>State</th>
								<th>Contact</th>
								<th>Login able ?</th>
								<th>Status</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${userList}" var="a">
								<c:if test="${a.user_status==1}">
									<tr class="success">
								</c:if>
								<c:if test="${a.user_status==0}">
									<tr class="danger">
								</c:if>
								<td>${a.user_id}</td>
								<td class="text-capitalize">${a.user_firstName}</td>
								<td class="text-capitalize">${a.user_lastName}</td>
								<td>${a.email}</td>
								<c:if test="${a.role=='admin'}">
									<td class="text-capitalize warning">${a.role}</td>
								</c:if>
								<c:if test="${a.role=='CUSTOMER'}">
									<td class="text-capitalize warning">${a.role}</td>
								</c:if>
								<td class="text-capitalize">${a.user_gender}</td>
								<td>${a.user_dob}</td>
								<td class="text-capitalize">${a.address}</td>
								<td class="text-capitalize">${a.user_state}</td>
								<td>${a.contact}</td>
								<td><c:if test="${a.enabled==true}">
										<a
											href="${context}/admin/userenableordelete?user=${a.user_id}"
											class="btn btn-danger glyphicon glyphicon-warning-sign">
											Not Allow</a>
									</c:if> <c:if test="${a.enabled==false}">
										<a
											href="${context}/admin/userenableordelete?user=${a.user_id}"
											class="btn btn-success glyphicon glyphicon-ok"> Allow</a>
									</c:if></td>
								<td><c:if test="${a.user_status==1}">
										<a href="${context}/admin/userloginable?user=${a.user_id}"
											class="btn btn-danger glyphicon glyphicon-remove">
											Deactivate</a>
									</c:if> <c:if test="${a.user_status==0}">
										<a href="${context}/admin/userloginable?user=${a.user_id}"
											class="btn btn-success glyphicon glyphicon-ok"> Activate</a>
									</c:if></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
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
						<a href="${context}/admin/uploadProducts"><span
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
											href="${context}/admin/productenableordelete?product=${b.product_Id}"
											class="btn btn-danger glyphicon glyphicon-ok"> Enable</a>
									</c:if> <c:if test="${b.product_activeIs==true}">
										<a
											href="${context}/admin/productenableordelete?product=${b.product_Id}"
											class="btn btn-success glyphicon glyphicon-remove">
											Disable</a>
									</c:if></td>
								<td><a
									href="${context}/admin/updateprofilecontroller?product=${b.product_Id}"
									class="btn btn-primary glyphicon glyphicon-arrow-up">
										Update</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div class="tab-pane fade" id="Supplier">
			<div class="container-fluid">
				<h2>Supplier Table</h2>
				<br>
				<p>Enable or disable the Supplier</p>
				<br> <br>
				<div class="table-responsive">
					<table class="table table-hover table-bordered">
						<thead>
							<tr>
								<th>Supplier Id</th>
								<th>Company Name</th>
								<th>Brand Name</th>
								<th>Email</th>
								<th>Phone Number</th>
								<th>Address</th>
								<th>Status</th>

							</tr>
						</thead>
						<tbody>
							<c:forEach items="${supplierList}" var="c">
								<c:if test="${c.enabled==true}">
									<tr class="success">
								</c:if>
								<c:if test="${c.enabled==false}">
									<tr class="danger">
								</c:if>
								<td>${c.user_id}</td>
								<td class="text-capitalize">${c.supplier_companyName}</td>
								<td class="text-capitalize warning">${c.supplier_brandName}</td>
								<td>${c.email}</td>
								<td>${c.contact}</td>
								<td class="text-capitalize">${c.address}</td>
								<td><c:if test="${c.enabled==true}">
										<a
											href="${context}/admin/supplierenableordelete?supplier=${c.user_id}"
											class="btn btn-danger glyphicon glyphicon-remove">
											Disable</a>
									</c:if> <c:if test="${c.enabled==false}">
										<a
											href="${context}/admin/supplierenableordelete?supplier=${c.user_id}"
											class="btn btn-success glyphicon glyphicon-ok"> Enable</a>
									</c:if></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>

		<div class="tab-pane fade" id="Reviews">
			<div class="container-fluid">
				<h2>Reviews Table</h2>
				<br>
				<p>Enable or disable the Reviews</p>
				<br> <br>
				<div class="table-responsive">
					<table class="table table-hover table-bordered">
						<thead>
							<tr>
								<th>Review Id</th>
								<th>Book Name</th>
								<th>Author</th>
								<th>User Email</th>
								<th>Rating</th>
								<th>Review</th>
								<th>Status</th>

							</tr>
						</thead>
						<tbody>
							<c:forEach items="${reviewsList}" var="d">
								<c:if test="${d.review_enabled==true}">
									<tr class="success">
								</c:if>
								<c:if test="${d.review_enabled==false}">
									<tr class="danger">
								</c:if>
								<td>${d.review_id}</td>
								<td class="text-capitalize">${d.product.product_bookName}</td>
								<td class="text-capitalize">${d.product.product_author}</td>
								<td>${d.user.email}</td>
								<td>${d.review_stars}</td>
								<td class="text-capitalize">${d.review_message}</td>
								<td><c:if test="${d.review_enabled==true}">
										<a
											href="${context}/admin/reviewEnableorDelete?review_id=${d.review_id}"
											class="btn btn-danger glyphicon glyphicon-remove">
											Disable</a>
									</c:if> <c:if test="${d.review_enabled==false}">
										<a
											href="${context}/admin/reviewEnableorDelete?review_id=${d.review_id}"
											class="btn btn-success glyphicon glyphicon-ok"> Enable</a>
									</c:if></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<jsp:include page="footer.jsp" />
</body>
</html>