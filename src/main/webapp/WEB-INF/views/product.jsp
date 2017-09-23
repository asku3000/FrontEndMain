<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<body>
	<jsp:include page="head.jsp" />

	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<c:forEach items="${textbook}" var="a">
					<div class="col-sm-6 col-md-4">
						<div class="thumbnail">
							<h6 class="text-center">
								<span class="label label-info text-capitalize">${a.product_bookName}</span>
							</h6>
							<img src="<c:url value="${a.product_imgUrl}"/>" alt="No logo" />
							<div class="caption">
								<div class="row">
									<div class="col-md-12 col-xs-12">
										<h3>Mathematics Class 8</h3>
									</div>

								</div>
							</div>
				</c:forEach>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>