<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="context" value="${pageContext.request.contextPath}" />

<style>
@import url(http://fonts.googleapis.com/css?family=Roboto);

.dropdown-menu-center {
	left: 50% !important;
	right: auto !important;
	text-align: left !important;
	transform: translate(-30%, 0) !important;
}

.stylish-input-group .input-group-addon {
	background: white !important;
}

.stylish-input-group .form-control {
	border-right: 0 !important;;
	box-shadow: 0 0 0 !important;;
	border-color: #ccc !important;;
}

.stylish-input-group button {
	border: 0 !important;;
	background: transparent !important;;
}

.aa:hover {
	border: 2px solid #AED6F1;
	border-radius: 6px;
}
</style>

</head>
<body>

	<div class="container-fluid" style="position: relative;">

		<div class="page-header"
			style="background-color: #F2F3F4; height: 150px">

			<div class="row">

				<div class="col-sm-3" style="padding-left: 100px; padding-top: 10px">
					<img src="<c:url value="/resources/Images/FinalLogo.png" />"
						alt="No logo" />
				</div>

				<div class="col-sm-6" style="padding-top: 50px; padding-left: 100px">
					<form action="${context}/search" method="get">
						<div id="imaginary_container">
							<div class="input-group stylish-input-group aa">
								<input type="text" disabled name="searchfor"
									class="form-control" placeholder="Search" /> <span
									class="input-group-addon">
									<button type="submit" disabled>
										<span class="glyphicon glyphicon-search"></span>
									</button>
								</span>
							</div>
						</div>
					</form>
				</div>

				<div class="col-sm-3">
					<c:if test="${pageContext.request.userPrincipal.name != null}">
						<h5 style="margin-left: 25%; margin-top: 5%; color: blue;">
							<!-- display the userId just entered -->
							Welcome ${user_firstName} ${user_lastName}
						</h5>
					</c:if>
					<c:if test="${pageContext.request.userPrincipal.name == null}">
						<h5 style="margin-left: 25%; margin-top: 5%; color: blue;">
							<!-- display the userId just entered -->
							Welcome to bookbag.com
						</h5>
					</c:if>
					<div class="dropdown" style="padding: 15px 20px 30px 110px">
						<button class="btn btn-default dropdown-toggle"
							style="border-radius: 100px" type="button" id="dropdownMenu1"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
							<img src="${context}/resources/Images/user.png"
								style="height: 60px; width: 50px" /> <span class="caret"></span>
						</button>
						<ul class="dropdown-menu dropdown-menu-center"
							aria-labelledby="dropdownMenu1">
							<c:if test="${pageContext.request.userPrincipal.name == null}">
								<li><a href="${context}/login1">Login</a></li>
								<li><a href="${context}/registration">Sign Up</a></li>
								<!--registration.obj  -->
								<!-- <li role="separator" class="divider"></li>
							<li><a href="#">Your Cart</a></li>-->
							</c:if>
							<c:if test="${pageContext.request.userPrincipal.name != null}">

								<li><a href="${context}/admin/changePassword">Change
										Password</a></li>
								<li><a href="${context}/admin/uploadProducts">Upload Products</a></li>
								<li role="separator" class="divider"></li>

								<li><a href="${context}/logout">Logout</a>
							</c:if>
						</ul>
					</div>

				</div>


			</div>





		</div>
	</div>



</body>