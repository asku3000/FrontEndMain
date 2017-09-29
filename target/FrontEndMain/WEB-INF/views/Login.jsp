<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="context" value="${pageContext.request.contextPath}"/>
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
html, body {
	position: relative;
	height: 100%;
}

.login-container {
	position: relative;
	width: 300px;
	margin: 80px auto;
	padding: 20px 40px 40px;
	text-align: center;
	background: #fff;
	border: 1px solid #ccc;
}

.avatar {
	width: 100px;
	height: 100px;
	margin: 10px auto 30px;
	border-radius: 100%;
	border: 2px solid #aaa;
	background-size: cover;
}

.form-box input {
	width: 100%;
	padding: 10px;
	text-align: center;
	height: 40px;
	border: 1px solid #ccc;;
	background: #fafafa;
	transition: 0.2s ease-in-out;
}

.form-box input:focus {
	outline: 0;
	background: #eee;
}

.form-box input[type="text"] {
	border-radius: 5px 5px 0 0;
}

.form-box input[type="password"] {
	border-radius: 0 0 5px 5px;
	border-top: 0;
}

.form-box button.login {
	margin-top: 15px;
	padding: 10px 20px;
}
</style>


</head>
<body>
	<jsp:include page="head.jsp" />
	<div class="container"
		style="background: #ECEFF1; width: 100%; height: 500px; margin: 10px 0 0 0;">
		<div class="login-container">
			<h3>Hey Welcome back !!</h3>
			<div class="avatar">
				<img src="resources/Images/user.png"
					style="height: 60px; width: 50px; margin: 15px auto 10px" />
			</div>
			<div class="form-box">
				<form action="login" method="POST">
					<input type="text" placeholder="Email" name="useremail"/> <input type="password"
						placeholder="Password" name="userpassword">
					<button class="btn btn-info btn-block login" type="submit">Login</button>
				</form>
				<div>
					<span style="color: red;">${err}</span>
				</div>

			</div>
			<a href="#"><b>Forgot Password? </b></a>
		</div>

	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>