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
<body>
	<c:if test="${param.msg != null}">
		<script>
			alert('${param.msg}');
		</script>
	</c:if>
	<jsp:include page="/WEB-INF/views/head.jsp" />
	<div class="container-fluid"
		style="margin: 10px auto 10px; width: 700px;">
		<div class="row">
			<div class="col-md-12">
				<h1 style="color: #E74C3C;" class="text-center">Account
					Temporarily Deactivated</h1>
				<br> <br> <br>
				<h3 style="color: #85C1E9;" class="text-center">
					Due to some reasons your account is deactivated either by <span
						style="color: #1F618D;">bookbag.com</span> or by <span
						style="color: #1F618D;">Yourself</span>
				</h3>
			</div>

		</div>
		<div class="row">
			<div class="col-md-12">
				<a href="${context}/user/userdeactivate"
					class="btn btn-lg btn-success glyphicon glyphicon-ok-sign"
					style="margin: 30px 43% 10px;"> Activate</a>
			</div>

		</div>
	</div>
	<jsp:include page="/WEB-INF/views/footer.jsp" />
</body>
</html>