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
</head>
<style>
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
	<c:if test="${param.msg != null}">
		<script>
			alert('${param.msg}');
		</script>
	</c:if>
	<jsp:include page="/WEB-INF/views/head.jsp" />
	<c:if test="${reviews != null}">
		<div class="container">
			<h2 class="pull-left text-danger">Edit Your Review</h2>
			<br> <br> <br> <br>
			<h4 class="pull-left text-info">For :-
				${reviews.product.product_bookName}</h4>
			<div class="row">
				<br> <br> <br> <br>
				<form action="${context}/user/giveReviewPageController1"
					method="get">
					<input type="hidden" name="product_id"
						value="${reviews.product.product_Id}" />
					<div class="col-md-8">
						<input type="text" class="input-xlarge" name="review_message"
							placeholder="Type Review Here" id="reviewField"
							value="${reviews.review_message}" onblur="checkReviewField()" />
					</div>
					<div class="col-md-2">
						<select name="review_stars" id="starsValue" class="input-xlarge">
							<option selected value="${reviews.review_stars}">${reviews.review_stars}</option>

							<option value="1">1 Stars</option>

							<option value="2">2 Stars</option>

							<option value="3">3 Stars</option>

							<option value="4">4 Stars</option>

							<option value="5">5 Stars</option>
						</select>
					</div>
					<div class="col-md-2">

						<button type="submit"
							class="btn btn-lg btn-primary pull-right glyphicon glyphicon-ok">
							Update</button>

					</div>
				</form>

			</div>

		</div>
	</c:if>
	<c:if test="${reviews == null}">
		<div class="row">
			<div class="col-md-12 text-center">
				<h4>
					<span class="glyphicon glyphicon-arrow-left"></span>&nbsp;&nbsp;
					YOU DIDN'T REVIEW THIS PRODUCT PLEASE GO BACK AND GIVE THE REVIEW

				</h4>
			</div>

		</div>
	</c:if>
	<jsp:include page="/WEB-INF/views/footer.jsp" />

</body>
</html>