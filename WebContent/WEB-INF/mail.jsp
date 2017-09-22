<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>


<!-- Bootstrap CSS -->
<link href="bootstrap/css/bootstrap.css" rel="stylesheet">
<!-- Custom CSS -->
<link href="style.css" rel="stylesheet">

<!-- Custom Fonts -->
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
</head>
<%@include file="header-admin.jsp"%>
<body>


	<form action="mail" method="post">
		<input type="submit" name="button1" value="Button 1" />
	</form>



	<div id="wrapper">

		<div id="page-wrapper" class="container-fluid">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">Edit MOTM content</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			<div class="row">
				<div class="col-lg-10 col-lg-offset-1">
					<!-- /.panel -->

					<div class="panel panel-default">
						<div class="panel-heading">
							<i class="fa fa-cog fa-fw"></i> Settings
						</div>
						<div class="panel-body">
							<div class="row">
								<div class="col-lg-12">
									<h3>This page allows you to edit the content of your Mood
										Of The Month</h3>
									<br />
									<div class="description">
										Customize your MOTM with the following content:
										<ul>
											<li>An <b>email subject</b>: this will be the subject of
												the email sent to employees
											</li>
											<li>An <b>email template</b>: this content will be
												inserted into the email to each employee
											</li>
										</ul>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-xs-12">
									<form id="setting-mail-form" action="mail" method="POST"
										role="form">
										<div class="form-group">
											<label for="name">Subject</label>
											<input type="text"
												class="input-lg form-control" id="name" name="name"
												value="Hey , let's hear it for your mood of the month!">
										</div>
										<div class="form-group">
											<label for="email-template">Email template (<a
												href="mail-template" target="_blank">check the email
													template</a>)
											</label>

											<textarea id="email-template" name="email-template" class="content"
												cols="" rows=""></textarea>
										</div>
										<div class="form-group">
											<div class="row">
												<div class="col-sm-6 col-sm-offset-3">
													<input type="submit" name="submit" id="submit"
														class="form-control btn btn-register" value="Edit">
												</div>
											</div>
										</div>
									</form>
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

	<!-- jQuery -->
	<script src="https://code.jquery.com/jquery.js" type="text/javascript"></script>

	<!-- Bootstrap Core JavaScript -->
	<script
		src="https://netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"
		type="text/javascript"></script>


	<!-- CKEditor -->
	<script src="https://cdn.ckeditor.com/4.6.2/full/ckeditor.js"
		type="text/javascript"></script>
	<script type="text/javascript">
		CKEDITOR.replace("email-template");
	</script>


</body>
<%@include file="footer.jsp"%>
</html>