<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<c:set var="context" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Congrats</title>
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
</head>
<body>
	<jsp:include page="/WEB-INF/views/head.jsp" />
	<div class="container">
		<div class="success">

			<ul class="nav navbar-nav">
				<li><h1>Congratulation, Your order has been placed</h1></li>
				<li class="active"><h3>
						<a class="btn btn-primary" href="${contextRoot}/index">Back</a>
					</h3></li>
			</ul>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/footer.jsp" />
</body>
</html>