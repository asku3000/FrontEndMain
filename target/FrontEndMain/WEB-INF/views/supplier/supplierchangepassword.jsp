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

	<script>
		function check2() {

			var password = document.getElementById("oldpassword").value;
			var confirmPassword = document.getElementById("password").value;
			if (password != confirmPassword) {
				//alert("Invalid Old Password !! Old Password do not match.");
				document.getElementById("print").innerHTML = "Invalid Old Password !! Old Password do not match.";
			}

		}
	</script>
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
		<c:if test="${param.msg1 != null}">
			<script>
				alert('${param.msg1}');
			</script>
			<div class="container pull-center" style="margin: 100px 43% 100px;">
				<a href="${context}/logout" class="btn btn-lg btn-info">Click
					Here to Continue</a>
			</div>
		</c:if>

		<c:if test="${param.msg == null}">
			<div class="row">
				<div class="col-sm-12">
					<h1>Change Password</h1>
				</div>
			</div>
			<br>
			<br>
			<div class="row">
				<div class="col-sm-6 col-sm-offset-3">
					<p class="text-center">Use the form below to change your
						password.</p>
					<br> <br> <br>
					<form action="${context}/supplier/changePassword2" method="post"
						id="passwordForm">
						<div>
							<h3 id="print" class="text-danger" style=""></h3>
						</div>
						<input type="hidden" id="oldpassword" name="oldpassword"
							value="${user.password}" /> <input type="password"
							class="input-lg form-control" name="password" id="password"
							placeholder="Old Password" onblur="check2()" required> <br>
						<br> <input type="password" class="input-lg form-control"
							name="password1" id="password1" placeholder="New Password"
							required /> <br> <br> <input type="submit"
							class="col-xs-12 btn btn-primary btn-load btn-lg"
							data-loading-text="Changing Password..." value="Change Password">
					</form>
				</div>
				<!--/col-sm-6-->
			</div>
			<!--/row-->
		</c:if>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>