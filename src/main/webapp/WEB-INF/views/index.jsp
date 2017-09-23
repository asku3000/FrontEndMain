<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
	<jsp:include page="head.jsp" />
	<div class="container-fluid" style="margin: 40px 30px;">
		<h2>
			<!-- display the userId just entered -->
			Welcome ${user.user_firstName } ${user.user_lastName }
		</h2>
		<br />
		<div class="container">


			<div id="myCarousel" class="carousel slide" data-ride="carousel">
				<!-- Indicators -->
				<ol class="carousel-indicators">
					<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
					<li data-target="#myCarousel" data-slide-to="1"></li>
					<li data-target="#myCarousel" data-slide-to="2"></li>
					<li data-target="#myCarousel" data-slide-to="3"></li>
				</ol>

				<!-- Wrapper for slides -->
				<div class="carousel-inner">
					<div class="item active">
						<img src="resources/Images/bookshelf.png" alt="No Image"
							style="height: 250px; width: 100%;">
						<div class="carousel-caption">
							<h2>WELCOME</h2>
							<h3>
								Flat 20% Off , use code:"BOOK20"
								<h3>
						</div>
					</div>

					<div class="item">
						<img src="resources/Images/carousel_3_1.png" alt="no image"
							style="height: 250px; width: 100%;">
						<div class="carousel-caption">
							<h2>OLD BOOKS !!</h2>
							<h3>Get 50% on Return</h3>
						</div>
					</div>

					<div class="item">
						<img src="resources/Images/web.jpg" alt="no image"
							style="height: 250px; width: 100%;">
						<div class="carousel-caption">
							<h2>Magazines unbelievable</h2>
							<h3>Top Brands !!!</h3>
						</div>
					</div>

					<div class="item">
						<img src="resources/Images/Package.png" alt="no image"
							style="height: 250px; width: 100%;">

					</div>
				</div>

				<!-- Left and right controls -->
				<a class="left carousel-control" href="#myCarousel"
					data-slide="prev"> <span
					class="glyphicon glyphicon-chevron-left"></span> <span
					class="sr-only">Previous</span>
				</a> <a class="right carousel-control" href="#myCarousel"
					data-slide="next"> <span
					class="glyphicon glyphicon-chevron-right"></span> <span
					class="sr-only">Next</span>
				</a>
			</div>
		</div>

		<div class="container"
			style="height: 340px; width: 100%; background: #F8F9F9; margin: 40px 50px 40px 25px;">
			<div class="row">
				<div class="col-sm-3">
					<table style="margin: 40px 40px;">
						<tr>
							<th style="padding: 20px 20px 20px 20px;"><h2>New Books</h2></th>
						</tr>
						<tr style="margin-left: 10px;">
							<th style="margin-left: 10px; padding: 20px 20px 20px 20px;"><a
								href="#" class="btn btn-primary" role="button">View All</a>
					</table>
				</div>

				<div class="col-sm-3">
					<table style="margin: 15px 5px 2px 5px; border: 1px solid #AEB6BF;">
						<tr>
							<th><a href="#"><img src="resources/Images/cbseclass8science.png"
									alt="Unable To Load" style="height: 250px; width: 100%;" /></a></th>
						</tr>
						<tr>
							<th style="padding: 3px 3px; text-align: center;">Class 8
								Science</th>
						</tr>
						<tr>
							<th style="padding: 3px 3px; text-align: center;">Publisher:
								Zankar</th>
						</tr>
						<tr>
							<th
								style="padding: 3px 3px; text-align: center; text_color: blue;">&#x20B9;
								220</th>
						</tr>

					</table>
				</div>

				<div class="col-sm-3">
					<table style="margin: 15px 5px 2px 5px; border: 1px solid #AEB6BF;">
						<tr>
							<th><a href="#"><img src="resources/Images/ncertclass8sst.png"
									alt="Unable To Load" style="height: 250px; width: 100%;" /></a></th>
						</tr>
						<tr>
							<th style="padding: 3px 3px; text-align: center;">Class 8
								Social Science</th>
						</tr>
						<tr>
							<th style="padding: 3px 3px; text-align: center;">Publisher:
								NCERT</th>
						</tr>
						<tr>
							<th
								style="padding: 3px 3px; text-align: center; text_color: blue;">&#x20B9;
								200</th>
						</tr>

					</table>
				</div>

				<div class="col-sm-3">
					<table style="margin: 15px 5px 2px 5px; border: 1px solid #AEB6BF;">
						<tr>
							<th><a href="#"><img src="resources/Images/ncertmathsclass8.png"
									alt="Unable To Load" style="height: 250px; width: 100%;" /></a></th>
						</tr>
						<tr>
							<th style="padding: 3px 3px; text-align: center;">Class 11
								Mathematics</th>
						</tr>
						<tr>
							<th style="padding: 3px 3px; text-align: center;">Publisher:
								NCERT</th>
						</tr>
						<tr>
							<th
								style="padding: 3px 3px; text-align: center; text_color: blue;">&#x20B9;
								150</th>
						</tr>

					</table>
				</div>


			</div>
		</div>




	</div>
	
	<jsp:include page="footer.jsp" />
</body>


</html>