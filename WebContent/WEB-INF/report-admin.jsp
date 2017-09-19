<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">


<link href="bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="style.css" rel="stylesheet">

<script src="bootstrap/js/jquery-3.1.1.min.js" type="text/javascript"></script>
<script src="bootstrap/js/bootstrap.js" type="text/javascript"></script>

<!-- Custom Fonts -->
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">


<title>Insert title here</title>
</head>
<%@include file="header-admin.jsp"%>
<body>


	<div id="wrapper">


		<div id="page-wrapper" class="container-fluid">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">Report</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			<div class="row">
				<div class="col-lg-10 col-lg-offset-1">
					<!-- /.panel -->
					<div class="panel panel-default">
						<div class="panel-body" id="statistics">
							<div class="row">
								<div class="col-xs-12">
									<div>
										<div class="dropdown pull-right selectbtn">
											<a class="dropdown-toggle btn btn-primary btn-lg"
												data-toggle="dropdown" href="#"> <i
												class="fa fa-gear fa-fw"></i> Select month <i
												class="fa fa-caret-down"></i>
											</a>
											<ul class="dropdown-menu dropdown-user">
												<li><a href="#">March 2017</a></li>
												<li><a href="#">February 2017</a></li>
												<li><a href="#">January 2017</a></li>
												<li><a href="#">December 2016</a></li>
											</ul>
										</div>
										<div class="clearfix"></div>
									</div>

									<div class="container-fluid" id="dashboard">
										<div class="half">
											<div class="month">
												<p class="month">
													<strong>MARCH 2017</strong>
												</p>
												<p class="sub_title">MOOD OF THE MONTH</p>
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
																		role="progressbar" aria-valuenow="10"
																		aria-valuemin="0" aria-valuemax="100"
																		style="width: 10%">
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
																		role="progressbar" aria-valuenow="15"
																		aria-valuemin="0" aria-valuemax="100"
																		style="width: 15%">
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
																	<div class="progress-bar progress-bar-neutral"
																		role="progressbar" aria-valuenow="45"
																		aria-valuemin="0" aria-valuemax="100"
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
																		role="progressbar" aria-valuenow="25"
																		aria-valuemin="0" aria-valuemax="100"
																		style="width: 25%">
																		<span class="">25%</span>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="half-2">
											<div class="row">
												<div class="col-xs-3 col-xs-offset-3">
													<img src="img/racoon1.jpg" alt="" class="img-responsive" />
												</div>
												<div class="col-xs-6">

													<div class="title_mood">Global Mood</div>
													<div class="note">
														<strong>4.2/5 </strong>
													</div>
												</div>
											</div>

											<div class="row">
												<div class="comments">
													<h2 class="title">Comments</h2>
													<div class="comment-container">
														<div class="note">
															<img class="mood" src="img/racoon3.jpg" alt="" />
														</div>
														<div class="comment">Lorem ipsum dolor sit amet,
															consectetur adipiscing elit. Duis nec nulla quam. Integer
															nisi ligula, molestie id diam ac, sagittis efficitur
															justo. Etiam aliquam aliquam dolor sed fringilla. Nullam
															at.</div>
													</div>
													<div class="comment-container">
														<div class="note">
															<img class="mood" src="../img/4.png" alt="" />
														</div>
														<div class="comment">Lorem ipsum dolor sit amet,
															consectetur adipiscing elit. Duis nec nulla quam. Integer
															nisi ligula, molestie id diam ac, sagittis efficitur
															justo. Etiam aliquam aliquam dolor sed fringilla. Nullam
															at.</div>
													</div>
													<div class="comment-container">
														<div class="note">
															<img class="mood" src="../img/3.png" alt="" />
														</div>
														<div class="comment">Lorem ipsum dolor sit amet,
															consectetur adipiscing elit. Duis nec nulla quam. Integer
															nisi ligula, molestie id diam ac, sagittis efficitur
															justo. Etiam aliquam aliquam dolor sed fringilla. Nullam
															at.</div>
													</div>
													<div class="comment-container">
														<div class="note">
															<img class="mood" src="../img/5.png" alt="" />
														</div>
														<div class="comment">Lorem ipsum dolor sit amet,
															consectetur adipiscing elit. Duis nec nulla quam. Integer
															nisi ligula, molestie id diam ac, sagittis efficitur
															justo. Etiam aliquam aliquam dolor sed fringilla. Nullam
															at.</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- /.row -->
						</div>
						<!-- /.panel-body -->
					</div>
					<!-- /.panel -->
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
		</div>
		<!-- /#page-wrapper -->

	</div>

</body>
<%@include file="footer.jsp"%>
</html>