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
	<div class="container"
		style="height: 500px; width: 60%; margin: 50px auto; text-algin: center">
		<div class="row  vertical-center">

			<div class="col-md-12" style="align: center;">

				<img src="<c:url value="resources/Images/Aboutusbackground.png" />"
					style="height: 500px; width: 1500px;" class="img-responsive">

				<div class="carousel-caption">
					<h1>About Us !</h1>
					<h3>"bookbag.com" is online book selling ,buying ,renting
						portal.</h3>
					<h3>Which enable customer to easily get the books on less
						price</h3>
					<h4>Here, customer can sell there old books also</h4>
					<h5>There are A to Z books here from "Text books" to "Epics"
						and "Magazines"</h5>
				</div>

			</div>



		</div>


	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>