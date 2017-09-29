<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="jstlc" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Register</title>
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
input[type=text], input[type=password], .selectgender {
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
	<jsp:include page="head.jsp" />

	<div class="container"
		style="background: #ECEFF1; width: 100%; height: 1800px; margin: 10px 0 0 0;">
		<div class="container-fluid "
			style="background: #FAFAFA; border: 1px solid #455A64; border-radius: 50px; height: 1600px; width: 600px; margin-top: 70px">
			<h2 style="text-align: center">Sign Up Form</h2>
			<hr>
			<sf:form modelAttribute="user">
				<sf:label path="email">Email<span class="text-danger">*</span> :</sf:label>
				<sf:input path="email" placeholder="xxxxxx@gmail.com" />
				<br />
				<!-- to display validation messages -->
				<jstlc:forEach
					items="${flowRequestContext.messageContext.getMessagesBySource('email')}"
					var="err">
					<div>
						<span class="text-danger">${err.text}</span>
					</div>
				</jstlc:forEach>

				<hr>

				<sf:label path="password">Password<span
						class="text-danger">*</span> :</sf:label>
				<sf:password path="" />
				<br />
				<!-- to display validation messages -->
				<jstlc:forEach
					items="${flowRequestContext.messageContext.getMessagesBySource('password')}"
					var="err">
					<div>
						<span class="text-danger">${err.text}</span>
					</div>
				</jstlc:forEach>
				<hr>
				<sf:label path="password">Repeat Password<span
						class="text-danger">*</span> :</sf:label>
				<sf:password path="password" />
				<br />
				<!-- to display validation messages -->
				<jstlc:forEach
					items="${flowRequestContext.messageContext.getMessagesBySource('password')}"
					var="err">
					<div>
						<span class="text-danger">${err.text}</span>
					</div>
				</jstlc:forEach>
				<hr>
				<sf:label path="user_firstName">First Name<span
						class="text-danger">*</span> :</sf:label>
				<sf:input path="user_firstName" />

				<br />
				<!-- to display validation messages -->
				<jstlc:forEach
					items="${flowRequestContext.messageContext.getMessagesBySource('user_firstName')}"
					var="err">
					<div>
						<span class="text-danger">${err.text}</span>
					</div>
				</jstlc:forEach>
				<hr>
				<sf:label path="user_lastName">Last Name<span
						class="text-danger">*</span> :</sf:label>
				<sf:input path="user_lastName" />
				<br />
				<!-- to display validation messages -->
				<jstlc:forEach
					items="${flowRequestContext.messageContext.getMessagesBySource('user_lastName')}"
					var="err">
					<div>
						<span class="text-danger">${err.text}</span>
					</div>
				</jstlc:forEach>
				<hr>
				<sf:label path="user_gender">Gender<span
						class="text-danger">*</span> :</sf:label>
				<sf:select path="user_gender" class="selectgender">
					<sf:option path="user_gender" value="null" label="I Am" />
					<sf:option path="user_gender" value="male" label="Male" />
					<sf:option path="user_gender" value="female" label="Female" />
				</sf:select>
				<br />
				<!-- to display validation messages -->
				<jstlc:forEach
					items="${flowRequestContext.messageContext.getMessagesBySource('user_gender')}"
					var="err">
					<div>
						<span class="text-danger">${err.text}</span>
					</div>
				</jstlc:forEach>
				<hr>
				<sf:label path="user_dob">Date Of Birth<span
						class="text-danger">*</span> :</sf:label>
				<sf:input type="date" path="user_dob" class="selectgender" />
				<br />
				<!-- to display validation messages -->
				<jstlc:forEach
					items="${flowRequestContext.messageContext.getMessagesBySource('user_dob')}"
					var="err">
					<div>
						<span class="text-danger">${err.text}</span>
					</div>
				</jstlc:forEach>
				<hr>
				<sf:label path="address">Address<span class="text-danger">*</span> :</sf:label>
				<sf:input path="address" placeholder="How bookbag can reach to you" />
				<br />
				<!-- to display validation messages -->
				<jstlc:forEach
					items="${flowRequestContext.messageContext.getMessagesBySource('address')}"
					var="err">
					<div>
						<span class="text-danger">${err.text}</span>
					</div>
				</jstlc:forEach>
				<hr>
				<sf:label path="contact">Contact<span class="text-danger">*</span> :</sf:label>
				<sf:input path="contact" placeholder="+91-xxxxxxxx" />
				<br />
				<!-- to display validation messages -->
				<jstlc:forEach
					items="${flowRequestContext.messageContext.getMessagesBySource('contact')}"
					var="err">
					<div>
						<span class="text-danger">${err.text}</span>
					</div>
				</jstlc:forEach>
				<hr>
				<sf:label path="user_state">State<span
						class="text-danger">*</span> :</sf:label>
				<sf:select name="State" path="user_state" class="selectgender">
					<sf:option value="null">State</sf:option>
					<sf:option value="Andaman and Nicobar Islands">Andaman and
							Nicobar Islands</sf:option>
					<sf:option path="user_state" value="Andhra Pradesh">Andhra Pradesh</sf:option>
					<sf:option path="user_state" value="Arunachal Pradesh">Arunachal Pradesh</sf:option>
					<sf:option path="user_state" value="Assam">Assam</sf:option>
					<sf:option path="user_state" value="Bihar">Bihar</sf:option>
					<sf:option path="user_state" value="Chandigarh">Chandigarh</sf:option>
					<sf:option path="user_state" value="Chhattisgarh">Chhattisgarh</sf:option>
					<sf:option path="user_state" value="Dadra and Nagar Haveli">Dadra and Nagar
							Haveli</sf:option>
					<sf:option path="user_state" value="Daman and Diu">Daman and Diu</sf:option>
					<sf:option path="user_state"
						value="National Capital Territory of Delhi">National
							Capital Territory of Delhi (DELHI)</sf:option>
					<sf:option path="user_state" value="Goa">Goa</sf:option>
					<sf:option path="user_state" value="Gujarat">Gujarat</sf:option>
					<sf:option path="user_state" value="Haryana">Haryana</sf:option>
					<sf:option path="user_state" value="Himachal Pradesh">Himachal Pradesh</sf:option>
					<sf:option path="user_state" value="Jammu and Kashmir">Jammu and Kashmir</sf:option>
					<sf:option path="user_state" value="Jharkhand">Jharkhand</sf:option>
					<sf:option path="user_state" value="Karnataka">Karnataka</sf:option>
					<sf:option path="user_state" value="Kerala">Kerala</sf:option>
					<sf:option path="user_state" value="Lakshadweep">Lakshadweep</sf:option>
					<sf:option path="user_state" value="Madhya Pradesh">Madhya Pradesh</sf:option>
					<sf:option path="user_state" value="Maharashtra">Maharashtra</sf:option>
					<sf:option path="user_state" value="Manipur">Manipur</sf:option>
					<sf:option path="user_state" value="Meghalaya">Meghalaya</sf:option>
					<sf:option path="user_state" value="Mizoram">Mizoram</sf:option>
					<sf:option path="user_state" value="Nagaland">Nagaland</sf:option>
					<sf:option path="user_state" value="Odisha">Odisha</sf:option>
					<sf:option path="user_state" value="Puducherry">Puducherry</sf:option>
					<sf:option path="user_state" value="Punjab">Punjab</sf:option>
					<sf:option path="user_state" value="Rajasthan">Rajasthan</sf:option>
					<sf:option path="user_state" value="Sikkim">Sikkim</sf:option>
					<sf:option path="user_state" value="Tamil Nadu">Tamil Nadu</sf:option>
					<sf:option path="user_state" value="Telangana">Telangana</sf:option>
					<sf:option path="user_state" value="Tripura">Tripura</sf:option>
					<sf:option path="user_state" value="Uttar Pradesh">Uttar Pradesh</sf:option>
					<sf:option path="user_state" value="Uttarakhand">Uttarakhand</sf:option>
					<sf:option path="user_state" value="West Bengal">West Bengal</sf:option>
				</sf:select>
				<br />
				<!-- to display validation messages -->
				<jstlc:forEach
					items="${flowRequestContext.messageContext.getMessagesBySource('user_state')}"
					var="err">
					<div>
						<span class="text-danger">${err.text}</span>
					</div>
				</jstlc:forEach>
				<hr>
				<span class="text-muted"><span class="label label-danger">Note:-</span>
					By clicking Sign Up, you agree to our <a href="#">Terms</a> and
					that you have read our <a href="#">Policy</a>, including our <a
					href="#">Conditions</a>.</span>
				<hr>

				<input name="_eventId_submit" type="submit" value="Sign up"
					class="btn btn-primary" style="margin: 20px 220px;" />
			</sf:form>
		</div>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>