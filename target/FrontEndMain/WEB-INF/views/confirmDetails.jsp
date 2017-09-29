<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Confirm details</title>
</head>
<body>
	<div class="content">
		<fieldset>
			<legend>Please Confirm Your Details</legend>
			<br /> <a href="index">Home</a> <br /> <br /> <br />
			<sf:form modelAttribute="user">
				<sf:label path="email">Email : </sf:label>${user.email}
					
				
				<hr>
				<br />
				<br />

				<sf:label path="password">Password : </sf:label>${user.password}
					
				<hr>
				<br />
				<br />

				<sf:label path="user_firstName">First Name : </sf:label>${user.user_firstName}
					
				<hr>
				<br />
				<br />

				<sf:label path="user_lastName">Last Name : </sf:label>${user.user_lastName}
					
				<hr>
				<br />
				<br />

				<sf:label path="user_gender">Gender : </sf:label>${user.user_gender}
					
				<hr>
				<br />
				<br />

				<sf:label path="user_dob">Date Of Birth : </sf:label>${user.user_dob}
					
				<hr>
				<br />
				<br />

				<sf:label path="address">Address : </sf:label>${user.address}
					
				<hr>
				<br />
				<br />

				<sf:label path="contact">Contact : </sf:label>${user.contact}
					
				<hr>
				<br />
				<br />

				<sf:label path="user_state">State : </sf:label>${user.user_state}
					
				<hr>
				<br />
				<br />

				<input name="_eventId_edit" type="submit" value="Edit" />
				<input name="_eventId_submit" type="submit" value="Confirm Details" />
				<br />
			</sf:form>
		</fieldset>
	</div>
</body>
</html>