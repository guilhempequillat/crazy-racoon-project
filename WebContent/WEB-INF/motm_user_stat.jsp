<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Motm User Stat</title>
<link href="bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="style.css" rel="stylesheet">
<title>Insert title here</title>
</head>
<%@include file="header.jsp"%>
<body>

	<div class="col-md-6 ">
		<!-- second part - stat -->
		<div class="row">
			<div class="col-md-12">

				<div class="row">
					<div class="col-xs-8 col-xs-offset-1">
						<div class="year">
							<strong>2017</strong>
						</div>
						<div class="sub_title">My Mood of the Year</div>
					</div>
				</div>

				<div class="details">
					<br>
					<div class="mood">
						<div class="row">
							<div class="col-xs-2">
								<div class="img-container">
									<img src="img/racoon1.jpg" alt="" class="img-responsive" />
								</div>
							</div>
							<div class="col-xs-9">
								<div class="progress-bar-container">
									<span class="desc">Vote count: 10</span>
									<div class="progress">
										<div class="progress-bar progress-bar-danger"
											role="progressbar" aria-valuenow="10" aria-valuemin="0"
											aria-valuemax="100" style="width: 10%">
											<span class="">10%</span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="mood">
						<div class="row">
							<div class="col-xs-2">
								<div class="img-container">
									<img src="img/racoon2.jpg" alt="" class="img-responsive" />
								</div>
							</div>
							<div class="col-xs-9">
								<div class="progress-bar-container">
									<span class="desc">Vote count: 5</span>
									<div class="progress">
										<div class="progress-bar progress-bar-warning"
											role="progressbar" aria-valuenow="5" aria-valuemin="0"
											aria-valuemax="100" style="width: 5%">
											<span class="">5%</span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="mood">
						<div class="row">
							<div class="col-xs-2">
								<div class="img-container">
									<img src="img/racoon3.jpg" alt="" class="img-responsive" />
								</div>
							</div>
							<div class="col-xs-9">
								<div class="progress-bar-container">
									<span class="desc">Vote count: 15</span>
									<div class="progress">
										<div class="progress-bar progress-bar-midsuccess"
											role="progressbar" aria-valuenow="15" aria-valuemin="0"
											aria-valuemax="100" style="width: 15%">
											<span class="">15%</span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="mood">
						<div class="row">
							<div class="col-xs-2">
								<div class="img-container">
									<img src="img/racoon4.jpg" alt="" class="img-responsive" />
								</div>
							</div>
							<div class="col-xs-9">
								<div class="progress-bar-container">
									<span class="desc">Vote count: 45</span>
									<div class="progress">
										<div class="progress-bar progress-bar-neutral" role="progressbar"
											aria-valuenow="45" aria-valuemin="0" aria-valuemax="100"
											style="width: 45%">
											<span class="">45%</span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="mood">
						<div class="row">
							<div class="col-xs-2">
								<div class="img-container">
									<img src="img/racoon5.jpg" alt="" class="img-responsive" />
								</div>
							</div>
							<div class="col-xs-9">
								<div class="progress-bar-container">
									<span class="desc">Vote count: 25</span>
									<div class="progress">
										<div class="progress-bar progress-bar-success"
											role="progressbar" aria-valuenow="25" aria-valuemin="0"
											aria-valuemax="100" style="width: 25%">
											<span class="">25%</span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>


			</div>
		</div>
	</div>

	<div class="col-md-6 ">

		<div class="row">
			<div class="col-xs-3 col-xs-offset-3">
				<img src="img/racoon1.jpg" alt="" class="img-responsive" />
			</div>
			<div class="col-xs-6">

				<div class="title_mood">My Global Mood</div>
				<div class="note">
					<strong>4.2/5 </strong>
				</div>
			</div>
		</div>


		<div class="row">
			<div class="col-xs-10 col-xs-offset-1">
				<div class="comments">
					<h2>Comments</h2>

					<!-- for each -->
					<div class="comment-container">
						<div class="note">
							<img src="img/racoon1.jpg" class="mood" alt="" />
						</div>
						<div class="comment">Lorem ipsum dolor sit amet, consectetur
							adipiscing elit. Duis nec nulla quam. Integer nisi ligula,
							molestie id diam ac, sagittis efficitur justo. Etiam aliquam
							aliquam dolor sed fringilla. Nullam at.</div>
					</div>
					
					<!-- fin for each -->
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-xs-offset-6">
				<nav>
				<ul class="pagination justify-content-end">
					<li class="page-item disabled"><a class="page-link" href="#"
						tabindex="-1">Previous</a></li>
					<li class="page-item"><a class="page-link" href="#">1</a></li>
					<li class="page-item"><a class="page-link" href="#">2</a></li>
					<li class="page-item"><a class="page-link" href="#">3</a></li>
					<li class="page-item"><a class="page-link" href="#">Next</a></li>
				</ul>
				</nav>
			</div>
		</div>
	</div>

</body>
<%@include file="footer.jsp"%>
</html>