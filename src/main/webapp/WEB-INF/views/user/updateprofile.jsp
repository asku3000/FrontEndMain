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
</head>
<body>
	<jsp:include page="/WEB-INF/views/head.jsp" />
	<c:if test="${param.msg != null}">
		<script>
			alert('${param.msg}');
		</script>
	</c:if>
	<div class="container-fluid"
		style="margin: 10px auto 10px; height: 900px; width: 50%; background: #F7F9F9;">
		<br>
		<div>
			<h2 style="color: #0033FF;">Profile</h2>


			<form action="${context}/user/updateProfile1" method="post">
				<br> <label>Email<span class="text-danger">*</span> :
				</label> <input readonly type="text" value="${user.email}"
					class="input-xlarge"><br> <br> <label>First
					Name<span class="text-danger">*</span> :
				</label> <input type="text" name="user_firstName"
					value="${user.user_firstName}" required class="input-xlarge"><br>
				<br> <label>Last Name<span class="text-danger">*</span>
					:
				</label> <input type="text" name="user_lastName"
					value="${user.user_lastName}" required class="input-xlarge"><br>
				<br> <label>Address<span class="text-danger">*</span> :
				</label> <input type="text" name="address" value="${user.address}" required
					class="input-xlarge"><br> <br> <label>State<span
					class="text-danger">*</span> :
				</label> <select name="user_state" class="input-xlarge">
					<option selected value="null">Please Choose Once Again</option>
					<option value="Andaman and Nicobar Islands">Andaman and
						Nicobar Islands</option>
					<option value="Andhra Pradesh">Andhra Pradesh</option>
					<option value="Arunachal Pradesh">Arunachal Pradesh</option>
					<option value="Assam">Assam</option>
					<option value="Bihar">Bihar</option>
					<option value="Chandigarh">Chandigarh</option>
					<option value="Chhattisgarh">Chhattisgarh</option>
					<option value="Dadra and Nagar Haveli">Dadra and Nagar
						Haveli</option>
					<option value="Daman and Diu">Daman and Diu</option>
					<option value="National Capital Territory of Delhi">National
						Capital Territory of Delhi (DELHI)</option>
					<option value="Goa">Goa</option>
					<option value="Gujarat">Gujarat</option>
					<option value="Haryana">Haryana</option>
					<option value="Himachal Pradesh">Himachal Pradesh</option>
					<option value="Jammu and Kashmir">Jammu and Kashmir</option>
					<option value="Jharkhand">Jharkhand</option>
					<option value="Karnataka">Karnataka</option>
					<option value="Kerala">Kerala</option>
					<option value="Lakshadweep">Lakshadweep</option>
					<option value="Madhya Pradesh">Madhya Pradesh</option>
					<option value="Maharashtra">Maharashtra</option>
					<option value="Manipur">Manipur</option>
					<option value="Meghalaya">Meghalaya</option>
					<option value="Mizoram">Mizoram</option>
					<option value="Nagaland">Nagaland</option>
					<option value="Odisha">Odisha</option>
					<option value="Puducherry">Puducherry</option>
					<option value="Punjab">Punjab</option>
					<option value="Rajasthan">Rajasthan</option>
					<option value="Sikkim">Sikkim</option>
					<option value="Tamil Nadu">Tamil Nadu</option>
					<option value="Telangana">Telangana</option>
					<option value="Tripura">Tripura</option>
					<option value="Uttar Pradesh">Uttar Pradesh</option>
					<option value="Uttarakhand">Uttarakhand</option>
					<option value="West Bengal">West Bengal</option>
				</select> <br> <br> <label>Contact<span class="text-danger">*</span>
					:
				</label> <input type="text" name="contact" value="${user.contact}" required
					class="input-xlarge"> <br> <br> <label>Date
					Of Birth<span class="text-danger">*</span> :
				</label> <input readonly type="text" value="${user.user_dob}"
					class="input-xlarge"> <br> <br>
				<div>
					<button type="submit"
						class="btn btn-primary pull-left btn-lg glyphicon glyphicon-ok">
						Update</button>
					<a href="${context}/user/userdeactivate" style="margin-left:20px;"
						class="btn btn-danger pull-left btn-lg glyphicon glyphicon-remove-sign">
						Temporarily Deactivate</a>

				</div>

			</form>
		</div>

	</div>
	<jsp:include page="/WEB-INF/views/footer.jsp" />
</body>
</html>