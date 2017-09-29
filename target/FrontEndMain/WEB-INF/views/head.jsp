<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="context" value="${pageContext.request.contextPath}"/>

<style>
@import url(http://fonts.googleapis.com/css?family=Roboto);

.dropdown-menu-center {
	left: 50% !important;
	right: auto !important;
	text-align: left !important;
	transform: translate(-30%, 0) !important;
}
</style>

</head>
<body>
	<div class="container-fluid" style="position: relative;">

		<div class="page-header"
			style="background-color: #F2F3F4; height: 150px">

			<div class="row">

				<div class="col-sm-3" style="padding-left: 100px; padding-top: 10px">
					<img src="<c:url value="resources/Images/FinalLogo.png" />"
						alt="No logo" />
				</div>

				<div class="col-sm-6" style="padding-top: 50px; padding-left: 100px">
					<div id="custom-search-input">
						<div class="input-group">
							<input type="text" class="form-control input-lg"
								placeholder="Which Book ?" /> <span class="input-group-btn">
								<button class="btn btn-info btn-lg" type="button">
									<i class="glyphicon glyphicon-search"></i>
								</button>
							</span>
						</div>
					</div>
				</div>

				<div class="col-sm-3">
					<div class="dropdown" style="padding: 40px 20px 30px 110px">
						<button class="btn btn-default dropdown-toggle"
							style="border-radius: 100px" type="button" id="dropdownMenu1"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
							<img src="resources/Images/user.png"
								style="height: 60px; width: 50px" /> <span class="caret"></span>
						</button>
						<ul class="dropdown-menu dropdown-menu-center"
							aria-labelledby="dropdownMenu1">
							<li><a href="${context}/login1">Login</a></li>
							<li><a href="registration">Sign Up</a></li>
							<!--registration.obj  -->
							<li role="separator" class="divider"></li>
							<li><a href="#">Your Cart</a></li>
						</ul>
					</div>

				</div>


			</div>

			<ul class="nav nav-tabs" style="margin: 20px">
				<li>
					<div class="dropdown">
						<a href="index" style="text-decoration: none">
							<h4 style="margin: 10px">Home</h4>
						</a>
					</div>
				</li>
				<li><div class="dropdown">
						<a style="margin: 10px" href="textbookList"
							class="dropdown-toggle" type="button"
							style="text-decoration: none" data-toggle="dropdown">
							<h4 style="margin: 10px">Text Books</h4></a>
						<ul class="dropdown-menu dropdown-menu-center">
							<c:forEach items="${textbookList}" var="a">
								<li><a class="text-capitalize"
									href="textbooks?name=${a.category_level}">${a.category_level}</a></li>
							</c:forEach>

						</ul>
					</div></li>
				<li><div class="dropdown">
						<a style="margin: 10px" href="magazinesList"
							class="dropdown-toggle" type="button"
							style="text-decoration: none" data-toggle="dropdown"><h4
								style="margin: 10px">Magazines</h4> </a>
						<ul class="dropdown-menu dropdown-menu-center">
							<c:forEach items="${magazinesList}" var="a">
								<li><a class="text-capitalize"
									href="magazinesList?name=${a.category_level}">${a.category_level}</a></li>
							</c:forEach>

						</ul>
					</div></li>
				<li><div class="dropdown">
						<a style="margin: 10px" href="novelList" class="dropdown-toggle"
							type="button" style="text-decoration: none"
							data-toggle="dropdown"><h4 style="margin: 10px">Novels</h4> </a>
						<ul class="dropdown-menu dropdown-menu-center">
							<c:forEach items="${novelList}" var="a">
								<li><a class="text-capitalize"
									href="novelList?name=${a.category_level}">${a.category_level}</a></li>
							</c:forEach>

						</ul>
					</div></li>
				<li><div class="dropdown">
						<a style="margin: 10px" href="epicList" class="dropdown-toggle"
							type="button" style="text-decoration: none"
							data-toggle="dropdown"><h4 style="margin: 10px">Epics</h4> </a>
						<ul class="dropdown-menu dropdown-menu-center">
							<c:forEach items="${epicList}" var="a">
								<li><a class="text-capitalize"
									href="epicList?name=${a.category_level}">${a.category_level}</a></li>
							</c:forEach>

						</ul>
					</div></li>

				<li style="float: right">
					<div class="dropdown">
						<a style="margin: 10px" href="AboutUs"
							style="text-decoration: none">
							<h4 style="margin: 10px">About Us</h4>
						</a>
					</div>
				</li>
				<li style="float: right">
					<div class="dropdown">
						<a style="margin: 10px" href="ContactUs"
							style="text-decoration: none">
							<h4 style="margin: 10px">Contact Us</h4>
						</a>
					</div>
				</li>
				<li style="float: right">
					<div class="dropdown">
						<a style="margin: 10px" href="index" style="text-decoration: none">
							<h4 style="margin: 10px">Sell With Us</h4>
						</a>
					</div>
				</li>
			</ul>



		</div>
	</div>



</body>