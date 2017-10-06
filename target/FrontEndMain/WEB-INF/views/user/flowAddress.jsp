<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
	<jsp:include page="/WEB-INF/views/head.jsp" />
	<div class="container">
		<!-- Form Container -->

		<div class="form-container">

			<h1>Address Confirmation Form</h1>
			<form:form method="POST" commandName="user" modelAttribute="user"
				class="form-horizontal">
				<div class="row">
					<div class="form-group col-md-12">
						<label class="col-md-3 control-lable" for="user_firstName">First Name</label>
						<div class="col-md-7">
							<form:input type="text" path="user_firstName" id="user_firstName"
								class="form-control input-sm" />
							<div class="has-error">
								<form:errors path="user_firstName" class="help-inline" />
							</div>
						</div>
					</div>
				</div>
				
				<div class="row">
					<div class="form-group col-md-12">
						<label class="col-md-3 control-lable" for="user_lastName">Last Name</label>
						<div class="col-md-7">
							<form:input type="text" path="user_lastName" id="user_lastName"
								class="form-control input-sm" />
							<div class="has-error">
								<form:errors path="user_lastName" class="help-inline" />
							</div>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="form-group col-md-12">
						<label class="col-md-3 control-lable" for="email">Email</label>
						<div class="col-md-7">
							<form:input type="text" path="email" id="email"
								class="form-control input-sm" />
							<div class="has-error">
								<form:errors path="email" class="help-inline" />
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-md-12">
						<label class="col-md-3 control-lable" for="address">Address</label>
						<div class="col-md-7">
							<form:input type="text" path="address" id="address"
								class="form-control input-sm" />
							<div class="has-error">
								<form:errors path="address" class="help-inline" />
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div style="text-align: center;">
						<input type="submit" value="Next" name="_eventId_addressSubmit"
							class="btn btn-primary btn-sm">
					</div>
				</div>
			</form:form>
		</div>
	</div>


</body>
</html>