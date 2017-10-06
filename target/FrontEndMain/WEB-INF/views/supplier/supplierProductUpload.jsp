<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="context" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>UploadProducts</title>
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
	<c:if test="${param.msg != null}">
		<script>
			alert('${param.msg}');
		</script>

	</c:if>
	<jsp:include page="header.jsp" />
	<div class="container-fluid">
		<ul class="nav nav-tabs" style="margin: 20px">
			<li>
				<div class="dropdown">
					<a href="${context}/index" style="text-decoration: none">
						<h4 style="margin: 10px">Home</h4>
					</a>
				</div>
			</li>
		</ul>
	</div>
	<div class="container"
		style="width: 50%; border: 1px solid #2C3E50; border-radius: 25px;">
		<form action="${context}/supplier/supplieruploadproduct1"
			method="post">
			<div class="row">
				<div class="col-md-12" style="margin-top: 15px;">
					<label>Book Name<span class="text-danger">*</span> :
					</label> <input class="input-xlarge" type="text" name="product_bookName"
						required placeholder="Book Name" />
				</div>
			</div>
			<div class="row">
				<div class="col-md-12" style="margin-top: 15px;">
					<label>Author Name<span class="text-danger">*</span> :
					</label> <input class="input-xlarge" type="text" name="product_author"
						required placeholder="Author Name" />
				</div>
			</div>
			<div class="row">
				<div class="col-md-12" style="margin-top: 15px;">
					<label>Publisher Name<span class="text-danger">*</span> :
					</label> <input class="input-xlarge" type="text" name="product_publisher"
						required placeholder="Publisher Name" />
				</div>
			</div>
			<div class="row">
				<div class="col-md-12" style="margin-top: 15px;">
					<label>Product Description<span class="text-danger">*</span>
						:
					</label> <input class="input-xlarge" type="text" name="product_description"
						required placeholder="Product Description" />
				</div>
			</div>
			<div class="row">
				<div class="col-md-12" style="margin-top: 15px;">
					<label>Product Language<span class="text-danger">*</span> :
					</label> <input class="input-xlarge" type="text" name="product_language"
						required placeholder="Product Language" />
				</div>
			</div>
			<div class="row">
				<div class="col-md-12" style="margin-top: 15px;">
					<label>Product Price<span class="text-danger">*</span> :
					</label> <input class="input-xlarge" type="text" name="product_price"
						required placeholder="Product Price" />
				</div>
			</div>
			<div class="row">
				<div class="col-md-12" style="margin-top: 15px;">
					<label>Product Quantity<span class="text-danger">*</span> :
					</label> <input class="input-xlarge" type="text" name="product_quantity"
						required placeholder="Product Quantity" />
				</div>
			</div>
			<div class="row">
				<div class="col-md-12" style="margin-top: 15px;">
					<label>Book is Used/New<span class="text-danger">*</span> :
					</label> <select name="product_status" class="input-xlarge">
						<option selected value="new">New</option>
						<option value="used">Used</option>
					</select>
				</div>
			</div>

			<div class="row">
				<div class="col-md-6" style="margin-top: 15px;">
					<label>Book Category<span class="text-danger">*</span> :
					</label> <select name="category" class="input-xlarge">
						<option selected value="text books">Text Books</option>
						<option selected value="novels">Novels</option>
						<option selected value="magazines">Magazines</option>
						<option selected value="epics">Epics</option>
					</select>
				</div>
				<div class="col-md-6" style="margin-top: 15px;">
					<label>Sub Category<span class="text-danger">*</span> :
					</label> <select name="categoryLevel" class="input-xlarge">
						<c:forEach items="${categoryLevel}" var="a">
							<option selected value="${a.category_level}"
								class="text-capitalize">${a.category_level}</option>
						</c:forEach>
					</select>
				</div>
			</div>
			<button type="submit" style="margin-top: 15px; margin-bottom: 15px;"
				class="btn btn-lg btn-primary pull-right glyphicon glyphicon-arrow-up">
				Upload</button>
		</form>
	</div>
	</div>


	<jsp:include page="footer.jsp" />

</body>
</html>