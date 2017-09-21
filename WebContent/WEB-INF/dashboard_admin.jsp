<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
					<h1 class="page-header">Statistics</h1>
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
												<c:forEach items="${months}" var="month">
													<li><a
														href="dashboard-admin?month=${month.monthNumber}&year=${month.yearNumber}">${month.dateString}</a></li>
												</c:forEach>
											</ul>
										</div>
										<div class="clearfix"></div>
									</div>

									<div class="container-fluid" id="dashboard">
										<div class="half">
											<div class="month">
												<p class="month">
													<strong>MOOD OF THE MONTH</strong>
												</p>
												<p class="sub_title">${Date}</p>
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
											</div>
										</div>
										<div class="half-2">
											<div class="row">
												<div class="col-xs-3 col-xs-offset-3">
													<img src="${Picture}" alt="" class="img-responsive" />
												</div>
												<div class="col-xs-6">

													<div class="title_mood">Global Mood</div>
													<div class="note">
														<strong>${Average}/5 </strong>
													</div>
												</div>
											</div>

											<div class="row">
												<div class="comments">

													<c:forEach items="${motms}" var="motm">
														<div class="comment-container">
															<div class="note">
																<img class="mood" src="img/racoon${motm.grade}.jpg"
																	alt="" />
															</div>
															<div class="comment">${motm.comment}</div>
														</div>
													</c:forEach>
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