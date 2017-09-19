<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Insert title here</title>
	<link href="bootstrap/css/bootstrap.css" rel="stylesheet">
	<link href="style.css" rel="stylesheet">
	<script src="bootstrap/js/jquery-3.1.1.min.js" type="text/javascript"></script>
	<script src="bootstrap/js/bootstrap.js" type="text/javascript"></script>
</head>
<%@include file="header.jsp"%>
<body>
   	<div class="row">
		<div class="col-md-6 col-md-offset-3">
		<c:if test="${not empty user }">
			<h2>Change your profile</h2>
				<div class="panel panel-login">
					<div class="panel-body">
						<div class="row">
							<div class="col-lg-12">
								<form id="register-form" action="edit-user" method="POST" role="form">
									<div class="form-group">
										<input type="text" value="${user.firstName}" name="firstName" placeholder="First Name" id="firstname"  class="form-control" >
									</div>
									<div class="form-group">
										<input type="text" value="${user.lastName}" name="lastName" placeholder="Last Name" id="lastName"  class="form-control" >
									</div>
									<div class="form-group">
										<input type="email" value="${user.email}" name="email" id="email" class="form-control" placeholder="Email Address" >
									</div>
									<div class="form-group">
										<input type="date" value="${user.stringDate}" name="birthdate" placeholder="Birthdate" id="birthdate"  class="form-control" >
									</div>
									<div class="form-group">
										<div class="row">
											<div class="col-sm-6 col-sm-offset-3">
												<input type="submit" name="register-submit" id="register-submit" tabindex="4" class="form-control btn btn-primary btn-block" value="Register Now">
											</div>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</c:if>
			<c:if test="${empty user }">
				<h2>You are not connected !</h2>
			</c:if>
		</div>
	</div>
</body>
</html>