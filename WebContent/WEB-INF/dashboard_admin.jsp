<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<!-- Bootstrap CSS -->


<link href="bootstrap/css/bootstrap.css" rel="stylesheet">

<link href="style.css" rel="stylesheet">

<!-- Custom Fonts -->

<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<head>
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

									<i class="fa fa-tachometer fa-fw"></i> Stats ${Date}

								</div>

								<div class="panel-body" id="stats">



									<div class="note">

										${Average}<small>/5</small>

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
														<span class="desc">Vote count: ${Rate1}</span>
														<div class="progress">
															<div class="progress-bar progress-bar-danger"
																role="progressbar" aria-valuenow="${Rate1}"
																aria-valuemin="0" aria-valuemax="100"
																style="width: ${Pourcent1}%">
																<span class="">${Pourcent1}%</span>
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
														<span class="desc">Vote count: ${Rate2}</span>
														<div class="progress">
															<div class="progress-bar progress-bar-warning"
																role="progressbar" aria-valuenow="${Rate2}"
																aria-valuemin="0" aria-valuemax="100"
																style="width: ${Pourcent2}%">
																<span class="">${Pourcent2}%</span>
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
														<span class="desc">Vote count: ${Rate3}</span>
														<div class="progress">
															<div class="progress-bar progress-bar-midsuccess"
																role="progressbar" aria-valuenow="${Rate3}"
																aria-valuemin="0" aria-valuemax="100"
																style="width: ${Pourcent3}%">
																<span class="">${Pourcent3}%</span>
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
														<span class="desc">Vote count: ${Rate4}</span>
														<div class="progress">
															<div class="progress-bar progress-bar-neutral"
																role="progressbar" aria-valuenow="${Rate4}"
																aria-valuemin="0" aria-valuemax="100"
																style="width: ${Pourcent4}%">
																<span class="">${Pourcent4}%</span>
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
														<span class="desc">Vote count: ${Rate5}</span>
														<div class="progress">
															<div class="progress-bar progress-bar-success"
																role="progressbar" aria-valuenow="${Rate5}"
																aria-valuemin="0" aria-valuemax="100"
																style="width: ${Pourcent5}%">
																<span class="">${Pourcent5}%</span>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
										<a href="report-admin" class="btn btn-default btn-block">View</a>


									</div>
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

													<div class="huge">${NumberMember}</div>

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

													<div class="huge">${NumberTemplate}</div>

													<div class="huge-label">Moods Templates</div>

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

										<a href="mail">

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
