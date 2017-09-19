<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Mood of the month</title>

<!-- Bootstrap CSS -->

<link href="bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="style.css" rel="stylesheet">
<!-- Custom Fonts -->
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
</head>
<%@include file="header-admin.jsp"%>
<body>

	<div id="wrapper">


		<div id="page-wrapper" class="container-fluid">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">Administration Panel</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->



			<div class="row">
				<div class="col-md-12">
					<div class="row">
						<div class="col-md-7">

							<div class="panel panel-default">
								<div class="panel-heading">
									<i class="fa fa-tachometer fa-fw"></i> Stats
								</div>
								<div class="panel-body" id="stats">

									<div class="note">
										4.2<small>/5</small>
										<p>Avg Mood</p>
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
															<div class="progress-bar progress-bar-neutral"
																role="progressbar" aria-valuenow="45" aria-valuemin="0"
																aria-valuemax="100" style="width: 45%">
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


									<a href="stats.html" class="btn btn-default btn-block">View
										more reports</a>
								</div>
								<!-- /.panel-body -->
							</div>

						</div>
						<div class="col-md-5">
							<div class="row">
								<div class="col-md-12">
									<div class="panel panel-primary">
										<div class="panel-heading">
											<div class="row">
												<div class="col-xs-3">
													<i class="fa fa-user fa-5x"></i>
												</div>
												<div class="col-xs-9 text-right">
													<div class="huge">46</div>
													<div class="huge-label">Registered members</div>
												</div>
											</div>
										</div>
										<a href="add-member">
											<div class="panel-footer">
												<span class="pull-left">Add member</span> <span
													class="pull-right"><i
													class="fa fa-arrow-circle-right"></i></span>
												<div class="clearfix"></div>
											</div>
										</a>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-12">
									<div class="panel panel-green">
										<div class="panel-heading">
											<div class="row">
												<div class="col-xs-3">
													<i class="fa fa-smile-o fa-5x"></i>
												</div>
												<div class="col-xs-9 text-right">
													<div class="huge">3</div>
													<div class="huge-label">Moods Closed</div>
												</div>
											</div>
										</div>
										<a href="edit-template">
											<div class="panel-footer">
												<span class="pull-left">Edit MOTM content</span> <span
													class="pull-right"><i
													class="fa fa-arrow-circle-right"></i></span>
												<div class="clearfix"></div>
											</div>
										</a>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-12">
									
										<div class="panel panel-blue">
											<div class="panel-heading">
												<div class="row">
													<div class="col-xs-3">
														<i class="fa fa-envelope fa-5x"></i>
													</div>
													<div class="col-xs-9 text-right">
														<div class="huge">Mail</div>
														<div class="huge-label">Settings</div>
													</div>
												</div>
											</div>
											<a href="dashboard.html">
												<div class="panel-footer">
													<span class="pull-left">Edit Settings</span> <span
														class="pull-right"><i
														class="fa fa-arrow-circle-right"></i></span>
													<div class="clearfix"></div>
												</div>
											</a>
										</div>
									
								</div>
							</div>
						</div>

					</div>
				</div>
			</div>


			</footer>

			<!-- jQuery -->
			<script src="../js/jquery-3.1.1.min.js"></script>

			<!-- togggle.js -->
			<script src="../js/toggle.js"></script>

			<!-- Bootstrap Core JavaScript -->
			<script src="../js/bootstrap.min.js"></script>
</body>
<%@include file="footer.jsp"%>
</html>